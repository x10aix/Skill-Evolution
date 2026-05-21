param()

$reportDir = "reports"
if (-not (Test-Path $reportDir)) { New-Item -ItemType Directory -Path $reportDir | Out-Null }
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$reportFile = "$reportDir\publish_scan_$timestamp.log"
$secrets = @(
    @{ Name="OpenAI API Key"; Regex="(sk-[a-zA-Z0-9]{32,})" },
    @{ Name="Anthropic API Key"; Regex="(sk-ant-[a-zA-Z0-9-_]{30,})" },
    @{ Name="GitHub Token"; Regex="(ghp_[a-zA-Z0-9]{36})" },
    @{ Name="Generic Password/Token"; Regex='(?i)(pwd|password|secret|api_key|token)\s*[:=]\s*["''][^"'']{8,}["'']' }
)
$found = $false
$logContent = @("=== PRE-FLIGHT SECRET SCAN REPORT ===", "Date: $(Get-Date)", "Project Path: $(Get-Location)", "-------------------------------------")

if ((Test-Path "package.json") -or (Test-Path "pom.xml") -or (Test-Path "*.sln")) {
    Write-Host "⚠️ WARNING: Heavy programming project detected! This workflow is optimized for lightweight Agent Skills. Scanning may take longer." -ForegroundColor Yellow
}

Get-ChildItem -File -Recurse -Exclude "reports", "releases", "dist", "node_modules", ".git", ".venv", ".next" | 
    Where-Object { 
        $_.Extension -match '\.(md|txt|json|jsonl|js|ts|py|csv|yml|yaml|env)$' -and 
        $_.Name -notmatch '\.(example|sample|template)$|(?i)dummy' -and
        $_.Length -lt 1MB 
    } | ForEach-Object {
    $file = $_
    $lines = Get-Content $file.FullName
    for ($i = 0; $i -lt $lines.Length; $i++) {
        foreach ($sec in $secrets) {
            # False Positive Protection: Ignore obvious dummy keys.
            if (($lines[$i] -match $sec.Regex) -and ($lines[$i] -notmatch '123456789|abcdef|example|dummy|placeholder')) {
                $msg = "WARNING: Potential $($sec.Name) found in $($file.Name) on line $($i+1)"
                Write-Host "⚠️ $msg!" -ForegroundColor Red
                Write-Host "   (Line content is hidden to prevent logging the secret into your terminal history)" -ForegroundColor DarkGray
                $logContent += $msg
                $found = $true
            }
        }
    }
}

if (-not $found) { 
    $logContent += "Status: CLEAN. No standard keys found." 
    Write-Host "✅ Pre-Flight Secret Scan passed." -ForegroundColor Green
}
$logContent | Set-Content $reportFile -Encoding UTF8
Write-Host "📄 Scan log saved to: $reportFile" -ForegroundColor Cyan

if ($found) {
    $ans = Read-Host "🚨 Possible secrets detected! Do you REALLY want to proceed with the publish preparation? (Y/N)"
    if ($ans -notmatch "^[Yy]") {
        Write-Host "Publish workflow aborted to prevent data leak." -ForegroundColor Yellow
        exit 1
    }
}
