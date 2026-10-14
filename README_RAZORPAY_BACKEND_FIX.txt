XE STORE — RAZORPAY BACKEND FIX PACK

This ZIP contains the XE Store frontend and backend with Razorpay Checkout (not direct UPI links). The frontend API base is set to https://xe-store.onrender.com.

IMPORTANT
- This is a starter patch, not a claim that your live service has been changed. You must upload/deploy the files yourself.
- First confirm that https://xe-store.onrender.com is your actual Render service URL. If it differs, change API in app.js and admin.js.
- Test with Razorpay TEST keys before live payments. Live payments require Razorpay activation/KYC.
- Never put RAZORPAY_KEY_SECRET, DATABASE_URL, JWT_SECRET, webhook secret, or admin password/hash in frontend files or public GitHub. Configure them only in Render Environment.

DEPLOY BACKEND
1. In your GitHub repository, replace backend/server.js, backend/package.json, and database/schema.sql with these files.
2. Render service Root Directory should be backend (match actual folder case), Build Command: npm install, Start Command: npm start.
3. In Render Environment configure DATABASE_URL, FRONTEND_ORIGIN=https://xe-developments.github.io, RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET, RAZORPAY_WEBHOOK_SECRET, ADMIN_EMAIL, ADMIN_PASSWORD_HASH, JWT_SECRET, NODE_ENV=production. Render supplies PORT.
4. Use Razorpay Dashboard Test Mode keys while testing. Configure webhook URL as https://xe-store.onrender.com/api/webhooks/razorpay only if that is your actual service URL. Set same webhook secret in Razorpay and Render. Select payment.captured and payment.failed.
5. Run database/schema.sql in the XE Store Supabase SQL Editor. It includes an ALTER TABLE ADD COLUMN IF NOT EXISTS category migration; running it more than once is safe for the category column and sample products are protected by ON CONFLICT. Review existing schema/data before running on a live database.
6. Redeploy and test GET /health, GET /api/products, admin login, order creation, checkout, payment signature verification, and webhook delivery.

PAYMENT NOTES
- Frontend uses Razorpay Checkout. Customer payment methods shown are controlled by Razorpay/account/device eligibility.
- Backend computes prices from products in the database, creates Razorpay orders, verifies payment signature and confirms captured amount/order match.
- Webhook signature is validated with RAZORPAY_WEBHOOK_SECRET.
- API order status may be updated by checkout verification or webhook; do not mark an order paid just because Checkout closed.
- The browser checkout's key ID is public by design; key secret must remain backend-only.
