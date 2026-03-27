-- Phase B patch: ensure projects has team/timeline/document columns.
-- Safe to run multiple times.

alter table public.projects
  add column if not exists team_capacity integer,
  add column if not exists estimated_start_date date,
  add column if not exists deadline date,
  add column if not exists documentation_url text;

-- Keep capacity in a sensible range.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'projects_team_capacity_range_check'
  ) then
    alter table public.projects
      add constraint projects_team_capacity_range_check
      check (team_capacity is null or (team_capacity >= 1 and team_capacity <= 20));
  end if;
end $$;

-- Deadline cannot be earlier than estimated start date.
do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'projects_timeline_order_check'
  ) then
    alter table public.projects
      add constraint projects_timeline_order_check
      check (
        estimated_start_date is null
        or deadline is null
        or deadline >= estimated_start_date
      );
  end if;
end $$;

-- Helpful indexes for list/detail queries.
create index if not exists idx_projects_deadline on public.projects(deadline);
create index if not exists idx_projects_estimated_start_date on public.projects(estimated_start_date);
