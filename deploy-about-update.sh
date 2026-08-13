#!/bin/bash

# About Section Update - Quick Deploy
set -e

echo "=================================="
echo "📝 ABOUT SECTION UPDATE"
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
git checkout -b feature/about-update 2>/dev/null || git checkout feature/about-update

echo ""
echo "📦 Staging changes..."
git add content/About/_index.md
git add content/ar/About/_index.md

echo ""
echo "💾 Committing changes..."
git commit -m "Update About section: Add volunteering and social gathering info

- Added information about volunteering community involvement in UAE
- Added details about organizing social gatherings for meaningful connection
- Emphasizes walking the walk on combating post-COVID isolation
- Updated both English and Arabic versions
- Maintains authentic voice and tone"

echo ""
echo "=================================="
echo "✅ READY TO PUSH!"
echo "=================================="
echo ""
echo "Run this command to push to GitHub:"
echo ""
echo "    git push origin feature/about-update"
echo ""
echo "=================================="
echo "🔍 AFTER PUSHING:"
echo "=================================="
echo ""
echo "1. Wait 2-3 minutes for Cloudflare build"
echo "2. Go to: https://dash.cloudflare.com"
echo "3. Pages → Naswell-Site → Deployments"
echo "4. Find: feature/about-update"
echo "5. Test preview URL"
echo ""
echo "=================================="
echo "✅ TO DEPLOY TO PRODUCTION:"
echo "=================================="
echo ""
echo "git checkout main"
echo "git merge feature/about-update"
echo "git push origin main"
echo ""
