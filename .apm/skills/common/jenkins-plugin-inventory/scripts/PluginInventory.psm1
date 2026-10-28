Set-StrictMode -Version 2

function Get-RepositoryName {
    param([string] $Url)
    $parsed = $null
    if ([uri]::TryCreate($Url, [UriKind]::Absolute, [ref] $parsed) -and $parsed.Host -eq 'github.com') {
        $parts = $parsed.AbsolutePath.Trim('/').Split('/')
        if ($parts.Count -ge 2 -and $parts[0] -match '^[\w.-]+$' -and $parts[1] -match '^[\w.-]+$') {
            return $parts[0] + '/' + ($parts[1] -replace '\.git$', '')
        }
    }
}

function Get-Field {
    param($Object, [string] $Name, $Default = $null)
    if ($null -ne $Object -and $null -ne $Object.PSObject.Properties[$Name]) {
        return $Object.$Name
    }
    return $Default
}

function Invoke-GitHubJson {
    param([string[]] $Arguments)
    $previous = $ErrorActionPreference
    try {
        $ErrorActionPreference = 'Continue'
        $text = & gh @Arguments 2>$null | Out-String
        $code = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previous
    }
    if ($code -ne 0) { throw 'GitHub request failed; check gh authentication, permissions, and rate limits.' }
    return $text | ConvertFrom-Json
}

function Get-GitHubPages {
    param([string] $Endpoint)
    $pages = Invoke-GitHubJson @('api', '--paginate', '--slurp', $Endpoint)
    foreach ($page in $pages) { foreach ($item in $page) { $item } }
}

function Write-InventoryJson {
    param($Value, [string] $Path)
    $parent = Split-Path ([IO.Path]::GetFullPath($Path)) -Parent
    [IO.Directory]::CreateDirectory($parent) | Out-Null
    $text = ConvertTo-Json -InputObject $Value -Depth 40
    [IO.File]::WriteAllText([IO.Path]::GetFullPath($Path), $text + "`n", [Text.UTF8Encoding]::new($false))
}

function ConvertTo-PluginInventory {
    param($Catalog, $GitHub, [string] $Account)
    $entries = @{}
    $priority = @{ 'catalog-developer' = 0; 'developer-team' = 1; 'pending-permissions' = 2; 'fork-only' = 3 }
    $allPlugins = @($Catalog.plugins.PSObject.Properties)
    $add = {
        param([string] $Repository, [string] $PluginId, [string] $Title, [string] $Kind, [string] $Source)
        $key = if ($Repository) { $Repository.ToLowerInvariant() } else { 'catalog:' + $PluginId }
        if (-not $entries.ContainsKey($key)) {
            $directory = if ($Repository) { ($Repository -split '/')[1] } else { $PluginId }
            if ($directory -notmatch '^[a-zA-Z0-9][a-zA-Z0-9_.-]*$') { throw 'Unsafe plugin directory name' }
            $entries[$key] = [pscustomobject]@{
                Key = $key; Directory = $directory; Repository = $Repository
                RepositoryUrl = $(if ($Repository) { 'https://github.com/' + $Repository } else { $null })
                Title = $Title; Classification = $Kind; PluginIds = @(); Evidence = @()
            }
        }
        $entry = $entries[$key]
        if ($PluginId -and $PluginId -notin $entry.PluginIds) { $entry.PluginIds += $PluginId }
        if ($priority[$Kind] -lt $priority[$entry.Classification]) { $entry.Classification = $Kind }
        if (-not @($entry.Evidence | Where-Object { $_.Kind -eq $Kind -and $_.Source -eq $Source }).Count) {
            $entry.Evidence += [pscustomobject]@{ Kind = $Kind; Source = $Source }
        }
    }
    foreach ($property in $allPlugins) {
        $plugin = $property.Value
        if (@((Get-Field $plugin 'developers' @()) | ForEach-Object { Get-Field $_ 'developerId' }) -icontains $Account) {
            $repo = Get-RepositoryName (Get-Field $plugin 'scm')
            & $add $repo $property.Name $plugin.title 'catalog-developer' 'https://updates.jenkins.io/current/update-center.actual.json'
        }
    }
    foreach ($repository in @(Get-Field $GitHub 'TeamRepositories' @())) {
        $name = $repository.full_name
        if ($name -match '^jenkinsci/.+plugin' -or @($allPlugins | Where-Object { (Get-RepositoryName (Get-Field $_.Value 'scm')) -eq $name }).Count) {
            & $add $name '' (($name -split '/')[1]) 'developer-team' $repository.teamUrl
        }
    }
    foreach ($request in @(Get-Field $GitHub 'Pending' @())) {
        $repo = Get-RepositoryName $request.repositoryUrl
        if ($repo) { & $add $repo '' (($repo -split '/')[1]) 'pending-permissions' $request.requestUrl }
    }
    foreach ($repository in @(Get-Field $GitHub 'Forks' @())) {
        $repo = Get-RepositoryName $repository.html_url
        if ($repo -match '^jenkinsci/.+plugin') {
            & $add $repo '' (($repo -split '/')[1]) 'fork-only' ('https://github.com/' + $Account + '/' + $repository.name)
        }
    }
    foreach ($property in $allPlugins) {
        $repo = Get-RepositoryName (Get-Field $property.Value 'scm')
        if ($repo -and $entries.ContainsKey($repo.ToLowerInvariant())) {
            $entry = $entries[$repo.ToLowerInvariant()]
            if ($property.Name -notin $entry.PluginIds) { $entry.PluginIds += $property.Name }
        }
    }
    return @($entries.Values | Sort-Object Directory)
}

