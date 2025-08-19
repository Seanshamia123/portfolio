from flask import Blueprint, request, jsonify
from ..contact import db, ContactMessage
from ..schemas import ContactMessageSchema

bp = Blueprint("contact", __name__, url_prefix="/api")
_c_schema = ContactMessageSchema()

@bp.post("/contact")
def send_message():
    data = request.get_json(force=True)
    msg = ContactMessage(
        name=data.get("name"),
        email=data.get("email"),
        message=data.get("message"),
    )
    db.session.add(msg)
    db.session.commit()
    return jsonify(_c_schema.dump(msg)), 201
