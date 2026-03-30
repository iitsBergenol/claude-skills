$source = "$PSScriptRoot\.claude\skills\*"
$destination = "$env:USERPROFILE\.claude\skills\"

if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

Copy-Item -Path $source -Destination $destination -Recurse -Force
Write-Host "Skills copied to $destination"
