param(
    [string] $ScratchRoot = [System.IO.Path]::GetTempPath(),
    [string] $PluginRepository
)

$ErrorActionPreference = 'Stop'
$repository = Split-Path $PSScriptRoot -Parent
$sandbox = Join-Path $ScratchRoot ('apm-' + [guid]::NewGuid().ToString('N').Substring(0, 6))
$packages = @(@{
    Source = $repository
    Name = 'maintenance'
    Skill = 'sync-fork-master'
    Assets = @('SKILL.md', 'scripts/sync-fork-master.sh')
    SkillSource = '.apm/skills/common/sync-fork-master'
})
if ($PluginRepository) {
    $packages += @{
        Source = (Resolve-Path $PluginRepository).Path
        Name = 'usage'
        Skill = 'lockable-resources-usage'
        Assets = @('SKILL.md', 'references/pipeline-patterns.md')
        SkillSource = '.apm/skills/lockable-resources-usage'
    }
}

New-Item -ItemType Directory -Path $sandbox | Out-Null
try {
    foreach ($package in $packages) {
        $source = Join-Path $sandbox ('s' + $package.Name.Substring(0, 1))
        $consumer = Join-Path $sandbox ('c' + $package.Name.Substring(0, 1))
        New-Item -ItemType Directory -Path $source, $consumer | Out-Null
        Copy-Item (Join-Path $package.Source 'apm.yml') $source
        Copy-Item (Join-Path $package.Source '.apm') $source -Recurse
        $github = Join-Path $consumer '.github'
        New-Item -ItemType Directory -Path $github | Out-Null
        $instructions = Join-Path $github 'copilot-instructions.md'
        [System.IO.File]::WriteAllText($instructions, '# Existing consumer instructions')
        $before = (Get-FileHash $instructions -Algorithm SHA256).Hash

        Push-Location $consumer
        try {
            & apm install $source --target copilot
            if ($LASTEXITCODE -ne 0) {
                throw ('APM install failed for ' + $package.Name)
            }
            $deployed = Join-Path $consumer ('.agents/skills/' + $package.Skill)
            foreach ($asset in $package.Assets) {
                $original = Join-Path (Join-Path $package.Source $package.SkillSource) $asset
                $installed = Join-Path $deployed $asset
                if (-not (Test-Path $installed)) {
                    throw ('Missing deployed asset: ' + $installed)
                }
                if ((Get-FileHash $original).Hash -ne (Get-FileHash $installed).Hash) {
                    throw ('Changed deployed asset: ' + $installed)
                }
            }
            if ($package.Name -eq 'maintenance') {
                foreach ($asset in @('SKILL.md', 'scripts/Fetch-JenkinsPlugins.ps1', 'scripts/Update-JenkinsPluginDashboard.ps1', 'scripts/PluginInventory.psm1')) {
                    $relative = 'common/jenkins-plugin-inventory/' + $asset
                    $original = Join-Path (Join-Path $package.Source '.apm/skills') $relative
                    $installed = Join-Path (Join-Path $consumer '.agents/skills/jenkins-plugin-inventory') $asset
                    if (-not (Test-Path $installed) -or (Get-FileHash $original).Hash -ne (Get-FileHash $installed).Hash) {
                        throw ('Missing or changed inventory skill asset: ' + $asset)
                    }
                }
                foreach ($name in @('jenkins-plugin-development.instructions.md', 'jenkins-plugin-pr-review.instructions.md')) {
                    $original = Join-Path (Join-Path $package.Source '.apm/instructions') $name
                    $installed = @(Get-ChildItem (Join-Path $consumer '.github/instructions') -Filter ('*' + $name))
                    if ($installed.Count -ne 1) {
                        throw ('Shared instruction was not deployed exactly once: ' + $name)
                    }
                    $sourceContent = [IO.File]::ReadAllText($original).Replace("`r`n", "`n").TrimEnd("`n")
                    $installedContent = [IO.File]::ReadAllText($installed[0].FullName).Replace("`r`n", "`n").TrimEnd("`n")
                    if ($sourceContent -ne $installedContent) {
                        throw ('Shared instruction content changed during deployment: ' + $name)
                    }
                }
            }
            if ($before -ne (Get-FileHash $instructions -Algorithm SHA256).Hash) {
                throw 'Existing Copilot instructions were overwritten'
            }
            if (-not (Test-Path (Join-Path $consumer 'apm.lock.yaml'))) {
                throw 'Consumer lockfile was not generated'
            }
            & apm install --frozen --target copilot
            if ($LASTEXITCODE -ne 0) {
                throw ('Frozen installation failed for ' + $package.Name)
            }
            Write-Output ('PASS: ' + $package.Name + ' assets, instructions, and frozen install')
        } finally {
            Pop-Location
        }
    }
} finally {
    Remove-Item $sandbox -Recurse -Force
}