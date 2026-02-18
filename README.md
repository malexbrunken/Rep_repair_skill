# Reputation Repair Skill & Template

Complete toolkit for setting up SEO reputation repair campaigns.

## What's Inside

- **SKILL.md** - Main skill file with workflow
- **wizard/** - Campaign setup questionnaire
- **templates/** - Campaign documents (VISION, CONTENT-TRACKER, etc.)
- **hugo-template/** - Ready-to-use Hugo site template
- **scripts/** - Deployment and DNS automation

## Quick Start

1. Read SKILL.md
2. Run wizard prompts (wizard/questionnaire.md)
3. Create campaign from templates
4. Deploy with scripts/

## Important Notes

- NO real client names in templates - use placeholders
- Always check SOUL.md for conflicts first
- Enforce quality gates (2000 words home/about, 1200+ words posts)
- Run drip campaigns, not bulk posts
- **Deployment**: Each `wrangler pages deploy` creates a NEW `.pages.dev` URL - always update CNAME after deploying!

## Deployment Process

Each Cloudflare Pages deployment generates a unique URL. Custom domains (CNAMEs) must be updated manually:

```bash
# Quick deploy with CNAME update
./scripts/deploy.sh <site-folder> <project> <domain> <zone-id> <record-id>
```

The script handles:
1. Building Hugo site
2. Deploying to Cloudflare Pages
3. Updating CNAME record
4. Purging Cloudflare cache

### Finding DNS IDs

```bash
# Get zone ID
curl -s -H "Authorization: Bearer $TOKEN" \
  "https://api.cloudflare.com/client/v4/zones?name=example.com" | jq '.result[0].id'

# Get CNAME record ID
curl -s -H "Authorization: Bearer $TOKEN" \
  "https://api.cloudflare.com/client/v4/zones/<ZONE_ID>/dns_records?type=CNAME&name=www.example.com" | jq '.result[0].id'
```

## Requirements

- Hugo (for building sites)
- Cloudflare account + API token
- Wrangler CLI (`npx wrangler`)

---

*For internal use only*
