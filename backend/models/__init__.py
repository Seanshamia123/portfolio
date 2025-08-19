from database import db 
# Import all models here
from .contactmessage import ContactMessage
from .experiences import Experience
from .project import Project
from .testimony import Testimony


# Make them available when importing from models
__all__ = ['db', 'ContactMessage', 'Experience', 'Project', 'Testimony']