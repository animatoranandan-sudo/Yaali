# Fix remaining corrupted dashes in the Time Period section
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$lines = Get-Content $htmlPath -Encoding UTF8

# Remove the duplicate corrupted line 201
$lines = $lines[0..199] + $lines[201..($lines.Count - 1)]

# Now fix the remaining corrupted dashes (line numbers shifted by -1 after deletion)
# Line 206 (was 207): Chera-Chola-Pandya
$lines[205] = '                    <li>Dynasties like Chera–Chola–Pandya lost clarity</li>'

# Line 208 (was 209): highlighted - pure ethics
$lines[207] = '                    <li>No major religion was highlighted – pure ethics & wisdom flourished</li>'

# Save with UTF-8 BOM
$utf8WithBom = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllLines($htmlPath, $lines, $utf8WithBom)

Write-Host "Fixed all remaining corrupted dashes in Time Period section!" -ForegroundColor Green
