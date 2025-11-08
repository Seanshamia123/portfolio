#!/usr/bin/env python3
"""
Script to create the MySQL database if it doesn't exist.
Run this before init_db.py
"""

import pymysql
import os
from dotenv import load_dotenv

load_dotenv()

def create_database():
    """Create the portfolio database if it doesn't exist."""
    host = os.getenv('MYSQL_HOST', 'localhost')
    port = int(os.getenv('MYSQL_PORT', 3306))
    user = os.getenv('MYSQL_USER')
    password = os.getenv('MYSQL_PASSWORD')
    db_name = os.getenv('MYSQL_DB')

    if not all([user, password, db_name]):
        print("❌ Error: Missing database credentials in .env file")
        print("Please ensure MYSQL_USER, MYSQL_PASSWORD, and MYSQL_DB are set")
        return False

    try:
        # Connect to MySQL server (without specifying a database)
        print(f"Connecting to MySQL server at {host}:{port}...")
        connection = pymysql.connect(
            host=host,
            port=port,
            user=user,
            password=password
        )

        cursor = connection.cursor()

        # Check if database exists
        cursor.execute(f"SHOW DATABASES LIKE '{db_name}'")
        result = cursor.fetchone()

        if result:
            print(f"✓ Database '{db_name}' already exists")
        else:
            # Create database
            print(f"Creating database '{db_name}'...")
            cursor.execute(f"CREATE DATABASE {db_name} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci")
            print(f"✓ Database '{db_name}' created successfully!")

        cursor.close()
        connection.close()
        return True

    except pymysql.Error as e:
        print(f"❌ MySQL Error: {e}")
        print("\nTroubleshooting tips:")
        print("1. Make sure MySQL server is running")
        print("2. Check your credentials in backend/.env file")
        print("3. Ensure the MySQL user has appropriate permissions")
        return False
    except Exception as e:
        print(f"❌ Error: {e}")
        return False

if __name__ == "__main__":
    if create_database():
        print("\n✅ Ready to initialize tables!")
        print("Run: python backend/init_db.py")
    else:
        print("\n❌ Failed to create database")
        print("Please fix the errors above and try again")
