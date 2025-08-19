from flask import Blueprint, jsonify

bp = Blueprint("auth", __name__, url_prefix="/api/auth")

@bp.get("/health")
def ok():
    return jsonify({"auth": "ok"})
