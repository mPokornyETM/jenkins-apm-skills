---
description: 'Use when developing or modernizing a Jenkins plugin: coding standards, public APIs, localization, tests, dependencies, changelog-ready PR titles, and merge readiness.'
applyTo: '**/*.java,**/*.jelly,**/*.js,**/*.ts,**/*.properties,**/pom.xml,**/Jenkinsfile,**/.github/workflows/*.yml,**/.github/workflows/*.yaml'
---

# Common Jenkins Plugin Development Rules

Initial publication authorized by mPokornyETM on 2026-10-28. Further changes
require review before publication. Derived from the Lockable Resources plugin's
coding and contribution rules; this file is shared guidance,
not evidence that every consumer has the same tooling, workflows, or release policy.

## Establish Repository Context

- Read the consumer's local agent instructions, contribution guide, POM, tests,
  and relevant CI workflows. Preserve its intentional rules and user edits.
- Use the Java, Maven, Jenkins baseline, parent POM, and BOM versions actually
  declared by that repository. Do not assume one Java version fits all plugins.
- Reuse existing APIs, test helpers, and formatting conventions. Keep changes
  focused; do not mix unrelated modernization work into a bug fix.
- Shared guidance supplements repository rules, not an instruction to replace
  them. Surface conflicts to the maintainer instead of silently overriding policy.

## Issues, Titles, and Descriptions

- Link Jira issues as `JENKINS-XXXXX` with their full
  `https://issues.jenkins.io/browse/JENKINS-XXXXX` URL. Link GitHub issues in the
  correct repository; do not confuse issue numbers with pull request numbers.
- Confirm the linked issue describes the actual change. Use closing keywords
  such as `Fixes #123` only when the PR fully resolves that issue.
- Bug fixes and new features require a tracking issue under this review policy;
  flag missing links. Minor improvements may omit one when repository policy
  permits it. Explain any maintainer-approved exception rather than inventing an issue.
- Write PR titles in imperative mood, describing the user-visible change. Where
  the title becomes the changelog entry, make it accurate without relying on the
  body. Follow the repository's title conventions and the
  [Jenkins changelog style](https://github.com/jenkins-infra/jenkins.io/blob/main/content/_data/changelogs/weekly.yml).
- Describe the implementation, tests, compatibility risks, and limitations.
  Remove unused template text and fix stale or unrelated descriptions.

## Coding and Compatibility

- Restrict internal-only public APIs with `@Restricted(NoExternalUse.class)`
  where applicable. If Jelly calls them, document the consuming Jelly file.
- For new public classes, fields, and methods, use the repository's restriction
  or `@since` conventions. Do not accidentally expose a new supported API.
- For deprecations, follow the repository's `@Deprecated(since = ...)` and
  removal policy. Use `TODO` version placeholders only when its release process
  explicitly supports them; do not guess a release version.
- Keep JavaScript external, avoid `eval()` and inline scripts, and respect
  [Jenkins Content Security Policy guidance](https://www.jenkins.io/doc/developer/security/csp/).
- Put user-visible localized strings in the appropriate `*.properties` files.
  Supply English entries for every new key. Check that plugin's translation
  workflow rather than assuming it uses Crowdin.
- Document UI, configuration, and Pipeline DSL changes in the plugin's existing
  documentation/examples location. Provide an actual usage example and expected
  behavior; do not assume every repository has `src/doc/examples/`.

## Test Evidence

- Every change needs appropriate automated coverage, or a precise explanation of
  why tests are not feasible. Passing CI alone does not show the changed path ran.
- Reproduce a bug or exercise the changed behavior in a focused test. For a
  refactor, exercise behavior before and after and confirm it stays identical.
- Use unit tests for logic, Jenkins test-harness integration tests for relevant
  runtime behavior, and Configuration as Code tests when configuration changes.
- Include before/after screenshots for frontend changes and check the affected
  pages. Record meaningful manual verification and expected outcomes.
- Run focused checks while implementing, then required repository gates before
  approval. Report flaky tests, failures, skipped checks, and unverified scenarios;
  do not call a change ready based only on compilation.

## Dependencies and Upgrades

- Include upstream changelog links and, when available, comparison links for
  dependency updates. Check baseline compatibility and transitive constraints.
- For new APIs or extension points, identify at least one real consumer or
  explain the intended contract and how it is tested.
- Add upgrade guidance for breaking changes or required manual action. Use an
  upgrade-guide label only if the repository defines it.

## Repository Automation and Merge Readiness

- Inspect the repository's labeler, release-drafter, title checks, and branch
  policies. Do not assume a label, path mapping, workflow, countdown, or auto-merge
  rule from another plugin exists here. Do not bypass required review.
- Require at least one approval, or more if repository policy requires it, with
  no outstanding change requests. Resolve all conversations or record the
  reviewer's explicit acceptance of a nonblocking concern.
- Confirm a changelog-ready title, appropriate labels, test evidence, and all
  required checks before recommending `ready-for-merge` where that label exists.
- These rules do not authorize creating branches, rewriting history, pushing,
  approving, merging, publishing, or changing repository automation on their own.
