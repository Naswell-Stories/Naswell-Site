#!/bin/bash
# Publish About Page Updates (English + Arabic)

cd "$(dirname "$0")"

echo "📤 Publishing About page updates..."

git add content/About/_index.md content/ar/About/_index.md
git commit -m "Add Professional Background section to About pages (English & Arabic)"
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! About pages updated and published!"
    echo ""
    echo "🌐 Your changes will be live in ~60 seconds:"
    echo "   English: https://naswellstories.com/about/"
    echo "   Arabic:  https://naswellstories.com/ar/about/"
    echo ""
else
    echo ""
    echo "❌ Error: Git push failed"
    echo "Please check your Git credentials and try again"
    exit 1
fi
