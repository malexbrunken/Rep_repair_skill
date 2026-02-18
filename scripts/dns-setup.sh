#!/bin/bash
# DNS setup script for Cloudflare

# Usage: ./dns-setup.sh [domain] [project-name]

DOMAIN="${1:-example.com}"
PROJECT_NAME="${2:-my-project}"

if [ -z "$CLOUDFLARE_API_TOKEN" ]; then
    echo "Error: CLOUDFLARE_API_TOKEN not set"
    exit 1
fi

echo "=== Setting up DNS for $DOMAIN ==="

# Step 1: Create zone (if not exists)
echo "Creating zone..."
ZONE_RESPONSE=$(curl -s -X POST \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"name\":\"$DOMAIN\",\"jump_start\":true}" \
    "https://api.cloudflare.com/client/v4/zones")

ZONE_ID=$(echo "$ZONE_RESPONSE" | jq -r '.result.id // empty')

if [ -z "$ZONE_ID" ]; then
    echo "Zone may already exist, getting ID..."
    ZONE_RESPONSE=$(curl -s \
        -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
        "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN")
    ZONE_ID=$(echo "$ZONE_RESPONSE" | jq -r '.result[0].id // empty')
fi

if [ -z "$ZONE_ID" ]; then
    echo "Error: Could not get zone ID"
    exit 1
fi

echo "Zone ID: $ZONE_ID"

# Wait for zone to be active
echo "Waiting for zone activation..."
sleep 5

# Step 2: Add CNAME record
echo "Adding CNAME record..."
curl -s -X POST \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"CNAME\",\"name\":\"$DOMAIN\",\"content\":\"$PROJECT_NAME.pages.dev\",\"proxied\":true}" \
    "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records"

echo ""
echo "=== DNS setup complete ==="
echo "Domain: $DOMAIN"
echo "Target: $PROJECT_NAME.pages.dev"
echo "Note: Propagation may take up to 24 hours"
