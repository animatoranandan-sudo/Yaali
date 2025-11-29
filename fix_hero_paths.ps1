# Fix hero section image and video paths

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$html = Get-Content $htmlPath -Raw

# Fix title image path
$html = $html -replace 'images/Assets/Project-Title\.png', 'images/Titles/Project Title.png'

# Fix logo animation video path  
$html = $html -replace 'images/videos/Logo Animation/Logo-Animation\.mp4', 'images/videos/Logo Animation/Logo animation.mp4'

# Save the file
$html | Set-Content $htmlPath -NoNewline

Write-Host "Fixed title image and logo video paths!" -ForegroundColor Green
