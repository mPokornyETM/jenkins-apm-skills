---
name: jenkins-plugin-inventory
description: 'Use when listing maintained or adopted Jenkins plugins, discovering Jenkins developer-team repositories, refreshing plugin health and modernization TODOs, or generating a maintenance dashboard with versions, issues, PRs, installations, coverage, and APM namespace links.'
compatibility: Requires Windows PowerShell 5.1 or PowerShell 7, authenticated GitHub CLI, and public Jenkins APIs. Git is needed only for optional checkouts.
---

# Jenkins Plugin Inventory and Dashboard

Initial publication authorized by mPokornyETM on 2026-10-28. Further changes to
this skill, generated snapshots, or its helpers require review before publication.

## Procedure

1. Establish the target workspace, account, and requested update scope. Inspect
   existing changes before writing files. Default account is `mPokornyETM`.
   Installing this skill does not authorize Git pushes, Jenkins changes, or builds.
2. Resolve the installed skill directory and invoke the
   [discovery helper](./scripts/Fetch-JenkinsPlugins.ps1) from the target workspace:

   ```powershell
   & <skill-directory>/scripts/Fetch-JenkinsPlugins.ps1 -Account mPokornyETM
   ```

   Discovery writes `data/plugins.json`, plus ignored source snapshots. It uses
   the update-center developer list, the authenticated account's Jenkins developer
   teams, open publishing-permission requests, and personal forks. If a source
   fails, preserve and report the inventory warnings; do not call it complete.
3. Keep the four evidence classes distinct. `fork-only` is not maintainership,
   and `pending-permissions` is not granted access. Team access is separate from
   released developer metadata. Group multiple plugin IDs under one repository.
4. To create or update local source checkouts, add `-CheckoutRoot <directory>`
   only when requested. Existing checkouts must have the expected GitHub origin;
   the helper fetches without switching branches or changing working files.
   Do not use production Jenkins directories or force a mismatched checkout.
5. Before rendering, ensure the target README has exactly one marker pair:

   ```markdown
   <!-- BEGIN GENERATED PLUGIN DASHBOARD -->
   <!-- END GENERATED PLUGIN DASHBOARD -->
   ```

   Do not silently add markers around or replace unrelated user-written content.
6. Invoke the [dashboard helper](./scripts/Update-JenkinsPluginDashboard.ps1)
   from that workspace. It writes `data/plugin-status.json`, replaces only the
   marked README region, and creates missing `.apm/skills/<repository>/README.md`
   namespaces. It never replaces existing plugin notes or invents a `SKILL.md`.
   A namespace link is not an installable skill; add a real skill after review.
7. Prefer cached results: successful API responses are reused for 24 hours.
   Use `-Offline` to render cached information with no network calls, or
   `-Refresh` to bypass cache freshness. Missing data remains unknown; failed
   refreshes retaining older data are explicitly marked `stale-cache`.
8. Present the diff, source warnings, missing metrics, and verification evidence
   to mPokornyETM. Never automatically commit or publish generated results.

## Data Contracts and Limits

- Plugin site JSON: `https://plugins.jenkins.io/api/plugin/<id>`. Version is the
  published plugin version, not a GitHub release or checkout version. Installations
  use the latest dated `stats.installations` sample, not cumulative downloads.
- Downloads are unknown: the queried APIs do not expose a download count. Do not
  rename installations, GitHub release assets, or HPI downloads as equivalent.
- GitHub GraphQL returns OPEN issue and PR counts separately, repository
  description, and the default branch's latest commit URL and timestamp. Do not
  use REST `open_issues_count` as an issue-only count: it includes pull requests.
- Health JSON: `https://plugin-health.jenkins.io/api/scores`. Preserve each
  plugin's score date and service-reported remediation text/link pairs in
  `details.*.components[].resolutions`. No remediation links is not proof that
  all modernization work is complete; see the linked score report.
- Modernizer metadata is historical and not available for every plugin. The
  dashboard links to its potential report directory without claiming that a
  missing report exists or that an old migration reflects the current HEAD.
- Coverage is the public Codecov default-branch badge via Shields JSON. Only a
  numeric percentage is accepted; unknown/private/unconfigured badges stay
  unknown. It is not necessarily measured at the linked latest commit.
- Network snapshots can lag the source and GitHub permissions can hide teams.
  Counts describe observed records, not a complete adoption history.

## Reproducible Checks

Run the repository's `tests/plugin-inventory.ps1` to exercise offline discovery,
multiple plugin IDs per repository, evidence precedence, separate issue/PR
counts, unknown versus zero, health TODOs, Markdown escaping, cache failure
provenance, safe README boundaries, and preservation of plugin notes. Run the APM
consumer test to check deployment of this skill and all three bundled scripts.