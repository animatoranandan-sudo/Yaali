# Script to add all 21 character images to the HTML

$htmlFile = "y:\WEBSITE\KarmaRebelsPitch\index.html"

# Character images in the correct order
$characters = @(
    @{file = "Ruthra.png"; name = "Ruthra" },
    @{file = "Ruthra1.png"; name = "Ruthra (Alternate)" },
    @{file = "KHSALA.png"; name = "Kshala" },
    @{file = "KHSALA1.png"; name = "Kshala (Alternate)" },
    @{file = "Sidh.png"; name = "Sion" },
    @{file = "Emperor Raaya.png"; name = "Emperor Raya" },
    @{file = "Young Raaya.png"; name = "Young Raya" },
    @{file = "Young Raaya1.png"; name = "Young Raya (Alternate)" },
    @{file = "Rajguru viruksha 1.png"; name = "Rajaguru Visuva" },
    @{file = "Queen Meghna.png"; name = "Queen Mechana" },
    @{file = "Queen Meghna1.png"; name = "Queen Mechana (Alternate)" },
    @{file = "Cheliya.png"; name = "Cheliya" },
    @{file = "Cheliya 2.png"; name = "Cheliya (Alternate)" },
    @{file = "Guru Kala.png"; name = "Guru Kala" },
    @{file = "Guru Kala1.png"; name = "Guru Kala (Alternate)" },
    @{file = "Koran.png"; name = "Koran" },
    @{file = "LION-FORM-RUTHRA.png"; name = "Lion Form Ruthra" },
    @{file = "Yaali 01.png"; name = "Yaali 01" },
    @{file = "Yaali 02.png"; name = "Yaali 02" },
    @{file = "Yaali 03.png"; name = "Yaali 03" },
    @{file = "Yaali 04.png"; name = "Yaali 04" }
)

Write-Host "Character images to add: $($characters.Count)"
foreach ($char in $characters) {
    Write-Host "  - $($char.name) ($($char.file))"
}
