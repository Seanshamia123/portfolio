# Portfolio Website

A full-stack portfolio website built with Flutter (frontend) and Flask (backend), using MySQL as the database.

## Features

- 🎨 Responsive design that works on web, mobile, and desktop
- 🌍 Multi-language support (English, Spanish, German)
- 🌓 Dark/Light theme toggle
- 📱 Cross-platform (Web, Android, iOS)
- 🔐 Admin authentication for content management
- 📊 RESTful API backend
- 💾 MySQL database with proper relationships

## Tech Stack

### Frontend
- **Flutter** - UI framework
- **Riverpod** - State management
- **GoRouter** - Navigation
- **Dio** - HTTP client
- **Freezed** - Code generation for models
- **Google Fonts** - Typography

### Backend
- **Flask** - Web framework
- **SQLAlchemy** - ORM
- **Flask-Migrate** - Database migrations
- **Flask-JWT-Extended** - Authentication
- **PyMySQL** - MySQL driver
- **Flask-CORS** - Cross-origin support

### Database
- **MySQL** - Relational database
- Supports JSON fields for multi-language content

## Quick Start

### 1. Setup Backend & Database

```bash
cd backend
./setup.sh
```

### 2. Start Backend

```bash
cd backend
source venv/bin/activate
flask run
```

### 3. Setup Frontend

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Start Frontend

```bash
flutter run -d chrome  # for web
# or
flutter run  # for mobile
```

## Default Credentials

**Admin Access:**
- Email: `admin@portfolio.com`
- Password: `admin123`

⚠️ **Change these in production!**

## Documentation

- [SETUP_GUIDE.md](SETUP_GUIDE.md) - Detailed setup instructions
- Backend API runs on `http://localhost:5000`
- Frontend connects automatically to backend

## License

MIT License - feel free to use this for your own portfolio!
