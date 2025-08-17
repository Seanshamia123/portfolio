from flask import Blueprint, request
from flask_jwt_extended import jwt_required
from models import db, Project

bp = Blueprint("projects", __name__, url_prefix="/api/projects")

def _dump_project(p):
    return {
        "id": str(p.id),
        "title": p.title,
        "description": p.description,
        "link": p.link,
        "image_url": p.image_url,
    }

@bp.get("")
def list_projects():
    q = Project.query.order_by(Project.sort_order.asc(), Project.id.desc())
    return [_dump_project(p) for p in q.all()]

@bp.post("")
@jwt_required()
def create_project():
    data = request.get_json() or {}
    p = Project(
        title=data.get("title", {}),
        description=data.get("description", {}),
        link=data.get("link"),
        image_url=data.get("image_url"),
        sort_order=int(data.get("sort_order") or 0),
    )
    db.session.add(p); db.session.commit()
    return _dump_project(p), 201

@bp.put("/<int:pid>")
@jwt_required()
def update_project(pid):
    p = Project.query.get_or_404(pid)
    data = request.get_json() or {}
    for k in ("title","description","link","image_url","sort_order"):
        if k in data: setattr(p, k, data[k])
    db.session.commit()
    return _dump_project(p)

@bp.delete("/<int:pid>")
@jwt_required()
def delete_project(pid):
    p = Project.query.get_or_404(pid)
    db.session.delete(p); db.session.commit()
    return {"ok": True}
