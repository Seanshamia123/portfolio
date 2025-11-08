#!/bin/bash
# Development Quick Start Script
# Starts both backend and frontend in development mode

set -e

echo "=========================================="
echo "Portfolio Development Server"
echo "=========================================="
echo ""

# Function to cleanup on exit
cleanup() {
    echo ""
    echo "Shutting down servers..."
    kill $BACKEND_PID 2>/dev/null || true
    kill $FRONTEND_PID 2>/dev/null || true
    exit
}

trap cleanup INT TERM

# Check if backend is set up
if [ ! -d "backend/venv" ]; then
    echo "⚠ Backend not set up yet. Running setup..."
    cd backend && ./setup.sh && cd ..
fi

# Start backend
echo "Starting Flask backend on http://localhost:5000..."
cd backend
source venv/bin/activate
FLASK_APP=app.py FLASK_ENV=development flask run &
BACKEND_PID=$!
cd ..
echo "✓ Backend started (PID: $BACKEND_PID)"

# Wait for backend to be ready
echo "Waiting for backend to be ready..."
sleep 3

# Start frontend
echo ""
echo "Starting Flutter frontend..."
echo "Choose your platform:"
echo "1) Web (Chrome)"
echo "2) Android Emulator"
echo "3) iOS Simulator"
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo "Starting on Chrome..."
        flutter run -d chrome &
        FRONTEND_PID=$!
        ;;
    2)
        echo "Starting on Android..."
        flutter run -d android &
        FRONTEND_PID=$!
        ;;
    3)
        echo "Starting on iOS..."
        flutter run -d ios &
        FRONTEND_PID=$!
        ;;
    *)
        echo "Invalid choice. Starting on web..."
        flutter run -d chrome &
        FRONTEND_PID=$!
        ;;
esac

echo ""
echo "=========================================="
echo "✅ Development servers running!"
echo "=========================================="
echo ""
echo "Backend API: http://localhost:5000"
echo "Frontend: Check Flutter output above"
echo ""
echo "Press Ctrl+C to stop all servers"
echo ""

# Wait for user interrupt
wait
