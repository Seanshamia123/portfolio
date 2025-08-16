from flask import Blueprint, request
from flask_jwt_extended import jwt_required
from models import db, Experience

bp = Blueprint("experiences", __name__, url_prefix="/api/experiences")

def _dump(x):
    return {
        "id": str(x.id),
        "link": x.link,
        "title": x.title,
        "description": x.description,
        # Flutter model doesn't need 'date', but we sort by it server-side
    }

@bp.get("")
def list_experiences():
    q = Experience.query.order_by(Experience.date.desc())
    return [_dump(x) for x in q.all()]

@bp.post("")
@jwt_required()
def create_experience():
    data = request.get_json() or {}
    x = Experience(
        link=data["link"],
        title=data.get("title", {}),
        description=data.get("description", {}),
    )
    db.session.add(x); db.session.commit()
    return _dump(x), 201

@bp.put("/<int:xid>")
@jwt_required()
def update_experience(xid):
    x = Experience.query.get_or_404(xid)
    data = request.get_json() or {}
    for k in ("link", "title", "description"):
        if k in data: setattr(x, k, data[k])
    db.session.commit()
    return _dump(x)

@bp.delete("/<int:xid>")
@jwt_required()
def delete_experience(xid):
    x = Experience.query.get_or_404(xid)
    db.session.delete(x); db.session.commit()
    return {"ok": True}
