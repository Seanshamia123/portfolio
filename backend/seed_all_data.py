#!/usr/bin/env python3
"""
Comprehensive seed script to populate the entire portfolio database.
Run this to add sample data for Projects, Experiences, and Testimonies.
"""

from datetime import datetime, timedelta
from dotenv import load_dotenv
load_dotenv()

from app import create_app
from models import db, Project, Experience, Testimony

def seed_projects():
    """Seed 10 sample projects."""
    projects_data = [
        {
            "title": {"en": "E-Commerce Mobile App"},
            "description": {"en": "A full-featured e-commerce mobile application built with Flutter. Includes product browsing, cart management, secure payments, and order tracking."},
            "link": "https://github.com/example/ecommerce-app",
            "image_url": "https://picsum.photos/seed/project1/800/600",
            "sort_order": 1
        },
        {
            "title": {"en": "Social Media Dashboard"},
            "description": {"en": "Real-time social media analytics dashboard built with React and Node.js. Features interactive charts, user engagement metrics, and automated reporting."},
            "link": "https://github.com/example/social-dashboard",
            "image_url": "https://picsum.photos/seed/project2/800/600",
            "sort_order": 2
        },
        {
            "title": {"en": "Task Management Platform"},
            "description": {"en": "Collaborative task management system with drag-and-drop interface, team collaboration features, and progress tracking built with Flutter and Firebase."},
            "link": "https://github.com/example/task-manager",
            "image_url": "https://picsum.photos/seed/project3/800/600",
            "sort_order": 3
        },
        {
            "title": {"en": "Weather Forecast App"},
            "description": {"en": "Beautiful weather application with real-time forecasts, hourly predictions, and interactive maps. Built using Flutter with OpenWeather API integration."},
            "link": "https://github.com/example/weather-app",
            "image_url": "https://picsum.photos/seed/project4/800/600",
            "sort_order": 4
        },
        {
            "title": {"en": "Fitness Tracker"},
            "description": {"en": "Comprehensive fitness tracking app with workout logging, nutrition tracking, progress charts, and social features. Built with Flutter and integrated with health APIs."},
            "link": "https://github.com/example/fitness-tracker",
            "image_url": "https://picsum.photos/seed/project5/800/600",
            "sort_order": 5
        },
        {
            "title": {"en": "Restaurant Ordering System"},
            "description": {"en": "Complete restaurant ordering platform with menu management, real-time order tracking, and payment processing. Features both customer and admin apps."},
            "link": "https://github.com/example/restaurant-app",
            "image_url": "https://picsum.photos/seed/project6/800/600",
            "sort_order": 6
        },
        {
            "title": {"en": "Learning Management System"},
            "description": {"en": "Educational platform with video courses, quizzes, progress tracking, and certificates. Built with modern web technologies and Flutter mobile app."},
            "link": "https://github.com/example/lms-platform",
            "image_url": "https://picsum.photos/seed/project7/800/600",
            "sort_order": 7
        },
        {
            "title": {"en": "Real Estate Marketplace"},
            "description": {"en": "Property listing platform with advanced search filters, virtual tours, mortgage calculator, and agent messaging system. Full-stack application with Flutter mobile app."},
            "link": "https://github.com/example/real-estate",
            "image_url": "https://picsum.photos/seed/project8/800/600",
            "sort_order": 8
        },
        {
            "title": {"en": "Expense Tracker Pro"},
            "description": {"en": "Smart expense tracking application with budget planning, category management, receipt scanning, and detailed financial reports. Built with Flutter and cloud sync."},
            "link": "https://github.com/example/expense-tracker",
            "image_url": "https://picsum.photos/seed/project9/800/600",
            "sort_order": 9
        },
        {
            "title": {"en": "Chat Application"},
            "description": {"en": "Real-time messaging app with group chats, file sharing, voice messages, and end-to-end encryption. Built with Flutter, Firebase, and WebRTC."},
            "link": "https://github.com/example/chat-app",
            "image_url": "https://picsum.photos/seed/project10/800/600",
            "sort_order": 10
        }
    ]

    added_count = 0
    for data in projects_data:
        # Check if project with same title already exists
        existing = Project.query.filter_by(title=data["title"]).first()
        if not existing:
            project = Project(**data)
            db.session.add(project)
            added_count += 1
            print(f"✓ Added project: {data['title']['en']}")
        else:
            print(f"⊘ Skipped project (already exists): {data['title']['en']}")

    return added_count


