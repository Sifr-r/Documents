$ErrorActionPreference = "Continue"
$dirs = @("concepts", "databases", "devops", "frameworks", "languages", "web-platform")
$broken = @()
$totalFiles = 0

foreach ($d in $dirs) {
    $files = Get-ChildItem -Path $d -Recurse -Filter "*.md" -ErrorAction SilentlyContinue
    foreach ($f in $files) {
        $totalFiles++
        $content = Get-Content $f.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { continue }
        $pattern = '\[([^\]]+)\]\(([^)]+)\)'
        $regexMatches = [regex]::Matches($content, $pattern)
        foreach ($m in $regexMatches) {
            $url = $m.Groups[2].Value
            if ($url -match '^https?://' -or $url -match '^#' -or $url -match '^mailto:') { continue }
            $cleanUrl = ($url -split '[?#]')[0]
            if (-not $cleanUrl) { continue }
            $targetPath = [System.IO.Path]::Combine($f.Directory.FullName, $cleanUrl)
            if (-not (Test-Path -LiteralPath $targetPath -ErrorAction SilentlyContinue)) {
                $broken += "$($f.FullName) -> $url"
            }
        }
    }
}

Write-Host "Total .md files checked: $totalFiles"
Write-Host "Broken links found: $($broken.Count)"
if ($broken.Count -gt 0) {
    $broken | ForEach-Object { Write-Host $_ }
} else {
    Write-Host "All internal links are valid!"
}