---
name: using
description: Use when the user or agent needs to understand Locus, choose among its installed skills, or decide the smallest safe knowledge-lifecycle action.
---

# Using Locus

Choose one capability from the current evidence:

| Need                                                                | Skill           |
| ------------------------------------------------------------------- | --------------- |
| Locate the smallest verified owner or active-work context           | `locus:find`    |
| Create, refresh, align, migrate, or explicitly reset canonical docs | `locus:init`    |
| Classify, resume, or synchronize repository work                    | `locus:track`   |
| Promote verified transient evidence into durable ownership          | `locus:distill` |

Start with `find` when ownership or active state is unclear. Use `track` for the
work lifecycle, then `distill` at completion when durable knowledge may have
changed. Use `init` only for the requested canonical document operation.

Read the selected skill completely before acting. Load optional integrations
only when installed and relevant. Return the chosen skill, why it matches, its
boundary, and the smallest safe next action.