def seed_experiences():
    """Seed 10 sample work experiences."""
    base_date = datetime.now()

    experiences_data = [
        {
            "title": {"en": "Senior Flutter Developer"},
            "description": {"en": "Led development of cross-platform mobile applications serving 100K+ users. Architected scalable solutions and mentored junior developers."},
            "link": "https://company1.com",
            "date": base_date - timedelta(days=30)
        },
        {
            "title": {"en": "Full Stack Developer"},
            "description": {"en": "Built and maintained web applications using React, Node.js, and PostgreSQL. Implemented CI/CD pipelines and improved deployment efficiency by 40%."},
            "link": "https://company2.com",
            "date": base_date - timedelta(days=90)
        },
        {
            "title": {"en": "Mobile App Developer"},
            "description": {"en": "Developed native iOS and Android applications with Flutter. Collaborated with design team to create intuitive user experiences."},
            "link": "https://company3.com",
            "date": base_date - timedelta(days=150)
        },
        {
            "title": {"en": "Backend Engineer"},
            "description": {"en": "Designed and implemented RESTful APIs using Python Flask and FastAPI. Optimized database queries resulting in 60% performance improvement."},
            "link": "https://company4.com",
            "date": base_date - timedelta(days=200)
        },
        {
            "title": {"en": "Frontend Developer"},
            "description": {"en": "Created responsive web applications with React and Vue.js. Implemented modern UI/UX designs and ensured cross-browser compatibility."},
            "link": "https://company5.com",
            "date": base_date - timedelta(days=270)
        },
        {
            "title": {"en": "DevOps Engineer"},
            "description": {"en": "Managed cloud infrastructure on AWS and GCP. Automated deployment processes and reduced deployment time by 70%."},
            "link": "https://company6.com",
            "date": base_date - timedelta(days=340)
        },
        {
            "title": {"en": "Software Developer Intern"},
            "description": {"en": "Contributed to open-source projects and internal tools. Learned Agile methodologies and modern development practices."},
            "link": "https://company7.com",
            "date": base_date - timedelta(days=400)
        },
        {
            "title": {"en": "Technical Consultant"},
            "description": {"en": "Advised clients on technology stack selection and architecture design. Delivered technical solutions for diverse business requirements."},
            "link": "https://consulting.com",
            "date": base_date - timedelta(days=460)
        },
        {
            "title": {"en": "UI/UX Developer"},
            "description": {"en": "Bridged design and development by implementing pixel-perfect interfaces. Conducted user testing and iterated based on feedback."},
            "link": "https://design-agency.com",
            "date": base_date - timedelta(days=520)
        },
        {
            "title": {"en": "Freelance Developer"},
            "description": {"en": "Delivered custom software solutions for various clients. Managed projects end-to-end from requirements gathering to deployment."},
            "link": "https://freelance-portfolio.com",
            "date": base_date - timedelta(days=600)
        }
    ]

    added_count = 0
    for data in experiences_data:
        # Check if experience with same title already exists
        existing = Experience.query.filter_by(title=data["title"]).first()
        if not existing:
            experience = Experience(**data)
            db.session.add(experience)
            added_count += 1
            print(f"✓ Added experience: {data['title']['en']}")
        else:
            print(f"⊘ Skipped experience (already exists): {data['title']['en']}")

    return added_count


