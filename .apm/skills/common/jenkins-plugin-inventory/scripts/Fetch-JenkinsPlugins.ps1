param(
    [string] $Account = 'mPokornyETM',
    [string] $OutputDirectory,
    [string] $CatalogPath,
    [string] $GitHubSnapshotPath,
    [string] $CheckoutRoot
)

$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'PluginInventory.psm1') -Force
if (-not $OutputDirectory) { $OutputDirectory = Join-Path (Get-Location).Path 'data' }
$OutputDirectory = [IO.Path]::GetFullPath($OutputDirectory)
$catalog = if ($CatalogPath) { Get-Content $CatalogPath -Raw | ConvertFrom-Json } else {
    Invoke-RestMethod 'https://updates.jenkins.io/current/update-center.actual.json' -TimeoutSec 60
}
$warnings = @()
if ($GitHubSnapshotPath) {
    $github = Get-Content $GitHubSnapshotPath -Raw | ConvertFrom-Json
} else {
    $github = [pscustomobject]@{ TeamRepositories = @(); Forks = @(); Pending = @() }
    try {
        $viewer = Invoke-GitHubJson @('api', 'user')
        if ($viewer.login -ieq $Account) {
            $teams = @(Get-GitHubPages 'user/teams?per_page=100' | Where-Object { $_.organization.login -eq 'jenkinsci' -and $_.name -match 'Developers$' })
            foreach ($team in $teams) {
                foreach ($repo in @(Get-GitHubPages ('orgs/jenkinsci/teams/' + $team.slug + '/repos?per_page=100'))) {
                    $github.TeamRepositories += [pscustomobject]@{ full_name = $repo.full_name; teamUrl = $team.html_url }
                }
            }
        } else { $warnings += 'Team discovery skipped: authenticated user does not match the requested account.' }
    } catch { $warnings += 'Developer-team discovery unavailable; inventory may be incomplete.' }
    try {
        foreach ($repo in @(Get-GitHubPages ('users/' + $Account + '/repos?per_page=100'))) {
            if ($repo.fork) {
                $detail = Invoke-GitHubJson @('api', ('repos/' + $repo.full_name))
                if ($detail.parent.owner.login -eq 'jenkinsci') { $github.Forks += $detail.parent }
            }
        }
    } catch { $warnings += 'Fork discovery incomplete; check GitHub access and rate limits.' }
    try {
        $requests = @(Get-GitHubPages 'repos/jenkins-infra/repository-permissions-updater/pulls?state=open&per_page=100' | Where-Object { $_.user.login -ieq $Account })
        foreach ($request in $requests) {
            foreach ($file in @(Get-GitHubPages ('repos/jenkins-infra/repository-permissions-updater/pulls/' + $request.number + '/files?per_page=100'))) {
                if ($file.filename -match '^permissions/plugin-(.+)\.yml$') {
                    $plugin = Get-Field $catalog.plugins $Matches[1]
                    $repo = Get-RepositoryName (Get-Field $plugin 'scm')
                    if ($repo) { $github.Pending += [pscustomobject]@{ repositoryUrl = 'https://github.com/' + $repo; requestUrl = $request.html_url } }
                }
            }
        }
    } catch { $warnings += 'Pending publishing-request discovery unavailable.' }
}
$inventory = [pscustomobject]@{
    SchemaVersion = 1; Account = $Account; FetchedAt = [datetime]::UtcNow.ToString('o')
    Warnings = $warnings; Plugins = @(ConvertTo-PluginInventory $catalog $github $Account)
}
Write-InventoryJson $inventory (Join-Path $OutputDirectory 'plugins.json')
Write-InventoryJson $catalog (Join-Path $OutputDirectory 'catalog.json')
Write-InventoryJson $github (Join-Path $OutputDirectory 'github-discovery.json')
foreach ($warning in $warnings) { Write-Warning $warning }
if ($CheckoutRoot) {
    [IO.Directory]::CreateDirectory([IO.Path]::GetFullPath($CheckoutRoot)) | Out-Null
    foreach ($plugin in $inventory.Plugins) {
        if (-not $plugin.Repository) { Write-Warning ('No known upstream for ' + $plugin.Directory); continue }
        $destination = Join-Path $CheckoutRoot $plugin.Directory
        if (Test-Path $destination) {
            $origin = & git -C $destination remote get-url origin
            if ($LASTEXITCODE -ne 0 -or (Get-RepositoryName $origin) -ne $plugin.Repository) { throw ('Unexpected checkout: ' + $destination) }
            & git -C $destination fetch origin --prune
        } else { & git clone -- $plugin.RepositoryUrl $destination }
        if ($LASTEXITCODE -ne 0) { throw ('Git fetch/clone failed for ' + $plugin.Repository) }
    }
}
Write-Output ('Discovered ' + $inventory.Plugins.Count + ' repository/plugin entries in ' + $OutputDirectory)