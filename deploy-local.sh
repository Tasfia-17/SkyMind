#!/bin/bash

# SkyMind AI - Quick Deployment Script

echo "🚁 SkyMind AI - Deployment Helper"
echo "=================================="
echo ""

# Check if we're in the right directory
if [ ! -f "README.md" ]; then
    echo "❌ Error: Run this script from the SkyMind root directory"
    exit 1
fi

echo "✅ Repository structure verified"
echo ""

# Test local deployment
echo "📦 Testing local deployment..."
cd mujoco_wasm

if command -v python3 &> /dev/null; then
    echo "✅ Python 3 found"
    echo ""
    echo "🌐 Starting local server on http://localhost:8000"
    echo "   Press Ctrl+C to stop"
    echo ""
    echo "📝 Instructions:"
    echo "   1. Open http://localhost:8000 in your browser"
    echo "   2. Press F12 to open console"
    echo "   3. Watch for AI decisions every 2 seconds:"
    echo "      🤖 AI Decision #1 (Key 1/3): patrol"
    echo ""
    python3 -m http.server 8000
else
    echo "❌ Python 3 not found. Install it first:"
    echo "   Ubuntu/Debian: sudo apt install python3"
    echo "   macOS: brew install python3"
    exit 1
fi
