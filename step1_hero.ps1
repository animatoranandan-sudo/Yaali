# Step 1: Restructure Hero Section - Move title and tagline above video

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$html = Get-Content $htmlPath -Raw

# Define the new hero section structure
$newHeroSection = @"
    <!-- Hero Section -->
    <section id="hero" class="hero">
        <!-- Title centered at top -->
        <div style="text-align: center; margin-bottom: 2rem;">
            <img src="images/Titles/Project Title.png" alt="YAALI: KARMA REBELS"
                style="max-width: 60%; height: auto; display: inline-block;">
        </div>

        <!-- Tagline below title -->
        <div style="text-align: center; margin-bottom: 3rem;">
            <h2 style="color: var(--neon-cyan); font-family: var(--font-heading); font-size: 2.2rem; margin: 0.5rem 0; letter-spacing: 4px; text-shadow: 0 0 20px rgba(0, 255, 255, 0.5), 0 0 40px rgba(0, 255, 255, 0.3); font-weight: 700; text-transform: uppercase;">
                KARMA REBELS THROUGH YAALI</h2>
            <h2 style="color: var(--neon-orange); font-family: var(--font-heading); font-size: 2.2rem; margin: 0.5rem 0; letter-spacing: 4px; text-shadow: 0 0 20px rgba(255, 140, 0, 0.5), 0 0 40px rgba(255, 140, 0, 0.3); font-weight: 700; text-transform: uppercase;">
                WHEN SWORD MEETS WINGS</h2>
        </div>

        <!-- Logo animation - smaller, centered -->
        <div style="max-width: 600px; margin: 0 auto 3rem auto;">
            <video autoplay loop muted playsinline style="width: 100%; height: auto; display: block; object-fit: contain;">
                <source src="images/videos/Logo Animation/Logo animation.mp4" type="video/mp4">
            </video>
        </div>

        <div class="button-grid">
            <a href="#story" class="neon-btn">STORY</a>
            <a href="#synopsis" class="neon-btn">SYNOPSIS</a>
            <a href="#mythology" class="neon-btn">MYTHOLOGY</a>
            <a href="#char-desc" class="neon-btn">CHARACTERS</a>
            <a href="#loc-desc" class="neon-btn">LOCATIONS</a>
            <a href="#scenes" class="neon-btn">SCENES</a>
            <a href="#previz" class="neon-btn">PREVIZ</a>
            <a href="#team" class="neon-btn">TEAM</a>
        </div>
    </section>
"@

# Find and replace the hero section
$pattern = '(?s)    <!-- Hero Section -->.*?</section>'
$html = $html -replace $pattern, $newHeroSection

# Save
$html | Set-Content $htmlPath -NoNewline

Write-Host "Step 1 Complete: Hero section restructured!" -ForegroundColor Green
