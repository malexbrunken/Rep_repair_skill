# Campaign Setup Wizard - User Prompts

Run this wizard BEFORE setting up any campaign.

---

## 🎯 REPUTATION REPAIR CAMPAIGN WIZARD

I'll need the following details to set this up. Please answer each question:

---

### 1. CLIENT NAME
What's the real name of the person we're helping?
> [User enters: e.g., "John Smith"]

---

### 2. CAMPAIGN TYPE
Choose one:

**[1] REAL PERSON PROMOTION ONLY**
- Write content directly about the client
- Use client's real name throughout
- Best for: Professionals who want visibility

**[2] ALTER ALIAS ONLY**
- Create fictional persona (reporter, influencer, etc.)
- Client's real name NOT published
- Best for: Clients who need privacy

**[3] BOTH (REAL + ALIAS)**
- Run dual campaigns
- Real identity + alias supporting
- Best for: Maximum SEO domination

> [User enters: 1, 2, or 3]

---

### 3. LOCATION
City and State?
> [User enters: e.g., "Austin, Texas"]

---

### 4. PROFESSION
What do they do? (business owner, professional, etc.)
> [User enters: e.g., "small business owner"]

---

### 5. POSITIVE STORY
What good things can we write about?
- Community involvement
- Business achievements
- Professional accomplishments
- Personal qualities
> [User enters details...]

---

### 6. ATTACK KEYWORDS
What negative terms show up in search that we want to push down?
> [User enters: e.g., "John Smith fraud", "John Smith arrested"]

---

### 7. TARGET KEYWORDS
What positive terms do we want to own?
> [User enters: e.g., "John Smith Austin", "Austin business"]

---

### 8. DOMAINS
Which domains are available for this campaign?
> [User enters: e.g., "johnsmith.com", "johnsmith.online"]

---

### 9. CLOUDFLARE CREDENTIALS
Do you have Cloudflare API access?
- API Token: [from Cloudflare dashboard]
- Account ID: [from Cloudflare dashboard]

---

## After User Answers

Create:
1. `/seo-campaigns/[client-folder]/`
2. Fill in `CAMPAIGN.md` with user answers
3. Fill in `VISION.md` with goals and keywords
4. Create Hugo site from template
5. Setup cron jobs per `CRON-SCHEDULE.md`

Then tell user:
```
✅ CAMPAIGN SETUP COMPLETE

Created: /seo-campaigns/[client-folder]/

NEXT STEPS:
1. Review CAMPAIGN.md
2. Approve content calendar
3. I'll write first round of content
```
