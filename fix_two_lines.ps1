# Read the HTML file
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$lines = Get-Content $htmlPath -Encoding UTF8

# Fix line 156 (index 155) - Lemuria heading
$lines[155] = '                    <h4 style="color: var(--neon-cyan); margin-bottom: 0.8rem;">3.1. Lemuria – The Lost Continent</h4>'

# Fix line 200 (index 199) - Time period with Tamil text
$lines[199] = '                <p style="color: #ccc; line-height: 1.6; margin-bottom: 1rem;"><strong>Approx. 6th–7th Century South India – Irunda Kaalam (இருண்ட காலம்)</strong></p>'

# Save the file with UTF-8 BOM
$utf8WithBom = New-Object System.Text.UTF8Encoding $true
[System.IO.File]::WriteAllLines($htmlPath, $lines, $utf8WithBom)

Write-Host "Fixed lines 156 and 200 successfully!" -ForegroundColor Green
