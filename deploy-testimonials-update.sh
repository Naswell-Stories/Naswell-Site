#!/bin/bash

# Testimonials Update - Deployment Script
set -e

echo "=================================="
echo "💬 TESTIMONIALS UPDATE"
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
git checkout -b feature/testimonials-update 2>/dev/null || git checkout feature/testimonials-update

echo ""
echo "📦 Staging changes..."
git add layouts/partials/testimonials.html
git add layouts/partials/testimonials-ar.html

echo ""
echo "💾 Committing changes..."
git commit -m "Update testimonials: 4 anonymous testimonials with coaching attributes

- Increased from 3 to 4 testimonials
- Removed personal identifiers (names/occupations)
- Added anonymous descriptors (facing transition, working on goal, etc.)
- Removed mention of 'sessions' from testimonials
- Mixed attributes: clarity/compartmentalizing, encouragement/strategizing, 
  grief support, nonjudgmental space, different perspectives, comradery, 
  patience/respect
- Added 4th avatar gradient (pink-yellow)
- Updated both English and Arabic versions
- Maintains authentic voice"

echo ""
echo "=================================="
echo "✅ READY TO PUSH!"
echo "=================================="
echo ""
echo "Run this command to push to GitHub:"
echo ""
echo "    git push origin feature/testimonials-update"
echo ""
echo "=================================="
echo "🔍 AFTER PUSHING:"
echo "=================================="
echo ""
echo "1. Wait 2-3 minutes for Cloudflare build"
echo "2. Go to: https://dash.cloudflare.com"
echo "3. Pages → Naswell-Site → Deployments"
echo "4. Find: feature/testimonials-update"
echo "5. Test preview URL"
echo ""
echo "Test both pages:"
echo "  • English homepage (testimonials section)"
echo "  • Arabic homepage (testimonials section)"
echo ""
echo "Verify:"
echo "  ✓ 4 testimonials show up"
echo "  ✓ Anonymous identifiers (not names/jobs)"
echo "  ✓ No mention of 'sessions'"
echo "  ✓ Attributes feel natural and authentic"
echo "  ✓ 4th avatar has pink-yellow gradient"
echo "  ✓ Arabic displays correctly (RTL)"
echo "  ✓ Mobile responsive"
echo ""
echo "=================================="
echo "✅ TO DEPLOY TO PRODUCTION:"
echo "=================================="
echo ""
echo "git checkout main"
echo "git merge feature/testimonials-update"
echo "git push origin main"
echo ""
