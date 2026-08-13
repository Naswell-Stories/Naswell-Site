#!/bin/bash

# Combined Update - Deployment Script
# Updates: Testimonials + Founding Spots
set -e

echo "=================================="
echo "🚀 COMBINED WEBSITE UPDATE"
echo "=================================="
echo ""

# Check if in correct directory
if [ ! -f "hugo.toml" ]; then
    echo "❌ Error: Not in naswell-site directory"
    echo "Please run from: C:\Users\HP\naswell-site"
    exit 1
fi

echo "✅ Files already updated!"
echo ""

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"
echo ""

# Create and switch to feature branch
echo "🔀 Creating feature branch..."
git checkout -b feature/testimonials-spots-update 2>/dev/null || git checkout feature/testimonials-spots-update

echo ""
echo "📦 Staging changes..."
git add layouts/partials/testimonials.html
git add layouts/partials/testimonials-ar.html
git add layouts/partials/hero-coaching.html
git add layouts/partials/hero-coaching-ar.html

echo ""
echo "💾 Committing changes..."
git commit -m "Update testimonials and founding spots counter

Testimonials Changes:
- Increased from 3 to 4 testimonials
- Removed personal identifiers (names/occupations)
- Added anonymous descriptors (facing transition, working on goal, etc.)
- Removed mention of 'sessions' from testimonials
- Changed subtitle to 'From conversations I've had.'
- Changed pronouns from 'they' to 'he'
- Mixed coaching attributes: clarity/compartmentalizing, encouragement/
  strategizing, grief support, nonjudgmental space, different perspectives,
  comradery, patience/respect
- Added 4th avatar gradient (pink-yellow)
- Updated both English and Arabic versions

Founding Spots Changes:
- Updated from 10/10 to 6/10 spots
- Added urgency messaging: 'Only 6 spots left of 10 • Book now'
- Arabic: 'فقط 6 أماكن متبقية من 10 • احجز الآن'
- Updated both English and Arabic hero sections"

echo ""
echo "=================================="
echo "✅ READY TO PUSH!"
echo "=================================="
echo ""
echo "Run this command to push to GitHub:"
echo ""
echo "    git push origin feature/testimonials-spots-update"
echo ""
echo "=================================="
echo "🔍 AFTER PUSHING:"
echo "=================================="
echo ""
echo "1. Wait 2-3 minutes for Cloudflare build"
echo "2. Go to: https://dash.cloudflare.com"
echo "3. Pages → Naswell-Site → Deployments"
echo "4. Find: feature/testimonials-spots-update"
echo "5. Test preview URL"
echo ""
echo "Test these sections:"
echo "  • Hero section (founding spots counter)"
echo "  • Testimonials section (4 testimonials)"
echo "  • Both English and Arabic versions"
echo ""
echo "Verify:"
echo "  ✓ Founding spots shows '6 spots left of 10 • Book now'"
echo "  ✓ 4 testimonials with anonymous identifiers"
echo "  ✓ Testimonials subtitle changed"
echo "  ✓ Pronouns are 'he' not 'they'"
echo "  ✓ No mention of 'sessions'"
echo "  ✓ 4th avatar has pink-yellow gradient"
echo "  ✓ Arabic displays correctly (RTL)"
echo "  ✓ Mobile responsive"
echo ""
echo "=================================="
echo "✅ TO DEPLOY TO PRODUCTION:"
echo "=================================="
echo ""
echo "git checkout main"
echo "git merge feature/testimonials-spots-update"
echo "git push origin main"
echo ""
