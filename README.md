# Jenkins APM Skills

Reusable, evidence-based skills for maintaining Jenkins plugins. Common workflows
live alongside plugin-specific knowledge; each skill bundles the helpers needed
to reproduce its workflow.

## Motivation

I maintain more than 40 Jenkins plugins. Over the years, I have learned a lot
about keeping them working, reviewing contributions, investigating failures,
and adapting to changes in Jenkins and its ecosystem. I want to share that
experience as reusable skills, so it can help other contributors as well as
make my own maintenance work more sustainable.

This repository is my growing collection of that knowledge: practical workflows,
reproducible helpers, lessons from real issues, and patterns checked against
source code and tests. The goal is AI-assisted maintenance, development, and
testing grounded in experience, not just generated code that looks plausible.

Over time, I want these skills to cover:

- Building plugins, running focused tests, and reproducing failures locally.
- Modernizing plugins toward current Jenkins APIs, tooling, security practices,
  and development standards without losing compatibility unintentionally.
- Preparing well-scoped pull requests with clear titles, useful descriptions,
  linked issues, and appropriate test evidence.
- Automating dependency maintenance and checking update pull requests for
  compatibility, regressions, and required follow-up changes.
- Reviewing PR checks and CI results, distinguishing code defects from flaky
  tests or infrastructure failures, and recording reproducible findings.
- Sharing plugin-specific knowledge and examples that make the next change
  easier to understand, implement, and verify.

These are the direction of the project, not a claim that every workflow is
already implemented. The first skill synchronizes a fork's `master` branch;
the collection will grow as I capture and review more of what I have learned.
AI can help with repetitive work, but it does not replace maintainer judgment,
testing, or human review.

### Support This Work

