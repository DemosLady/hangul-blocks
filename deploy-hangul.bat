@echo off
chcp 65001 >nul
echo ========================================
echo   HANGUL BLOCKS - Deploy to GitHub
echo ========================================
echo.

set REPO_NAME=hangul-blocks
set GITHUB_USER=DemosLady

echo Step 1: Creating project folder...
mkdir %REPO_NAME% 2>nul
cd %REPO_NAME%

echo Step 2: Copying files...
copy ..\hangul-blocks.html index.html >nul
copy ..\hangul-chart.pdf hangul-chart.pdf >nul
copy ..\ads.txt ads.txt >nul
copy ..\sitemap.xml sitemap.xml >nul
copy ..\robots.txt robots.txt >nul

echo Step 3: Initializing git...
git init
git add .
git commit -m "Hangul Blocks - Learn Korean in 60 minutes"

echo Step 4: Pushing to GitHub...
git branch -M main
git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git
git push -u origin main

echo.
echo ========================================
echo   DONE! Now go to Vercel:
echo   1. vercel.com/new
echo   2. Import %GITHUB_USER%/%REPO_NAME%
echo   3. Deploy (no config needed)
echo   URL: https://%REPO_NAME%.vercel.app/
echo ========================================
pause
