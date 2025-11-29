# Restore Characters and Locations sections properly

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$backupPath = "y:\WEBSITE\KarmaRebelsPitch\index_restore.html"

# Read both files
$current = Get-Content $htmlPath -Raw
$backup = Get-Content $backupPath -Raw

# Extract Characters section from backup (all 21 characters)
if ($backup -match '(?s)(    <!-- Characters -->.*?</section>\s*\r?\n\s*<!-- Locations)') {
    $charactersSection = $matches[1]
    Write-Host "Found Characters section with 21 images" -ForegroundColor Green
}

# Extract Locations section from backup  
if ($backup -match '(?s)(    <!-- Locations -->.*?</section>\s*\r?\n\s*<!-- Character)') {
    $locationsSection = $matches[1]
    Write-Host "Found Locations section" -ForegroundColor Green
}

# Insert them after Key Places section
$insertPoint = '    </section>\r\n\r\n    <!-- Locations'
$replacement = "    </section>`r`n`r`n$charactersSection`r`n`r`n$locationsSection`r`n`r`n    <!-- Character"

$current = $current -replace [regex]::Escape($insertPoint), $replacement

# Save
$current | Set-Content $htmlPath -NoNewline

Write-Host "Characters and Locations galleries restored!" -ForegroundColor Green
