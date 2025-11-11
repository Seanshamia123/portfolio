from datetime import datetime
from database import db


class Testimony(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(160), nullable=False)
    text = db.Column(db.Text, nullable=False)
    link = db.Column(db.String(255), nullable=True)  # Optional for public submissions
    avatar = db.Column(db.String(255), nullable=True)  # Optional, will use default if not provided
    status = db.Column(db.String(20), default='pending')  # pending, approved, rejected
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    email = db.Column(db.String(160), nullable=True)  # For contact/moderation purposes
    
