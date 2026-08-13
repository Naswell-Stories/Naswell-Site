#!/bin/bash

# Complete Website Update - Deployment Script (CORRECTED)
# Updates: Testimonials + Integrated Founding Spots Counter + Booking Pages
set -e

echo "=================================="
echo "🚀 COMPLETE WEBSITE UPDATE"
echo "=================================="
echo ""

# Check if in correct directory
if [ ! -f "hugo.toml" ]; then
    echo "❌ Error: Not in naswell-site directory"
    echo "Please run from: C:\Users\HP\naswell-site"
    exit 1
fi

echo "✅ All files updated!"
echo ""

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"
echo ""

# Create and switch to feature branch
echo "🔀 Creating feature branch..."
git checkout -b feature/complete-update 2>/dev/null || git checkout feature/complete-update

echo ""
echo "📦 Staging changes..."
git add layouts/partials/testimonials.html
git add layouts/partials/testimonials-ar.html
git add layouts/partials/hero-coaching.html
git add layouts/partials/hero-coaching-ar.html
git add layouts/partials/final-cta.html
git add layouts/partials/final-cta-ar.html
git add content/booking/index.md
git add content/ar/booking/index.md
git add layouts/shortcodes/booking-countdown.html

echo ""
echo "💾 Committing changes..."
git commit -m "Complete update: Testimonials + Integrated spots counter + Booking pages

Testimonials Changes:
- Increased from 3 to 4 testimonials
- Removed personal identifiers (names/occupations)
- Added anonymous descriptors
- Removed mention of 'sessions'
- Changed subtitle to 'From conversations I've had.'
- Changed pronouns from 'they' to 'he'
- Mixed all 7 coaching attributes naturally
- Added 4th avatar gradient (pink-yellow)
- Updated both English and Arabic versions

Founding Spots Counter - UPDATED COUNTDOWN ONLY (10→6):
✅ Hero section: Integrated into green button (⚡ 6 spots left)
✅ Final CTA section: Integrated into green button (⚡ 6 spots left)
✅ Booking page (EN): Updated text '10 spots' → '6 spots remaining'
✅ Booking page (AR): Updated text '10 أماكن' → '6 أماكن متبقية'
✅ Booking countdown shortcode: Shows '6' instead of '10'
❌ Why The Hybrid Model: Stays at '10' (explains original strategy, not countdown)

Integration Details:
- Counter positioned INSIDE green CTA buttons (Option B)
- Below main button text
- Bold orange/yellow color (#ffa500/#ff8c00)
- Lightning bolt icon (⚡) with pulse animation
- Creates urgency while maintaining authentic tone
- Excellent contrast with green button background
- Entire button area is clickable
- Mobile responsive with adjusted sizing

Updated files (9 total):
1. testimonials.html + testimonials-ar.html
2. hero-coaching.html + hero-coaching-ar.html
3. final-cta.html + final-cta-ar.html
4. content/booking/index.md + content/ar/booking/index.md
5. layouts/shortcodes/booking-countdown.html"

echo ""
echo "=================================="
echo "✅ READY TO PUSH!"
echo "=================================="
echo ""
echo "Run this command to push to GitHub:"
echo ""
echo "    git push origin feature/complete-update"
echo ""
echo "=================================="
echo "🔍 AFTER PUSHING:"
echo "=================================="
echo ""
echo "1. Wait 2-3 minutes for Cloudflare build"
echo "2. Go to: https://dash.cloudflare.com"
echo "3. Pages → Naswell-Site → Deployments"
echo "4. Find: feature/complete-update"
echo "5. Test preview URL"
echo ""
echo "Test ALL sections:"
echo "  • Hero section (integrated counter in button)"
echo "  • Testimonials section (4 testimonials)"
echo "  • Final CTA section (integrated counter in button)"
echo "  • Booking page /booking (countdown shows 6)"
echo "  • Why The Hybrid Model (still says 10 - CORRECT)"
echo "  • Both English and Arabic versions"
echo ""
echo "Verify:"
echo "  ✓ Hero button: '⚡ Only 6 spots left of 10'"
echo "  ✓ Final CTA button: '⚡ Only 6 spots left of 10'"
echo "  ✓ Booking page: 'Only 6 founding client spots remaining'"
echo "  ✓ Booking countdown box: Shows '6' (big number)"
echo "  ✓ Why Hybrid Model: Says '10 founding clients' (STAYS 10)"
echo "  ✓ 4 testimonials with anonymous identifiers"
echo "  ✓ Testimonials subtitle: 'From conversations I've had.'"
echo "  ✓ Pronouns are 'he' not 'they'"
echo "  ✓ No mention of 'sessions'"
echo "  ✓ 4th avatar has pink-yellow gradient"
echo "  ✓ Arabic displays correctly (RTL)"
echo "  ✓ Mobile responsive"
echo "  ✓ All buttons are clickable"
echo ""
echo "=================================="
echo "✅ TO DEPLOY TO PRODUCTION:"
echo "=================================="
echo ""
echo "git checkout main"
echo "git merge feature/complete-update"
echo "git push origin main"
echo ""
