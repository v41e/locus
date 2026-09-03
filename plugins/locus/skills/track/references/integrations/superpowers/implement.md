# Implement

Superpowers skills for the Locus Implement phase.

## Skills

| Use when                                                                                              | Skill                                        | Boundary                                                        |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------- | --------------------------------------------------------------- |
| Production code changes: feature, fix, or refactor                                                    | `superpowers:test-driven-development`        | Ask before exceptions for config, generated code, or prototypes |
| Two or more ad hoc tasks are independent and no plan executor owns them                               | `superpowers:dispatching-parallel-agents`    | Review results, check conflicts, then run the full suite        |
| An approved plan has mostly independent tasks, stays here, and per-task review justifies the overhead | `superpowers:subagent-driven-development`    | Use its task reviewer after every task                          |
| An approved plan runs in a separate task                                                              | `superpowers:executing-plans`                | Do not stack plan executors                                     |
| A check fails or unexpected behavior appears                                                          | `superpowers:systematic-debugging`           | Return to root-cause diagnosis                                  |

## Rules

- Choose one plan executor.
- Parallelize only independent work; keep coupled writes sequential.
