# WeatherNow CLI 🌤️

A simple command-line tool to get current weather information for any location worldwide.

## Quick Install

```bash
npm install -g @mark_alber/weathernow-cli
```

That's it! Now you can use `weathernow` from anywhere in your terminal.

## Features

- Get temperature and humidity for any city/location
- Filter results to show only temperature or humidity
- Clean, formatted output with emojis
- Error handling for invalid locations and API issues
- Supports both environment variables and .env files

## Setup

### 1. Get an API Key
- Sign up for a free account at [OpenWeatherMap](https://openweathermap.org/api)
- Get your API key from the dashboard

### 2. Configure API Key (Choose one method)

**Option A: Environment Variable**
```powershell
# Windows PowerShell
$env:WEATHER_API_KEY = "your_api_key_here"

# Or set it permanently
[Environment]::SetEnvironmentVariable("WEATHER_API_KEY", "your_api_key_here", "User")
```

```bash
# Linux/macOS
export WEATHER_API_KEY="your_api_key_here"

# Add to ~/.bashrc or ~/.zshrc for persistence
echo 'export WEATHER_API_KEY="your_api_key_here"' >> ~/.bashrc
```

**Option B: .env File** (For local development)
```bash
# Create .env file in your project directory
echo "WEATHER_API_KEY=your_api_key_here" > .env
```

## Usage

```bash
# Show both temperature and humidity
weathernow "New York"
weathernow London

# Show only temperature
weathernow "Paris" temp
weathernow Tokyo temperature

# Show only humidity
weathernow "Los Angeles" humidity

# Multiple word locations (use quotes)
weathernow "San Francisco" temp
```

## Examples

```bash
$ weathernow "New York"
🔍 Fetching weather data for "New York"...

📍 New York, US
──────────────────────────────
🌡️  Temperature: 18.5°C
💧 Humidity: 65%

$ weathernow London temp
🔍 Fetching weather data for "London"...

📍 London, GB
──────────────────────────────
🌡️  Temperature: 12.3°C

$ weathernow Paris humidity
🔍 Fetching weather data for "Paris"...

📍 Paris, FR
──────────────────────────────
💧 Humidity: 73%
```

## Alternative Installation Methods

### Option 1: One-liner Script (Linux/macOS)
```bash
curl -sSL https://raw.githubusercontent.com/MarkCoder1/weathernow-cli/main/install.sh | bash
```

### Option 2: One-liner Script (Windows)
```powershell
# PowerShell
iwr -useb https://raw.githubusercontent.com/mark-alber/weathernow-cli/main/install.ps1 | iex
```

### Option 3: From Source
```bash
git clone https://github.com/mark-alber/weathernow-cli.git
cd weathernow-cli
npm install -g .
```

### Option 4: Local Development
```bash
git clone https://github.com/mark-alber/weathernow-cli.git
cd weathernow-cli
npm install
cp .env.example .env
# Edit .env with your API key
node index.js London
```

## Publishing to npm (For Maintainers)

```bash
# 1. Login to npm
npm login

# 2. Publish the package
npm publish

# 3. Users can then install with:
npm install -g @mark_alber/weathernow-cli
```
