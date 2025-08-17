from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.mysql import JSON as MYSQL_JSON  # MySQL JSON type
# If you're using Postgres or SQLite, you can switch to db.JSON directly.

db = SQLAlchemy()

class ContactMessage(db.Models):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(160), nullable=False)
    email = db.Column(db.String(160), nullable=False)
    message = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    status = db.Column(db.String(40), default="new")