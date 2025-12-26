# PowerShell script to collect earliest/latest git commit dates for specified top-level folders
Set-Location 'D:\_Workspace_Flutter\fullstack-flutter-dev_github'
if(-not (Test-Path '.git_dates2')){ New-Item -ItemType Directory -Path '.git_dates2' | Out-Null }
$folders = 'JavaStudy','JDBCStudy','Lecture_note','OracleStudy','XmlStudy'
foreach($f in $folders){
    $fpath = Join-Path (Get-Location) $f
    if(-not (Test-Path $fpath)){
        Write-Output "SKIP: $f (not found)"
        continue
    }
    $subs = Get-ChildItem -Path $fpath -Directory -Force -ErrorAction SilentlyContinue
    if(!$subs -or $subs.Count -eq 0){
        $ear = (git log --format=%ad --date=short -- $f | Select-Object -First 1) -join ''
        $lat = (git log --format=%ad --date=short -- $f | Select-Object -Last 1) -join ''
        if([string]::IsNullOrEmpty($ear)){ $ear='[N/A]' }
        if([string]::IsNullOrEmpty($lat)){ $lat='[N/A]' }
        "$f|$ear|$lat" | Out-File -FilePath ".git_dates2\${f}__root.txt" -Encoding utf8
        Write-Output "WROTE: .git_dates2\${f}__root.txt"
        continue
    }
    foreach($s in $subs){
        $rel = "$f/" + $s.Name
        $ear = (git log --format=%ad --date=short -- $rel | Select-Object -First 1) -join ''
        $lat = (git log --format=%ad --date=short -- $rel | Select-Object -Last 1) -join ''
        if([string]::IsNullOrEmpty($ear)){ $ear='[N/A]' }
        if([string]::IsNullOrEmpty($lat)){ $lat='[N/A]' }
        "$f`__$($s.Name)|$ear|$lat" | Out-File -FilePath ".git_dates2\${f}__${($s.Name)}.txt" -Encoding utf8
        Write-Output "WROTE: .git_dates2\${f}__${($s.Name)}.txt"
    }
}
Write-Output 'Done.'
