# PowerShell script to add all 21 character images to index.html

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"

# Read the HTML file
$html = Get-Content $htmlPath -Raw

# Define the complete Characters section with all 21 images
$charactersSection = @"
    <!-- Characters -->
    <section id="characters" class="content-section">
        <h2 class="section-title">CHARACTERS</h2>
        <div class="container grid-3">
            <div class="char-card">
                <img src="images/Characters/Ruthra.png" alt="Ruthra">
                <h3>Ruthra</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Ruthra1.png" alt="Ruthra (Alternate)">
                <h3>Ruthra (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/KHSALA.png" alt="Kshala">
                <h3>Kshala</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/KHSALA1.png" alt="Kshala (Alternate)">
                <h3>Kshala (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Sidh.png" alt="Sion">
                <h3>Sion</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Emperor Raaya.png" alt="Emperor Raya">
                <h3>Emperor Raya</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Young Raaya.png" alt="Young Raya">
                <h3>Young Raya</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Young Raaya1.png" alt="Young Raya (Alternate)">
                <h3>Young Raya (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Rajguru viruksha 1.png" alt="Rajaguru Visuva">
                <h3>Rajaguru Visuva</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Queen Meghna.png" alt="Queen Mechana">
                <h3>Queen Mechana</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Queen Meghna1.png" alt="Queen Mechana (Alternate)">
                <h3>Queen Mechana (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Cheliya.png" alt="Cheliya">
                <h3>Cheliya</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Cheliya 2.png" alt="Cheliya (Alternate)">
                <h3>Cheliya (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Guru Kala.png" alt="Guru Kala">
                <h3>Guru Kala</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Guru Kala1.png" alt="Guru Kala (Alternate)">
                <h3>Guru Kala (Alternate)</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Koran.png" alt="Koran">
                <h3>Koran</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/LION-FORM-RUTHRA.png" alt="Lion Form Ruthra">
                <h3>Lion Form Ruthra</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Yaali 01.png" alt="Yaali 01">
                <h3>Yaali 01</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Yaali 02.png" alt="Yaali 02">
                <h3>Yaali 02</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Yaali 03.png" alt="Yaali 03">
                <h3>Yaali 03</h3>
            </div>
            <div class="char-card">
                <img src="images/Characters/Yaali 04.png" alt="Yaali 04">
                <h3>Yaali 04</h3>
            </div>
        </div>
    </section>

"@

# Find the correct pattern with HTML entity
$pattern = "    </section>`r`n`r`n    <!-- Character & Location Descriptions -->"
$replacement = "    </section>`r`n`r`n$charactersSection    <!-- Character & Location Descriptions -->"

if ($html -match [regex]::Escape($pattern)) {
    $html = $html -replace [regex]::Escape($pattern), $replacement
    $html | Set-Content $htmlPath -NoNewline
    Write-Host "Successfully added all 21 character images!" -ForegroundColor Green
    Write-Host "Total characters added: 21" -ForegroundColor Cyan
}
else {
    Write-Host "Pattern not found. Checking file structure..." -ForegroundColor Yellow
    if ($html -match "<!-- Character") {
        Write-Host "Found Character comment in file" -ForegroundColor Green
    }
}
