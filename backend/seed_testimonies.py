#!/usr/bin/env python3
"""
Seed script to populate the database with sample testimonies.
Run this script to add 10 realistic client reviews.
"""

from dotenv import load_dotenv
load_dotenv()

from app import create_app
from models import db, Testimony

def seed_testimonies():
    """Add 10 sample testimonies to the database."""
    app = create_app()

    testimonies_data = [
        {
            "name": "Sarah Johnson",
            "text": "Working with this developer was an absolute pleasure! The project was delivered on time and exceeded all expectations. Professional, skilled, and great communication throughout.",
            "link": "https://linkedin.com/in/sarahjohnson",
            "email": "sarah.j@example.com"
        },
        {
            "name": "Michael Chen",
            "text": "Exceptional work on our mobile app! The attention to detail and clean code made a huge difference. Highly recommend for any Flutter development needs.",
            "link": "https://linkedin.com/in/michaelchen",
            "email": None
        },
        {
            "name": "Emily Rodriguez",
            "text": "Outstanding developer with excellent problem-solving skills. Turned our complex requirements into a beautiful, functional application. Would definitely work together again!",
            "link": None,
            "email": "emily.r@techcorp.com"
        },
        {
            "name": "James Wilson",
            "text": "Best freelancer I've worked with! Quick turnaround, responsive communication, and high-quality code. The backend API integration was flawless.",
            "link": "https://linkedin.com/in/jameswilson",
            "email": None
        },
        {
            "name": "Aisha Patel",
            "text": "Incredible experience from start to finish. The portfolio website looks amazing and performs perfectly. Very happy with the results!",
            "link": None,
            "email": None
        },
        {
            "name": "David Kim",
            "text": "Professional, reliable, and talented developer. Built our e-commerce platform with clean architecture and great UX. Couldn't be happier with the outcome.",
            "link": "https://linkedin.com/in/davidkim",
            "email": "d.kim@business.com"
        },
        {
            "name": "Maria Garcia",
            "text": "Fantastic developer who really understands modern web technologies. The React dashboard is fast, responsive, and user-friendly. Highly recommended!",
            "link": "https://linkedin.com/in/mariagarcia",
            "email": None
        },
        {
            "name": "Robert Taylor",
            "text": "Delivered a complex Flutter app with pixel-perfect design and smooth animations. Great collaboration and always open to feedback. 10/10 would hire again!",
            "link": None,
            "email": "rtaylor@startup.io"
        },
        {
            "name": "Linda Nguyen",
            "text": "Impressed by the technical expertise and creative solutions. The app runs smoothly and users love it. Thank you for bringing our vision to life!",
            "link": "https://linkedin.com/in/lindanguyen",
            "email": None
        },
        {
            "name": "Ahmed Hassan",
            "text": "Top-tier developer with strong full-stack skills. The API and frontend integration was seamless. Professional communication and great work ethic throughout the project.",
            "link": "https://linkedin.com/in/ahmedhassan",
            "email": "ahmed.h@company.com"
        }
    ]

    with app.app_context():
        # Clear existing testimonies (optional - comment out if you want to keep existing data)
        # Testimony.query.delete()

        added_count = 0
        for data in testimonies_data:
            # Check if testimony with same name already exists
            existing = Testimony.query.filter_by(name=data["name"]).first()
            if not existing:
                testimony = Testimony(
                    name=data["name"],
                    text=data["text"],
                    link=data.get("link"),
                    email=data.get("email"),
                    status="approved"  # Auto-approve seed data
                )
                db.session.add(testimony)
                added_count += 1
                print(f"✓ Added: {data['name']}")
            else:
                print(f"⊘ Skipped (already exists): {data['name']}")

        db.session.commit()

        # Show summary
        total = Testimony.query.filter_by(status='approved').count()
        print(f"\n{'='*50}")
        print(f"✓ Seed complete!")
        print(f"  - Added: {added_count} new testimonies")
        print(f"  - Total approved testimonies in database: {total}")
        print(f"{'='*50}")

if __name__ == "__main__":
    seed_testimonies()
