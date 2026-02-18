#!/bin/bash
# Deploy script for Hugo sites to Cloudflare Pages

# Usage: ./deploy.sh [site-directory] [project-name]

SITE_DIR="${1:-.}"
PROJECT_NAME="${2:-my-project}"

echo "=== Deploying $SITE_DIR to $PROJECT_NAME ==="

# Check for required environment variables
if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
    echo "Error: CLOUDFLARE_API_TOKEN not set"
    exit 1
fi

if [ -z "$CLOUDFLARE_ACCOUNT_ID" ]; then
    echo "Error: CLOUDFLARE_ACCOUNT_ID not set"
    exit 1
fi

# Build the site
echo "Building Hugo site..."
cd "$SITE_DIR"
hugo --minify

if [ $? -ne 0 ]; then
    echo "Error: Hugo build failed"
    exit 1
fi

# Deploy to Cloudflare
echo "Deploying to Cloudflare Pages..."
npx wrangler pages deploy public \
    --project-name "$PROJECT_NAME" \
    --commit-dirty=true

if [ $? -eq 0 ]; then
    echo "=== Deployment complete ==="
else
    echo "Error: Deployment failed"
    exit 1
fi
