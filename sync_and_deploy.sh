#!/bin/bash
# Automatically sync latest changes from Downloads to the repository and push to GitHub (which auto-updates Vercel)
SOURCE="/Users/meghana/Downloads/Nov Wedding Invite copy.html"
DEST="/Users/meghana/.gemini/antigravity-ide/scratch/wedding-invitation/index.html"

if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$DEST"
    echo "Synced latest Nov Wedding Invite copy.html to index.html"
fi

cd /Users/meghana/.gemini/antigravity-ide/scratch/wedding-invitation
git add index.html
if git diff --staged --quiet; then
    echo "No new changes to commit."
else
    git commit -m "Update invitation content $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "Pushed updates to GitHub! Vercel is now automatically deploying your live changes."
fi
