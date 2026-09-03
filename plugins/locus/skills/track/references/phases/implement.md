# Implement

## Preconditions

The work contract is approved at the depth required by its workflow.

## Workflow

1. Apply the mapped active status to tracked work and record the actual start
   when the selected platform supports it.
2. Continue in the selected checkout or worktree and follow the nearest Git
   policy.
3. Choose direct, plan-execution, or parallel topology based on coupling.
4. Implement the smallest approved change with a failing check first when code
   behavior changes.
5. Integrate once in the main agent and run deterministic affected checks.

## Outcome

Proceed to Review only with passing evidence. If a check fails, diagnose it;
never weaken the check or silently expand scope.
