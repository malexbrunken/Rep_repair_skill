#!/bin/bash
# SEO Site Deploy Script
# Usage: ./deploy.sh <site-folder> <cloudflare-project> <domain> <zone-id> <record-id> [api-token]
# Example: ./deploy.sh site-01-matthew-bovee-com matt-bovee-com matthew-bovee.com 42d1b6b90d15d00382a0b2c63641ae3c 8d0d35b04d469cde10f3a49ce862a4d6

SITE_DIR="$1"
PROJECT="$2"
DOMAIN="$3"
ZONE="$4"
RECORD="$5"
TOKEN="${6:-$CLOUDFLARE_API_TOKEN}"

if [ -z "$SITE_DIR" ] || [ -z "$PROJECT" ]; then
    echo "Usage: $0 <site-folder> <cloudflare-project> <domain> <zone-id> <record-id> [api-token]"
    exit 1
fi

cd "$SITE_DIR"

echo "Building site..."
rm -rf public resources/_gen
hugo --minify

echo "Deploying to Cloudflare..."
export CLOUDFLARE_API_TOKEN="$TOKEN"
export CLOUDFLARE_ACCOUNT_ID="5a21b4f1865cb68ebe9577c44f060f1b"

DEPLOY_URL=$(npx wrangler pages deploy public --project-name "$PROJECT" 2>&1 | grep -oP 'https://\K[a-f0-9]+\.'"$PROJECT"'.pages.dev')

if [ -z "$DEPLOY_URL" ]; then
    echo "Failed to get deployment URL"
    exit 1
fi

echo "New deployment: https://$DEPLOY_URL"

if [ -n "$ZONE" ] && [ -n "$RECORD" ]; then
    echo "Updating CNAME for $DOMAIN..."
    curl -s -X PUT -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        --data '{"type":"CNAME","name":"'"$DOMAIN"'","content":"'"$DEPLOY_URL"'","proxied":true}' \
        "https://api.cloudflare.com/client/v4/zones/$ZONE/dns_records/$RECORD" | jq -r '.success'
    
    echo "Purging Cloudflare cache..."
    curl -s -X POST -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        --data '{"purge_everything":true}' \
        "https://api.cloudflare.com/client/v4/zones/$ZONE/purge_cache" | jq -r '.success'
    
    echo "Done! https://$DOMAIN should update in ~30 seconds"
fi
