# WeatherNow CLI Installation Script for PowerShell
# This script installs weathernow-cli globally using npm

Write-Host "🌤️  Installing WeatherNow CLI..." -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
try {
    $nodeVersion = node --version 2>$null
    Write-Host "✅ Node.js is installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed. Please install Node.js first:" -ForegroundColor Red
    Write-Host "   Visit: https://nodejs.org/" -ForegroundColor Yellow
    exit 1
}

# Check if npm is installed
try {
    $npmVersion = npm --version 2>$null
    Write-Host "✅ npm is installed: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm is not installed. Please install npm first." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Install the package globally
Write-Host "📦 Installing @mark_alber/weathernow-cli globally..." -ForegroundColor Yellow
try {
    npm install -g @mark_alber/weathernow-cli
    Write-Host ""
    Write-Host "🎉 Installation complete!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📋 Next steps:" -ForegroundColor Cyan
    Write-Host "1. Get a free API key from: https://openweathermap.org/api"
    Write-Host "2. Set your API key:"
    Write-Host "   `$env:WEATHER_API_KEY = `"your_api_key_here`"" -ForegroundColor Yellow
    Write-Host "3. Test the installation:"
    Write-Host "   weathernow London" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "For more help, visit: https://github.com/mark-alber/weathernow-cli"
} catch {
    Write-Host "❌ Installation failed. Please try manually:" -ForegroundColor Red
    Write-Host "npm install -g @mark_alber/weathernow-cli" -ForegroundColor Yellow
    exit 1
}