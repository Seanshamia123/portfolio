from flask import Blueprint, request
from flask_jwt_extended import create_access_token
from werkzeug.security import check_password_hash
from models import User

bp = Blueprint("auth", __name__, url_prefix="/api/auth")

@bp.post("/login")
def login():
    data = request.get_json() or {}
    email, password = data.get("email"), data.get("password")
    user = User.query.filter_by(email=email).first()
    if not user or not check_password_hash(user.password_hash, password):
        return {"message": "Invalid credentials"}, 401
    token = create_access_token(identity={"id": user.id, "email": user.email})
    return {"access_token": token}
