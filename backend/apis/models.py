from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.mysql import JSON as MYSQL_JSON  # MySQL JSON type
# If you're using Postgres or SQLite, you can switch to db.JSON directly.

db = SQLAlchemy()

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(160), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)

class Project(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # Your Flutter model expects title/description as Map<String,String>
    title = db.Column(MYSQL_JSON, nullable=False)        # { "en": "...", ... }
    description = db.Column(MYSQL_JSON, nullable=False)  # { "en": "...", ... }
    link = db.Column(db.String(255), nullable=True)
    image_url = db.Column(db.String(255), nullable=True)
    sort_order = db.Column(db.Integer, default=0)        # to mimic Firestore order

class Experience(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    link = db.Column(db.String(255), nullable=False)
    title = db.Column(MYSQL_JSON, nullable=False)        # { "en": "...", ... }
    description = db.Column(MYSQL_JSON, nullable=False)  # { "en": "...", ... }
    # You ordered by 'date' in Firestore; keep it for sorting:
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)

class Testimony(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(160), nullable=False)
    text = db.Column(db.Text, nullable=False)
    link = db.Column(db.String(255), nullable=False)
    avatar = db.Column(db.String(255), nullable=False)

class ContactMessage(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(160), nullable=False)
    email = db.Column(db.String(160), nullable=False)
    message = db.Column(db.Text, nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    status = db.Column(db.String(40), default="new")
