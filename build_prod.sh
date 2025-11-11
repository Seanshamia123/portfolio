#!/bin/bash
# Build Flutter Web for Production (Render deployment)

# Check if API_BASE_URL is provided
if [ -z "$1" ]; then
    echo "Usage: ./build_prod.sh <API_BASE_URL>"
    echo "Example: ./build_prod.sh https://portfolio-backend.onrender.com"
    exit 1
fi

API_BASE_URL=$1

echo "Building Flutter Web for Production..."
echo "API Base URL: $API_BASE_URL"
echo ""

flutter build web --release \
    --dart-define=API_BASE_URL=$API_BASE_URL

echo ""
echo "✓ Production build complete!"
echo "Output: build/web/"
echo "API configured to: $API_BASE_URL"
