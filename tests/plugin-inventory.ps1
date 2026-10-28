$ErrorActionPreference = 'Stop'
$scripts = Join-Path $PSScriptRoot '../.apm/skills/common/jenkins-plugin-inventory/scripts'
Import-Module (Join-Path $scripts 'PluginInventory.psm1') -Force
$catalog = [pscustomobject]@{ plugins = [pscustomobject]@{
    alpha = [pscustomobject]@{ title = 'Alpha'; developers = @([pscustomobject]@{ developerId = 'MPOKORNYETM' }); scm = 'https://github.com/jenkinsci/alpha-plugin' }
    'alpha-api' = [pscustomobject]@{ title = 'Alpha API'; developers = @(); scm = 'https://github.com/jenkinsci/alpha-plugin' }
    orphan = [pscustomobject]@{ title = 'Orphan'; developers = @([pscustomobject]@{ developerId = 'mpokornyetm' }) }
} }
$github = [pscustomobject]@{
    TeamRepositories = @([pscustomobject]@{ full_name = 'jenkinsci/beta-plugin'; teamUrl = 'https://github.com/orgs/jenkinsci/teams/beta-developers' })
    Pending = @([pscustomobject]@{ repositoryUrl = 'https://github.com/jenkinsci/gamma-plugin'; requestUrl = 'https://github.com/example/permissions/pull/1' })
    Forks = @([pscustomobject]@{ html_url = 'https://github.com/jenkinsci/alpha-plugin'; name = 'alpha-plugin' }, [pscustomobject]@{ html_url = 'https://github.com/jenkinsci/delta-plugin'; name = 'delta-plugin' })
}
$result = @(ConvertTo-PluginInventory $catalog $github 'mPokornyETM')
if ($result.Count -ne 5) { throw 'Incorrect inventory count or repository deduplication' }
$alpha = $result | Where-Object Directory -eq 'alpha-plugin'
if ($alpha.Classification -ne 'catalog-developer' -or $alpha.PluginIds.Count -ne 2) { throw 'Multi-module mapping or evidence priority failed' }
if (($result | Where-Object Directory -eq 'delta-plugin').Classification -ne 'fork-only') { throw 'Fork was incorrectly promoted to maintainer' }
if (($result | Where-Object Directory -eq 'gamma-plugin').Classification -ne 'pending-permissions') { throw 'Pending request was incorrectly classified' }
if (($result | Where-Object Directory -eq 'beta-plugin').Classification -ne 'developer-team') { throw 'Developer-team evidence lost' }
if (($result | Where-Object Directory -eq 'orphan').Repository) { throw 'Missing repository was invented' }
if ((Get-RepositoryName 'https://github.com/jenkinsci/alpha-plugin.git') -ne 'jenkinsci/alpha-plugin') { throw 'Repository normalization failed' }
if (Get-RepositoryName 'https://example.com/jenkinsci/alpha-plugin') { throw 'Unexpected repository host accepted' }
Write-Output 'PASS: account matching, evidence classes, deduplication, multi-module plugins, missing upstream, URL normalization'

