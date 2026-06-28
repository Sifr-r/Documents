$ErrorActionPreference = "Stop"
$baseDir = "c:\Users\rahin\repos\docs\Documents\languages"

$langDirs = @(
    "javascript", "python", "clojure", "cpp", "csharp", "dart",
    "elixir", "erlang", "go", "haskell", "java", "kotlin",
    "lua", "php", "ruby", "rust", "scala", "swift"
)

$allMdFiles = @()
foreach ($lang in $langDirs) {
    $dir = Join-Path $baseDir $lang
    if (Test-Path $dir) {
        $files = Get-ChildItem -Path $dir -Recurse -Filter *.md | ForEach-Object { $_.FullName }
        $allMdFiles += $files
    }
}

Write-Host "=== Found $($allMdFiles.Count) .md files ==="

$brokenLinks = @()
$validLinks = @()
$externalLinks = @()
$allLinks = @()
$skippedCodeBlock = 0

foreach ($file in $allMdFiles) {
    $lines = Get-Content -Path $file
    $relativePath = $file.Substring($baseDir.Length + 1)
    $fileDir = Split-Path $file -Parent
    
    $inCodeBlock = $false
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $lineNum = $i + 1
        
        # Track fenced code blocks (``` or ~~~)
        if ($line -match '^\s*```') {
            $inCodeBlock = -not $inCodeBlock
            continue
        }
        if ($line -match '^\s*~~~') {
            $inCodeBlock = -not $inCodeBlock
            continue
        }
        
        if ($inCodeBlock) {
            continue
        }
        
        # Remove inline code spans (content between backticks) to avoid false matches
        $cleanLine = $line -replace '`[^`]+`', ''
        
        $pattern = '\[([^\]]*)\]\(([^)]+)\)'
        $matches = [regex]::Matches($cleanLine, $pattern)
        
        foreach ($match in $matches) {
            $linkText = $match.Groups[1].Value
            $linkTarget = $match.Groups[2].Value
            
            $allLinks += @{
                SourceFile = $relativePath
                Line = $lineNum
                LinkText = $linkText
                LinkTarget = $linkTarget
            }
            
            # Skip external URLs, mailto, anchors, and clearly code-like targets
            if ($linkTarget -match '^https?://' -or $linkTarget -match '^mailto:' -or $linkTarget -match '^#') {
                $externalLinks += @{
                    SourceFile = $relativePath
                    Line = $lineNum
                    LinkText = $linkText
                    LinkTarget = $linkTarget
                }
                continue
            }
            
            # Skip targets that look like code (contain spaces, angle brackets, etc)
            if ($linkTarget -match '[<>]' -or $linkTarget -match '^\s*$') {
                $skippedCodeBlock++
                continue
            }
            
            $targetPath = $null
            if ($linkTarget.StartsWith('/')) {
                $targetPath = Join-Path $baseDir $linkTarget.TrimStart('/')
            } else {
                $targetPath = Join-Path $fileDir $linkTarget
            }
            
            try {
                $targetPath = [System.IO.Path]::GetFullPath($targetPath)
            } catch {
                $brokenLinks += @{
                    SourceFile = $relativePath
                    Line = $lineNum
                    LinkText = $linkText
                    LinkTarget = $linkTarget
                    ResolvedPath = $targetPath
                    Issue = "Invalid path: $_"
                }
                continue
            }
            
            if (Test-Path -Path $targetPath -PathType Leaf) {
                $actualName = (Get-Item -Path $targetPath).Name
                $expectedName = Split-Path $targetPath -Leaf
                
                if ($actualName -ceq $expectedName) {
                    $validLinks += @{
                        SourceFile = $relativePath
                        Line = $lineNum
                        LinkText = $linkText
                        LinkTarget = $linkTarget
                        ResolvedPath = $targetPath
                    }
                } else {
                    $brokenLinks += @{
                        SourceFile = $relativePath
                        Line = $lineNum
                        LinkText = $linkText
                        LinkTarget = $linkTarget
                        ResolvedPath = $targetPath
                        Issue = "CASE MISMATCH: expected '$expectedName' but actual file is '$actualName'"
                    }
                }
            } else {
                $brokenLinks += @{
                    SourceFile = $relativePath
                    Line = $lineNum
                    LinkText = $linkText
                    LinkTarget = $linkTarget
                    ResolvedPath = $targetPath
                    Issue = "FILE NOT FOUND: $targetPath"
                }
            }
        }
    }
}

Write-Host ""
Write-Host "=== SUMMARY ==="
Write-Host "Total .md files: $($allMdFiles.Count)"
Write-Host "Total links found: $($allLinks.Count)"
Write-Host "Valid links: $($validLinks.Count)"
Write-Host "Broken links: $($brokenLinks.Count)"
Write-Host "External/Skipped links: $($externalLinks.Count)"
Write-Host "Code-block false positives skipped: $skippedCodeBlock"
Write-Host ""

if ($brokenLinks.Count -gt 0) {
    Write-Host "=== BROKEN LINKS ==="
    foreach ($bl in $brokenLinks) {
        Write-Host "  FILE: $($bl.SourceFile):$($bl.Line)"
        Write-Host "    Link: [$($bl.LinkText)]($($bl.LinkTarget))"
        Write-Host "    ISSUE: $($bl.Issue)"
        Write-Host ""
    }
} else {
    Write-Host "=== ALL LINKS ARE VALID ==="
}

# Also list all valid links for manual verification
Write-Host ""
Write-Host "=== VALID LINKS BY FILE ==="
$grouped = $validLinks | Group-Object -Property SourceFile
foreach ($group in $grouped) {
    Write-Host "  $($group.Name):"
    foreach ($link in $group.Group) {
        Write-Host "    L$($link.Line): [$($link.LinkText)]($($link.LinkTarget))"
    }
}
Write-Host ""
Write-Host "=== EXTERNAL LINKS ==="
foreach ($el in $externalLinks) {
    Write-Host "  $($el.SourceFile):$($el.Line): [$($el.LinkText)]($($el.LinkTarget))"
}