# FinderDev Product Backlog Notes

This file stores feature ideas that are confirmed but intentionally postponed.

## Collaboration Work Log (Trello-like)

- Allow project owners or members to create work items/tasks inside a project.
- Each task should support progress notes or work logs (who did what, when).
- Team members should be able to view activity history for transparency.
- Target outcome: lightweight project activity board and audit trail.

## Project Capacity Settings

- During project creation, owner should define team capacity (for example max member count).
- Capacity data should be persisted in Supabase and exposed in project detail.
- Future: hide or disable apply action when capacity is full.

## Application / Request Approval Workflow

- Applying to a project should not auto-accept participants.
- Every request should enter a pending state and require owner decision.
- Owner should be able to accept or reject requests from a dedicated management view.
- Decisions should be visible to applicants (status updates).

## Team Role Permissions (Leader / Co-Leader)

- Projects should support team authority levels such as Leader and Co-Leader.
- Co-Leader should be able to review and manage incoming join requests.
- Permission matrix should define which actions each role can perform (member management, updates, approvals).
- Future: expose role assignment UI inside project management settings.

## Achievement / Badge System

- Add a public achievement model visible on profile pages.
- Track core signals such as profile completion, completed projects, and project abandonment patterns.
- Surface badge counts and achievement history in user profile and developer discovery contexts.
- Future: include moderation-safe negative trust indicators with clear criteria.

## Project Type Classification

- Add a `project_type` field to project creation and detail views.
- Initial options: `Web Project`, `Mobile App`, `Game`, `AI Tool`, `API/Backend`, `Desktop App`, `Other`.
- Include project type in browse/search filtering and card metadata.
- Keep schema extensible for future multi-type tagging.

