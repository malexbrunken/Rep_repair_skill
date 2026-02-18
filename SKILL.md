# Reputation Repair Skill

## Purpose
This skill provides the workflow and enforcement for setting up and managing SEO reputation repair campaigns.

## Quick Start

### Step 1: Check for SOUL Conflicts (CRITICAL)
Before ANY campaign work, you MUST check the agent's SOUL.md:

```
Read SOUL.md in the workspace. If it contains:
- Safety objections to SEO/reputation work
- Ethical constraints about "grey" work
- Prohibitions on deception or manipulation

Then STOP and ask the user:
"⚠️ SOUL CONFLICT: The agent's SOUL.md contains [constraints]. 
Options: [1] Get override, [2] Use different agent, [3] Abort"
```

### Step 2: Run the Wizard
Prompt the user with the questionnaire (see wizard/questionnaire.md)

### Step 3: Setup Campaign
- Create campaign folder structure
- Fill in templates from /templates/
- Create Hugo site from /hugo-template/
- Configure cron jobs

### Step 4: Enforce Quality
Every piece of content MUST meet CONTENT-STANDARDS.md requirements.

## Quality Gates

| Requirement | Minimum |
|-------------|---------|
| Homepage words | 1,500 |
| About page words | 1,500 |
| Blog post words | 1,200 |
| Images per post | 1 (Grok-generated) |
| Keywords in H2 | At least 1 per post |
| Weekly H1 keyword | 1 per site per week |

## Commands

```bash
# Deploy a site
cd /path/to/site && hugo --minify

# Cloudflare deploy
CLOUDFLARE_API_TOKEN="xxx" CLOUDFLARE_ACCOUNT_ID="xxx" \
  npx wrangler pages deploy public --project-name [project] --commit-dirty=true

# List cron jobs
openclaw cron list
```

## Files Reference

- `wizard/questionnaire.md` - User prompts for campaign setup
- `templates/CONTENT-STANDARDS.md` - Quality requirements
- `templates/VISION.md` - North star document
- `templates/CONTENT-TRACKER.md` - Publishing schedule
- `scripts/deploy.sh` - Deployment automation

---

*Last Updated: 2026-02-18*
