# Cron Schedule - [CLIENT_NAME]

## Active Jobs

### Daily Content Drip
- **Schedule:** 9am, 1pm, 5pm ET (Mon-Fri)
- **What:** Write 1 blog post per run
- **Requirements:**
  - 1,200-1,800 words
  - At least 1 target keyword in H2
  - Grok image with alt text
- **Update tracker:** Mark ✅ with date

### Weekly Vision Review (Monday)
- **Schedule:** 9am ET every Monday
- **What:** Review VISION.md, check alignment
- **Verify:**
  - Domains live (curl each)
  - Search keywords, record positions
  - Update VISION.md with status

### Weekly Content Audit (Friday)
- **Schedule:** 9am ET every Friday
- **What:** Count pages per site, check gaps
- **Compare:** Against CONTENT-TRACKER.md targets
- **Report:** Gaps and priorities for next week

### Weekly Rank Tracking (Wednesday)
- **Schedule:** 6am ET every Wednesday
- **What:** Search all target keywords
- **Record:** Positions of owned domains
- **Save:** To tracking/rankings.json

### Bi-weekly Image Audit
- **Schedule:** 1st and 15th of month, 10am ET
- **What:** Search image results
- **Count:** Owned images in top 20
- **Update:** tracking/image-audit.json

---

## Cron Management

```bash
# List all cron jobs
openclaw cron list

# Add new job
openclaw cron add --name "Job Name" --schedule "0 9 * * 1" --message "Task..."

# Check job status
openclaw cron status [job-id]

# Run manually
openclaw cron run [job-id]
```

---

*Last Updated: [DATE]*