$inventory = [pscustomobject]@{ Plugins = @($alpha); FetchedAt = '2026-10-27T00:00:00Z'; Warnings = @() }
$inputs = [pscustomobject]@{
    Repositories = [pscustomobject]@{ 'jenkinsci/alpha-plugin' = [pscustomobject]@{ State = 'cached'; Data = [pscustomobject]@{ repository = [pscustomobject]@{
        description = "A [plugin]`nwith | markdown"; issues = [pscustomobject]@{ totalCount = 0 }; pullRequests = [pscustomobject]@{ totalCount = 3 }
        defaultBranchRef = [pscustomobject]@{ target = [pscustomobject]@{ oid = '1234567890abcdef'; url = 'https://github.com/jenkinsci/alpha-plugin/commit/1234567890abcdef'; committedDate = '2026-10-26' } }
    } } } }
    Coverage = [pscustomobject]@{ 'jenkinsci/alpha-plugin' = [pscustomobject]@{ State = 'cached'; Data = [pscustomobject]@{ message = '0%' } } }
    PluginSite = [pscustomobject]@{ alpha = [pscustomobject]@{ State = 'cached'; Data = [pscustomobject]@{ version = '2.0'; stats = [pscustomobject]@{ installations = @([pscustomobject]@{ timestamp = 0; total = 0 }, [pscustomobject]@{ timestamp = 86400000; total = 7 }) } } } }
    Health = [pscustomobject]@{ State = 'cached'; Data = [pscustomobject]@{ plugins = [pscustomobject]@{ alpha = [pscustomobject]@{ value = 0; date = '2026-10-26'; details = [pscustomobject]@{ testing = [pscustomobject]@{ components = @([pscustomobject]@{ resolutions = @([pscustomobject]@{ text = 'Add tests'; link = 'https://example.com/testing' }) }) } } } } } }
}
$status = ConvertTo-PluginStatus $inventory $inputs
$plugin = $status.Entries[0].Plugins | Where-Object Id -eq 'alpha'
if ($plugin.Health -ne 0 -or $plugin.Installations -ne 7 -or $plugin.InstallationsDate -ne '1970-01-02') { throw 'Metric value or date mapping failed' }
if ($null -ne $plugin.Downloads -or $status.Entries[0].Coverage -ne '0%') { throw 'Downloads were confused with installations or zero coverage lost' }
if ($status.Entries[0].OpenIssues -ne 0 -or $status.Entries[0].OpenPullRequests -ne 3) { throw 'Issue/PR counts were conflated or zero lost' }
if ($plugin.ModernizationTodos.Count -ne 1) { throw 'Modernization remediation links lost' }
$markdown = ConvertTo-PluginDashboard $status
if (-not $markdown.Contains('A \[plugin\] with \| markdown') -or -not $markdown.Contains('Open issues: 0; open PRs: 3')) { throw 'Markdown escaping or counts failed' }
if (-not $markdown.Contains('Unknown/100') -or -not $markdown.Contains('Downloads: Unknown')) { throw 'Missing source data was presented as a real value' }
$readme = "KEEP BEFORE`n<!-- BEGIN GENERATED PLUGIN DASHBOARD -->`nold`n<!-- END GENERATED PLUGIN DASHBOARD -->`nKEEP AFTER`n"
$rendered = Update-DashboardSection $readme $markdown
if (-not $rendered.StartsWith('KEEP BEFORE') -or -not $rendered.EndsWith("KEEP AFTER`n")) { throw 'Manual README content was overwritten' }
if ((Update-DashboardSection $rendered $markdown) -ne $rendered) { throw 'Rendering is not idempotent' }
try { Update-DashboardSection 'missing markers' $markdown | Out-Null; throw 'Missing markers accepted' } catch { if ($_.Exception.Message -eq 'Missing markers accepted') { throw } }
Write-Output 'PASS: separate metrics, unknown/zero values, UTC dates, recommendations, escaping, README boundaries and idempotence'

$sandbox = Join-Path ([IO.Path]::GetTempPath()) ('plugin-inventory-' + [guid]::NewGuid().ToString('N'))
[IO.Directory]::CreateDirectory($sandbox) | Out-Null
try {
    $metricPath = Join-Path $sandbox 'metric.json'
    $fetched = Get-CachedMetric -Path $metricPath -Fetch { [pscustomobject]@{ value = 42 } }
    $cached = Get-CachedMetric -Path $metricPath -Fetch { throw 'Network must not run for a fresh cache' }
    $stale = Get-CachedMetric -Path $metricPath -Refresh -Fetch { throw 'Simulated outage' }
    $missing = Get-CachedMetric -Path (Join-Path $sandbox 'absent.json') -Offline -Fetch { throw 'Offline mode contacted network' }
    if ($fetched.State -ne 'fetched' -or $cached.State -ne 'cached' -or $stale.State -ne 'stale-cache' -or $missing.State -ne 'unavailable') { throw 'Cache freshness or outage handling failed' }
    if ($stale.Data.value -ne 42 -or $stale.FetchedAt -ne $fetched.FetchedAt) { throw 'Stale cache lost provenance' }
    Write-InventoryJson $catalog (Join-Path $sandbox 'catalog-input.json')
    Write-InventoryJson $github (Join-Path $sandbox 'github-input.json')
    $data = Join-Path $sandbox 'data'
    & (Join-Path $scripts 'Fetch-JenkinsPlugins.ps1') -CatalogPath (Join-Path $sandbox 'catalog-input.json') -GitHubSnapshotPath (Join-Path $sandbox 'github-input.json') -OutputDirectory $data
    $readmePath = Join-Path $sandbox 'README.md'
    [IO.File]::WriteAllText($readmePath, $readme)
    $notesRoot = Join-Path $sandbox '.apm/skills'
    $existingNotes = Join-Path $notesRoot 'alpha-plugin/README.md'
    [IO.Directory]::CreateDirectory((Split-Path $existingNotes -Parent)) | Out-Null
    [IO.File]::WriteAllText($existingNotes, 'USER NOTES MUST SURVIVE')
    & (Join-Path $scripts 'Update-JenkinsPluginDashboard.ps1') -DataDirectory $data -ReadmePath $readmePath -SkillsDirectory $notesRoot -Offline
    if ([IO.File]::ReadAllText($existingNotes) -ne 'USER NOTES MUST SURVIVE') { throw 'Existing plugin notes overwritten' }
    if (@(Get-ChildItem $notesRoot -Recurse -Filter README.md).Count -ne 5) { throw 'Plugin namespaces not created' }
    if (-not ([IO.File]::ReadAllText($readmePath)).Contains('KEEP AFTER')) { throw 'End-to-end render overwrote manual content' }
    Write-Output 'PASS: cache freshness, outage provenance, offline scripts, namespace creation, existing notes preserved'
} finally {
    Remove-Item $sandbox -Recurse -Force
}