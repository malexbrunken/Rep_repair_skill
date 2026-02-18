# Deployment Guide - [CLIENT_NAME]

## Cloudflare Configuration

### Account Details
- **Account ID:** [ACCOUNT_ID]
- **API Token:** [TOKEN]
- **IndexNow Key:** [KEY]

## Domains

| Domain | Type | Project Name | Status |
|--------|------|--------------|--------|
| [DOMAIN] | Pages | [PROJECT] | [STATUS] |

## Deploy Command

```bash
cd /path/to/site

# Build
hugo --minify

# Deploy
CLOUDFLARE_API_TOKEN="[TOKEN]" \
CLOUDFLARE_ACCOUNT_ID="[ACCOUNT_ID]" \
npx wrangler pages deploy public --project-name [PROJECT] --commit-dirty=true
```

## DNS Setup

### For new domains:
1. Add domain to Cloudflare
2. Create CNAME record pointing to [PROJECT].pages.dev
3. Wait for propagation (can take up to 24h)

### API Commands:
```bash
# Create zone
curl -X POST -H "Authorization: Bearer [TOKEN]" \
  -H "Content-Type: application/json" \
  --data '{"name":"[DOMAIN]","jump_start":true}' \
  "https://api.cloudflare.com/client/v4/zones"

# Add CNAME
curl -X POST -H "Authorization: Bearer [TOKEN]" \
  -H "Content-Type: application/json" \
  --data '{"type":"CNAME","name":"[DOMAIN]","content":"[PROJECT].pages.dev","proxied":true}' \
  "https://api.cloudflare.com/client/v4/zones/[ZONE_ID]/dns_records"
```

---

*Last Updated: [DATE]*
