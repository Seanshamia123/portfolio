from flask import Blueprint
from flask_restx import Api
from .contact import api as contactmessage_ns
from .experiences import api as experiences_ns
from .projects import api as projects_ns
from .testimonies import api as testimonies_ns
from .auth import api as auth_ns

# from .subscriptions import api as subscriptions_ns
from .auth import api as auth_ns

# Create the main API blueprint
api_bp = Blueprint('api', __name__, url_prefix='/api')

# Initialize Flask-RESTX API with Swagger documentation
api = Api(
    api_bp,
    version='1.0',
    title='VPG API',
    description='A comprehensive social media platform API with user authentication, project management, and more.',
    doc='/docs/',  # Swagger UI will be available at /api/docs/
    contact='developer@example.com',
    license='MIT',
    authorizations={
        'Bearer': {
            'type': 'apiKey',
            'in': 'header',
            'name': 'Authorization',
            'description': 'Add a JWT token to the header with ** Bearer &lt;JWT&gt; ** token to authorize'
        }
    },
    security=['Bearer']
)

# Add namespaces to the API
api.add_namespace(auth_ns, path='/auth')
api.add_namespace(projects_ns, path='/projects')
api.add_namespace(experiences_ns, path='/experiences')
api.add_namespace(testimonies_ns, path='/testimonies')
api.add_namespace(contactmessage_ns, path='/contact')

__all__ = ['api_bp']