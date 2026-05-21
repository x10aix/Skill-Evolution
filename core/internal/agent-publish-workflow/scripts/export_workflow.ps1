param(
    [Parameter(Mandatory=$true)]
    [string]$Mode
)

$source = Get-Location

if ($Mode -eq "direkt" -or $Mode -eq "direct") {
    $target = $source
    Write-Host "⚠️ DIRECT MODE: Master files will be overwritten!" -ForegroundColor Yellow
} else {
    if ($Mode -eq "zip") { $target = Join-Path ([System.IO.Path]::GetTempPath()) "publish_temp_$(Get-Random)" } 
    else { $target = Join-Path $source "dist" }
    
    if (Test-Path $target) { Remove-Item -Recurse -Force $target }
    New-Item -ItemType Directory -Path $target | Out-Null
    
    $excludeFields = @(".git", "node_modules", ".venv", ".next", "reports", "dist", "releases", ".skill-config.json", ".env")
    Get-ChildItem -Path $source -Exclude $excludeFields | Copy-Item -Destination $target -Recurse -Force
}

# Universal Sanitization on the TARGET directory
Get-ChildItem -Path $target -File -Recurse | Where-Object { $_.Extension -match '\.(md|txt|json|jsonl|js|ts|py|csv|yml|yaml|env)$' -and $_.Length -lt 1MB } | ForEach-Object {
    $content = Get-Content $_.FullName
    $inConfig = $false
    $modified = $false
    for ($i = 0; $i -lt $content.Length; $i++) {
        if ($content[$i] -match '<!-- CONFIGURATION_START -->') { $inConfig = $true }
        elseif ($content[$i] -match '<!-- CONFIGURATION_END -->') { $inConfig = $false }
        elseif ($inConfig) {
            if ($content[$i] -match '^STATUS:') {
                $content[$i] = 'STATUS: UNCONFIGURED'
                $modified = $true
            } elseif ($content[$i] -match '^([^:]+):') {
                $key = $Matches[1]
                $content[$i] = "$($key): N/A"
                $modified = $true
            }
        }
    }
    if ($modified) { $content | Set-Content $_.FullName -Encoding UTF8 }
}

if ($Mode -eq "zip") {
    $releaseDir = Join-Path $source "releases"
    if (-not (Test-Path $releaseDir)) { New-Item -ItemType Directory -Path $releaseDir | Out-Null }
    $zipName = "$releaseDir\release_$(Get-Date -f 'yyyyMMdd_HHmmss').zip"
    Compress-Archive -Path "$target\*" -DestinationPath $zipName -Force
    Remove-Item -Recurse -Force $target
    Write-Host "📦 Zipped Release created at: $zipName" -ForegroundColor Green
} elseif ($Mode -eq "dist") {
    Write-Host "📂 Dist Folder created at: $target" -ForegroundColor Green
} else {
    Write-Host "✅ Direct Sanitization complete." -ForegroundColor Green
}
