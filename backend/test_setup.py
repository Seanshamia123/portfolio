#!/usr/bin/env python3
"""Test script to verify backend setup before deployment"""

import sys
from app import create_app
from models import db, Project, Experience, Testimony, ContactMessage, User

def test_setup():
    print("Testing backend setup...")
    print("-" * 50)

    try:
        # Test 1: Create Flask app
        print("1. Creating Flask app...", end=" ")
        app = create_app()
        print("✓")

        # Test 2: Check database connection
        print("2. Checking database connection...", end=" ")
        with app.app_context():
            # Try to query the database
            projects = Project.query.count()
            experiences = Experience.query.count()
            testimonies = Testimony.query.count()
            contacts = ContactMessage.query.count()
            users = User.query.count()
            print("✓")

            # Test 3: Display data counts
            print("\n" + "-" * 50)
            print("Database Contents:")
            print(f"  Projects: {projects}")
            print(f"  Experiences: {experiences}")
            print(f"  Testimonies: {testimonies}")
            print(f"  Contact Messages: {contacts}")
            print(f"  Users: {users}")

        print("-" * 50)
        print("✓ All tests passed! Backend is ready for deployment.")
        return True

    except Exception as e:
        print(f"\n✗ Error: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == '__main__':
    success = test_setup()
    sys.exit(0 if success else 1)
