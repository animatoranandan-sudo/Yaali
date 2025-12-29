# Fix encoding issues in the HTML file
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"

# Read the file
$content = Get-Content $htmlPath -Raw -Encoding UTF8

Write-Host "Fixing encoding issues..." -ForegroundColor Cyan

# Fix the earth emoji (most important)
$content = $content -replace [char]0xF0 + [char]0x9F + [char]0x8C + [char]0x8E, '🌎'

# Fix en-dash (–) - appears as â€"
$content = $content -replace 'â€"', '–'

# Fix em-dash (—)
$content = $content -replace 'â€"', '—'

# Fix right single quotation mark (')
$content = $content -replace "â€™", "'"

# Fix left double quotation mark (")
$content = $content -replace 'â€œ', '"'

# Fix right double quotation mark (")
$content = $content -replace 'â€�', '"'

# Save with UTF-8 BOM
$utf8WithBom = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllText($htmlPath, $content, $utf8WithBom)

Write-Host "Encoding fixed!" -ForegroundColor Green
