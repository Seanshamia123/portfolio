from flask import Blueprint, jsonify
from ..experiences import db, Experience
from ..schemas import ExperienceSchema

bp = Blueprint("experiences", __name__, url_prefix="/api")
_exp_schema = ExperienceSchema(many=True)

@bp.get("/experiences")
def list_experiences():
    items = Experience.query.order_by(Experience.date.desc()).all()
    return jsonify(_exp_schema.dump(items))