function Get-CachedMetric {
    param([string] $Path, [scriptblock] $Fetch, [switch] $Offline, [switch] $Refresh, [double] $MaxAgeHours = 24)
    $previous = if (Test-Path $Path) { Get-Content $Path -Raw | ConvertFrom-Json } else { $null }
    if ($previous -and -not $Refresh -and ($Offline -or ([datetime]::UtcNow - [datetime]$previous.FetchedAt).TotalHours -le $MaxAgeHours)) {
        return [pscustomobject]@{ State = $(if ($Offline) { 'offline-cache' } else { 'cached' }); FetchedAt = $previous.FetchedAt; Data = $previous.Data }
    }
    if (-not $Offline) {
        try {
            $data = & $Fetch
            if ($null -eq $data) { throw 'Empty metric response' }
            $response = [pscustomobject]@{ State = 'fetched'; FetchedAt = [datetime]::UtcNow.ToString('o'); Data = $data }
            Write-InventoryJson $response $Path
            return $response
        } catch { }
    }
    return [pscustomobject]@{ State = $(if ($previous) { 'stale-cache' } else { 'unavailable' }); FetchedAt = $(if ($previous) { $previous.FetchedAt } else { $null }); Data = $(if ($previous) { $previous.Data } else { $null }) }
}

function ConvertTo-PluginStatus {
    param($Inventory, $Inputs)
    $results = @()
    foreach ($entry in $Inventory.Plugins) {
        $repository = Get-Field $Inputs.Repositories $entry.Key
        $info = Get-Field (Get-Field $repository 'Data') 'repository'
        $head = Get-Field (Get-Field $info 'defaultBranchRef') 'target'
        $coverage = Get-Field $Inputs.Coverage $entry.Key
        $coverageMessage = [string](Get-Field (Get-Field $coverage 'Data') 'message')
        $coverageValue = if ($coverageMessage -match '^\d+(?:\.\d+)?%$') { $coverageMessage } else { $null }
        $plugins = @()
        foreach ($id in $entry.PluginIds) {
            $site = Get-Field $Inputs.PluginSite $id
            $siteData = Get-Field $site 'Data'
            $stats = Get-Field $siteData 'stats'
            $latest = @(Get-Field $stats 'installations' @() | Sort-Object timestamp -Descending | Select-Object -First 1)
            $score = Get-Field (Get-Field (Get-Field $Inputs.Health 'Data') 'plugins') $id
            $todos = @()
            $details = Get-Field $score 'details'
            if ($details) {
                foreach ($detail in $details.PSObject.Properties) {
                    foreach ($component in @(Get-Field $detail.Value 'components' @())) {
                        foreach ($resolution in @(Get-Field $component 'resolutions' @())) {
                            $todos += [pscustomobject]@{ Check = $detail.Name; Text = $resolution.text; Url = $resolution.link }
                        }
                    }
                }
            }
            $plugins += [pscustomobject]@{
                Id = $id; Version = Get-Field $siteData 'version'; ReleaseDate = Get-Field $siteData 'releaseTimestamp'
                Installations = $(if ($latest.Count) { $latest[0].total } else { $null })
                InstallationsDate = $(if ($latest.Count) { [DateTimeOffset]::FromUnixTimeMilliseconds([long]$latest[0].timestamp).ToString('yyyy-MM-dd') } else { $null })
                Downloads = $null; DownloadsStatus = 'Not exposed by the sources queried'
                Health = Get-Field $score 'value'; HealthDate = Get-Field $score 'date'
                HealthSourceState = Get-Field $Inputs.Health 'State'; SiteSourceState = Get-Field $site 'State'
                HealthUrl = 'https://plugin-health.jenkins.io/scores/' + $id
                ModernizationTodos = $todos; ModernizationStatus = $(if ($score) { 'health-recommendations' } else { 'unavailable' })
                ModernizerUrl = 'https://github.com/jenkins-infra/metadata-plugin-modernizer/tree/main/' + $id
            }
        }
        $results += [pscustomobject]@{
            Key = $entry.Key; Directory = $entry.Directory; Title = $entry.Title; Classification = $entry.Classification
            Evidence = $entry.Evidence; Repository = $entry.Repository; RepositoryUrl = $entry.RepositoryUrl
            Description = Get-Field $info 'description'; OpenIssues = Get-Field (Get-Field $info 'issues') 'totalCount'
            OpenPullRequests = Get-Field (Get-Field $info 'pullRequests') 'totalCount'
            LastCommit = $(if ($head) { [pscustomobject]@{ Sha = $head.oid; Url = $head.url; Date = $head.committedDate } } else { $null })
            GitHubSourceState = Get-Field $repository 'State' 'unavailable'; GitHubFetchedAt = Get-Field $repository 'FetchedAt'; Coverage = $coverageValue
            CoverageSourceState = Get-Field $coverage 'State' 'unavailable'
            CoverageFetchedAt = Get-Field $coverage 'FetchedAt'
            CoverageUrl = $(if ($entry.Repository) { 'https://app.codecov.io/gh/' + $entry.Repository } else { $null })
            Plugins = $plugins
        }
    }
    return [pscustomobject]@{ SchemaVersion = 1; GeneratedAt = [datetime]::UtcNow.ToString('o'); InventoryFetchedAt = $Inventory.FetchedAt; Warnings = $Inventory.Warnings; Entries = $results }
}

