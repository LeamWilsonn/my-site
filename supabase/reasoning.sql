-- The reasoning service's memory (Challenge 2). You run this ONCE, right
-- before you build the service: Supabase dashboard -> SQL Editor -> New
-- query -> paste this whole file -> Run. Expect "Success. No rows returned."
-- The build guide (course book, end of Lane 2) explains every line.

create table public.reasoning_latest (
  type text primary key,
  problem jsonb not null,
  answer jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.reasoning_latest enable row level security;

create policy "anyone can read" on public.reasoning_latest
  for select using (true);
create policy "anyone can insert" on public.reasoning_latest
  for insert with check (true);
create policy "anyone can update" on public.reasoning_latest
  for update using (true);

grant select, insert, update on public.reasoning_latest to anon;