# Fix encoding issues in the HTML file
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"

# Read the file as UTF-8
$content = Get-Content $htmlPath -Raw -Encoding UTF8

Write-Host "Original file size: $($content.Length) characters" -ForegroundColor Cyan

# Fix the corrupted characters
$replacements = @{
    # Fix emoji
    'ðŸŒŽ' = '🌎'
    
    # Fix en-dashes and em-dashes
    'â€"'  = '–'
    'â€"'  = '—'
    
    # Fix smart quotes
    "â€™"  = "'"
    'â€œ'  = '"'
    'â€�'  = '"'
    
    # Fix other common corruptions
    'Ã¡'   = 'á'
    'Ã©'   = 'é'
    'Ã­'   = 'í'
    'Ã³'   = 'ó'
    'Ãº'   = 'ú'
    'Ã±'   = 'ñ'
    
    # Fix Tamil characters if corrupted
    'à®'   = 'இ'
    'à®°'  = 'ர'
    'à¯'   = 'ு'
    'à®£'  = 'ண்'
    'à®Ÿ'  = 'ட'
    'à®•'  = 'க'
    'à®¾'  = 'ா'
    'à®²'  = 'ல'
    'à®®'  = 'ம்'
}

# Apply all replacements
foreach ($key in $replacements.Keys) {
    if ($content -match [regex]::Escape($key)) {
        $count = ([regex]::Matches($content, [regex]::Escape($key))).Count
        Write-Host "Replacing '$key' with '$($replacements[$key])' ($count occurrences)" -ForegroundColor Yellow
        $content = $content -replace [regex]::Escape($key), $replacements[$key]
    }
}

# Additional specific fixes based on the screenshots
# Fix "CONTEXT & CORE LORE" title
$content = $content -replace 'ðŸŒŽ CONTEXT & CORE LORE', '🌎 CONTEXT & CORE LORE'
$content = $content -replace 'ðŸŒŽ CONTEXT \u0026 CORE LORE', '🌎 CONTEXT & CORE LORE'

# Fix "Lemuria – The Lost Continent"
$content = $content -replace 'Lemuria â€" The Lost Continent', 'Lemuria – The Lost Continent'

# Fix "Chera–Chola–Pandya"
$content = $content -replace 'Cheraâ€"Cholaâ€"Pandya', 'Chera–Chola–Pandya'

# Fix "6th–7th Century"
$content = $content -replace '6thâ€"7th Century', '6th–7th Century'

# Fix any remaining corrupted dashes
$content = $content -replace 'â€"', '–'
$content = $content -replace 'â€"', '—'

# Save the file with proper UTF-8 encoding (with BOM)
$utf8WithBom = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllText($htmlPath, $content, $utf8WithBom)

Write-Host "`nFile saved with UTF-8 BOM encoding" -ForegroundColor Green
Write-Host "New file size: $($content.Length) characters" -ForegroundColor Cyan
Write-Host "`nEncoding issues fixed successfully!" -ForegroundColor Green
