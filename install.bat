@echo off
REM WeatherNow CLI Installation Script for Windows
REM This script installs weathernow-cli globally using npm

echo 🌤️  Installing WeatherNow CLI...
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js first:
    echo    Visit: https://nodejs.org/
    exit /b 1
)

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    exit /b 1
)

echo ✅ Node.js and npm are installed
echo.

REM Install the package globally
echo 📦 Installing @mark_alber/weathernow-cli globally...
npm install -g @mark_alber/weathernow-cli

echo.
echo 🎉 Installation complete!
echo.
echo 📋 Next steps:
echo 1. Get a free API key from: https://openweathermap.org/api
echo 2. Set your API key:
echo    set WEATHER_API_KEY=your_api_key_here
echo 3. Test the installation:
echo    weathernow London
echo.
echo For more help, visit: https://github.com/mark-alber/weathernow-cli