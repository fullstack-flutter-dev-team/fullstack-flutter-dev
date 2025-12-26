# Collect earliest and latest git commit dates for each file under JavaStudy (recursive)
Set-Location 'D:\_Workspace_Flutter\fullstack-flutter-dev_github'
if(-not (Test-Path '.git_dates2')){ New-Item -ItemType Directory -Path '.git_dates2' | Out-Null }
$out = '.git_dates2\JavaStudy_files.txt'
if(Test-Path $out){ Remove-Item $out }
$files = Get-ChildItem -Path .\JavaStudy -Recurse -File -Force -ErrorAction SilentlyContinue
if(-not $files){ Write-Output "No files found in JavaStudy"; exit }
foreach($f in $files){
    $full = $f.FullName
    $repoRoot = (Get-Location).ProviderPath
    $rel = $full.Substring($repoRoot.Length+1) -replace '\\\\','/' -replace '\\','/'
    $dates = git log --format=%ad --date=short -- $rel 2>$null
    if(!$dates){ continue }
    $ear = ($dates | Select-Object -Last 1) -join ''
    $lat = ($dates | Select-Object -First 1) -join ''
    if([string]::IsNullOrEmpty($ear)){ $ear='[N/A]' }
    if([string]::IsNullOrEmpty($lat)){ $lat='[N/A]' }
    "$rel|$ear|$lat" | Out-File -FilePath $out -Encoding utf8 -Append
    Write-Output "WROTE: $rel -> $ear | $lat"
}
Write-Output "Done. Output: $out"