Open source is freely available, but maintaining it takes personal time and
does not come with unlimited free support. Time spent on plugins is also time
away from family, friends, and hobbies. If these skills or my Jenkins plugin
work help you, you can [buy me a coffee](https://buymeacoffee.com/mpokornyetm)
to support the time and energy behind them. Thank you for supporting my work.

## My Jenkins Plugins

My GitHub forks are not a complete maintenance inventory: adopting a plugin does
not require keeping a personal fork, and having a fork does not establish a
maintainer role. This draft list starts with Jenkins publishing records and the
released plugin catalog, rather than inferring ownership from my repositories.
Many of these plugins are maintained together with other contributors.

Run the helpers below to refresh this dashboard. Plugin-specific APM links lead
to draft namespaces, not claims that a usable skill already exists for each
plugin. Existing notes are never overwritten by the refresh.

<!-- BEGIN GENERATED PLUGIN DASHBOARD -->

Snapshot: 2026-10-27T22:31:27.2467034Z. Discovery: 2026-10-27T22:26:24.3201382Z.

Evidence labels distinguish listed developers, developer-team access, pending permissions, and fork-only candidates. Counts are not claims of active maintainership.

Downloads are not exposed by the sources queried. Reporting installations are monthly controller reports, not downloads. Coverage is the public Codecov default-branch badge, not verified coverage of the latest commit. Health recommendations are a partial modernization checklist, not a complete audit; historical migration reports may be absent or outdated.

### [android-emulator-plugin](https://github.com/jenkinsci/android-emulator-plugin)

Android Emulator plugin for Jenkins

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/android-emulator-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 3; latest default-branch commit: [4696c661](https://github.com/jenkinsci/android-emulator-plugin/commit/4696c661dc8372e9ff4e735f1d45a389bec9f264). GitHub data: offline-cache, 2026-10-27T22:28:49.3493041Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/android-emulator-plugin)); source: offline-cache, 2026-10-27T22:28:49.7540409Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/android-emulator-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/android-emulator-plugin).
- [android-emulator](https://plugins.jenkins.io/android-emulator/): published version **725.vb\_b\_5b\_6685196f**; reporting installations **1413** (2026-02-01); health **80/100** (2026-10-27T21:36:24.520778Z, [score details](https://plugin-health.jenkins.io/scores/android-emulator)). Sources: site offline-cache, health offline-cache.
- Modernization for android-emulator: 1 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/android-emulator).
- TODO (android-emulator: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).

### [anything-goes-formatter-plugin](https://github.com/jenkinsci/anything-goes-formatter-plugin)

Description unavailable from GitHub.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/anything-goes-formatter-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 0; latest default-branch commit: [2031ca0a](https://github.com/jenkinsci/anything-goes-formatter-plugin/commit/2031ca0a572be24f3152560d20d1473e846c9a0c). GitHub data: offline-cache, 2026-10-27T22:28:52.1701429Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/anything-goes-formatter-plugin)); source: offline-cache, 2026-10-27T22:28:52.3875123Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/anything-goes-formatter-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/anything-goes-formatter-plugin).
- [anything-goes-formatter](https://plugins.jenkins.io/anything-goes-formatter/): published version **39.v625a\_b\_b\_d4d1a\_a\_**; reporting installations **1026** (2026-02-01); health **100/100** (2026-10-27T21:36:17.264303Z, [score details](https://plugin-health.jenkins.io/scores/anything-goes-formatter)). Sources: site offline-cache, health offline-cache.
- Modernization for anything-goes-formatter: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/anything-goes-formatter).

### [artifactdeployer-plugin](https://github.com/jenkinsci/artifactdeployer-plugin)

Description unavailable from GitHub.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/artifactdeployer-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 0; latest default-branch commit: [3f98e393](https://github.com/jenkinsci/artifactdeployer-plugin/commit/3f98e393a3ce0162c0855c39060846e17f8ebe4e). GitHub data: offline-cache, 2026-10-27T22:28:54.0498685Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/artifactdeployer-plugin)); source: offline-cache, 2026-10-27T22:28:54.5231544Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/artifactdeployer-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/artifactdeployer-plugin).
- [artifactdeployer](https://plugins.jenkins.io/artifactdeployer/): published version **1.3**; reporting installations **2780** (2026-02-01); health **80/100** (2026-10-27T21:36:36.198459Z, [score details](https://plugin-health.jenkins.io/scores/artifactdeployer)). Sources: site offline-cache, health offline-cache.
- Modernization for artifactdeployer: 2 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/artifactdeployer).
- TODO (artifactdeployer: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (artifactdeployer: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).

### [badge-plugin](https://github.com/jenkinsci/badge-plugin)

Jenkins Badge plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/badge-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 2; open PRs: 0; latest default-branch commit: [bed967ca](https://github.com/jenkinsci/badge-plugin/commit/bed967cabe9300f3cece46c8035a9661c6982131). GitHub data: offline-cache, 2026-10-27T22:28:56.1528457Z.
- Coverage: 99% ([Codecov](https://app.codecov.io/gh/jenkinsci/badge-plugin)); source: offline-cache, 2026-10-27T22:28:56.3401786Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/badge-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/badge-plugin).
- [badge](https://plugins.jenkins.io/badge/): published version **3.615.vb\_ed967ca\_b\_e93**; reporting installations **17775** (2026-02-01); health **100/100** (2026-10-27T21:36:19.132451Z, [score details](https://plugin-health.jenkins.io/scores/badge)). Sources: site offline-cache, health offline-cache.
- Modernization for badge: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/badge).

### [blueocean-plugin](https://github.com/jenkinsci/blueocean-plugin)

Blue Ocean is a reboot of the Jenkins CI/CD User Experience

- Evidence: fork-only. [APM skill namespace](.apm/skills/blueocean-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 638; open PRs: 39; latest default-branch commit: [e66dee5a](https://github.com/jenkinsci/blueocean-plugin/commit/e66dee5a419e64ebfe7083febec48c64fbe859ef). GitHub data: offline-cache, 2026-10-27T22:28:58.2669290Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/blueocean-plugin)); source: offline-cache, 2026-10-27T22:28:58.4779499Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/blueocean-plugin).
- [blueocean](https://plugins.jenkins.io/blueocean/): published version **1.27.26**; reporting installations **50058** (2026-02-01); health **72/100** (2026-10-27T21:36:33.4443Z, [score details](https://plugin-health.jenkins.io/scores/blueocean)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean).
- TODO (blueocean: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-bitbucket-pipeline](https://plugins.jenkins.io/blueocean-bitbucket-pipeline/): published version **1.27.26**; reporting installations **52265** (2026-02-01); health **72/100** (2026-10-27T21:36:37.740629Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-bitbucket-pipeline)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-bitbucket-pipeline: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-bitbucket-pipeline).
- TODO (blueocean-bitbucket-pipeline: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-bitbucket-pipeline: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-bitbucket-pipeline: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-bitbucket-pipeline: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-commons](https://plugins.jenkins.io/blueocean-commons/): published version **1.27.26**; reporting installations **61561** (2026-02-01); health **72/100** (2026-10-27T21:36:19.676129Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-commons)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-commons: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-commons).
- TODO (blueocean-commons: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-commons: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-commons: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-commons: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-config](https://plugins.jenkins.io/blueocean-config/): published version **1.27.26**; reporting installations **52757** (2026-02-01); health **72/100** (2026-10-27T21:36:33.254506Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-config)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-config: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-config).
- TODO (blueocean-config: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-config: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-config: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-config: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-core-js](https://plugins.jenkins.io/blueocean-core-js/): published version **1.27.26**; reporting installations **59164** (2026-02-01); health **72/100** (2026-10-27T21:36:51.090823Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-core-js)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-core-js: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-core-js).
- TODO (blueocean-core-js: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-core-js: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-core-js: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-core-js: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-dashboard](https://plugins.jenkins.io/blueocean-dashboard/): published version **1.27.26**; reporting installations **54518** (2026-02-01); health **72/100** (2026-10-27T21:36:50.665732Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-dashboard)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-dashboard: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-dashboard).
- TODO (blueocean-dashboard: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-dashboard: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-dashboard: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-dashboard: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-events](https://plugins.jenkins.io/blueocean-events/): published version **1.27.26**; reporting installations **51927** (2026-02-01); health **72/100** (2026-10-27T21:36:33.308613Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-events)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-events: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-events).
- TODO (blueocean-events: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-events: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-events: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-events: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-executor-info](https://plugins.jenkins.io/blueocean-executor-info/): published version **1.27.26**; reporting installations **2033** (2026-02-01); health **72/100** (2026-10-27T21:36:28.958389Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-executor-info)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-executor-info: 3 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-executor-info).
- TODO (blueocean-executor-info: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-executor-info: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-executor-info: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-git-pipeline](https://plugins.jenkins.io/blueocean-git-pipeline/): published version **1.27.26**; reporting installations **54677** (2026-02-01); health **72/100** (2026-10-27T21:36:40.801667Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-git-pipeline)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-git-pipeline: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-git-pipeline).
- TODO (blueocean-git-pipeline: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-git-pipeline: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-git-pipeline: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-git-pipeline: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-github-pipeline](https://plugins.jenkins.io/blueocean-github-pipeline/): published version **1.27.26**; reporting installations **53739** (2026-02-01); health **72/100** (2026-10-27T21:36:19.661431Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-github-pipeline)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-github-pipeline: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-github-pipeline).
- TODO (blueocean-github-pipeline: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-github-pipeline: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-github-pipeline: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-github-pipeline: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-i18n](https://plugins.jenkins.io/blueocean-i18n/): published version **1.27.26**; reporting installations **52995** (2026-02-01); health **72/100** (2026-10-27T21:36:43.302402Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-i18n)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-i18n: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-i18n).
- TODO (blueocean-i18n: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-i18n: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-i18n: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-i18n: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-jira](https://plugins.jenkins.io/blueocean-jira/): published version **1.27.26**; reporting installations **18738** (2026-02-01); health **72/100** (2026-10-27T21:36:45.332077Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-jira)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-jira: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-jira).
- TODO (blueocean-jira: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-jira: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-jira: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-jira: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-jwt](https://plugins.jenkins.io/blueocean-jwt/): published version **1.27.26**; reporting installations **58464** (2026-02-01); health **72/100** (2026-10-27T21:36:37.389558Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-jwt)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-jwt: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-jwt).
- TODO (blueocean-jwt: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-jwt: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-jwt: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-jwt: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-personalization](https://plugins.jenkins.io/blueocean-personalization/): published version **1.27.26**; reporting installations **52798** (2026-02-01); health **72/100** (2026-10-27T21:36:20.203121Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-personalization)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-personalization: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-personalization).
- TODO (blueocean-personalization: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-personalization: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-personalization: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-personalization: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-pipeline-api-impl](https://plugins.jenkins.io/blueocean-pipeline-api-impl/): published version **1.27.26**; reporting installations **56931** (2026-02-01); health **72/100** (2026-10-27T21:36:37.506409Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-pipeline-api-impl)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-pipeline-api-impl: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-pipeline-api-impl).
- TODO (blueocean-pipeline-api-impl: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-pipeline-api-impl: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-pipeline-api-impl: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-pipeline-api-impl: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-pipeline-editor](https://plugins.jenkins.io/blueocean-pipeline-editor/): published version **1.27.26**; reporting installations **52398** (2026-02-01); health **72/100** (2026-10-27T21:36:33.828403Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-pipeline-editor)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-pipeline-editor: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-pipeline-editor).
- TODO (blueocean-pipeline-editor: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-pipeline-editor: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-pipeline-editor: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-pipeline-editor: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-pipeline-scm-api](https://plugins.jenkins.io/blueocean-pipeline-scm-api/): published version **1.27.26**; reporting installations **58505** (2026-02-01); health **72/100** (2026-10-27T21:36:33.993588Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-pipeline-scm-api)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-pipeline-scm-api: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-pipeline-scm-api).
- TODO (blueocean-pipeline-scm-api: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-pipeline-scm-api: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-pipeline-scm-api: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-pipeline-scm-api: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-rest](https://plugins.jenkins.io/blueocean-rest/): published version **1.27.26**; reporting installations **61212** (2026-02-01); health **72/100** (2026-10-27T21:36:37.442837Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-rest)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-rest: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-rest).
- TODO (blueocean-rest: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-rest: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-rest: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-rest: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-rest-impl](https://plugins.jenkins.io/blueocean-rest-impl/): published version **1.27.26**; reporting installations **57612** (2026-02-01); health **72/100** (2026-10-27T21:36:19.691087Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-rest-impl)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-rest-impl: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-rest-impl).
- TODO (blueocean-rest-impl: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-rest-impl: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-rest-impl: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-rest-impl: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [blueocean-web](https://plugins.jenkins.io/blueocean-web/): published version **1.27.26**; reporting installations **58899** (2026-02-01); health **72/100** (2026-10-27T21:36:33.414272Z, [score details](https://plugin-health.jenkins.io/scores/blueocean-web)). Sources: site offline-cache, health offline-cache.
- Modernization for blueocean-web: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/blueocean-web).
- TODO (blueocean-web: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (blueocean-web: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (blueocean-web: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (blueocean-web: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).
- [jenkins-design-language](https://plugins.jenkins.io/jenkins-design-language/): published version **1.27.26**; reporting installations **61584** (2026-02-01); health **72/100** (2026-10-27T21:36:43.393212Z, [score details](https://plugin-health.jenkins.io/scores/jenkins-design-language)). Sources: site offline-cache, health offline-cache.
- Modernization for jenkins-design-language: 4 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/jenkins-design-language).
- TODO (jenkins-design-language: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/blueocean-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (jenkins-design-language: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (jenkins-design-language: deprecation): [See deprecation guidelines](https://www.jenkins.io/doc/developer/plugin-governance/deprecating-or-removing-plugin/).
- TODO (jenkins-design-language: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [categorized-view-plugin](https://github.com/jenkinsci/categorized-view-plugin)

This is a plugin to create a new view named Categorized Jobs View, where jobs are grouped dynamically by regular expressions

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/categorized-view-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 8; open PRs: 2; latest default-branch commit: [d8a556b4](https://github.com/jenkinsci/categorized-view-plugin/commit/d8a556b4262ad7541c333c1b545ad2c11c3d583f). GitHub data: offline-cache, 2026-10-27T22:29:14.4969365Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/categorized-view-plugin)); source: offline-cache, 2026-10-27T22:29:14.6949436Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/categorized-view-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/categorized-view-plugin).
- [categorized-view](https://plugins.jenkins.io/categorized-view/): published version **220.vdc6a\_fd005471**; reporting installations **3690** (2026-02-01); health **100/100** (2026-10-27T21:36:42.619147Z, [score details](https://plugin-health.jenkins.io/scores/categorized-view)). Sources: site offline-cache, health offline-cache.
- Modernization for categorized-view: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/categorized-view).

### [chucknorris-plugin](https://github.com/jenkinsci/chucknorris-plugin)

Chuck Norris plugin for Jenkins

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/chucknorris-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 1; open PRs: 0; latest default-branch commit: [fdb219e2](https://github.com/jenkinsci/chucknorris-plugin/commit/fdb219e271c816d5e2ae5fe8128a4d0e816012d7). GitHub data: offline-cache, 2026-10-27T22:29:16.3200012Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/chucknorris-plugin)); source: offline-cache, 2026-10-27T22:29:16.5437468Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/chucknorris-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/chucknorris-plugin).
- [chucknorris](https://plugins.jenkins.io/chucknorris/): published version **226.v66da\_221cda\_79**; reporting installations **1640** (2026-02-01); health **100/100** (2026-10-27T21:36:43.967732Z, [score details](https://plugin-health.jenkins.io/scores/chucknorris)). Sources: site offline-cache, health offline-cache.
- Modernization for chucknorris: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/chucknorris).

### [collapsing-console-sections-plugin](https://github.com/jenkinsci/collapsing-console-sections-plugin)

Jenkins collapsing-console-sections plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/collapsing-console-sections-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 1; latest default-branch commit: [2054f468](https://github.com/jenkinsci/collapsing-console-sections-plugin/commit/2054f4682a7fdbc075e677cd7c10ce90a56ef709). GitHub data: offline-cache, 2026-10-27T22:29:18.2161914Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/collapsing-console-sections-plugin)); source: offline-cache, 2026-10-27T22:29:18.4547948Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/collapsing-console-sections-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/collapsing-console-sections-plugin).
- [collapsing-console-sections](https://plugins.jenkins.io/collapsing-console-sections/): published version **1.14.0**; reporting installations **558** (2026-02-01); health **100/100** (2026-10-27T21:36:37.215724Z, [score details](https://plugin-health.jenkins.io/scores/collapsing-console-sections)). Sources: site offline-cache, health offline-cache.
- Modernization for collapsing-console-sections: 1 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/collapsing-console-sections).
- TODO (collapsing-console-sections: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).

### [console-badge-plugin](https://github.com/jenkinsci/console-badge-plugin)

Description unavailable from GitHub.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/console-badge-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 2; latest default-branch commit: [16d88443](https://github.com/jenkinsci/console-badge-plugin/commit/16d884438bc7d8048a007a99b9bcc3f4b04c0717). GitHub data: offline-cache, 2026-10-27T22:29:19.7681318Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/console-badge-plugin)); source: offline-cache, 2026-10-27T22:29:19.9681400Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/console-badge-plugin-developers).
- [console-badge](https://plugins.jenkins.io/console-badge/): published version **1.1**; reporting installations **365** (2026-02-01); health **67/100** (2026-10-27T21:36:41.751511Z, [score details](https://plugin-health.jenkins.io/scores/console-badge)). Sources: site offline-cache, health offline-cache.
- Modernization for console-badge: 6 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/console-badge).
- TODO (console-badge: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (console-badge: documentation): [https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/](https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/).
- TODO (console-badge: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (console-badge: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (console-badge: repository-configuration): [See how to add a Jenkinsfile](https://www.jenkins.io/doc/developer/tutorial-improve/add-a-jenkinsfile/).
- TODO (console-badge: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [copyartifact-plugin](https://github.com/jenkinsci/copyartifact-plugin)

Copy artifacts

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/copyartifact-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 61; open PRs: 0; latest default-branch commit: [9d139335](https://github.com/jenkinsci/copyartifact-plugin/commit/9d1393350780823dca4ca84cefedadfd627a14a2). GitHub data: offline-cache, 2026-10-27T22:29:21.3587360Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/copyartifact-plugin)); source: offline-cache, 2026-10-27T22:29:21.5623227Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/copyartifact-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/copyartifact-plugin).
- [copyartifact](https://plugins.jenkins.io/copyartifact/): published version **805.v9d1393350780**; reporting installations **39784** (2026-02-01); health **80/100** (2026-10-27T21:36:25.576933Z, [score details](https://plugin-health.jenkins.io/scores/copyartifact)). Sources: site offline-cache, health offline-cache.
- Modernization for copyartifact: 1 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/copyartifact).
- TODO (copyartifact: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).

### [copy-project-link-plugin](https://github.com/jenkinsci/copy-project-link-plugin)

Description unavailable from GitHub.

- Evidence: fork-only. [APM skill namespace](.apm/skills/copy-project-link-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 3; latest default-branch commit: [a078d4fc](https://github.com/jenkinsci/copy-project-link-plugin/commit/a078d4fc7da0935f1b6eea6ba65ca44610c24d1b). GitHub data: offline-cache, 2026-10-27T22:29:23.2896546Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/copy-project-link-plugin)); source: offline-cache, 2026-10-27T22:29:23.4985633Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/copy-project-link-plugin).
- [copy-project-link](https://plugins.jenkins.io/copy-project-link/): published version **171.va\_078d4fc7da\_0**; reporting installations **1114** (2026-02-01); health **97/100** (2026-10-27T21:36:43.031423Z, [score details](https://plugin-health.jenkins.io/scores/copy-project-link)). Sources: site offline-cache, health offline-cache.
- Modernization for copy-project-link: 2 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/copy-project-link).
- TODO (copy-project-link: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/copy-project-link-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (copy-project-link: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [custom-tools-plugin](https://github.com/jenkinsci/custom-tools-plugin)

A generic tool installer for Jenkins

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/custom-tools-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 3; open PRs: 10; latest default-branch commit: [27beb098](https://github.com/jenkinsci/custom-tools-plugin/commit/27beb098cac7886f7b74d06cd61da47ca5ed733a). GitHub data: offline-cache, 2026-10-27T22:29:24.8485769Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/custom-tools-plugin)); source: offline-cache, 2026-10-27T22:29:25.0458046Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/customtools-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/custom-tools-plugin).
- [custom-tools-plugin](https://plugins.jenkins.io/custom-tools-plugin/): published version **0.8**; reporting installations **3444** (2026-02-01); health **76/100** (2026-10-27T21:36:30.60096Z, [score details](https://plugin-health.jenkins.io/scores/custom-tools-plugin)). Sources: site offline-cache, health offline-cache.
- Modernization for custom-tools-plugin: 5 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/custom-tools-plugin).
- TODO (custom-tools-plugin: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (custom-tools-plugin: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (custom-tools-plugin: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (custom-tools-plugin: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (custom-tools-plugin: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [data-tables-api-plugin](https://github.com/jenkinsci/data-tables-api-plugin)

Jenkins plug-that provides JQuery DataTables

- Evidence: fork-only. [APM skill namespace](.apm/skills/data-tables-api-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 2; open PRs: 1; latest default-branch commit: [a9005dc2](https://github.com/jenkinsci/data-tables-api-plugin/commit/a9005dc27e36860249594a063d3cd6f2b7f67b42). GitHub data: offline-cache, 2026-10-27T22:29:26.7205214Z.
- Coverage: 75% ([Codecov](https://app.codecov.io/gh/jenkinsci/data-tables-api-plugin)); source: offline-cache, 2026-10-27T22:29:26.8966809Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/data-tables-api-plugin).
- [data-tables-api](https://plugins.jenkins.io/data-tables-api/): published version **2.3.8-1570.v1cb\_1cd2a\_0fb\_c**; reporting installations **63112** (2026-02-01); health **96/100** (2026-10-27T21:36:42.056745Z, [score details](https://plugin-health.jenkins.io/scores/data-tables-api)). Sources: site offline-cache, health offline-cache.
- Modernization for data-tables-api: 3 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/data-tables-api).
- TODO (data-tables-api: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (data-tables-api: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (data-tables-api: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [docker-workflow-plugin](https://github.com/jenkinsci/docker-workflow-plugin)

Jenkins plugin which allows building, testing, and using Docker images from Jenkins Pipeline projects.

- Evidence: fork-only. [APM skill namespace](.apm/skills/docker-workflow-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 211; open PRs: 46; latest default-branch commit: [bec72d18](https://github.com/jenkinsci/docker-workflow-plugin/commit/bec72d18e03f56beb4489ac4cf18aab82066709e). GitHub data: offline-cache, 2026-10-27T22:29:28.6643112Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/docker-workflow-plugin)); source: offline-cache, 2026-10-27T22:29:28.8679582Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/docker-workflow-plugin).
- [docker-workflow](https://plugins.jenkins.io/docker-workflow/): published version **653.v2f2c08eff0ec**; reporting installations **89052** (2026-02-01); health **74/100** (2026-10-27T21:36:31.055274Z, [score details](https://plugin-health.jenkins.io/scores/docker-workflow)). Sources: site offline-cache, health offline-cache.
- Modernization for docker-workflow: 5 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/docker-workflow).
- TODO (docker-workflow: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/docker-workflow-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (docker-workflow: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (docker-workflow: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (docker-workflow: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (docker-workflow: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [extra-columns-plugin](https://github.com/jenkinsci/extra-columns-plugin)

Jenkins extra-columns-plugin

- Evidence: fork-only. [APM skill namespace](.apm/skills/extra-columns-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 2; latest default-branch commit: [bce58584](https://github.com/jenkinsci/extra-columns-plugin/commit/bce585844292d8a72561cbd8b05a04da183a93f3). GitHub data: offline-cache, 2026-10-27T22:29:30.5304773Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/extra-columns-plugin)); source: offline-cache, 2026-10-27T22:29:30.7386577Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/extra-columns-plugin).
- [extra-columns](https://plugins.jenkins.io/extra-columns/): published version **1.29**; reporting installations **6396** (2026-02-01); health **100/100** (2026-10-27T21:36:36.727519Z, [score details](https://plugin-health.jenkins.io/scores/extra-columns)). Sources: site offline-cache, health offline-cache.
- Modernization for extra-columns: 2 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/extra-columns).
- TODO (extra-columns: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (extra-columns: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [favorite-view-plugin](https://github.com/jenkinsci/favorite-view-plugin)

Jenkins favorite-view plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/favorite-view-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 1; open PRs: 0; latest default-branch commit: [1fc3c4e4](https://github.com/jenkinsci/favorite-view-plugin/commit/1fc3c4e411174f2accbf66a698f3cde08f508328). GitHub data: offline-cache, 2026-10-27T22:29:32.0910770Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/favorite-view-plugin)); source: offline-cache, 2026-10-27T22:29:32.2610273Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/favorite-view-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/favorite-view-plugin).
- [favorite-view](https://plugins.jenkins.io/favorite-view/): published version **50.v9525c96139c6**; reporting installations **736** (2026-02-01); health **100/100** (2026-10-27T21:36:20.186097Z, [score details](https://plugin-health.jenkins.io/scores/favorite-view)). Sources: site offline-cache, health offline-cache.
- Modernization for favorite-view: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/favorite-view).

### [job-restrictions-plugin](https://github.com/jenkinsci/job-restrictions-plugin)

Provides additional options to restrict job execution in Jenkins

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/job-restrictions-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 2; latest default-branch commit: [eebe4e60](https://github.com/jenkinsci/job-restrictions-plugin/commit/eebe4e607637a13fbf31a9f9366697fe996ae9e7). GitHub data: offline-cache, 2026-10-27T22:29:33.8132254Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/job-restrictions-plugin)); source: offline-cache, 2026-10-27T22:29:33.9896452Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/job-restrictions-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/job-restrictions-plugin).
- [job-restrictions](https://plugins.jenkins.io/job-restrictions/): published version **242.v6edda\_c9e4ca\_f**; reporting installations **5243** (2026-02-01); health **97/100** (2026-10-27T21:36:49.02349Z, [score details](https://plugin-health.jenkins.io/scores/job-restrictions)). Sources: site offline-cache, health offline-cache.
- Modernization for job-restrictions: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/job-restrictions).

### [jqs-monitoring-plugin](https://github.com/jenkinsci/jqs-monitoring-plugin)

Monitoring Plug-in for Jenkins.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/jqs-monitoring-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 2; open PRs: 0; latest default-branch commit: [f50a82a0](https://github.com/jenkinsci/jqs-monitoring-plugin/commit/f50a82a0bf323c647c68aadd9eda9590a9468c2d). GitHub data: offline-cache, 2026-10-27T22:29:35.4545348Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/jqs-monitoring-plugin)); source: offline-cache, 2026-10-27T22:29:35.6650486Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/jqs-monitoring-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/jqs-monitoring-plugin).
- [jqs-monitoring](https://plugins.jenkins.io/jqs-monitoring/): published version **37.vf50a\_82a\_0b\_f32**; reporting installations **1007** (2026-02-01); health **71/100** (2026-10-27T21:36:32.798673Z, [score details](https://plugin-health.jenkins.io/scores/jqs-monitoring)). Sources: site offline-cache, health offline-cache.
- Modernization for jqs-monitoring: 5 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/jqs-monitoring).
- TODO (jqs-monitoring: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (jqs-monitoring: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (jqs-monitoring: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (jqs-monitoring: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (jqs-monitoring: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [label-linked-jobs-plugin](https://github.com/jenkinsci/label-linked-jobs-plugin)

LabelPluginSettings

- Evidence: pending-permissions. [APM skill namespace](.apm/skills/label-linked-jobs-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 10; open PRs: 13; latest default-branch commit: [20eaf414](https://github.com/jenkinsci/label-linked-jobs-plugin/commit/20eaf414fda2fdb4d1639668b964d11dcb1b55c8). GitHub data: offline-cache, 2026-10-27T22:29:37.0032706Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/label-linked-jobs-plugin)); source: offline-cache, 2026-10-27T22:29:37.2161301Z. Downloads: Unknown.
- Evidence source: [pending-permissions](https://github.com/jenkins-infra/repository-permissions-updater/pull/5034).
- Evidence source: [fork-only](https://github.com/mPokornyETM/label-linked-jobs-plugin).
- [label-linked-jobs](https://plugins.jenkins.io/label-linked-jobs/): published version **6.0.1**; reporting installations **1169** (2026-02-01); health **79/100** (2026-10-27T21:36:16.827987Z, [score details](https://plugin-health.jenkins.io/scores/label-linked-jobs)). Sources: site offline-cache, health offline-cache.
- Modernization for label-linked-jobs: 6 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/label-linked-jobs).
- TODO (label-linked-jobs: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (label-linked-jobs: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (label-linked-jobs: documentation): [https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/](https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/).
- TODO (label-linked-jobs: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (label-linked-jobs: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (label-linked-jobs: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [lockable-resources-plugin](https://github.com/jenkinsci/lockable-resources-plugin)

Lock resources against concurrent use

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/lockable-resources-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 118; open PRs: 6; latest default-branch commit: [d557ff19](https://github.com/jenkinsci/lockable-resources-plugin/commit/d557ff1941db8e1f77d63ab80fd600faf79619b7). GitHub data: offline-cache, 2026-10-27T22:29:38.9398849Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/lockable-resources-plugin)); source: offline-cache, 2026-10-27T22:29:39.1150193Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/lockable-resources-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/lockable-resources-plugin).
- [lockable-resources](https://plugins.jenkins.io/lockable-resources/): published version **1579.vf54f8418ffb\_2**; reporting installations **76094** (2026-02-01); health **100/100** (2026-10-27T21:36:45.414762Z, [score details](https://plugin-health.jenkins.io/scores/lockable-resources)). Sources: site offline-cache, health offline-cache.
- Modernization for lockable-resources: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/lockable-resources).

### [ownership-plugin](https://github.com/jenkinsci/ownership-plugin)

Jenkins plugin. Provides explicit ownership of jobs and agents

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/ownership-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 4; latest default-branch commit: [b41d4396](https://github.com/jenkinsci/ownership-plugin/commit/b41d439617c277afdd89c1a98fb15f95577359e7). GitHub data: offline-cache, 2026-10-27T22:29:40.0745481Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/ownership-plugin)); source: offline-cache, 2026-10-27T22:29:40.3074186Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/ownership-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/ownership-plugin).
- [ownership](https://plugins.jenkins.io/ownership/): published version **373.vb\_41d439617c2**; reporting installations **1207** (2026-02-01); health **71/100** (2026-10-27T21:36:21.430984Z, [score details](https://plugin-health.jenkins.io/scores/ownership)). Sources: site offline-cache, health offline-cache.
- Modernization for ownership: 5 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/ownership).
- TODO (ownership: security): [SECURITY-2062-1](https://www.jenkins.io/security/advisory/2022-03-29/#SECURITY-2062%20%281%29).
- TODO (ownership: security): [SECURITY-2062-2](https://www.jenkins.io/security/advisory/2022-03-29/#SECURITY-2062%20%282%29).
- TODO (ownership: security): [SECURITY-2285](https://www.jenkins.io/security/advisory/2022-03-29/#SECURITY-2285).
- TODO (ownership: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (ownership: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).

### [perfpublisher-plugin](https://github.com/jenkinsci/perfpublisher-plugin)

Jenkins perfpublisher plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/perfpublisher-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 2; open PRs: 6; latest default-branch commit: [d41a39d5](https://github.com/jenkinsci/perfpublisher-plugin/commit/d41a39d54229da9308e271c586a621f81b94783c). GitHub data: offline-cache, 2026-10-27T22:29:41.6164480Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/perfpublisher-plugin)); source: offline-cache, 2026-10-27T22:29:41.9099227Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/perfpublisher-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/perfpublisher-plugin).
- [perfpublisher](https://plugins.jenkins.io/perfpublisher/): published version **8.09**; reporting installations **1** (2023-04-01); health **36/100** (2026-10-27T21:36:39.126223Z, [score details](https://plugin-health.jenkins.io/scores/perfpublisher)). Sources: site offline-cache, health offline-cache.
- Modernization for perfpublisher: 9 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/perfpublisher).
- TODO (perfpublisher: security): [SECURITY-2928](https://www.jenkins.io/security/advisory/2023-03-21/#SECURITY-2928).
- TODO (perfpublisher: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (perfpublisher: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (perfpublisher: documentation): [https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/](https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/).
- TODO (perfpublisher: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (perfpublisher: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (perfpublisher: repository-configuration): [See how to add a Jenkinsfile](https://www.jenkins.io/doc/developer/tutorial-improve/add-a-jenkinsfile/).
- TODO (perfpublisher: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (perfpublisher: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [pipeline-stage-step-plugin](https://github.com/jenkinsci/pipeline-stage-step-plugin)

Description unavailable from GitHub.

- Evidence: fork-only. [APM skill namespace](.apm/skills/pipeline-stage-step-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 13; open PRs: 1; latest default-branch commit: [36b83761](https://github.com/jenkinsci/pipeline-stage-step-plugin/commit/36b837616af6a0d75c24ae0970cf2b88014b438b). GitHub data: offline-cache, 2026-10-27T22:29:43.6971175Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/pipeline-stage-step-plugin)); source: offline-cache, 2026-10-27T22:29:43.8678932Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/pipeline-stage-step-plugin).
- [pipeline-stage-step](https://plugins.jenkins.io/pipeline-stage-step/): published version **345.va\_96187909426**; reporting installations **234795** (2026-02-01); health **97/100** (2026-10-27T21:36:25.496339Z, [score details](https://plugin-health.jenkins.io/scores/pipeline-stage-step)). Sources: site offline-cache, health offline-cache.
- Modernization for pipeline-stage-step: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/pipeline-stage-step).

### [port-allocator-plugin](https://github.com/jenkinsci/port-allocator-plugin)

Jenkins port-allocator plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/port-allocator-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 9; open PRs: 5; latest default-branch commit: [c09af6d8](https://github.com/jenkinsci/port-allocator-plugin/commit/c09af6d8454fff04fdbaf5ef7878ee880d4fa6d2). GitHub data: offline-cache, 2026-10-27T22:29:45.3531807Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/port-allocator-plugin)); source: offline-cache, 2026-10-27T22:29:45.5314236Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/port-allocator-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/port-allocator-plugin).
- [port-allocator](https://plugins.jenkins.io/port-allocator/): published version **351.v7a\_94cf6e4677**; reporting installations **1849** (2026-02-01); health **55/100** (2026-10-27T21:36:51.302172Z, [score details](https://plugin-health.jenkins.io/scores/port-allocator)). Sources: site offline-cache, health offline-cache.
- Modernization for port-allocator: 3 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/port-allocator).
- TODO (port-allocator: security): [SECURITY-1441](https://jenkins.io/security/advisory/2019-07-11/#SECURITY-1441).
- TODO (port-allocator: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (port-allocator: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [publish-over-cifs-plugin](https://github.com/jenkinsci/publish-over-cifs-plugin)

Description unavailable from GitHub.

- Evidence: fork-only. [APM skill namespace](.apm/skills/publish-over-cifs-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 22; open PRs: 3; latest default-branch commit: [f6ec0854](https://github.com/jenkinsci/publish-over-cifs-plugin/commit/f6ec0854efadf63ce31e3c447b433e3264d5e5aa). GitHub data: offline-cache, 2026-10-27T22:29:46.7581004Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/publish-over-cifs-plugin)); source: offline-cache, 2026-10-27T22:29:46.9247339Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/publish-over-cifs-plugin).
- [publish-over-cifs](https://plugins.jenkins.io/publish-over-cifs/): published version **212.vf6ec0854efa\_d**; reporting installations **2992** (2026-02-01); health **96/100** (2026-10-27T21:36:31.134759Z, [score details](https://plugin-health.jenkins.io/scores/publish-over-cifs)). Sources: site offline-cache, health offline-cache.
- Modernization for publish-over-cifs: 2 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/publish-over-cifs).
- TODO (publish-over-cifs: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (publish-over-cifs: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).

### [pull-request-monitoring-plugin](https://github.com/jenkinsci/pull-request-monitoring-plugin)

Jenkins plugin to monitor pull requests with customizable dashboard. You can also provide a view for your plugin that other developers can use in their dashboard.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/pull-request-monitoring-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 4; open PRs: 6; latest default-branch commit: [a19b2388](https://github.com/jenkinsci/pull-request-monitoring-plugin/commit/a19b2388df92f4b4147ffc5725e16adb4e639159). GitHub data: offline-cache, 2026-10-27T22:29:48.3101960Z.
- Coverage: 79% ([Codecov](https://app.codecov.io/gh/jenkinsci/pull-request-monitoring-plugin)); source: offline-cache, 2026-10-27T22:29:48.4848258Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/pull-request-monitoring-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/pull-request-monitoring-plugin).
- [pull-request-monitoring](https://plugins.jenkins.io/pull-request-monitoring/): published version **335.v525cd64ec76b\_**; reporting installations **215** (2026-02-01); health **80/100** (2026-10-27T21:36:14.979468Z, [score details](https://plugin-health.jenkins.io/scores/pull-request-monitoring)). Sources: site offline-cache, health offline-cache.
- Modernization for pull-request-monitoring: 2 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/pull-request-monitoring).
- TODO (pull-request-monitoring: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (pull-request-monitoring: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [security-inspector-plugin](https://github.com/jenkinsci/security-inspector-plugin)

The plugin allows checking user permissions for particular jobs and nodes and building reports

- Evidence: fork-only. [APM skill namespace](.apm/skills/security-inspector-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 11; latest default-branch commit: [6eecc369](https://github.com/jenkinsci/security-inspector-plugin/commit/6eecc36919c24116ee99f1500fb94966542270a0). GitHub data: offline-cache, 2026-10-27T22:29:50.2486802Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/security-inspector-plugin)); source: offline-cache, 2026-10-27T22:29:50.4422794Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/security-inspector-plugin).
- [security-inspector](https://plugins.jenkins.io/security-inspector/): published version **117.v6eecc36919c2**; reporting installations **132** (2026-02-01); health **52/100** (2026-10-27T21:36:28.440265Z, [score details](https://plugin-health.jenkins.io/scores/security-inspector)). Sources: site offline-cache, health offline-cache.
- Modernization for security-inspector: 5 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/security-inspector).
- TODO (security-inspector: dependency-management): [See the open pull requests of the plugin](https://github.com/jenkinsci/security-inspector-plugin/pulls?q=is%3Aopen+is%3Apr+label%3Adependencies).
- TODO (security-inspector: security): [SECURITY-2051](https://www.jenkins.io/security/advisory/2022-09-21/#SECURITY-2051).
- TODO (security-inspector: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (security-inspector: repository-configuration): [See how to setup JEP-229 on the plugin.](https://www.jenkins.io/doc/developer/publishing/releasing-cd/).
- TODO (security-inspector: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [summary\_report-plugin](https://github.com/jenkinsci/summary_report-plugin)

Hudson Summary Display Plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/summary_report-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 4; open PRs: 3; latest default-branch commit: [0fb58ad0](https://github.com/jenkinsci/summary_report-plugin/commit/0fb58ad0d68a32910fc5c6ae3f139bf8809d8a13). GitHub data: offline-cache, 2026-10-27T22:29:52.0878299Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/summary_report-plugin)); source: offline-cache, 2026-10-27T22:29:52.2609333Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/summary_report-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/summary_report-plugin).
- [summary\_report](https://plugins.jenkins.io/summary_report/): published version **1.15**; reporting installations **1416** (2026-02-01); health **49/100** (2026-10-27T21:36:34.97181Z, [score details](https://plugin-health.jenkins.io/scores/summary_report)). Sources: site offline-cache, health offline-cache.
- Modernization for summary\_report: 3 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/summary_report).
- TODO (summary\_report: security): [SECURITY-3750](https://www.jenkins.io/security/advisory/2026-08-05/#SECURITY-3750).
- TODO (summary\_report: documentation): [https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/](https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/).
- TODO (summary\_report: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [syslog-logger-plugin](https://github.com/jenkinsci/syslog-logger-plugin)

Jenkins Syslog Logger Plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/syslog-logger-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 2; latest default-branch commit: [c49b6e77](https://github.com/jenkinsci/syslog-logger-plugin/commit/c49b6e77bf3f94e6f0ab7d1d32e2371f56059a56). GitHub data: offline-cache, 2026-10-27T22:29:54.0222066Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/syslog-logger-plugin)); source: offline-cache, 2026-10-27T22:29:54.2177367Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/syslog-logger-plugin-developers).
- [syslog-logger](https://plugins.jenkins.io/syslog-logger/): published version **1.0.5**; reporting installations **355** (2026-02-01); health **70/100** (2026-10-27T21:36:23.091603Z, [score details](https://plugin-health.jenkins.io/scores/syslog-logger)). Sources: site offline-cache, health offline-cache.
- Modernization for syslog-logger: 7 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/syslog-logger).
- TODO (syslog-logger: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (syslog-logger: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (syslog-logger: documentation): [https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/](https://www.jenkins.io/doc/developer/tutorial-improve/migrate-documentation-to-github/).
- TODO (syslog-logger: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (syslog-logger: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (syslog-logger: repository-configuration): [See how to add a Jenkinsfile](https://www.jenkins.io/doc/developer/tutorial-improve/add-a-jenkinsfile/).
- TODO (syslog-logger: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [test-results-analyzer-plugin](https://github.com/jenkinsci/test-results-analyzer-plugin)

Jenkins plugin to analyze test results for packages, classes and test-methods across all the builds.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/test-results-analyzer-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 1; open PRs: 0; latest default-branch commit: [d3775a18](https://github.com/jenkinsci/test-results-analyzer-plugin/commit/d3775a18cafc7d60b904e7f18244783024167db2). GitHub data: offline-cache, 2026-10-27T22:29:55.7317058Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/test-results-analyzer-plugin)); source: offline-cache, 2026-10-27T22:29:55.9886507Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/test-results-analyzer-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/test-results-analyzer-plugin).
- [test-results-analyzer](https://plugins.jenkins.io/test-results-analyzer/): published version **353.vea\_f73668d8b\_5**; reporting installations **6484** (2026-02-01); health **80/100** (2026-10-27T21:36:35.597108Z, [score details](https://plugin-health.jenkins.io/scores/test-results-analyzer)). Sources: site offline-cache, health offline-cache.
- Modernization for test-results-analyzer: 1 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/test-results-analyzer).
- TODO (test-results-analyzer: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).

### tool-labels-plugin

Description unavailable from GitHub.

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/tool-labels-plugin/README.md) (placeholder, not an installed skill).
- Open issues: Unknown; open PRs: Unknown; latest default-branch commit: Unknown. GitHub data: unavailable, Unknown.
- Coverage: Unknown; source: unavailable, Unknown. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- [tool-labels-plugin](https://plugins.jenkins.io/tool-labels-plugin/): published version **3.0**; reporting installations **103** (2026-02-01); health **25/100** (2026-10-01T23:32:04.90133Z, [score details](https://plugin-health.jenkins.io/scores/tool-labels-plugin)). Sources: site offline-cache, health offline-cache.
- Modernization for tool-labels-plugin: 3 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/tool-labels-plugin).
- TODO (tool-labels-plugin: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (tool-labels-plugin: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (tool-labels-plugin: repository-configuration): [Please open a bug on plugin-health-scoring project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).

### [updatejob-plugin](https://github.com/jenkinsci/updatejob-plugin)

Hudson CLI extension to update an existing job

- Evidence: developer-team. [APM skill namespace](.apm/skills/updatejob-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 0; latest default-branch commit: [41c4a8ea](https://github.com/jenkinsci/updatejob-plugin/commit/41c4a8ea3ba3c5baf8b485e2b24049e26a17e697). GitHub data: offline-cache, 2026-10-27T22:29:58.0503609Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/updatejob-plugin)); source: offline-cache, 2026-10-27T22:29:58.2515014Z. Downloads: Unknown.
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/updatejob-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/updatejob-plugin).
- Published version, installations, health and modernization: Unknown; no plugin ID matched in the current catalog.

### [vrealize-automation-8-plugin](https://github.com/jenkinsci/vrealize-automation-8-plugin)

vRealize Automation Plugin for Jenkins

- Evidence: fork-only. [APM skill namespace](.apm/skills/vrealize-automation-8-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 5; latest default-branch commit: [2774798a](https://github.com/jenkinsci/vrealize-automation-8-plugin/commit/2774798ae62db9a25857886a2898ca7d021e7c17). GitHub data: offline-cache, 2026-10-27T22:29:59.0433754Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/vrealize-automation-8-plugin)); source: offline-cache, 2026-10-27T22:29:59.2460027Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/vrealize-automation-8-plugin).
- [vrealize-automation-8](https://plugins.jenkins.io/vrealize-automation-8/): published version **1.4**; reporting installations **10** (2026-02-01); health **80/100** (2026-10-27T21:36:51.159779Z, [score details](https://plugin-health.jenkins.io/scores/vrealize-automation-8)). Sources: site offline-cache, health offline-cache.
- Modernization for vrealize-automation-8: 6 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/vrealize-automation-8).
- TODO (vrealize-automation-8: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (vrealize-automation-8: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (vrealize-automation-8: documentation): [Please see how to migrate the plugin description for the plugin.](https://www.jenkins.io/doc/developer/tutorial-improve/move-description-to-index/).
- TODO (vrealize-automation-8: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (vrealize-automation-8: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (vrealize-automation-8: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [workflow-basic-steps-plugin](https://github.com/jenkinsci/workflow-basic-steps-plugin)

Description unavailable from GitHub.

- Evidence: fork-only. [APM skill namespace](.apm/skills/workflow-basic-steps-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 85; open PRs: 11; latest default-branch commit: [60e3c7e6](https://github.com/jenkinsci/workflow-basic-steps-plugin/commit/60e3c7e6654df31a22a7372be7ba98416eb4df60). GitHub data: offline-cache, 2026-10-27T22:30:00.5929301Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/workflow-basic-steps-plugin)); source: offline-cache, 2026-10-27T22:30:00.7693511Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/workflow-basic-steps-plugin).
- [workflow-basic-steps](https://plugins.jenkins.io/workflow-basic-steps/): published version **1129.v60e3c7e6654d**; reporting installations **234683** (2026-02-01); health **100/100** (2026-10-27T21:36:45.237071Z, [score details](https://plugin-health.jenkins.io/scores/workflow-basic-steps)). Sources: site offline-cache, health offline-cache.
- Modernization for workflow-basic-steps: no remediation links reported by the health service. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/workflow-basic-steps).

### [workflow-cps-plugin](https://github.com/jenkinsci/workflow-cps-plugin)

Description unavailable from GitHub.

- Evidence: fork-only. [APM skill namespace](.apm/skills/workflow-cps-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 312; open PRs: 27; latest default-branch commit: [923703e1](https://github.com/jenkinsci/workflow-cps-plugin/commit/923703e1f613323d981b0cd010e107fb860bc08c). GitHub data: offline-cache, 2026-10-27T22:30:02.1271976Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/workflow-cps-plugin)); source: offline-cache, 2026-10-27T22:30:02.3378572Z. Downloads: Unknown.
- Evidence source: [fork-only](https://github.com/mPokornyETM/workflow-cps-plugin).
- [workflow-cps](https://plugins.jenkins.io/workflow-cps/): published version **4395.v738456a\_5da\_6b\_**; reporting installations **237226** (2026-02-01); health **100/100** (2026-10-27T21:36:41.002433Z, [score details](https://plugin-health.jenkins.io/scores/workflow-cps)). Sources: site offline-cache, health offline-cache.
- Modernization for workflow-cps: 1 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/workflow-cps).
- TODO (workflow-cps: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

### [wsclean-plugin](https://github.com/jenkinsci/wsclean-plugin)

Jenkins Distributed Workspace Clean plugin

- Evidence: catalog-developer. [APM skill namespace](.apm/skills/wsclean-plugin/README.md) (placeholder, not an installed skill).
- Open issues: 0; open PRs: 3; latest default-branch commit: [0f3bb630](https://github.com/jenkinsci/wsclean-plugin/commit/0f3bb6301328643d7cb4ebea486a9ba2bca7a9a0). GitHub data: offline-cache, 2026-10-27T22:30:04.0886217Z.
- Coverage: Unknown ([Codecov](https://app.codecov.io/gh/jenkinsci/wsclean-plugin)); source: offline-cache, 2026-10-27T22:30:04.2628002Z. Downloads: Unknown.
- Evidence source: [catalog-developer](https://updates.jenkins.io/current/update-center.actual.json).
- Evidence source: [developer-team](https://github.com/orgs/jenkinsci/teams/wsclean-plugin-developers).
- Evidence source: [fork-only](https://github.com/mPokornyETM/wsclean-plugin).
- [hudson-wsclean-plugin](https://plugins.jenkins.io/hudson-wsclean-plugin/): published version **1.0.8**; reporting installations **2868** (2026-02-01); health **71/100** (2026-10-27T21:36:30.975398Z, [score details](https://plugin-health.jenkins.io/scores/hudson-wsclean-plugin)). Sources: site offline-cache, health offline-cache.
- Modernization for hudson-wsclean-plugin: 6 reported recommendations. [Historical migration reports, if available](https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/hudson-wsclean-plugin).
- TODO (hudson-wsclean-plugin: dependency-management): [Please open an issue on the project.](https://github.com/jenkins-infra/plugin-health-scoring/issues/new/choose).
- TODO (hudson-wsclean-plugin: adoption): [See adoption guidelines](https://www.jenkins.io/doc/developer/plugin-governance/adopt-a-plugin/#plugins-marked-for-adoption).
- TODO (hudson-wsclean-plugin: documentation): [Plugin could benefit from using Release Drafter.](https://github.com/jenkinsci/.github/blob/master/.github/release-drafter.adoc).
- TODO (hudson-wsclean-plugin: repository-configuration): [Learn about code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).
- TODO (hudson-wsclean-plugin: repository-configuration): [See OpenRewrite recipe to fix this.](https://docs.openrewrite.org/recipes/jenkins/github/addteamtocodeowners).
- TODO (hudson-wsclean-plugin: junit4-ban): [How to set up JUnit 4 import ban](https://github.com/jenkinsci/plugin-pom/pull/1178).

<!-- END GENERATED PLUGIN DASHBOARD -->

## Refresh the Dashboard

Run from the root of this repository using PowerShell and an authenticated
`gh` CLI. These helpers make read-only API requests and write local files;
they do not push Git changes or modify Jenkins controllers.

```powershell
$helpers = './.apm/skills/common/jenkins-plugin-inventory/scripts'
& "$helpers/Fetch-JenkinsPlugins.ps1"
& "$helpers/Update-JenkinsPluginDashboard.ps1"
```

The first helper discovers the plugin list and saves structured evidence in
`data/plugins.json`. The second fetches metric data, writes
`data/plugin-status.json`, creates missing plugin README namespaces, and replaces
only the generated section above. Review these files before publishing.

To clone missing upstream repositories and fetch existing checkouts, explicitly
choose a separate checkout directory. This is optional; the dashboard does not
need local clones:

```powershell
& "$helpers/Fetch-JenkinsPlugins.ps1" -CheckoutRoot C:/ws/jenkins/plugin-checkouts
```

Successful metric responses are cached for 24 hours under ignored `data/.cache/`.
Use the saved inventory and cache to avoid repeating research in a new session:

```powershell
& "$helpers/Update-JenkinsPluginDashboard.ps1" -Offline
& "$helpers/Update-JenkinsPluginDashboard.ps1" -Refresh
```

`-Offline` makes no API requests; absent metrics remain unknown. `-Refresh`
requests fresh metrics, retaining old values only with an explicit stale-cache
label if their source fails. Do not interpret unknown values as zero or a clean
bill of health. The dashboard identifies source times and distinguishes reporting
installations from downloads. Health remediation links are only a partial
modernization checklist, and coverage badges may lag the latest commit.

Both helpers accept explicit paths for use from another directory. Discovery
supports `-CatalogPath` and `-GitHubSnapshotPath` for offline fixture replay.
Source snapshots and API caches are ignored; the compact inventory and dashboard
snapshot remain available for review. No publication is automated.

## Review Status

Initial publication was authorized by mPokornyETM on 2026-10-28. Every subsequent
skill, rule, helper, and reference change still requires review before publication.
Plugin-specific namespaces are placeholders, not installed or implemented skills.

## Layout

```text
.apm/
  instructions/
    jenkins-plugin-development.instructions.md
    jenkins-plugin-pr-review.instructions.md
  skills/
    common/
      sync-fork-master/
        SKILL.md
        scripts/sync-fork-master.sh
      jenkins-plugin-inventory/
        SKILL.md
        scripts/
    <plugin-repository>/
      README.md
```

`common/` holds workflows shared across plugins. Plugin directories will hold
maintenance knowledge specific to their plugin. End-user Pipeline and resource
configuration skills belong in the corresponding plugin repository instead.

APM 0.31.0 does not automatically deploy the grouped common skill. The root
`apm.yml` explicitly declares its directory as a local dependency. Add future
grouped skills there, then verify their deployed names and bundled assets.

## Shared Jenkins Rules

The package also contains common instruction rules adapted from the Lockable
Resources plugin's coding instructions and PR-review checklist, inspected on
2026-10-27:

- [Development rules](.apm/instructions/jenkins-plugin-development.instructions.md):
  issue linking, changelog-ready titles, API restrictions, localization, CSP,
  testing, dependency updates, and merge readiness. File patterns scope these
  rules to Jenkins source/build/CI files.
- [PR-review rules](.apm/instructions/jenkins-plugin-pr-review.instructions.md):
  the ordered review workflow, including all review threads, a continuation
  plan, manual and automated testing, performance impact, branch freshness, and
  target validation. Its description enables task-based discovery; it does not
  attach the complete checklist to every source edit.

These are instruction primitives, not another skill to invoke manually. Installing
the package with `--target copilot` deploys them to `.github/instructions/` while
skills go to `.agents/skills/`. No `apm compile` or replacement of a consumer's
existing `copilot-instructions.md` is needed. APM normalizes instruction line
endings; the deployment test verifies the complete rules after that normalization.

The common rules deliberately do not copy LR's fixed Java baseline, Crowdin
project, examples directory, label mappings, automatic approval countdown, or
`master` default. They require checking each consumer's actual configuration.
Internal API restriction syntax uses `@Restricted(NoExternalUse.class)`.
Tracking issues follow the stricter source PR-review rule for bugs and features,
with any maintainer-approved exceptions made explicit.

LR-specific hot paths (`LockableResourcesManager`, `LockStepExecution`),
lock/unlock UI steps, and the 100-resource/50-waiter workload remain local rules.
Other plugins use representative workloads and their own runtime hot paths.
The shared rules require full verification before approval readiness, without
treating a source-only review as completed testing. Reviewing a PR does not
authorize rebasing, pushing, merging, or publishing it.

Both original LR instruction files are unchanged. Keep repository-specific
instructions alongside these common rules and surface conflicts for review;
do not silently delete local policy or overwrite installed files. Changes to the
shared rules require mPokornyETM's review before publication.

## Install from a Local Checkout

Install [Microsoft APM](https://github.com/microsoft/apm) first. These commands
were tested with APM 0.31.0. Use a short temporary directory on Windows: APM's
dependency staging can exceed Windows path-length limits under long paths.

From an empty consumer workspace, adjust the source path for your machine:

```sh
apm install /path/to/jenkins-apm-skills --target copilot
```

In Windows PowerShell, an absolute source path also works:

```powershell
apm install C:/ws/jenkins/plugins/jenkins-apm-skills --target copilot
```

Use a clean source checkout for local package installs. The manifest's `includes`
list limits packed artifacts; it does not filter all files copied while staging
a local dependency. Do not install a source directory containing private state.

APM writes the consumer manifest and lockfile, caches dependencies in
`apm_modules/`, deploys skills and helpers under `.agents/skills/`, and installs
the shared rules under `.github/instructions/`. Inspect these changes before accepting them.
Do not commit a machine-specific absolute dependency path in a shared project.

From a target plugin checkout, preview a sync using the installed helper:

```sh
sh .agents/skills/sync-fork-master/scripts/sync-fork-master.sh --dry-run
```

Verify that `origin` is upstream, `fork` is your fork, and `master` is the intended
branch before using the helper. A dry-run still fetches upstream. Running without
`--dry-run` pushes to the fork and requires your authorization.

## Install a Reviewed Revision

Install the published package from GitHub:

```sh
apm install mPokornyETM/jenkins-apm-skills --target copilot
```

For a reproducible installation, substitute a reviewed full commit SHA:

```sh
apm install mPokornyETM/jenkins-apm-skills#<reviewed-commit-sha> --target copilot
```

Commit the consumer's reviewed `apm.yml` and generated `apm.lock.yaml` together.
Restore the locked dependencies with `apm install --frozen`. Never invent a
release tag or advertise a draft commit as reviewed. APM deploys skills without
requiring `apm compile`; do not overwrite existing Copilot instructions.

## Validation

Run the isolated shell regression test from this repository in Git Bash or
another POSIX shell:

```sh
sh tests/sync-fork-master.sh
```

Run the inventory and dashboard regression tests without network access:

```powershell
./tests/plugin-inventory.ps1
```

The APM integration test uses clean package snapshots and leaves existing
consumer instructions intact. Run it from PowerShell; choose an existing short
scratch directory on Windows:

```powershell
./tests/apm-install.ps1 -ScratchRoot C:/ws -PluginRepository ../lockable-resources-plugin
```

Omit `-PluginRepository` to test only the maintainer collection. The test removes
its temporary workspace after completion. It checks full-package installation,
bundled-file hashes, shared instruction deployment, preservation of existing
Copilot instructions, and `--frozen` restore.

The shell test uses temporary local Git repositories, never the real upstream or fork.
For packaging changes, also install this checkout into a fresh consumer and
verify the deployed `SKILL.md` and `scripts/` contents. Installing from the author
directory with no dependencies is not sufficient evidence of deployment.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the review and publication policy.
