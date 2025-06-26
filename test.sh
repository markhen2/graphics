#!/usr/bin/env bash
set -e

cd ~/repo
git pull origin main

# regenerate your HTML
node scripts/buildGraphics.js

git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"
git add docs/ index.html assets/
git diff --quiet --cached || git commit -m "Automated plot update"
git push origin main