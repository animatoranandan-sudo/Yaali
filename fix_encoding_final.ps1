# PowerShell script to fix encoding - using regex replace with proper UTF-8 handling
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"

# Read as bytes and convert to string
$bytes = [System.IO.File]::ReadAllBytes($htmlPath)
$content = [System.Text.Encoding]::UTF8.GetString($bytes)

Write-Host "Original content length: $($content.Length)" -ForegroundColor Cyan

# Count issues before
$beforeCount = ([regex]::Matches($content, 'â€')).Count
Write-Host "Found $beforeCount corrupted character sequences" -ForegroundColor Yellow

# Replace corrupted sequences with correct UTF-8 characters
# These are the actual byte sequences we need to fix

# Fix: â€" (en-dash corruption) -> – (proper en-dash U+2013)
$content = $content -creplace 'â€"', '–'

# Fix: â€" (em-dash corruption) -> — (proper em-dash U+2014)  
$content = $content -creplace 'â€"', '—'

# Fix: â€™ (right single quote corruption) -> ' (proper U+2019)
$content = $content -creplace 'â€™', "'"

# Fix: â€œ (left double quote corruption) -> " (proper U+201C)
$content = $content -creplace 'â€œ', '"'

# Fix: â€� (right double quote corruption) -> " (proper U+201D)
$content = $content -creplace 'â€�', '"'

# Fix Tamil text corruption
$content = $content -creplace 'à®‡à®°à¯à®£à¯à®Ÿ à®•à®¾à®²à®®à¯', 'இருண்ட காலம்'

# Count after
$afterCount = ([regex]::Matches($content, 'â€')).Count
Write-Host "Remaining corrupted sequences: $afterCount" -ForegroundColor Yellow

# Write back with UTF-8 BOM
$utf8 = New-Object System.Text.UTF8Encoding $true
$bytes = $utf8.GetBytes($content)
[System.IO.File]::WriteAllBytes($htmlPath, $bytes)

Write-Host "`nFile updated successfully!" -ForegroundColor Green
Write-Host "Saved with UTF-8 BOM encoding" -ForegroundColor Green
