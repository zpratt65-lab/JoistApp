# 1. Clean up old builds
if (Test-Path -Path "dist") { Remove-Item -Recurse -Force dist }

# 2. Export the project (This creates the 'dist' folder)
Write-Host "Exporting Expo web build..." -ForegroundColor Cyan
npx expo export -p web

# 3. The 'Secret Ingredients' for GitHub Pages
Write-Host "Applying GitHub Pages fixes..." -ForegroundColor Cyan

# Fix A: Create .nojekyll so GitHub doesn't hide the '_expo' folder
New-Item -Path "dist\.nojekyll" -ItemType File -Force

# Fix B: Copy index.html to 404.html 
# This tells GitHub: 'If you can't find a page, just load the app and let the app handle it.'
Copy-Item -Path "dist\index.html" -Destination "dist\404.html" -Force

# 4. Deploy to the gh-pages branch
Write-Host "Pushing to GitHub..." -ForegroundColor Green
npx gh-pages -d dist