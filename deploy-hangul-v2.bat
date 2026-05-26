@echo off
chcp 65001 >nul
echo ========================================
echo   HANGUL BLOCKS - Deploy to GitHub
echo ========================================
echo.

set REPO_NAME=hangul-blocks
set GITHUB_USER=DemosLady

echo Step 1: Preparing files...
if exist hangul-blocks.html (
    copy /Y hangul-blocks.html index.html >nul
    echo    hangul-blocks.html copied to index.html
)

echo Step 2: Initializing git...
if not exist .git (
    git init
    git branch -M main
    git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git
) else (
    echo    Git already initialized
)

echo Step 3: Committing...
git add index.html hangul-chart.pdf ads.txt sitemap.xml robots.txt 2>nul
git commit -m "Hangul Blocks - update"

echo Step 4: Pushing to GitHub...
git push -u origin main --force

echo.
echo ========================================
echo   DONE!
echo   URL: https://%REPO_NAME%.vercel.app/
echo ========================================
pause
