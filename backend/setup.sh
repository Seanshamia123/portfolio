#!/bin/bash
# Portfolio Backend Setup Script
# This script sets up the backend environment and database

set -e  # Exit on error

echo "================================================"
echo "Portfolio Backend Setup"
echo "================================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Change to backend directory
cd "$(dirname "$0")"

echo "Step 1: Creating virtual environment..."
if [ -d "venv" ]; then
    echo -e "${YELLOW}⚠ Virtual environment already exists, removing old one...${NC}"
    rm -rf venv
fi

python3 -m venv venv
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Virtual environment created${NC}"
else
    echo -e "${RED}❌ Failed to create virtual environment${NC}"
    echo "Please install python3-venv: sudo apt install python3-venv"
    exit 1
fi

echo ""
echo "Step 2: Activating virtual environment and installing dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Dependencies installed${NC}"
else
    echo -e "${RED}❌ Failed to install dependencies${NC}"
    exit 1
fi

echo ""
echo "Step 3: Creating MySQL database..."
python3 create_db.py

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Database ready${NC}"
else
    echo -e "${YELLOW}⚠ Database creation had issues. You may need to:${NC}"
    echo "  - Start MySQL: sudo systemctl start mysql"
    echo "  - Check credentials in .env file"
    echo "  - Or create database manually in MySQL Workbench"
fi

echo ""
echo "Step 4: Initializing database tables and seed data..."
python3 init_db.py

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Database initialized${NC}"
else
    echo -e "${RED}❌ Failed to initialize database${NC}"
    exit 1
fi

echo ""
echo "================================================"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo "================================================"
echo ""
echo "To start the backend server:"
echo "  cd backend"
echo "  source venv/bin/activate"
echo "  flask run"
echo ""
echo "Or simply run:"
echo "  cd backend && source venv/bin/activate && flask run"
echo ""
echo "API will be available at: http://localhost:5000"
echo "Admin credentials: admin@portfolio.com / admin123"
echo ""
