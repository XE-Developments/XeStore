XE STORE — NEW FULL PROJECT

Includes a black-and-white storefront with external product photos, responsive product grid, search, category filters, sorting, cart and Razorpay checkout; an admin UI for login, product CRUD, order listing and revenue summary; Express/PostgreSQL backend scaffold; SQL schema and sample catalog.

SETUP:
1. Create a NEW Supabase project and run database/schema.sql in SQL Editor.
2. Create a NEW GitHub repository. Upload index.html, styles.css, app.js, admin.html, admin.css and admin.js to the root.
3. Create a NEW Render Web Service from backend/server.js (if uploading whole ZIP, set Root Directory to backend). Build: npm install. Start: npm start.
4. Set Render env vars from backend/.env.example. Generate a bcrypt hash for ADMIN_PASSWORD_HASH; never put plain passwords or secrets in GitHub. FRONTEND_ORIGIN should be your GitHub Pages origin without the repo path.
5. Change API URL at the top of app.js and admin.js to the actual Render URL.
6. Enable GitHub Pages and test in Razorpay Test Mode.

PHOTOS: These are external Unsplash-hosted sample images, not verified photos of your actual stock. Replace with accurate product photos before sales; review image licensing/terms.

ADMIN: Dashboard requires the new backend deployed and ADMIN_EMAIL, ADMIN_PASSWORD_HASH, JWT_SECRET set. It will not log in until those are configured. Admin routes are JWT-protected.

PAYMENTS: Test mode first. Live payments require Razorpay activation and Live keys in Render. Verify the whole payment/webhook flow before launch. Never expose Razorpay secret keys in frontend JavaScript.

NOT INCLUDED/NEEDS FINALIZATION: Newsletter provider, real support email, final privacy/returns/shipping policies, password reset/MFA, stock tracking and production monitoring. Do not claim the store is production-ready until these are completed and tested.
