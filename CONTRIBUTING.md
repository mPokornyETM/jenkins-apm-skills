# Contributing

## Review Before Publication

Every new skill, reference, template, and executable helper must be reviewed by
mPokornyETM before it is published. This includes changes to existing skills.

- Prepare and validate drafts locally first.
- Do not push skill content, open a public pull request containing it, publish a
  package, or create a release or tag without explicit approval for that content.
- An empty public repository is not approval to publish its pending drafts.
- Keep reviewed revisions separate from unreviewed work. Record the approved
  commit and verification evidence when publication is authorized.
- Never copy credentials, private controller data, personal workspace paths, or
  unreviewed session transcripts into a skill.

## Authoring

Use `.apm/skills/common/<skill-name>/` for shared workflows and
`.apm/skills/<plugin-repository>/<skill-name>/` for plugin-specific maintenance.
Each skill has a `SKILL.md` with `name` matching its immediate directory and a
specific, intent-oriented `description`. Bundle executable helpers in `scripts/`
and detailed evidence in `references/`; use relative links from the skill.

Declare grouped skills in the root manifest so APM can deploy them. Do not copy
maintainer skills into plugin end-user packages or duplicate generated skills
as another source of truth.

Place shared Jenkins instruction rules in `.apm/instructions/*.instructions.md`
and declare their packing paths in `apm.yml`. Use file patterns for source-scoped
rules and a task-oriented description for review workflows. Preserve consumer
instructions and plugin-specific exceptions; test installation instead of
replacing a repository's root instructions through compilation. Instruction
changes require the same review-before-publication gate as skill changes.

For each finding, document its source, affected versions, prerequisites, known
limits, and a reproducible check. Separate established behavior from hypotheses
and unreleased features. Prefer links to source, tests, and existing examples
over speculative API guidance. Keep environment snapshots small and sanitized.

## Validation

1. Check frontmatter, skill names, links, and bundled paths.
2. Run focused behavioral tests for every changed helper.
3. Install into a disposable consumer with the documented APM version and
   `--target copilot`. Check deployment and asset preservation, not just exit code.
4. Verify that existing Copilot instructions are unchanged. Do not use force
   installation or compilation to overwrite user-authored instructions.
5. Present the draft diff and test evidence for review before publication.