def seed_testimonies():
    """Seed 10 sample testimonies."""
    testimonies_data = [
        {
            "name": "Sarah Johnson",
            "text": "Working with this developer was an absolute pleasure! The project was delivered on time and exceeded all expectations. Professional, skilled, and great communication throughout.",
            "link": "https://linkedin.com/in/sarahjohnson",
            "email": "sarah.j@example.com",
            "status": "approved"
        },
        {
            "name": "Michael Chen",
            "text": "Exceptional work on our mobile app! The attention to detail and clean code made a huge difference. Highly recommend for any Flutter development needs.",
            "link": "https://linkedin.com/in/michaelchen",
            "email": None,
            "status": "approved"
        },
        {
            "name": "Emily Rodriguez",
            "text": "Outstanding developer with excellent problem-solving skills. Turned our complex requirements into a beautiful, functional application. Would definitely work together again!",
            "link": None,
            "email": "emily.r@techcorp.com",
            "status": "approved"
        },
        {
            "name": "James Wilson",
            "text": "Best freelancer I've worked with! Quick turnaround, responsive communication, and high-quality code. The backend API integration was flawless.",
            "link": "https://linkedin.com/in/jameswilson",
            "email": None,
            "status": "approved"
        },
        {
            "name": "Aisha Patel",
            "text": "Incredible experience from start to finish. The portfolio website looks amazing and performs perfectly. Very happy with the results!",
            "link": None,
            "email": None,
            "status": "approved"
        },
        {
            "name": "David Kim",
            "text": "Professional, reliable, and talented developer. Built our e-commerce platform with clean architecture and great UX. Couldn't be happier with the outcome.",
            "link": "https://linkedin.com/in/davidkim",
            "email": "d.kim@business.com",
            "status": "approved"
        },
        {
            "name": "Maria Garcia",
            "text": "Fantastic developer who really understands modern web technologies. The React dashboard is fast, responsive, and user-friendly. Highly recommended!",
            "link": "https://linkedin.com/in/mariagarcia",
            "email": None,
            "status": "approved"
        },
        {
            "name": "Robert Taylor",
            "text": "Delivered a complex Flutter app with pixel-perfect design and smooth animations. Great collaboration and always open to feedback. 10/10 would hire again!",
            "link": None,
            "email": "rtaylor@startup.io",
            "status": "approved"
        },
        {
            "name": "Linda Nguyen",
            "text": "Impressed by the technical expertise and creative solutions. The app runs smoothly and users love it. Thank you for bringing our vision to life!",
            "link": "https://linkedin.com/in/lindanguyen",
            "email": None,
            "status": "approved"
        },
        {
            "name": "Ahmed Hassan",
            "text": "Top-tier developer with strong full-stack skills. The API and frontend integration was seamless. Professional communication and great work ethic throughout the project.",
            "link": "https://linkedin.com/in/ahmedhassan",
            "email": "ahmed.h@company.com",
            "status": "approved"
        }
    ]

    added_count = 0
    for data in testimonies_data:
        # Check if testimony with same name already exists
        existing = Testimony.query.filter_by(name=data["name"]).first()
        if not existing:
            testimony = Testimony(**data)
            db.session.add(testimony)
            added_count += 1
            print(f"✓ Added testimony: {data['name']}")
        else:
            print(f"⊘ Skipped testimony (already exists): {data['name']}")

    return added_count


def seed_all():
    """Main function to seed all data."""
    app = create_app()

    with app.app_context():
        print("="*60)
        print("Starting database seeding...")
        print("="*60)
        print()

        # Seed Projects
        print("📦 SEEDING PROJECTS")
        print("-"*60)
        projects_added = seed_projects()
        print()

        # Seed Experiences
        print("💼 SEEDING EXPERIENCES")
        print("-"*60)
        experiences_added = seed_experiences()
        print()

        # Seed Testimonies
        print("⭐ SEEDING TESTIMONIES")
        print("-"*60)
        testimonies_added = seed_testimonies()
        print()

        # Commit all changes
        db.session.commit()

        # Show summary
        total_projects = Project.query.count()
        total_experiences = Experience.query.count()
        total_testimonies = Testimony.query.filter_by(status='approved').count()

        print("="*60)
        print("✓ SEED COMPLETE!")
        print("="*60)
        print(f"Added in this run:")
        print(f"  • Projects: {projects_added}")
        print(f"  • Experiences: {experiences_added}")
        print(f"  • Testimonies: {testimonies_added}")
        print()
        print(f"Total in database:")
        print(f"  • Projects: {total_projects}")
        print(f"  • Experiences: {total_experiences}")
        print(f"  • Testimonies (approved): {total_testimonies}")
        print("="*60)


if __name__ == "__main__":
    seed_all()
