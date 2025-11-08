from datetime import datetime
from database import db


class Testimony(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(160), nullable=False)
    text = db.Column(db.Text, nullable=False)
    link = db.Column(db.String(255), nullable=False)
    avatar = db.Column(db.String(255), nullable=False)
    
