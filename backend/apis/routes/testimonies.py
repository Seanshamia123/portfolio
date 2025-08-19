from flask import Blueprint, jsonify
from ..testimonies import db, Testimony
from ..schemas import TestimonySchema

bp = Blueprint("testimonies", __name__, url_prefix="/api")
_t_schema = TestimonySchema(many=True)

@bp.get("/testimonies")
def list_testimonies():
    items = Testimony.query.all()
    return jsonify(_t_schema.dump(items))
