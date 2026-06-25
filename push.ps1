# Script untuk push perubahan backend ke GitHub
# Usage: .\push.ps1 "commit message"

param(
    [Parameter(Mandatory=$false)]
    [string]$Message = "Update backend"
)

Write-Host "🔄 Pushing backend to GitHub..." -ForegroundColor Cyan
Write-Host ""

# Check if there are changes
$status = git status --porcelain
if ([string]::IsNullOrEmpty($status)) {
    Write-Host "✅ No changes to commit" -ForegroundColor Green
    exit 0
}

# Show changes
Write-Host "📝 Changes detected:" -ForegroundColor Yellow
git status --short

Write-Host ""
Write-Host "📦 Adding all changes..." -ForegroundColor Cyan
git add -A

Write-Host "💾 Committing with message: '$Message'" -ForegroundColor Cyan
git commit -m $Message

Write-Host "🚀 Pushing to GitHub (backend_aplikasi_novil)..." -ForegroundColor Cyan
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "🔗 Repository: https://github.com/novil04/backend_aplikasi_novil" -ForegroundColor Cyan
    Write-Host "⏳ Railway will auto-deploy in 2-5 minutes" -ForegroundColor Yellow
} else {
    Write-Host ""
    Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
    exit 1
}
