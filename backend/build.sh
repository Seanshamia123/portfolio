#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Run database migrations
flask db upgrade

# Seed database if needed (optional - comment out if not needed)
# python seed_all_data.py
