@echo off
chcp 65001 >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "$file='y:\WEBSITE\KarmaRebelsPitch\index.html'; $lines=[System.IO.File]::ReadAllLines($file, [System.Text.Encoding]::UTF8); $lines = $lines[0..204] + $lines[206] + $lines[207] + $lines[209..($lines.Count-1)]; [System.IO.File]::WriteAllLines($file, $lines, (New-Object System.Text.UTF8Encoding $true)); Write-Host 'Removed duplicate corrupted lines!' -ForegroundColor Green"
