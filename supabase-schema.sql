create table if not exists public.events (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  organizer text not null,
  city text not null,
  venue text,
  category text not null check (category in ('Hackathon','Ideathon','Coding Competition','Tech Fest','Workshop')),
  mode text not null check (mode in ('Offline','Online','Hybrid')),
  start_date date,
  deadline date,
  registration_url text not null,
  description text,
  ambassador_name text not null,
  ambassador_email text not null,
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default now()
);

alter table public.events enable row level security;

-- Anyone can read only approved events.
create policy "Public can view approved events" on public.events
for select using (status = 'approved');

-- Anyone can submit an event, but cannot choose its publication status.
create policy "Anyone can submit pending events" on public.events
for insert with check (status = 'pending');

-- Review and approve submissions in Supabase Table Editor.
-- Do not expose the service_role key in the browser or commit it to Git.
