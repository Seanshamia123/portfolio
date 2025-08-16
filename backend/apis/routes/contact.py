from flask import Blueprint, request
from models import db, ContactMessage

bp = Blueprint("contact", __name__, url_prefix="/api/contact")

@bp.post("")
def create_message():
    d = request.get_json() or {}
    m = ContactMessage(name=d["name"], email=d["email"], message=d["message"])
    db.session.add(m); db.session.commit()
    return {"ok": True}, 201
