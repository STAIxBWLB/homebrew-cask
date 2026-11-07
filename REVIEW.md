# Review instructions

Read by the required OCR delegation reviewer (Claude Code, Codex, or Kimi Code),
additional `/codex:review` or `/code-review` passes, and human reviewers alike.

## Passes

Run these passes and tag every finding with its pass:

- Bugs: logic errors, broken edge cases, regressions. Error messages: a new or changed error, refusal or
  failure message a person or agent sees names the cause (what failed and why) and the next step (the
  command, setting or target that fixes it). When secrets, ids or paths must stay out, it names the cause
  class and how to check it. A message missing either is a finding; Important when it is the only signal
  of a blocked action (a CLI exit, a refused tool call), otherwise a nit.
- Security: injection, auth gaps, secrets or PII in logs and diffs. In workflows, event text such as
  commit messages and branch names reaches `run:` only through `env:`.
- Compliance: the change matches the linked issue. Workflow changes (`.github/workflows/`) keep a
  `timeout-minutes` on every job and a `concurrency` group.
- Instruction prose (changes to AGENTS.md, REVIEW.md, or prompts): for each "do not X", would
  "do Y" alone keep the force and the boundary? Keep it for safety, permission, and contract
  boundaries. Is a chain of cases standing in for a judgment? Does a new directive name the failure
  it prevents? Nits unless runtime behavior changes.

## Repo focus

- The audit loads the tap only after trusting it: Homebrew 6.0+ refuses an untrusted tap
  (`.github/workflows/audit.yml:40-43`). A change that audits before this step fails at load time.
- Only an audited commit reaches `main` from a release bot: the `publish` job runs only for pushes to
  `publish/**` after `audit` passes, refuses a branch that touches files outside `Casks/` and
  `Formula/` (`.github/workflows/audit.yml:73-79`), and merges with `--match-head-commit` on the
  audited SHA (`.github/workflows/audit.yml:51-81`). Known exception: `Formula/dotfiles.rb` is not audited
  (`.github/workflows/audit.yml:45-49` names only `maru-workspace` and `maru-cli`).
- `Casks/` and `Formula/` are rendered by the producers' release jobs (STAIxBWLB/maru
  `scripts/update-homebrew-tap.mjs`, STAIxBWLB/dotfiles `.goreleaser.yaml`). A hand edit here is
  overwritten by the next release; fix the producer template instead.

## Findings

Each finding carries its pass, severity, evidence (`file:line` or a reproduction), and provenance:
introduced by this change, pre-existing, or indeterminate. Pre-existing findings go to a follow-up
issue instead of widening the change. Report what was reviewed and what was not reached.

## Re-review

Hand the reviewer the diff, the spec, and this file, and let it read the rest of the repo. Do not hand
it fix-status claims, earlier dispositions, or do-not-reflag notes. Judge recurrence by the violated
invariant, not by wording.

## What Important means here

Reserve Important for findings that break behavior, leak data, or breach a policy.
Style and naming are nits.

## Cap the nits

Report at most 3 nits per review; summarize the rest as a count.

## Do not report

- Generated paths: none in git. Style inside `Casks/` and `Formula/` belongs to the producer templates.
- Anything CI already enforces: `brew audit --strict --online` for `maru-workspace` and `maru-cli`.

## Feedback into AGENTS.md

When the same finding appears twice, the correction goes into `AGENTS.md` in the same PR (create the file if the repo has none yet).

---

Findings require evidence-based disposition. Merges happen on the owner's instruction after a
current-head review.
