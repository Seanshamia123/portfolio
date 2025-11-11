#!/bin/bash
# Build Flutter Web for Development (uses localhost)

echo "Building Flutter Web for Development..."
flutter build web --release

echo "✓ Development build complete!"
echo "Output: build/web/"
echo ""
echo "To test locally:"
echo "  cd build/web && python3 -m http.server 8080"
echo "  Then visit: http://localhost:8080"
