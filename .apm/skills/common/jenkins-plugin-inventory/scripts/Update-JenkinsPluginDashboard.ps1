param(
    [string] $DataDirectory,
    [string] $ReadmePath,
    [string] $SkillsDirectory,
    [switch] $Offline,
    [switch] $Refresh,
    [double] $MaxAgeHours = 24
)

$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'PluginInventory.psm1') -Force
if ($Offline -and $Refresh) { throw 'Choose either -Offline or -Refresh' }
$root = (Get-Location).Path
if (-not $DataDirectory) { $DataDirectory = Join-Path $root 'data' }
if (-not $ReadmePath) { $ReadmePath = Join-Path $root 'README.md' }
if (-not $SkillsDirectory) { $SkillsDirectory = Join-Path $root '.apm/skills' }
$readme = [IO.File]::ReadAllText([IO.Path]::GetFullPath($ReadmePath))
Update-DashboardSection $readme '' | Out-Null
$inventory = Get-Content (Join-Path $DataDirectory 'plugins.json') -Raw | ConvertFrom-Json
$cache = Join-Path $DataDirectory '.cache'
$inputs = [pscustomobject]@{ Repositories = [pscustomobject]@{}; PluginSite = [pscustomobject]@{}; Coverage = [pscustomobject]@{}; Health = $null }
$cacheOptions = @{ Offline = $Offline; Refresh = $Refresh; MaxAgeHours = $MaxAgeHours }
$inputs.Health = Get-CachedMetric -Path (Join-Path $cache 'health.json') -Fetch {
    Invoke-RestMethod 'https://plugin-health.jenkins.io/api/scores' -TimeoutSec 30
} @cacheOptions
$query = 'query($owner:String!,$name:String!){repository(owner:$owner,name:$name){description issues(states:OPEN){totalCount} pullRequests(states:OPEN){totalCount} defaultBranchRef{name target{... on Commit{oid url committedDate}}}}}'
foreach ($entry in $inventory.Plugins) {
    if ($entry.Directory -notmatch '^[a-zA-Z0-9][a-zA-Z0-9_.-]*$') { throw 'Unsafe plugin directory in inventory' }
    if ($entry.Repository) {
        if ((Get-RepositoryName $entry.RepositoryUrl) -ne $entry.Repository) { throw 'Repository URL mismatch in inventory' }
        $repository = $entry.Repository
        $parts = $repository.Split('/')
        $metric = Get-CachedMetric -Path (Join-Path $cache ($entry.Directory + '-github.json')) -Fetch {
            $result = Invoke-GitHubJson @('api', 'graphql', '-f', ('query=' + $query), '-F', ('owner=' + $parts[0]), '-F', ('name=' + $parts[1]))
            if ((Get-Field $result 'errors') -or -not $result.data.repository) { throw 'Repository metadata unavailable' }
            $result.data
        } @cacheOptions
        $inputs.Repositories | Add-Member -NotePropertyName $entry.Key -NotePropertyValue $metric
        $badge = Get-CachedMetric -Path (Join-Path $cache ($entry.Directory + '-coverage.json')) -Fetch {
            Invoke-RestMethod ('https://img.shields.io/codecov/c/github/' + $repository + '.json') -TimeoutSec 20
        } @cacheOptions
        $inputs.Coverage | Add-Member -NotePropertyName $entry.Key -NotePropertyValue $badge
    }
    foreach ($id in $entry.PluginIds) {
        if ($id -notmatch '^[a-zA-Z0-9][a-zA-Z0-9_.-]*$') { throw 'Unsafe plugin ID in inventory' }
        if ($inputs.PluginSite.PSObject.Properties[$id]) { continue }
        $site = Get-CachedMetric -Path (Join-Path $cache ($id + '-plugin.json')) -Fetch {
            Invoke-RestMethod ('https://plugins.jenkins.io/api/plugin/' + $id) -TimeoutSec 25
        } @cacheOptions
        $inputs.PluginSite | Add-Member -NotePropertyName $id -NotePropertyValue $site
    }
    Write-Output ('Collected metrics: ' + $entry.Directory)
}
$snapshot = ConvertTo-PluginStatus $inventory $inputs
Write-InventoryJson $snapshot (Join-Path $DataDirectory 'plugin-status.json')
foreach ($entry in $snapshot.Entries) {
    $directory = Join-Path $SkillsDirectory $entry.Directory
    $notes = Join-Path $directory 'README.md'
    if (-not (Test-Path $notes)) {
        [IO.Directory]::CreateDirectory($directory) | Out-Null
        $content = '# ' + $entry.Directory + "`n`nDraft maintenance namespace awaiting mPokornyETM's review.`n`n"
        if ($entry.RepositoryUrl) { $content += '[Upstream repository](' + $entry.RepositoryUrl + ")`n`n" }
        $content += 'Discovery classification: ' + $entry.Classification + ". A namespace is not proof of maintainership.`n`n"
        $content += "No plugin-specific skill exists yet. Add reviewed skills as ``<skill-name>/SKILL.md`` with relative helpers and evidence, then declare grouped skills in the root manifest. This README alone is not an installable APM skill.`n"
        [IO.File]::WriteAllText($notes, $content, [Text.UTF8Encoding]::new($false))
    }
}
$updated = Update-DashboardSection $readme (ConvertTo-PluginDashboard $snapshot)
[IO.File]::WriteAllText([IO.Path]::GetFullPath($ReadmePath), $updated, [Text.UTF8Encoding]::new($false))
Write-Output ('Updated ' + $snapshot.Entries.Count + ' dashboard entries; existing plugin notes were preserved.')