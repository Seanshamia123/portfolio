from flask import Blueprint, jsonify
from ..projects import db, Project
from ..schemas import ProjectSchema

bp = Blueprint("projects", __name__, url_prefix="/api")
_project_schema = ProjectSchema(many=True)

@bp.get("/projects")
def list_projects():
    items = Project.query.order_by(Project.sort_order.asc()).all()
    return jsonify(_project_schema.dump(items))
