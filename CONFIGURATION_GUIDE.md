# Configuration Guide for Local Development & Production

This guide explains how to configure your portfolio for both local development and production deployment on Render.

## Table of Contents
- [Local Development Setup](#local-development-setup)
- [Production Deployment](#production-deployment)
- [Build Scripts](#build-scripts)
- [Environment Variables](#environment-variables)
- [CORS Configuration](#cors-configuration)
- [Testing](#testing)

---

## Local Development Setup

### Backend (Flask)

1. **Set up environment:**
   ```bash
   cd backend
   cp .env.example .env
   ```

2. **Configure `.env` for local development:**
   ```bash
   FLASK_APP=app.py
   FLASK_ENV=development
   SECRET_KEY=your-dev-secret-key
   JWT_SECRET_KEY=your-dev-jwt-key
   MYSQL_HOST=localhost
   MYSQL_PORT=3306
   MYSQL_USER=your_user
   MYSQL_PASSWORD=your_password
   MYSQL_DB=portfolio
   CORS_ORIGINS=*
   ```

3. **Run backend:**
   ```bash
   python app.py
   # Backend runs at http://localhost:5000
   ```

### Frontend (Flutter)

1. **No configuration needed for local development!**
   The app automatically uses `http://localhost:5000` for web builds.

2. **Run frontend:**
   ```bash
   flutter run -d chrome
   # or
   flutter run -d web-server
   ```

---

## Production Deployment

### Step 1: Deploy Backend to Render

1. **Push code to Git:**
   ```bash
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Deploy using Blueprint:**
   - Go to https://dashboard.render.com
   - Click "New +" → "Blueprint"
   - Connect your repository
   - Render creates backend + database automatically

3. **Get your backend URL:**
   - Example: `https://portfolio-backend.onrender.com`
   - Test: `curl https://portfolio-backend.onrender.com/api/health`

### Step 2: Build Flutter for Production

**Option A: Using build script (Recommended)**
```bash
./build_prod.sh https://portfolio-backend.onrender.com
```

**Option B: Manual build**
```bash
flutter build web --release \
    --dart-define=API_BASE_URL=https://portfolio-backend.onrender.com
```

The production build is now in `build/web/`

### Step 3: Deploy Frontend to Render

1. **Create Static Site:**
   - Click "New +" → "Static Site"
   - Connect your repository
   - Configure:
     - **Name**: `portfolio-frontend`
     - **Build Command**: See below
     - **Publish Directory**: `build/web`

2. **Build Command for Render:**
   ```bash
   flutter build web --release --dart-define=API_BASE_URL=https://portfolio-backend.onrender.com
   ```

   Or if you have the build script:
   ```bash
   ./build_prod.sh https://portfolio-backend.onrender.com
   ```

### Step 4: Update CORS (Important!)

After deploying frontend, update CORS in your backend:

1. Go to your backend service on Render
2. Navigate to "Environment" tab
3. Update `CORS_ORIGINS`:
   ```
   https://your-frontend.onrender.com
   ```

   Or for multiple domains:
   ```
   https://your-frontend.onrender.com,https://yourdomain.com
   ```

4. Backend will auto-redeploy with new CORS settings

---

## Build Scripts

### Development Build
```bash
./build_dev.sh
```
- Builds for local testing
- Uses default localhost API

### Production Build
```bash
./build_prod.sh https://your-backend-url.onrender.com
```
- Builds with production API URL
- Output: `build/web/`

### Testing Production Build Locally
```bash
# After building
cd build/web
python3 -m http.server 8080
# Visit http://localhost:8080
```

---

## Environment Variables

### Backend Environment Variables (Render)

Configure these in Render Dashboard → Your Service → Environment:

| Variable | Value | Required |
|----------|-------|----------|
| `DATABASE_URL` | Auto-set by Render | ✅ |
| `SECRET_KEY` | Auto-generated | ✅ |
| `JWT_SECRET_KEY` | Auto-generated | ✅ |
| `FLASK_ENV` | `production` | ✅ |
| `CORS_ORIGINS` | `https://your-frontend.onrender.com` | ✅ |
| `PYTHON_VERSION` | `3.11.0` | Optional |

### Frontend Build Variables

Set at build time using `--dart-define`:

| Variable | Example | When to Use |
|----------|---------|-------------|
| `API_BASE_URL` | `https://portfolio-backend.onrender.com` | Production builds only |

**Note:** Not needed for local development - defaults to localhost automatically!

---

## CORS Configuration

### How CORS Works in Your App

The backend uses the `CORS_ORIGINS` environment variable:

```python
# In app.py
cors_origins = os.getenv('CORS_ORIGINS', '*')
```

### CORS Settings by Environment

**Development (Local):**
```bash
CORS_ORIGINS=*
```
Allows all origins - convenient for testing.

**Production (Render):**
```bash
CORS_ORIGINS=https://your-frontend.onrender.com
```
Only allows your specific frontend domain.

**Multiple Domains:**
```bash
CORS_ORIGINS=https://your-frontend.onrender.com,https://yourdomain.com,https://www.yourdomain.com
```

### CORS Troubleshooting

If you see CORS errors in browser console:

1. **Check backend environment variables**
   - Verify `CORS_ORIGINS` is set correctly
   - Make sure there are no typos in URLs

2. **Check frontend is using correct API URL**
   ```bash
   # In browser console
   console.log('API Base URL:', /* check network requests */);
   ```

3. **Verify CORS headers in response**
   ```bash
   curl -I https://your-backend.onrender.com/api/health
   # Look for: Access-Control-Allow-Origin
   ```

---

## Testing

### Test Backend Locally
```bash
cd backend
python app.py

# In another terminal
curl http://localhost:5000/api/health
curl http://localhost:5000/api/projects
```

### Test Backend on Render
```bash
curl https://your-backend.onrender.com/api/health
curl https://your-backend.onrender.com/api/projects
curl https://your-backend.onrender.com/api/experiences
curl https://your-backend.onrender.com/api/testimonies
```

### Test Frontend Locally
```bash
flutter run -d chrome
# or
flutter run -d web-server --web-port=8080
```

### Test Frontend Build
```bash
./build_dev.sh
cd build/web
python3 -m http.server 8080
# Visit http://localhost:8080
```

---

## Common Issues & Solutions

### Issue: Flutter build can't find API

**Solution:** Make sure you're passing the API URL:
```bash
./build_prod.sh https://portfolio-backend.onrender.com
```

### Issue: CORS error in production

**Solution:** Update `CORS_ORIGINS` in Render backend environment variables:
```bash
CORS_ORIGINS=https://your-frontend.onrender.com
```

### Issue: Backend shows "Database connection error"

**Solution:** Check `DATABASE_URL` is set in Render environment variables.

### Issue: Frontend shows localhost API in production

**Solution:** You forgot to set API_BASE_URL at build time:
```bash
flutter build web --release --dart-define=API_BASE_URL=https://your-backend.onrender.com
```

---

## Configuration Files Reference

### Project Structure
```
portfolio/
├── backend/
│   ├── .env                  # Local config (gitignored)
│   ├── .env.example          # Template for .env
│   ├── app.py                # Flask app with CORS config
│   ├── config.py             # Database & app config
│   ├── build.sh              # Build script for Render
│   └── requirements.txt      # Python dependencies
├── lib/
│   └── shared/
│       └── api_client.dart   # API configuration
├── build_dev.sh              # Build for development
├── build_prod.sh             # Build for production
├── render.yaml               # Render Blueprint config
└── CONFIGURATION_GUIDE.md    # This file
```

### API Client Logic (lib/shared/api_client.dart)

```dart
static String _getBaseUrl() {
  // 1. Use --dart-define API_BASE_URL (production)
  if (_envBaseUrl.isNotEmpty) {
    return _envBaseUrl;
  }

  // 2. Auto-detect localhost (development)
  if (kIsWeb) {
    return 'http://localhost:5000';
  } else {
    return 'http://10.0.2.2:5000'; // Android emulator
  }
}
```

---

## Quick Reference Commands

### Local Development
```bash
# Backend
cd backend && python app.py

# Frontend
flutter run -d chrome
```

### Production Build
```bash
# Build with production API
./build_prod.sh https://portfolio-backend.onrender.com

# Or manually
flutter build web --release \
    --dart-define=API_BASE_URL=https://portfolio-backend.onrender.com
```

### Deploy to Render
```bash
git add .
git commit -m "Deploy to production"
git push origin main
# Render auto-deploys on push
```

---

## Need More Help?

- **Full Deployment Guide**: See [RENDER_DEPLOYMENT_GUIDE.md](./RENDER_DEPLOYMENT_GUIDE.md)
- **Quick Checklist**: See [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md)
- **Render Docs**: https://render.com/docs
- **Flutter Web Docs**: https://docs.flutter.dev/deployment/web

---

**You're all set!** 🚀

For deployment, start with: `./build_prod.sh https://your-backend-url.onrender.com`
