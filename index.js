#!/usr/bin/env node

const axios = require('axios');
const path = require('path');
const fs = require('fs');

// Load environment variables from .env file if it exists
try {
    require('dotenv').config({ path: path.join(__dirname, '.env') });
} catch (error) {
    // dotenv not found or .env file doesn't exist, continue without it
}

// OpenWeatherMap API configuration
// Note: You'll need to get a free API key from https://openweathermap.org/api
const API_KEY = process.env.WEATHER_API_KEY || 'your_api_key_here';
const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

async function getWeatherData(location) {
    try {
        const response = await axios.get(BASE_URL, {
            params: {
                q: location,
                appid: API_KEY,
                units: 'metric' // Use Celsius
            }
        });
        
        return {
            temperature: response.data.main.temp,
            humidity: response.data.main.humidity,
            location: response.data.name,
            country: response.data.sys.country
        };
    } catch (error) {
        if (error.response && error.response.status === 404) {
            throw new Error(`Location "${location}" not found`);
        } else if (error.response && error.response.status === 401) {
            throw new Error('Invalid API key. Please set WEATHER_API_KEY environment variable');
        } else {
            throw new Error(`Failed to fetch weather data: ${error.message}`);
        }
    }
}

function displayWeatherInfo(weatherData, showType = 'both') {
    console.log(`\n📍 ${weatherData.location}, ${weatherData.country}`);
    console.log('─'.repeat(30));
    
    switch (showType) {
        case 'temp':
        case 'temperature':
            console.log(`🌡️  Temperature: ${weatherData.temperature}°C`);
            break;
        case 'humidity':
            console.log(`💧 Humidity: ${weatherData.humidity}%`);
            break;
        default:
            console.log(`🌡️  Temperature: ${weatherData.temperature}°C`);
            console.log(`💧 Humidity: ${weatherData.humidity}%`);
    }
    console.log();
}

function showUsage() {
    console.log('\n🌤️  WeatherNow CLI Usage:');
    console.log('─'.repeat(30));
    console.log('weathernow <location> [temp|humidity]');
    console.log('\nExamples:');
    console.log('weathernow "New York"');
    console.log('weathernow London temp');
    console.log('weathernow Paris humidity');
    console.log('weathernow Tokyo');
    console.log('\nNote: Get your free API key from https://openweathermap.org/api');
    console.log('Set it as WEATHER_API_KEY environment variable\n');
}

async function main() {
    const args = process.argv.slice(2);
    
    if (args.length === 0) {
        showUsage();
        return;
    }
    
    // Check if API key is configured
    if (API_KEY === 'your_api_key_here') {
        console.error('❌ Please set your OpenWeatherMap API key in WEATHER_API_KEY environment variable');
        console.log('Get a free API key from: https://openweathermap.org/api');
        process.exit(1);
    }
    
    // Parse arguments
    let location = args[0];
    let showType = 'both';
    
    // If there are more arguments, check if the last one is a display type
    if (args.length > 1) {
        const lastArg = args[args.length - 1].toLowerCase();
        if (['temp', 'temperature', 'humidity'].includes(lastArg)) {
            showType = lastArg;
            // Join all arguments except the last one as location
            location = args.slice(0, -1).join(' ');
        } else {
            // Join all arguments as location
            location = args.join(' ');
        }
    }
    
    try {
        console.log(`🔍 Fetching weather data for "${location}"...`);
        const weatherData = await getWeatherData(location);
        displayWeatherInfo(weatherData, showType);
    } catch (error) {
        console.error(`❌ ${error.message}`);
        process.exit(1);
    }
}

// Run the CLI
main().catch(console.error);