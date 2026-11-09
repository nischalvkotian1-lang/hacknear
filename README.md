# HackNear MVP

A location-first student opportunity board for hackathons, ideathons and campus tech events. Built with Next.js, Tailwind CSS and Supabase; ready for Vercel.

## 1. Run locally

Install Node.js 20.9+ and Git. In this folder run:

```bash
npm install
cp .env.example .env.local
npm run dev
```

Open http://localhost:3000.

## 2. Connect Supabase (required for live submissions)

1. Create a project at https://supabase.com.
2. Open **SQL Editor** and run the contents of `supabase-schema.sql`.
3. Open **Project Settings → API** (or Connect) and copy the Project URL and anon/public key.
4. Put them in `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_SUPABASE_ANON_KEY
```

5. Restart `npm run dev`.

Submissions are saved with `pending` status. Public visitors can only read `approved` events. To review submissions, open **Supabase → Table Editor → events** and change the `status` field to `approved` or `rejected`. This is the simple MVP moderation workflow; an authenticated admin dashboard can be added next.

## 3. Deploy to Vercel

1. Push this project to a new GitHub repository.
2. Sign in at https://vercel.com and choose **Add New → Project**.
3. Import the GitHub repository. Vercel should detect Next.js automatically.
4. In **Environment Variables**, add `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` with the same values from Supabase.
5. Click **Deploy**. Vercel will provide a public `*.vercel.app` URL.

If you change environment variables later, redeploy the project.

## 4. Current MVP scope

- Responsive event discovery homepage.
- Search by event, organizer or city.
- Location and category filters.
- Ambassador event submission form.
- Supabase-backed submissions and approved-event listing.
- Manual moderation through Supabase Table Editor.

Not yet included: image uploads, student accounts, ambassador login, automated scraping, notifications, maps, and an in-site admin dashboard. Add these after validating the first campus pilot.

## Security notes

- Only the Supabase anon/public key belongs in `NEXT_PUBLIC_` variables.
- Never put the Supabase `service_role` key in frontend code or GitHub.
- Keep event publication approval manual until trusted ambassador accounts and admin authentication are implemented.
