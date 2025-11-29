# Complete fix: Restore all sections properly

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$backupPath = "y:\WEBSITE\KarmaRebelsPitch\index.html.backup"

# Read the backup file with all 21 characters
$backup = Get-Content $backupPath -Raw

# Read current file
$current = Get-Content $htmlPath -Raw

# Extract the complete Characters section (21 images) from backup
if ($backup -match '(?s)    <!-- Characters -->.*?    <section id="characters"[^>]*>.*?</section>') {
    $charactersSection = $matches[0]
    Write-Host "Extracted Characters section" -ForegroundColor Green
}

# Extract the Locations section from backup
if ($backup -match '(?s)    <!-- Locations -->.*?    <section id="locations"[^>]*>.*?</section>') {
    $locationsSection = $matches[0]
    Write-Host "Extracted Locations section" -ForegroundColor Green
}

# Find where to insert (after Key Places section, before Character & Location Descriptions)
$pattern = '(?s)(    </section>\s*\r?\n\s*<!-- Character & Location Descriptions)'
if ($current -match $pattern) {
    $replacement = "    </section>`r`n`r`n$charactersSection`r`n`r`n$locationsSection`r`n`r`n    <!-- Character & Location Descriptions"
    $current = $current -replace $pattern, $replacement
    
    $current | Set-Content $htmlPath -NoNewline
    Write-Host "SUCCESS: Characters (21) and Locations (7) galleries restored!" -ForegroundColor Green
}
else {
    Write-Host "Pattern not found - checking structure..." -ForegroundColor Yellow
}
