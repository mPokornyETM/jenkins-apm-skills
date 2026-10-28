# Repository Rules

- Every skill and change to a skill, script, reference, or template requires
  mPokornyETM's review before publication.
- Keep drafts local until explicit approval. Do not push content, create public
  pull requests, releases, tags, or registry publications without authorization.
- Creating an empty GitHub repository does not authorize publishing its drafts.
- Do not commit credentials, private Jenkins state, or unreviewed transcripts.
- Store common source skills in `.apm/skills/common/<skill-name>/` and
  plugin-specific maintenance skills in `.apm/skills/<plugin>/<skill-name>/`.
- Declare grouped skills in `apm.yml`; do not assume nested discovery works.
- Keep executable helpers inside their skill and reference them relatively.
- Validate helpers with disposable resources and test APM deployment into a
  clean consumer. Never use a real fork push or production Jenkins job as a test
  without explicit authorization.
- Record provenance, applicable versions, limits, and reproducible evidence.
  Do not convert an unverified finding into a best-practice claim.
- Do not overwrite existing agent instructions or edit generated installed
  skills as a substitute for changing their authoring source.

See CONTRIBUTING.md for the review process and README.md for validation commands.
