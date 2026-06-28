# Comprehensive link checker for the docs repo - v2 (strips code blocks)
$repoRoot = "c:\Users\rahin\repos\docs\Documents"
$targetDirs = @("concepts", "databases", "devops", "frameworks", "languages", "web-platform")

# Exclude web-platform/mdn
$excludePrefix = "web-platform\mdn"

$brokenLinks = @()
$totalLinks = 0
$checkedFiles = 0

# Collect all .md files from target dirs
$mdFiles = @()
foreach ($dir in $targetDirs) {
    $fullDir = Join-Path $repoRoot $dir
    if (Test-Path $fullDir) {
        $files = Get-ChildItem -Path $fullDir -Recurse -Filter "*.md" | ForEach-Object { $_.FullName }
        foreach ($f in $files) {
            $rel = $f.Substring($repoRoot.Length + 1)
            if ($rel.StartsWith($excludePrefix)) { continue }
            $mdFiles += @{ FullPath = $f; Relative = $rel }
        }
    }
}

Write-Host "Found $($mdFiles.Count) .md files to check" -ForegroundColor Cyan
Write-Host ""

function StripCodeBlocks($text) {
    # Remove fenced code blocks (``` ... ```)
    $text = $text -replace '(?s)```[^\n]*\n.*?```', ''
    # Remove inline code spans (`...`)
    $text = $text -replace '`[^`]+`', ''
    return $text
}

foreach ($fileInfo in $mdFiles) {
    $filePath = $fileInfo.FullPath
    $fileRel = $fileInfo.Relative
    $fileDir = Split-Path $filePath -Parent
    
    $rawContent = Get-Content -Path $filePath -Raw -ErrorAction SilentlyContinue
    if (-not $rawContent) { continue }
    
    $checkedFiles++
    $content = StripCodeBlocks $rawContent
    
    # Extract all markdown links: [text](url)
    $linkPattern = '\[([^\]]*)\]\(([^)]+)\)'
    $matches = [regex]::Matches($content, $linkPattern)
    
    if ($matches.Count -eq 0) { continue }
    
    foreach ($match in $matches) {
        $linkText = $match.Groups[1].Value
        $linkUrl = $match.Groups[2].Value
        $totalLinks++
        
        # Skip external URLs
        if ($linkUrl -match '^https?://' -or $linkUrl -match '^mailto:' -or $linkUrl -match '^ftp://') {
            continue
        }
        
        # Skip pure anchor links
        if ($linkUrl -match '^#') {
            continue
        }
        
        # Handle links with anchors: file.md#section
        $originalUrl = $linkUrl
        $anchorPart = ""
        if ($linkUrl -match '^(.+?)(#.*)$') {
            $linkUrl = $Matches[1]
            $anchorPart = $Matches[2]
        }
        
        # Skip empty URLs
        if ([string]::IsNullOrWhiteSpace($linkUrl)) {
            continue
        }
        
        # Resolve the path
        $resolvedPath = $null
        
        try {
            $resolvedPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($fileDir, $linkUrl))
        } catch {
            $brokenLinks += [PSCustomObject]@{
                SourceFile = $fileRel
                LinkUrl = $originalUrl
                ResolvedPath = "(invalid path)"
                Issue = "Cannot resolve path"
            }
            continue
        }
        
        # Check if the target exists
        if (-not (Test-Path -Path $resolvedPath)) {
            # Check if the link might be a directory (ending with /)
            $brokenLinks += [PSCustomObject]@{
                SourceFile = $fileRel
                LinkUrl = $originalUrl
                ResolvedPath = $resolvedPath
                Issue = "File not found"
            }
        }
    }
}

Write-Host "=== RESULTS ===" -ForegroundColor Cyan
Write-Host "Checked $checkedFiles files with $totalLinks total internal links" -ForegroundColor Green
Write-Host ""

if ($brokenLinks.Count -eq 0) {
    Write-Host "ALL INTERNAL LINKS ARE VALID!" -ForegroundColor Green
} else {
    Write-Host "BROKEN LINKS FOUND: $($brokenLinks.Count)" -ForegroundColor Red
    Write-Host ""
    
    $grouped = $brokenLinks | Group-Object -Property SourceFile
    foreach ($group in $grouped) {
        Write-Host "--- $($group.Name) ---" -ForegroundColor Yellow
        foreach ($link in $group.Group) {
            Write-Host "  [$($link.LinkUrl)]" -ForegroundColor Red
            Write-Host "    -> $($link.ResolvedPath)" -ForegroundColor Gray
            Write-Host "    Issue: $($link.Issue)" -ForegroundColor Red
            Write-Host ""
        }
    }
}

# Additional check: README.md files in subdirectories (not top-level) should link to core.md
Write-Host "=== README -> core.md CHECK ===" -ForegroundColor Cyan
Write-Host "(Only checking READMEs in subdirectories that have a core.md sibling)" -ForegroundColor Gray
Write-Host ""
$readmeIssues = @()
foreach ($fileInfo in $mdFiles) {
    $fileName = Split-Path $fileInfo.FullPath -Leaf
    if ($fileName -ne "README.md") { continue }
    
    $fileDir = Split-Path $fileInfo.FullPath -Parent
    $fileRelDir = $fileDir.Substring($repoRoot.Length + 1)
    
    # Skip top-level READMEs (directly in concepts/, databases/, etc.)
    $depth = ($fileRelDir -split '\\').Count
    if ($depth -le 1) { continue }
    
    # Check if core.md exists in the same directory
    $coreMdPath = Join-Path $fileDir "core.md"
    if (-not (Test-Path $coreMdPath)) {
        # No core.md sibling, so no link needed
        continue
    }
    
    $content = Get-Content -Path $fileInfo.FullPath -Raw -ErrorAction SilentlyContinue
    if (-not $content) { continue }
    $content = StripCodeBlocks $content
    
    $linkPattern = '\[([^\]]*)\]\(([^)]+)\)'
    $matches = [regex]::Matches($content, $linkPattern)
    
    $hasCoreLink = $false
    $coreLinkValid = $true
    foreach ($match in $matches) {
        $linkUrl = $match.Groups[2].Value
        if ($linkUrl -match '^https?://' -or $linkUrl -match '^#' -or $linkUrl -match '^mailto:') { continue }
        
        if ($linkUrl -match 'core\.md') {
            $hasCoreLink = $true
            $anchorPart = ""
            $cleanUrl = $linkUrl
            if ($cleanUrl -match '^(.+?)(#.*)$') {
                $cleanUrl = $Matches[1]
                $anchorPart = $Matches[2]
            }
            try {
                $resolved = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($fileDir, $cleanUrl))
                if (-not (Test-Path $resolved)) {
                    $coreLinkValid = $false
                    $readmeIssues += [PSCustomObject]@{
                        SourceFile = $fileInfo.Relative
                        LinkUrl = $linkUrl
                        Issue = "core.md link broken"
                    }
                }
            } catch {
                $coreLinkValid = $false
            }
        }
    }
    
    if (-not $hasCoreLink) {
        $readmeIssues += [PSCustomObject]@{
            SourceFile = $fileInfo.Relative
            LinkUrl = "(none)"
            Issue = "README has no link to core.md"
        }
    }
}

if ($readmeIssues.Count -eq 0) {
    Write-Host "All README -> core.md links are valid!" -ForegroundColor Green
} else {
    Write-Host "README issues found: $($readmeIssues.Count)" -ForegroundColor Red
    foreach ($issue in $readmeIssues) {
        Write-Host "  $($issue.SourceFile): $($issue.Issue) [$($issue.LinkUrl)]" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "=== DONE ===" -ForegroundColor Cyan