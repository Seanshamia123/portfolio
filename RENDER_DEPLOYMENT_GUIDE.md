# Render Deployment Guide

This guide will help you deploy your portfolio project (Flask backend + Flutter frontend) on Render.

## Prerequisites

- A Render account (sign up at https://render.com)
- Your code pushed to a Git repository (GitHub, GitLab, or Bitbucket)

## Architecture Overview

Your deployment will consist of:
1. **PostgreSQL Database** (Free tier available)
2. **Backend Web Service** (Flask API)
3. **Frontend Static Site** (Flutter Web)

---

## Part 1: Deploy Backend (Flask API)

### Option A: Using render.yaml Blueprint (Recommended)

1. **Push your code to Git repository**
   ```bash
   git add .
   git commit -m "Prepare for Render deployment"
   git push origin main
   ```

2. **Create New Blueprint on Render**
   - Go to https://dashboard.render.com
   - Click "New +" → "Blueprint"
   - Connect your Git repository
   - Render will automatically detect `render.yaml` and create:
     - PostgreSQL database (`portfolio-db`)
     - Web service (`portfolio-backend`)

3. **Set Additional Environment Variables**
   - Go to your backend service in Render dashboard
   - Navigate to "Environment" tab
   - The following are auto-configured by render.yaml:
     - `DATABASE_URL` (auto-linked from PostgreSQL)
     - `SECRET_KEY` (auto-generated)
     - `JWT_SECRET_KEY` (auto-generated)
     - `FLASK_ENV=production`

4. **Deploy**
   - Render will automatically deploy your service
   - Wait for the build to complete (5-10 minutes)
   - Your API will be available at: `https://portfolio-backend.onrender.com`

### Option B: Manual Deployment

#### Step 1: Create PostgreSQL Database

1. Go to Render Dashboard
2. Click "New +" → "PostgreSQL"
3. Fill in:
   - **Name**: `portfolio-db`
   - **Database**: `portfolio`
   - **User**: `portfolio_user`
   - **Region**: Choose closest to you
   - **Plan**: Free
4. Click "Create Database"
5. **Copy the Internal Database URL** (you'll need this later)

#### Step 2: Create Web Service

1. Click "New +" → "Web Service"
2. Connect your Git repository
3. Configure:
   - **Name**: `portfolio-backend`
   - **Region**: Same as database
   - **Branch**: `main`
   - **Root Directory**: `backend`
   - **Runtime**: `Python 3`
   - **Build Command**: `./build.sh`
   - **Start Command**: `gunicorn app:create_app()`
   - **Plan**: Free (or choose paid plan)

4. **Add Environment Variables**:
   Click "Advanced" → "Add Environment Variable"

   | Key | Value |
   |-----|-------|
   | `DATABASE_URL` | (paste the Internal Database URL from Step 1) |
   | `SECRET_KEY` | (generate a random string or use: `python -c 'import secrets; print(secrets.token_hex(32))'`) |
   | `JWT_SECRET_KEY` | (generate another random string) |
   | `FLASK_ENV` | `production` |
   | `PYTHON_VERSION` | `3.11.0` |

5. Click "Create Web Service"

#### Step 3: Verify Backend Deployment

Once deployed, test your API:
```bash
curl https://your-backend-url.onrender.com/api/health
```

Expected response:
```json
{"status": "ok"}
```

---

## Part 2: Deploy Frontend (Flutter Web)

### Step 1: Prepare Flutter for Production

1. **Update API endpoint in your Flutter app**

   Find where you're setting the API base URL (likely in `lib/` somewhere) and update it:
   ```dart
   // Change from localhost to your Render backend URL
   const String apiBaseUrl = 'https://portfolio-backend.onrender.com';
   ```

2. **Create .env file for Flutter** (if using flutter_dotenv)

   Create/update `.env` in project root:
   ```
   API_BASE_URL=https://portfolio-backend.onrender.com
   ```

3. **Build Flutter web app**
   ```bash
   flutter build web --release
   ```

   This creates production files in `build/web/`

### Step 2: Deploy Flutter to Render

1. **Create a new Static Site on Render**
   - Click "New +" → "Static Site"
   - Connect your Git repository
   - Configure:
     - **Name**: `portfolio-frontend`
     - **Branch**: `main`
     - **Build Command**: `flutter build web --release`
     - **Publish Directory**: `build/web`

2. **Set Environment Variables** (if needed)
   | Key | Value |
   |-----|-------|
   | `FLUTTER_VERSION` | `3.3.0` (or your version) |

3. **Add build script** (if Flutter is not auto-detected)

   Create `build.sh` in project root:
   ```bash
   #!/bin/bash

   # Install Flutter
   git clone https://github.com/flutter/flutter.git -b stable
   export PATH="$PATH:`pwd`/flutter/bin"

   # Build web app
   flutter doctor
   flutter pub get
   flutter build web --release
   ```

4. Click "Create Static Site"

### Alternative: Deploy Frontend to Netlify/Vercel

If you prefer, you can deploy the Flutter web app to Netlify or Vercel:

**For Netlify:**
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Build and deploy
flutter build web --release
netlify deploy --prod --dir=build/web
```

**For Vercel:**
```bash
# Install Vercel CLI
npm install -g vercel

# Build and deploy
flutter build web --release
cd build/web
vercel --prod
```

---

## Part 3: Post-Deployment Configuration

### Update CORS Settings

Make sure your backend allows requests from your frontend domain:

In `backend/app.py`, update CORS configuration:
```python
from flask_cors import CORS

# Allow your frontend domain
CORS(app, origins=[
    "https://your-frontend.onrender.com",
    "https://your-custom-domain.com"
])
```

### Set Up Custom Domain (Optional)

1. **For Backend:**
   - Go to your backend service → "Settings" → "Custom Domains"
   - Add your domain (e.g., `api.yourdomain.com`)
   - Update DNS records as instructed

2. **For Frontend:**
   - Go to your static site → "Settings" → "Custom Domains"
   - Add your domain (e.g., `www.yourdomain.com`)
   - Update DNS records

### Initialize Database Data

If you need to seed your database with initial data:

1. Go to your backend service in Render
2. Navigate to "Shell" tab
3. Run:
   ```bash
   cd backend
   python seed_all_data.py
   ```

Or update `build.sh` to automatically seed on deployment.

---

## Part 4: Monitoring and Maintenance

### View Logs

- Go to your service in Render dashboard
- Click "Logs" tab to see real-time logs
- Use for debugging and monitoring

### Auto-Deploy on Git Push

Render automatically deploys when you push to your configured branch:
```bash
git add .
git commit -m "Update feature"
git push origin main
```

### Free Tier Limitations

- **PostgreSQL**: 90 days, then $7/month
- **Web Services**: Spins down after 15 min of inactivity (first request will be slow)
- **Static Sites**: Always on, no spin-down

### Upgrade to Paid Plan

To avoid spin-down and get better performance:
- Go to service → "Settings" → "Plan"
- Upgrade to Starter ($7/month) or higher

---

## Troubleshooting

### Backend won't start

1. Check logs for errors
2. Verify DATABASE_URL is set correctly
3. Ensure `build.sh` is executable: `chmod +x backend/build.sh`
4. Check Python version matches your local version

### Database connection errors

1. Verify DATABASE_URL format: `postgresql://user:pass@host/db`
2. Check database is in same region as web service
3. Use Internal Database URL, not External

### Frontend can't connect to backend

1. Check CORS settings in backend
2. Verify API URL in frontend code
3. Test backend health endpoint directly

### Build failures

1. Check `requirements.txt` has all dependencies
2. Verify Python version is specified
3. Review build logs for specific errors

---

## Environment Variables Reference

### Backend (Flask)

| Variable | Description | Required |
|----------|-------------|----------|
| `DATABASE_URL` | PostgreSQL connection string | Yes |
| `SECRET_KEY` | Flask secret key | Yes |
| `JWT_SECRET_KEY` | JWT signing key | Yes |
| `FLASK_ENV` | `production` or `development` | Yes |
| `PYTHON_VERSION` | Python version (e.g., `3.11.0`) | No |

### Frontend (Flutter)

| Variable | Description | Required |
|----------|-------------|----------|
| `API_BASE_URL` | Backend API URL | Yes |
| `FLUTTER_VERSION` | Flutter SDK version | No |

---

## Cost Estimate

### Free Tier (Starter)
- PostgreSQL: Free for 90 days, then $7/month
- Web Service: Free (with spin-down)
- Static Site: Free
- **Total**: $0-7/month

### Paid Tier (No Spin-down)
- PostgreSQL: $7/month
- Web Service: $7/month (Starter)
- Static Site: Free
- **Total**: $14/month

---

## Next Steps

1. ✅ Push code to Git repository
2. ✅ Create PostgreSQL database on Render
3. ✅ Deploy backend web service
4. ✅ Test backend API endpoints
5. ✅ Update frontend API URLs
6. ✅ Build Flutter web app
7. ✅ Deploy frontend to Render (or Netlify/Vercel)
8. ✅ Configure CORS
9. ✅ (Optional) Set up custom domain
10. ✅ (Optional) Seed database with initial data

---

## Useful Links

- [Render Dashboard](https://dashboard.render.com)
- [Render Docs - Deploy Flask](https://render.com/docs/deploy-flask)
- [Render Docs - PostgreSQL](https://render.com/docs/databases)
- [Render Docs - Static Sites](https://render.com/docs/static-sites)
- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)

---

## Support

If you encounter issues:
1. Check Render's status page: https://status.render.com
2. Review Render documentation: https://render.com/docs
3. Check application logs in Render dashboard
4. Review this deployment guide

Good luck with your deployment! 🚀
