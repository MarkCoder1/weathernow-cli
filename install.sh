#!/bin/bash

# WeatherNow CLI Installation Script
# This script installs weathernow-cli globally using npm

set -e

echo "🌤️  Installing WeatherNow CLI..."
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first:"
    echo "   Visit: https://nodejs.org/"
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"
echo ""

# Install the package globally
echo "📦 Installing @mark_alber/weathernow-cli globally..."
npm install -g @mark_alber/weathernow-cli

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Get a free API key from: https://openweathermap.org/api"
echo "2. Set your API key:"
echo "   export WEATHER_API_KEY=\"your_api_key_here\""
echo "3. Test the installation:"
echo "   weathernow London"
echo ""
echo "For more help, visit: https://github.com/mark-alber/weathernow-cli"