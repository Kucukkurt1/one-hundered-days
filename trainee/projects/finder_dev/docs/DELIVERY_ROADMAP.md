# FinderDev Delivery Roadmap

This roadmap locks the release order and groups postponed work into clear post-launch packages.

## Phase 0 - MVP Lock (Now)

Order of execution:

1. Ship Realtime-first chat MVP.
2. Validate critical end-to-end flows.
3. Apply final RLS hardening after behavior is verified.

### Critical Regression Checklist

- Auth: sign in, sign up, protected routes, session restore.
- Profile visibility: `public` and `members_only` behavior.
- Browse/search: project mode and developer mode queries + filters.
- Project details: roles display, team/timeline block, owner/team rendering.
- Create project: required fields, timeline validation, status dropdown, capacity bounds.
- Notifications/messages entry points and basic navigation safety.

### Definition of Done (MVP Lock)

- Chat MVP is usable for authenticated users in intended project scopes.
- No blocking regressions in checklist flows.
- Final RLS policies are enabled and validated against main user journeys.

## Phase 1 - Post-Launch Package A (Team Management)

Focus: project governance and access control.

- Application/request approval workflow (`pending -> accept/reject`).
- Leader/Co-Leader role model and permission matrix.
- Capacity-aware application guardrails (disable or prevent apply when full).

Exit criteria:

- Owners and co-leaders can safely manage incoming requests.
- Applicant status is visible and consistent.
- Capacity rules are enforced both in UI and backend.

## Phase 2 - Post-Launch Package B (Product Deepening)

Focus: trust, productivity, and discovery quality.

- Trello-like collaboration work log with activity history.
- Achievement/badge system with profile visibility.
- Project type classification integrated into create and browse flows.

Exit criteria:

- Teams can track who did what and when inside project context.
- Public profile credibility signals are visible and understandable.
- Project discovery supports category-based filtering.
