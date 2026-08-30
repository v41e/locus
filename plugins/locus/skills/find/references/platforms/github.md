# GitHub Active Work

Use GitHub only when the task needs remote shaping, delivery, or review context.

1. Follow an explicitly named issue or pull request regardless of state.
2. Otherwise read the repository-root `Work Tracking` section. If it declares
   no Project, search repository-scoped open issues only when useful.
3. Resolve the current repository from its remote. In a cross-repository
   Project, filter items to that repository before loading their content.
4. Resolve Project status semantics from Project metadata or repository policy.
   Exclude an item only when its status unambiguously means completed. When the
   meaning is unclear, retain it and report its state as unknown. Keep closed
   repository work excluded unless an exception below applies.
5. For a tracked-work state question, hydrate only the linked Issue, its current
   Project item, and any linked pull request needed to establish shaping,
   coordination, and delivery state.
6. Otherwise hydrate the strongest matching issue or pull request. If several
   remain plausible, return compact pointers before loading bodies and comments.
7. Load completed or archived history only when explicitly named, directly
   depended upon, or needed to explain current durable truth.
8. After completed delivery, inspect the relevant current code, tests, or
   repository docs when the question asks for current truth rather than history.

Issues own shaping, decisions, and approved specification or plan snapshots.
Pull requests own delivery, verification, deviations, and review. Code, tests,
and repository docs remain durable truth.
