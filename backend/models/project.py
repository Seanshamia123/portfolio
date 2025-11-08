from datetime import datetime
from database import db


class Project(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    # Your Flutter model expects title/description as Map<String,String>
    title = db.Column(db.JSON, nullable=False)        # { "en": "...", ... }
    description = db.Column(db.JSON, nullable=False)  # { "en": "...", ... }
    link = db.Column(db.String(255), nullable=True)
    image_url = db.Column(db.String(255), nullable=True)
    sort_order = db.Column(db.Integer, default=0)
