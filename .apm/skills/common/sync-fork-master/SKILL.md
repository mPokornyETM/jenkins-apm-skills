---
name: sync-fork-master
description: 'Use when synchronizing a Jenkins plugin fork master branch with upstream master, checking fork drift, or previewing a safe fast-forward Git sync.'
compatibility: Requires Git, a POSIX shell such as Git Bash, and configured origin and fork remotes.
---

# Sync Fork Master

## Review Status

Initial publication authorized by mPokornyETM on 2026-10-28. Do not publish or
push further skill changes, or create releases, without explicit approval.
Invoking this skill does not itself
authorize pushing to a fork.

## Procedure

1. Work inside the target plugin repository, not the installed skill directory.
   Inspect `git status --short --branch` and `git remote -v` without changing
   branches or discarding local work.
2. Confirm that `origin` is the intended upstream and `fork` is the user's fork.
   Do not assume the names have these meanings in every repository. If they do
   not, stop and agree on the mapping; do not silently rewrite remotes.
3. Confirm that both repositories use `master`. This helper does not support
   other branch names. Check remote URLs before sending authenticated requests.
4. Run the bundled [helper](./scripts/sync-fork-master.sh) using its resolved
   installed path, while keeping the working directory inside the target repo:

   ```sh
   sh <resolved-skill-directory>/scripts/sync-fork-master.sh --dry-run
   ```

   On Windows use Git Bash. PowerShell's `sh` may resolve to a different shell.
   The preview fetches upstream and updates `origin/master`, but does not push.
5. If the user has authorized the update and the preview succeeds, run the same
   command without `--dry-run`. Report the upstream commit and push result.
6. If the push is rejected, inspect divergence and report the fork-only commits.
   Never automatically force-push, reset, merge, or rebase to make it succeed.

## Guarantees and Limits

- The helper fetches `origin/master` and pushes it directly to `fork/master`.
- It does not check out or modify local branches, the index, or working files.
- Git rejects non-fast-forward pushes; fork-only commits are not overwritten.
- It requires network access and existing Git authentication. Never request,
  print, or embed credentials in skills, commands, examples, or logs.
- It does not synchronize tags or other branches, or update local `master`.
- Do not add a force refspec or use a mirror-configured push remote.

## Evidence

The helper originated in the lockable-resources-plugin maintenance workspace.
Before approving changes, exercise shell syntax, dry-run, fast-forward update,
already-synchronized behavior, divergent fork rejection, invalid arguments,
and preservation of local branches and uncommitted files using disposable
local repositories. No real fork needs to be changed for these checks.