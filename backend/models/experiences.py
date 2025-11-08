from datetime import datetime
from database import db


class Experience(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    link = db.Column(db.String(255), nullable=False)
    title = db.Column(db.JSON, nullable=False)        # { "en": "...", ... }
    description = db.Column(db.JSON, nullable=False)  # { "en": "...", ... }
    # You ordered by 'date' in Firestore; keep it for sorting:
    date = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)
