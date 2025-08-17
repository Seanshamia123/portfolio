from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.mysql import JSON as MYSQL_JSON  # MySQL JSON type
# If you're using Postgres or SQLite, you can switch to db.JSON directly.

db = SQLAlchemy()

class Experience(db.Models):
    id = db.Column(db.Integer, primary_key=True)
    link = db.Column(db.String(255), nullable=False)
    title = db.Column(MYSQL_JSON, nullable=False)        # { "en": "...", ... }
    description = db.Column(MYSQL_JSON, nullable=False)  # { "en": "...", ... }
    # You ordered by 'date' in Firestore; keep it for sorting:
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)