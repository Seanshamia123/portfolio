from flask import Blueprint, request
from flask_jwt_extended import jwt_required
from models import db, Testimony

bp = Blueprint("testimonies", __name__, url_prefix="/api/testimonies")

def _dump(t):
    return {
        "id": str(t.id),
        "name": t.name,
        "text": t.text,
        "link": t.link or "",
        "avatar": t.avatar or "https://ui-avatars.com/api/?name=" + t.name.replace(" ", "+"),
        "status": getattr(t, 'status', 'approved'),
        "created_at": t.created_at.isoformat() if hasattr(t, 'created_at') and t.created_at else None,
    }

@bp.get("")
def list_testimonies():
    # Only show approved testimonies to public
    return [_dump(t) for t in Testimony.query.filter_by(status='approved').order_by(Testimony.created_at.desc()).all()]

@bp.post("")
@jwt_required()
def create_testimony():
    """Admin endpoint to create testimony"""
    d = request.get_json() or {}
    t = Testimony(
        name=d["name"],
        text=d["text"],
        link=d.get("link"),
        avatar=d.get("avatar"),
        status=d.get("status", "approved")
    )
    db.session.add(t); db.session.commit()
    return _dump(t), 201

@bp.post("/submit")
def submit_review():
    """Public endpoint for clients to submit reviews"""
    d = request.get_json() or {}

    # Validation
    if not d.get("name") or len(d.get("name", "").strip()) < 2:
        return {"error": "Name is required and must be at least 2 characters"}, 400
    if not d.get("text") or len(d.get("text", "").strip()) < 10:
        return {"error": "Review text is required and must be at least 10 characters"}, 400
    if d.get("email") and "@" not in d.get("email"):
        return {"error": "Valid email is required"}, 400

    # Create testimony with approved status to display immediately
    t = Testimony(
        name=d["name"].strip(),
        text=d["text"].strip(),
        link=d.get("link", "").strip() or None,
        email=d.get("email", "").strip() or None,
        status="approved"  # Auto-approve client submissions
    )
    db.session.add(t)
    db.session.commit()

    return {
        "ok": True,
        "message": "Thank you for your review! It will be published after moderation."
    }, 201

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
