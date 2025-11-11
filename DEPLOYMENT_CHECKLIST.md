# Render Deployment Checklist

Use this checklist to deploy your portfolio to Render.

## Pre-Deployment Checklist

- [ ] Code is committed to a Git repository (GitHub, GitLab, or Bitbucket)
- [ ] You have a Render account (https://render.com)
- [ ] Backend `.env` file is in `.gitignore` (✅ Already done)
- [ ] Updated `requirements.txt` with production dependencies (✅ Already done)
- [ ] Created `build.sh` script (✅ Already done)
- [ ] Updated `config.py` for PostgreSQL support (✅ Already done)

## Quick Deploy Steps

### Option 1: Using Blueprint (Fastest)

1. **Push to Git**
   ```bash
   git add .
   git commit -m "Prepare for Render deployment"
   git push origin main
   ```

2. **Deploy on Render**
   - Go to https://dashboard.render.com
   - Click "New +" → "Blueprint"
   - Connect repository
   - Render auto-creates database + backend from `render.yaml`
   - Wait for deployment (~5-10 minutes)

3. **Get Backend URL**
   - Your API will be at: `https://portfolio-backend.onrender.com`
   - Test: `curl https://portfolio-backend.onrender.com/api/health`

4. **Update Flutter Frontend**
   - Update API URL in your Flutter code to point to Render backend
   - Build: `flutter build web --release`

5. **Deploy Frontend**
   - Click "New +" → "Static Site"
   - Build Command: `flutter build web --release`
   - Publish Directory: `build/web`

### Option 2: Manual Setup

See [RENDER_DEPLOYMENT_GUIDE.md](./RENDER_DEPLOYMENT_GUIDE.md) for detailed manual setup instructions.

## Post-Deployment Checklist

- [ ] Backend health check responds: `/api/health`
- [ ] Database is connected (check logs for errors)
- [ ] CORS is configured for frontend domain
- [ ] Frontend can connect to backend API
- [ ] Environment variables are set correctly
- [ ] (Optional) Seed database with initial data
- [ ] (Optional) Set up custom domain

## Critical Environment Variables

**Backend:**
- `DATABASE_URL` - Auto-set by Render PostgreSQL
- `SECRET_KEY` - Generate random string
- `JWT_SECRET_KEY` - Generate random string
- `FLASK_ENV` - Set to `production`

**Frontend:**
- Update API base URL to your Render backend URL

## Testing

After deployment, test these endpoints:

```bash
# Health check
curl https://your-backend.onrender.com/api/health

# Projects endpoint
curl https://your-backend.onrender.com/api/projects

# Experiences endpoint
curl https://your-backend.onrender.com/api/experiences

# Testimonies endpoint
curl https://your-backend.onrender.com/api/testimonies
```

## Common Issues

| Issue | Solution |
|-------|----------|
| Backend won't start | Check logs, verify DATABASE_URL is set |
| Database connection fails | Use Internal URL, not External |
| Frontend can't reach API | Update CORS settings, check API URL |
| Build.sh permission denied | Run: `chmod +x backend/build.sh` |

## Cost Summary

**Free Tier:**
- Backend: Free (spins down after 15 min inactivity)
- Database: Free for 90 days, then $7/month
- Frontend: Free

**Paid (No spin-down):**
- Backend: $7/month
- Database: $7/month
- Total: $14/month

## Need Help?

- Full guide: [RENDER_DEPLOYMENT_GUIDE.md](./RENDER_DEPLOYMENT_GUIDE.md)
- Render Docs: https://render.com/docs
- Render Status: https://status.render.com

---

**Ready to deploy?** Start with Option 1 (Blueprint) above! 🚀
