"""
Expose Flask blueprints for the API package.

The individual modules define Flask blueprints (``bp``) rather than Flask-RESTX
namespaces. Import the modules here so ``from apis import auth`` works without
expecting nonexistent ``api`` objects.
"""

from . import auth, contact, experiences, projects, testimonies

__all__ = ["auth", "contact", "experiences", "projects", "testimonies"]
