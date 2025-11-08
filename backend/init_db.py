#!/usr/bin/env python3
"""
Database initialization script for Portfolio backend.
This script will:
1. Create the database if it doesn't exist
2. Create all tables
3. Add sample seed data for testing
"""

from app import create_app
from models import db, Project, Experience, Testimony, ContactMessage, User
from werkzeug.security import generate_password_hash
import sys

def init_database():
    """Initialize the database with tables and seed data."""
    app = create_app()

    with app.app_context():
        try:
            # Create all tables
            print("Creating database tables...")
            db.create_all()
            print("✓ Tables created successfully!")

            # Check if we already have data
            if Project.query.first() or Experience.query.first() or Testimony.query.first():
                print("\n⚠ Database already has data. Skipping seed data creation.")
                print("To reset the database, drop all tables and run this script again.")
                return

            # Add seed data
            print("\nAdding seed data...")

            # Create admin user
            admin = User(
                email="admin@portfolio.com",
                password_hash=generate_password_hash("admin123")
            )
            db.session.add(admin)
            print("✓ Admin user created (email: admin@portfolio.com, password: admin123)")

            # Add sample projects
            projects = [
                Project(
                    title={"en": "E-commerce Platform", "es": "Plataforma de comercio electrónico", "de": "E-Commerce-Plattform"},
                    description={"en": "A full-stack e-commerce solution with payment integration", "es": "Una solución de comercio electrónico completa con integración de pagos", "de": "Eine Full-Stack-E-Commerce-Lösung mit Zahlungsintegration"},
                    link="https://github.com/example/ecommerce",
                    image_url="https://via.placeholder.com/400x300",
                    sort_order=1
                ),
                Project(
                    title={"en": "Portfolio Website", "es": "Sitio web de portafolio", "de": "Portfolio-Website"},
                    description={"en": "A responsive portfolio website built with Flutter and Flask", "es": "Un sitio web de portafolio responsivo construido con Flutter y Flask", "de": "Eine responsive Portfolio-Website, die mit Flutter und Flask erstellt wurde"},
                    link="https://github.com/example/portfolio",
                    image_url="https://via.placeholder.com/400x300",
                    sort_order=2
                ),
                Project(
                    title={"en": "Task Management App", "es": "Aplicación de gestión de tareas", "de": "Aufgabenverwaltungs-App"},
                    description={"en": "A collaborative task management application", "es": "Una aplicación colaborativa de gestión de tareas", "de": "Eine kollaborative Aufgabenverwaltungsanwendung"},
                    link="https://github.com/example/taskmanager",
                    image_url="https://via.placeholder.com/400x300",
                    sort_order=3
                )
            ]
            db.session.add_all(projects)
            print(f"✓ Added {len(projects)} sample projects")

            # Add sample experiences
            experiences = [
                Experience(
                    link="https://company1.com",
                    title={"en": "Senior Full Stack Developer", "es": "Desarrollador Full Stack Senior", "de": "Senior Full Stack Entwickler"},
                    description={"en": "Led development of cloud-based applications", "es": "Lideré el desarrollo de aplicaciones basadas en la nube", "de": "Leitete die Entwicklung von cloudbasierten Anwendungen"}
                ),
                Experience(
                    link="https://company2.com",
                    title={"en": "Flutter Developer", "es": "Desarrollador Flutter", "de": "Flutter-Entwickler"},
                    description={"en": "Built cross-platform mobile applications", "es": "Construí aplicaciones móviles multiplataforma", "de": "Erstellte plattformübergreifende mobile Anwendungen"}
                ),
                Experience(
                    link="https://company3.com",
                    title={"en": "Backend Engineer", "es": "Ingeniero Backend", "de": "Backend-Ingenieur"},
                    description={"en": "Designed and implemented RESTful APIs", "es": "Diseñé e implementé APIs RESTful", "de": "Entwarf und implementierte RESTful-APIs"}
                )
            ]
            db.session.add_all(experiences)
            print(f"✓ Added {len(experiences)} sample experiences")

            # Add sample testimonies
            testimonies = [
                Testimony(
                    name="John Doe",
                    text="Excellent work on our project! Highly recommended.",
                    link="https://linkedin.com/in/johndoe",
                    avatar="https://i.pravatar.cc/150?img=1"
                ),
                Testimony(
                    name="Jane Smith",
                    text="Professional, skilled, and delivers on time. Great experience working together!",
                    link="https://linkedin.com/in/janesmith",
                    avatar="https://i.pravatar.cc/150?img=2"
                ),
                Testimony(
                    name="Mike Johnson",
                    text="Outstanding developer with great communication skills.",
                    link="https://linkedin.com/in/mikejohnson",
                    avatar="https://i.pravatar.cc/150?img=3"
                )
            ]
            db.session.add_all(testimonies)
            print(f"✓ Added {len(testimonies)} sample testimonies")

            # Commit all changes
            db.session.commit()
            print("\n✅ Database initialized successfully!")
            print("\nYou can now start the Flask server with: flask run")
            print("Or: python -m flask run")

        except Exception as e:
            print(f"\n❌ Error initializing database: {e}")
            db.session.rollback()
            sys.exit(1)

if __name__ == "__main__":
    init_database()
