from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from models import db 
from config import Config
from dotenv import load_dotenv
from flask_cors import CORS
from flask_jwt_extended import JWTManager


def create_app(config_name=None):
    load_dotenv()
    app = Flask(__name__)
    app.config.from_object(Config)

    CORS(app)
    db.init_app(app)
    Migrate(app, db)   # <-- this line registers "flask db" commands
    JWTManager(app)

    @app.get("/api/health")
    def health():
        return {"status": "ok"}

    # register blueprints here...
    from apis import auth, projects, experiences, testimonies, contact
    app.register_blueprint(auth.bp)
    app.register_blueprint(projects.bp)
    app.register_blueprint(experiences.bp)
    app.register_blueprint(testimonies.bp)
    app.register_blueprint(contact.bp)

    return app

app = create_app()
