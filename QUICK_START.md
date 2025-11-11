# Quick Start: Deploy to Render in 5 Steps

## Prerequisites
- [ ] Git repository (GitHub/GitLab/Bitbucket)
- [ ] Render account (https://render.com)

---

## 🚀 Deploy Backend + Database

### Step 1: Push to Git
```bash
git add .
git commit -m "Deploy to Render"
git push origin main
```

### Step 2: Deploy with Blueprint
1. Go to https://dashboard.render.com
2. Click **"New +"** → **"Blueprint"**
3. Connect your repository
4. Wait 5-10 minutes ⏱️

✅ Your backend is live at: `https://portfolio-backend.onrender.com`

**Test it:**
```bash
curl https://portfolio-backend.onrender.com/api/health
# Expected: {"status": "ok"}
```

---

## 🎨 Deploy Frontend

### Step 3: Build Flutter for Production
```bash
./build_prod.sh https://portfolio-backend.onrender.com
```

### Step 4: Deploy Static Site
1. On Render: **"New +"** → **"Static Site"**
2. Connect your repository
3. Configure:
   - **Build Command**:
     ```bash
     ./build_prod.sh https://portfolio-backend.onrender.com
     ```
   - **Publish Directory**: `build/web`
4. Click **"Create Static Site"**

✅ Your frontend is live at: `https://your-frontend.onrender.com`

---

## 🔒 Secure CORS (Step 5)

After frontend deploys, update backend CORS:

1. Go to backend service on Render
2. **Environment** tab
3. Edit `CORS_ORIGINS`:
   ```
   https://your-frontend.onrender.com
   ```
4. Save (auto-redeploys)

---

## ✅ Done!

Your portfolio is now live:
- **Backend**: `https://portfolio-backend.onrender.com`
- **Frontend**: `https://your-frontend.onrender.com`
- **Database**: Managed by Render

---

## 📝 What Was Configured

### Backend Changes:
- ✅ PostgreSQL support added
- ✅ CORS configured for production
- ✅ Gunicorn for production server
- ✅ Database migrations automated
- ✅ Environment variables secured

### Frontend Changes:
- ✅ API URL configurable at build time
- ✅ Auto-detects localhost for dev
- ✅ Production build scripts created

---

## 🛠️ Common Commands

### Local Development
```bash
# Backend
cd backend && python app.py

# Frontend
flutter run -d chrome
```

### Production Builds
```bash
# Build with production API
./build_prod.sh https://portfolio-backend.onrender.com
```

### Test Production Build Locally
```bash
cd build/web
python3 -m http.server 8080
# Visit http://localhost:8080
```

---

## 📚 Need More Help?

| Document | Purpose |
|----------|---------|
| [DEPLOYMENT_CHECKLIST.md](./DEPLOYMENT_CHECKLIST.md) | Step-by-step checklist |
| [CONFIGURATION_GUIDE.md](./CONFIGURATION_GUIDE.md) | Detailed configuration |
| [RENDER_DEPLOYMENT_GUIDE.md](./RENDER_DEPLOYMENT_GUIDE.md) | Complete deployment guide |

---

## 💰 Cost Summary

**Free Tier:**
- Backend: Free (spins down after 15min inactivity)
- Database: Free for 90 days → $7/month
- Frontend: Free forever

**Paid (No spin-down):**
- Total: $14/month (Backend $7 + Database $7)

---

## 🔧 Troubleshooting

### CORS Error?
Update `CORS_ORIGINS` in backend environment variables.

### Can't Connect to API?
Check frontend was built with correct API URL:
```bash
./build_prod.sh https://your-backend.onrender.com
```

### Database Error?
Verify `DATABASE_URL` is set in Render backend environment.

---

**Ready? Start with Step 1!** 🎉
