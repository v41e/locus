# Refresh Existing Documents

Refresh reconciles existing documents with the current template contract. It is
not replacement from a template.

## Workflow

1. Read every existing selected document and every selected template completely.
2. Create a missing selected companion when the target contract calls for it.
3. Map existing sections by purpose rather than exact heading.
4. Preserve verified repository-specific facts and useful custom sections.
5. Add missing required sections in template order. Move or merge content when
   its owner changed; do not duplicate durable explanations in `AGENTS.md`.
6. Remove obsolete boilerplate, duplication, and placeholders only after useful
   content is preserved.
7. Never silently delete unmatched content or replace facts with placeholders.
   Report unresolved content as an open fact.
8. Re-read the refreshed documents together and compare them with the templates
   for structure, not wording.
