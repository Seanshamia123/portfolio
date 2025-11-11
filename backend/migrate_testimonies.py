#!/usr/bin/env python3
"""
Migration script to add new columns to existing Testimony table.
Run this if you have existing data and need to add the new fields.
"""

from dotenv import load_dotenv

# Load environment variables BEFORE importing app
load_dotenv()

from app import create_app
from models import db

def migrate_testimonies():
    """Add new columns to existing testimonies table."""
    app = create_app()

    with app.app_context():
        try:
            # Detect database type
            db_type = db.engine.name

            # Use raw SQL to add columns if they don't exist
            with db.engine.connect() as conn:
                # Check if columns exist
                if db_type == 'sqlite':
                    result = conn.execute(db.text("PRAGMA table_info(testimony)"))
                    columns = [row[1] for row in result]
                elif db_type == 'mysql':
                    result = conn.execute(db.text("SHOW COLUMNS FROM testimony"))
                    columns = [row[0] for row in result]
                else:
                    print(f"❌ Unsupported database type: {db_type}")
                    return

                migrations_needed = []

                if 'status' not in columns:
                    migrations_needed.append("ALTER TABLE testimony ADD COLUMN status VARCHAR(20) DEFAULT 'approved'")

                if 'created_at' not in columns:
                    if db_type == 'sqlite':
                        # SQLite doesn't support CURRENT_TIMESTAMP in ALTER TABLE
                        migrations_needed.append("ALTER TABLE testimony ADD COLUMN created_at DATETIME")
                    else:
                        migrations_needed.append("ALTER TABLE testimony ADD COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP")

                if 'email' not in columns:
                    migrations_needed.append("ALTER TABLE testimony ADD COLUMN email VARCHAR(160)")

                if migrations_needed:
                    print("Applying migrations...")
                    for migration in migrations_needed:
                        print(f"  - {migration}")
                        conn.execute(db.text(migration))
                    conn.commit()
                    print("✓ Migration completed successfully!")
                else:
                    print("✓ All columns already exist. No migration needed.")

                # Update existing testimonies to 'approved' status and set timestamps
                conn.execute(db.text("UPDATE testimony SET status = 'approved' WHERE status IS NULL"))
                conn.execute(db.text("UPDATE testimony SET created_at = CURRENT_TIMESTAMP WHERE created_at IS NULL"))
                conn.commit()
                print("✓ Updated existing testimonies to 'approved' status with timestamps")

        except Exception as e:
            print(f"❌ Error during migration: {e}")
            print("Note: If using MySQL, you may need to run migrations differently.")

if __name__ == "__main__":
    migrate_testimonies()
