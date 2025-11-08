# Portfolio Project Setup Guide

This guide will help you set up your Flutter portfolio website with Flask backend and MySQL database.

## Prerequisites

- MySQL Server (or MySQL Workbench with server)
- Python 3.8+
- Flutter SDK
- Git

## Database Setup with MySQL Workbench

### Option 1: Automatic Setup (Recommended)

1. **Start MySQL Server** (if not already running):
   ```bash
   sudo systemctl start mysql
   # or on macOS:
   brew services start mysql
   ```

2. **Run the automated setup script**:
   ```bash
   cd backend
   ./setup.sh
   ```

   This script will:
   - Create a Python virtual environment
   - Install all dependencies
   - Create the `portfolio` database
   - Create all tables
   - Add sample seed data

### Option 2: Manual Setup with MySQL Workbench

1. **Open MySQL Workbench** and connect to your MySQL server

2. **Create the database**:
   ```sql
   CREATE DATABASE portfolio CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```

3. **Update backend credentials** (if different from defaults):
   Edit `backend/.env`:
   ```env
   MYSQL_HOST=localhost
   MYSQL_PORT=3306
   MYSQL_USER=your_mysql_username
   MYSQL_PASSWORD=your_mysql_password
   MYSQL_DB=portfolio
   ```

4. **Install Python dependencies**:
   ```bash
   cd backend
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

5. **Initialize the database**:
   ```bash
   python3 create_db.py
   python3 init_db.py
   ```

## Backend Setup

### Configuration

The backend is configured via `backend/.env`:

```env
FLASK_APP=app.py
FLASK_ENV=development

# Flask Configuration
SECRET_KEY='your-secret-key-here'

# MySQL Configuration
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=shamia
MYSQL_PASSWORD=12345
MYSQL_DB=portfolio

# JWT Secret (optional, for admin authentication)
JWT_SECRET_KEY=your-jwt-secret-key
```

### Running the Backend

```bash
cd backend
source venv/bin/activate  # Activate virtual environment
FLASK_APP=app.py flask run --port 5000
```

Leave this process running while you develop the Flutter app. The API will be available at `http://localhost:5000`.

### API Endpoints

- `GET /api/health` - Health check
- `GET /api/projects` - List all projects
- `GET /api/experiences` - List all experiences
- `GET /api/testimonies` - List all testimonies
- `POST /api/contact` - Submit contact form
- `POST /api/auth/login` - Admin login (email: admin@portfolio.com, password: admin123)

## Frontend Setup

### Install Dependencies

```bash
flutter pub get
```

### Run Code Generation

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running the Flutter App

**For Web:**
```bash
flutter run -d chrome
```

> Tip: ensure the Flask server is running on port 5000 before launching the web build.

**For Android Emulator:**
```bash
flutter run
```

**For iOS Simulator:**
```bash
flutter run -d ios
```

### API Configuration

The Flutter app targets the backend automatically:
- **Web**: `http://localhost:5000`
- **Android Emulator**: `http://10.0.2.2:5000`

You can override the base URL at runtime with a Dart define:

```bash
flutter run --dart-define=API_BASE_URL=http://192.168.1.50:5000 -d chrome
```

The same flag works for any platform build. Alternatively, you can pass a custom base URL when constructing `ApiClient`.

## Testing the Integration

### 1. Test Backend API

```bash
# Health check
curl http://localhost:5000/api/health

# Get projects
curl http://localhost:5000/api/projects

# Get experiences
curl http://localhost:5000/api/experiences

# Get testimonies
curl http://localhost:5000/api/testimonies
```

### 2. Test Frontend

1. Start the backend server (see above) and keep it running.
2. Start the Flutter app
3. Navigate through the app pages:
   - Home page with testimonies
   - Projects page
   - Experiences page
   - Contact page

## Database Schema

### Tables

1. **user** - Admin users for authentication
   - id (INT, Primary Key)
   - email (VARCHAR, Unique)
   - password_hash (VARCHAR)
   - created_at (DATETIME)
   - is_active (BOOLEAN)

2. **project** - Portfolio projects
   - id (INT, Primary Key)
   - title (JSON) - Multi-language: {"en": "...", "es": "...", "de": "..."}
   - description (JSON) - Multi-language
   - link (VARCHAR)
   - image_url (VARCHAR)
   - sort_order (INT)

3. **experience** - Work experiences
   - id (INT, Primary Key)
   - link (VARCHAR)
   - title (JSON) - Multi-language
   - description (JSON) - Multi-language
   - date (DATETIME)

4. **testimony** - Client testimonials
   - id (INT, Primary Key)
   - name (VARCHAR)
   - text (TEXT)
   - link (VARCHAR)
   - avatar (VARCHAR)

5. **contact_message** - Contact form submissions
   - id (INT, Primary Key)
   - name (VARCHAR)
   - email (VARCHAR)
   - message (TEXT)
   - created_at (DATETIME)
   - status (VARCHAR)

## Troubleshooting

### Backend Issues

**Problem**: `ModuleNotFoundError: No module named 'pymysql'`
**Solution**: Make sure you activated the virtual environment and installed dependencies:
```bash
cd backend
source venv/bin/activate
pip install -r requirements.txt
```

**Problem**: `Can't connect to MySQL server`
**Solution**:
- Check if MySQL is running: `sudo systemctl status mysql`
- Start MySQL: `sudo systemctl start mysql`
- Verify credentials in `backend/.env`

**Problem**: `Access denied for user`
**Solution**: Update MySQL credentials in `backend/.env` or create the user in MySQL Workbench

### Frontend Issues

**Problem**: `The method 'GoRouter' isn't defined`
**Solution**: Run code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Problem**: API calls failing
**Solution**:
- Make sure backend is running on port 5000
- Check API base URL in `lib/shared/api_client.dart`
- For Android emulator, use `http://10.0.2.2:5000` instead of `localhost`

## Project Structure

```
portfolio/
├── backend/
│   ├── apis/          # API endpoints
│   ├── models/        # Database models
│   ├── migrations/    # Database migrations
│   ├── app.py         # Flask application
│   ├── config.py      # Configuration
│   ├── database.py    # Database setup
│   ├── init_db.py     # Database initialization script
│   ├── create_db.py   # Database creation script
│   ├── setup.sh       # Automated setup script
│   └── requirements.txt
├── lib/
│   ├── features/      # Feature modules
│   ├── routes/        # App routing
│   ├── shared/        # Shared utilities
│   ├── style/         # Themes and styles
│   └── main.dart      # App entry point
└── SETUP_GUIDE.md     # This file
```

## Next Steps

1. Customize the content in MySQL Workbench
2. Update styling in `lib/style/`
3. Add your own images to `assets/images/`
4. Deploy to production (Firebase Hosting for frontend, any cloud provider for backend)

## Support

For issues or questions, please refer to:
- Flask documentation: https://flask.palletsprojects.com/
- Flutter documentation: https://flutter.dev/docs
- MySQL documentation: https://dev.mysql.com/doc/