function ConvertTo-MarkdownText {
    param($Text)
    return (([string]$Text -replace '[\r\n\t]+', ' ').Replace('\', '\\').Replace('[', '\[').Replace(']', '\]').Replace('<', '&lt;').Replace('>', '&gt;').Replace('|', '\|').Replace('*', '\*').Replace('_', '\_').Replace('`', '\`'))
}

function Format-Metric {
    param($Value)
    if ($null -eq $Value -or [string]$Value -eq '') { return 'Unknown' }
    return ConvertTo-MarkdownText $Value
}

function Format-PublicLink {
    param([string] $Text, [string] $Url)
    $uri = $null
    if ([uri]::TryCreate($Url, [UriKind]::Absolute, [ref]$uri) -and $uri.Scheme -eq 'https' -and -not $uri.UserInfo) {
        return '[' + (ConvertTo-MarkdownText $Text) + '](' + $uri.AbsoluteUri.Replace('(', '%28').Replace(')', '%29') + ')'
    }
    return ConvertTo-MarkdownText $Text
}

function ConvertTo-PluginDashboard {
    param($Snapshot)
    $lines = [Collections.Generic.List[string]]::new()
    $lines.Add('Snapshot: ' + $Snapshot.GeneratedAt + '. Discovery: ' + $Snapshot.InventoryFetchedAt + '.')
    $lines.Add('')
    $lines.Add('Evidence labels distinguish listed developers, developer-team access, pending permissions, and fork-only candidates. Counts are not claims of active maintainership.')
    $lines.Add('')
    $lines.Add('Downloads are not exposed by the sources queried. Reporting installations are monthly controller reports, not downloads. Coverage is the public Codecov default-branch badge, not verified coverage of the latest commit. Health recommendations are a partial modernization checklist, not a complete audit; historical migration reports may be absent or outdated.')
    $lines.Add('')
    foreach ($warning in @($Snapshot.Warnings)) { $lines.Add('- Discovery warning: ' + (ConvertTo-MarkdownText $warning)) }
    foreach ($entry in $Snapshot.Entries) {
        if ($lines[$lines.Count - 1] -ne '') { $lines.Add('') }
        $lines.Add('### ' + (Format-PublicLink $entry.Directory $entry.RepositoryUrl))
        $lines.Add('')
        $lines.Add($(if ($entry.Description) { ConvertTo-MarkdownText $entry.Description } else { 'Description unavailable from GitHub.' }))
        $lines.Add('')
        $lines.Add('- Evidence: ' + $entry.Classification + '. [APM skill namespace](.apm/skills/' + $entry.Directory + '/README.md) (placeholder, not an installed skill).')
        $lines.Add('- Open issues: ' + (Format-Metric $entry.OpenIssues) + '; open PRs: ' + (Format-Metric $entry.OpenPullRequests) + '; latest default-branch commit: ' + $(if ($entry.LastCommit) { Format-PublicLink $entry.LastCommit.Sha.Substring(0, 8) $entry.LastCommit.Url } else { 'Unknown' }) + '. GitHub data: ' + $entry.GitHubSourceState + ', ' + (Format-Metric $entry.GitHubFetchedAt) + '.')
        $lines.Add('- Coverage: ' + (Format-Metric $entry.Coverage) + $(if ($entry.CoverageUrl) { ' (' + (Format-PublicLink 'Codecov' $entry.CoverageUrl) + ')' } else { '' }) + '; source: ' + $entry.CoverageSourceState + ', ' + (Format-Metric $entry.CoverageFetchedAt) + '. Downloads: Unknown.')
        foreach ($evidence in $entry.Evidence) { $lines.Add('- Evidence source: ' + (Format-PublicLink $evidence.Kind $evidence.Source) + '.') }
        if (-not $entry.Plugins.Count) { $lines.Add('- Published version, installations, health and modernization: Unknown; no plugin ID matched in the current catalog.') }
        foreach ($plugin in $entry.Plugins) {
            $lines.Add('- ' + (Format-PublicLink $plugin.Id ('https://plugins.jenkins.io/' + $plugin.Id + '/')) + ': published version **' + (Format-Metric $plugin.Version) + '**; reporting installations **' + (Format-Metric $plugin.Installations) + '** (' + (Format-Metric $plugin.InstallationsDate) + '); health **' + (Format-Metric $plugin.Health) + '/100** (' + (Format-Metric $plugin.HealthDate) + ', ' + (Format-PublicLink 'score details' $plugin.HealthUrl) + '). Sources: site ' + $plugin.SiteSourceState + ', health ' + $plugin.HealthSourceState + '.')
            $lines.Add('- Modernization for ' + (ConvertTo-MarkdownText $plugin.Id) + ': ' + $(if ($plugin.ModernizationStatus -eq 'unavailable') { 'Unknown' } elseif (-not $plugin.ModernizationTodos.Count) { 'no remediation links reported by the health service' } else { [string]$plugin.ModernizationTodos.Count + ' reported recommendations' }) + '. ' + (Format-PublicLink 'Historical migration reports, if available' $plugin.ModernizerUrl) + '.')
            foreach ($todo in $plugin.ModernizationTodos) { $lines.Add('- TODO (' + (ConvertTo-MarkdownText ($plugin.Id + ': ' + $todo.Check)) + '): ' + (Format-PublicLink $todo.Text $todo.Url) + '.') }
        }
    }
    return ($lines -join "`n").Trim() + "`n"
}

function Update-DashboardSection {
    param([string] $Readme, [string] $Dashboard)
    $begin = '<!-- BEGIN GENERATED PLUGIN DASHBOARD -->'
    $end = '<!-- END GENERATED PLUGIN DASHBOARD -->'
    if ([regex]::Matches($Readme, [regex]::Escape($begin)).Count -ne 1 -or [regex]::Matches($Readme, [regex]::Escape($end)).Count -ne 1) { throw 'README must contain exactly one dashboard marker pair' }
    $start = $Readme.IndexOf($begin) + $begin.Length
    $finish = $Readme.IndexOf($end)
    if ($finish -le $start) { throw 'README dashboard markers are out of order' }
    $newline = if ($Readme.Contains("`r`n")) { "`r`n" } else { "`n" }
    $body = $Dashboard.Replace("`r`n", "`n").Replace("`n", $newline).TrimEnd()
    return $Readme.Substring(0, $start) + $newline + $newline + $body + $newline + $newline + $Readme.Substring($finish)
}

Export-ModuleMember -Function Get-RepositoryName, Get-Field, Invoke-GitHubJson, Get-GitHubPages, Write-InventoryJson, ConvertTo-PluginInventory, Get-CachedMetric, ConvertTo-PluginStatus, ConvertTo-PluginDashboard, Update-DashboardSection