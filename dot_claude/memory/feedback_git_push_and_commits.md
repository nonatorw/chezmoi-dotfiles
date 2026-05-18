---
name: feedback_git_push_and_commits
description: Rules for git push and commit squashing — push requires explicit operator approval and passing tests; intermediate commits must be squash-merged before push
metadata:
  type: feedback
---

**Rule 1 — Never push without explicit approval.**
Never run `git push` (or any remote-writing git command) without first:
1. Confirming that the functionality specified in the task is working correctly (tests or manual verification)
2. Receiving explicit, unambiguous approval from the operator in that same conversation turn

"Siga", "continue", or similar forward instructions do NOT constitute push approval.

**Why:** In a session on 2026-05-18, pushes to `nonatorw-dotfiles` and `bluefin-template` were made without authorization, and one of those repos was planned to be replaced by a new repo (`linux-init-bootstrap`). This caused irreversible remote state changes.

**How to apply:** Before any `git push`, stop and ask: "Testes passando. Posso fazer push de `<repo>` para origin?" — wait for an explicit "yes" or equivalent before proceeding. Apply to ALL agents, subagents, and inline execution in ALL projects on this machine.

---

**Rule 2 — Squash intermediate commits before pushing.**
When a task produces multiple intermediate commits (e.g. fix, re-fix, review-driven corrections), offer to squash them into a single commit before pushing. Do not push a noisy commit history without giving the operator the option.

**Why:** The operator was not offered this option before the unauthorized push happened on 2026-05-18.

**How to apply:** After all tasks for a feature/plan are complete and before asking for push approval, list the commits that will be pushed and ask: "Deseja fazer squash destes N commits em um só antes do push?" Apply to ALL projects on this machine.
