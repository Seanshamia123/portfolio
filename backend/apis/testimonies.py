from flask import Blueprint, request
from flask_jwt_extended import jwt_required
from models import db, Testimony

bp = Blueprint("testimonies", __name__, url_prefix="/api/testimonies")

def _dump(t):
    return {
        "id": str(t.id),
        "name": t.name,
        "text": t.text,
        "link": t.link,
        "avatar": t.avatar,
    }

@bp.get("")
def list_testimonies():
    return [_dump(t) for t in Testimony.query.all()]

@bp.post("")
@jwt_required()
def create_testimony():
    d = request.get_json() or {}
    t = Testimony(name=d["name"], text=d["text"], link=d["link"], avatar=d["avatar"])
    db.session.add(t); db.session.commit()
    return _dump(t), 201

@bp.put("/<int:tid>")
@jwt_required()
def update_testimony(tid):
    t = Testimony.query.get_or_404(tid)
    d = request.get_json() or {}
    for k in ("name","text","link","avatar"):
        if k in d: setattr(t, k, d[k])
    db.session.commit()
    return _dump(t)

@bp.delete("/<int:tid>")
@jwt_required()
def delete_testimony(tid):
    t = Testimony.query.get_or_404(tid)
    db.session.delete(t); db.session.commit()
    return {"ok": True}
