---
description: 'Use when reviewing, cleaning up, triaging, or assessing merge readiness of a Jenkins plugin pull request. Covers issue validation, all review threads, continuation plans, manual and automated tests, performance, and branch policy.'
---

# Common Jenkins Plugin PR Review and Cleanup

Initial publication authorized by mPokornyETM on 2026-10-28. Further changes
require review before publication. Apply this workflow in order when asked to
review, clean up, or triage a Jenkins plugin PR. Read the
consumer's own coding and review instructions as well. This workflow does not
authorize modifying branches, publishing reviews, or merging a PR.

## 1. Validate the Description

Read the current PR title and body, and compare them with the current diff.
Flag inaccurate claims, copy-paste mistakes, stale descriptions, and unfilled
template text. Record the reviewed head commit so later changes are not mistaken
for already-reviewed code.

## 2. Validate Linked Items

Read linked Jira and GitHub issues and check that they match the PR's intent.
Flag unrelated links. Bug fixes and features need tracking issues under this
policy; minor improvements may omit one where the repository permits it. Record
any explicit maintainer-approved exception. Do not silently drop this check.

## 3. Validate the Implementation

Inspect the diff and nearest controlling code, tests, and call sites. Confirm
that the implementation addresses the stated problem without introducing a
regression. Look for incomplete changes, dead code, debugging leftovers,
unrelated edits, security risks, and compatibility breaks. Apply local coding
rules and the shared Jenkins development guidance when installed.

## 4. Read All Review Comments

Read both open and resolved threads, plus general discussion and review states.
Resolved threads can explain previous concerns, rejected approaches, and design
decisions. Do not treat an addressed comment on an old revision as proof that the
current implementation is correct.

Every open concern needs a meaningful resolution or explicit nonblocking
acceptance by the reviewer before merge. If the tools cannot retrieve a thread
or distinguish its resolution state, report that gap instead of claiming all
conversations are resolved.

## 5. Propose a Continuation Plan

Always give at least one concrete next step. Identify missing or broken pieces,
needed code/test changes, branch updates, or comment resolutions. Recommend
continuing, splitting, or closing in favor of a fresh PR when warranted. For an
idle PR, compare its approach with the current target branch before proposing
further work. Make clear which actions require maintainer authorization.

## 6. Define Manual and Automated Testing

Provide concrete manual steps, expected outcomes, and the affected UI pages or
runtime scenarios. For a typical Maven HPI plugin, `mvn hpi:run` may be suitable,
but first check its documented environment and existing instance; do not start
an extra controller or change real jobs without permission.

For concurrent, queued, scheduled, or shared-state behavior, describe competing
jobs, cancellation/failure, restart, and cleanup cases relevant to the change.
Do not copy Lockable Resources-specific scenarios to unrelated plugins.

Require unit tests for changed logic, Jenkins test-harness integration tests
for runtime/Pipeline behavior, and Configuration as Code tests where config
structures change. Reuse the repository's existing tests and helpers rather than
assuming a particular test class exists. If coverage is missing, add it within
an authorized implementation task or explain exactly what is missing and why.

Run the full required verification before recommending approval: normally
`mvn clean verify` for a Maven HPI plugin, or its documented equivalent. Check
repository-specific formatting, static analysis, and CI gates too. If execution
is unavailable or the task is source review only, disclose that testing is
incomplete and do not claim approval readiness. Never silently skip flaky or
slow tests, or declare an infrastructure failure to be unrelated without evidence.

## 7. Evaluate Performance Impact

Identify the actual plugin hot paths: build hooks, Pipeline execution, queue
dispatch, polling, UI/API requests, persistence, or shared service operations.

- Check lock contention, synchronization overhead, and work performed while
  holding a lock. Justify new `synchronized` sections or blocking calls.
- Look for repeated full-collection scans, growing query counts, unnecessary
  object resolution, and new `save()` or other disk/network I/O in frequent paths.
- Assess memory lifetime: leaks, unbounded collections/caches, and retained
  `Run`, `FlowNode`, request, or class-loader references where applicable.
- Choose workload sizes representative of that plugin's expected production
  use. Do not treat a small happy-path test as evidence of scalability.
- For a hot-path change, request or provide a reproducible benchmark or load
  scenario, comparing before/after behavior under the same conditions. Record
  inputs, measurements, and limits; distinguish analysis from measurements.
- Flag new synchronization, persistence, or full scans without justification,
  and state explicitly when performance impact has not been measured.

## 8. Check Source-Branch Freshness

Check whether the source is up to date with the intended target and whether
conflicts or relevant intervening changes exist. If it is behind, propose the
repository-approved rebase or merge before merge readiness, then rerun the
affected checks on the new head. This policy does not authorize automatically
rebasing, merging, force-pushing, or discarding local work during a review.

## 9. Check the Target Branch

Use the repository's configured default branch as the normal target; do not
assume all plugins use `master`. Other targets, such as a release or long-running
feature branch, require an explicit repository policy or maintainer agreement.
Flag an unexpected target and verify its justification.

## Review Output

Lead with actionable findings, ordered by severity and grounded in file/line
references to the reviewed revision. Distinguish confirmed defects from risks
and missing evidence. If there are no findings, say so and identify residual
test or performance gaps. Follow with the continuation plan and verification
status; do not bury blockers under a general summary.

Checklist for every review:

```text
[ ] Title and description match the current diff
[ ] Linked issues are relevant, or a permitted exception is explained
[ ] Implementation solves the problem without unrelated changes
[ ] Open and resolved comments have been reviewed
[ ] Open concerns are resolved or explicitly accepted by the reviewer
[ ] Concrete continuation plan is provided
[ ] Manual verification steps and expected outcomes are defined
[ ] Automated coverage exists or its absence is precisely explained
[ ] Full verification is complete, or approval readiness is withheld
[ ] Runtime, memory, I/O, synchronization, and scalability risks are assessed
[ ] Source branch is current with the intended target
[ ] Target branch follows repository policy
```
