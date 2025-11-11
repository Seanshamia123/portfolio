from flask import Flask
from flask_migrate import Migrate
from models import db
from apis import auth, projects, experiences, testimonies, contact
from config import Config
from dotenv import load_dotenv
from flask_cors import CORS
from flask_jwt_extended import JWTManager
import os


def create_app(config_name=None):
    load_dotenv()
    app = Flask(__name__)
    app.config.from_object(Config)

    # Configure CORS for both development and production
    cors_origins = os.getenv('CORS_ORIGINS', '*')
    if cors_origins != '*':
        # Parse comma-separated origins for production
        cors_origins = [origin.strip() for origin in cors_origins.split(',')]

    CORS(app,
         origins=cors_origins,
         supports_credentials=True,
         allow_headers=['Content-Type', 'Authorization'],
         methods=['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'])

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
    # Development server only - in production, gunicorn will use create_app()
    app.run(host='0.0.0.0', port=5000)
