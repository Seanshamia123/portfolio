from flask import Flask
from flask_migrate import Migrate
from models import db
from apis import auth, projects, experiences, testimonies, contact
from config import Config
from dotenv import load_dotenv
from flask_cors import CORS
from flask_jwt_extended import JWTManager


def create_app(config_name=None):
    load_dotenv()
    app = Flask(__name__)
    app.config.from_object(Config)

    CORS(app)
    # Initialize extensions
    db.init_app(app)
    Migrate(app, db)
    JWTManager(app)

    @app.get("/api/health")
    def health():
        return {"status": "ok"}

    # register blueprints here...
    app.register_blueprint(auth.bp)
    app.register_blueprint(projects.bp)
    app.register_blueprint(experiences.bp)
    app.register_blueprint(testimonies.bp)
    app.register_blueprint(contact.bp)

    return app

if __name__ == '__main__':
    app = create_app()
