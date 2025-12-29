# Read the HTML file
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$content = Get-Content $htmlPath -Raw -Encoding UTF8

# Define the new Context & Lore section
$newContextSection = @'
    <!-- Mythology / Context -->
    <section id="mythology" class="content-section alt-bg">
        <h2 class="section-title">🌎 CONTEXT & CORE LORE</h2>
        <div class="container">
            <!-- First Row: Story World Summary and Core Mythology -->
            <div class="grid-2" style="display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; align-items: start; margin-bottom: 3rem;">
                <div>
                    <h3 style="color: var(--neon-cyan); margin-bottom: 1rem;">1. Story World Summary</h3>
                    <p style="color: #ccc; line-height: 1.6; margin-bottom: 2rem;">
                        The story is set in a period of Mystical Realism in 6th-century South India, characterized by historical Dravidian culture and ancient fantasy elements. The central conflict originates in the Cave of Destiny, where two princes chose relics: Prince Raya (the Magic Sword of Pride) and Prince Cheliya (the Winged Armor of Awareness). Raya kills Cheliya's righteous father, Sellia, and exiles the young Prince Ruthra, who is raised in secret as a masked rebel. Guided by his mentor Sidh and the rebel Kshala, Ruthra must awaken his ancestral Wing Power, confront his fear through the Yaali philosophy, and lead a rebellion against the tyrannical Emperor Raya.
                    </p>
                </div>
                <div>
                    <h3 style="color: var(--neon-purple); margin-bottom: 1rem;">2. Core Mythology: The Yaali and Fear Transformation</h3>
                    <p style="color: #ccc; line-height: 1.6; margin-bottom: 1.5rem;">
                        The Yaali (யாளி) is not merely a mythic beast but the philosophical spine of the story, rooted in the Irunda Kaalam (Black Age).
                    </p>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.6;">
                        <li style="margin-bottom: 1rem;">
                            <strong style="color: var(--neon-red);">Origin:</strong> The tribal sculptors, the Pazhi Makkal (Kshala's tribe), learned that fear, when suppressed, destroys, but when shaped into form, it transforms into strength. The Yaali is the mind reborn through courage.
                        </li>
                        <li style="margin-bottom: 1rem;">
                            <strong style="color: var(--neon-orange);">Three Forms of Fear Mastery:</strong>
                            <ul style="list-style: circle; padding-left: 1.5rem; margin-top: 0.5rem;">
                                <li><strong>Hunter (Bhaktin/Black Hills Master):</strong> Mastery of the fear of being hunted.</li>
                                <li><strong>Sentinel (Winged Armor Master):</strong> Mastery of the fear of overwhelming force.</li>
                                <li><strong>Chaos (Inner Tribe Master):</strong> Mastery of the fear of chaos/the unknown.</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Second Row: Cosmology & The Karmic Loop -->
            <div style="background: rgba(0,0,0,0.4); padding: 2rem; border-radius: 10px; border: 1px solid #444;">
                <h3 style="color: var(--neon-green); margin-bottom: 1.5rem; text-align: center;">3. Cosmology & The Karmic Loop</h3>
                
                <div style="margin-bottom: 2rem;">
                    <h4 style="color: var(--neon-cyan); margin-bottom: 0.8rem;">3.1. Lemuria – The Lost Continent</h4>
                    <p style="color: #ccc; line-height: 1.6;">
                        Lemuria was an ancient super-civilization that thrived in harmonic balance with Earth's cosmic energy fields. When its rulers exploited this energy, they broke universal karmic law, resulting in the Kadarkol—a cosmic tectonic shift and deluge that sank the continent. Its energy survived, sealed within hidden nodes across the world.
                    </p>
                </div>

                <div style="margin-bottom: 2rem;">
                    <h4 style="color: var(--neon-purple); margin-bottom: 0.8rem;">3.2. Earth's Energy Network</h4>
                    <p style="color: #ccc; line-height: 1.6; margin-bottom: 0.8rem;">Lemurians built their lives around:</p>
                    <ul style="list-style: disc; padding-left: 1.5rem; color: #ccc; line-height: 1.6;">
                        <li><strong>Energy Currents:</strong> Nadi-like oceanic channels.</li>
                        <li><strong>Cave Nodes:</strong> Places where energy concentrates.</li>
                        <li><strong>Cosmic Echo Repositories:</strong> Memory fields carried across generations.</li>
                    </ul>
                    <p style="color: #ccc; line-height: 1.6; margin-top: 0.8rem;">
                        These nodes, often located in fault-line temples and natural vortex zones like the Cave of Destiny, still hold fragments of Lemuria's power.
                    </p>
                </div>

                <div>
                    <h4 style="color: var(--neon-orange); margin-bottom: 0.8rem;">3.3. The Karma Loop</h4>
                    <p style="color: #ccc; line-height: 1.6; margin-bottom: 0.8rem;">
                        When Lemuria fell, its collective negative karma shifted forward in time, creating a "loop" that binds Earth's tectonic balance to the destiny of one bloodline (Ruthra's). This imbalance manifests as unstable energy currents and repeating patterns of human conflict. The loop can only be closed when:
                    </p>
                    <ul style="list-style: disc; padding-left: 1.5rem; color: #ccc; line-height: 1.6;">
                        <li>A vessel with compatible Lemurian ancestry rises (Ruthra).</li>
                        <li>The corrupted counterpart (Raya) is defeated.</li>
                        <li>Balance is restored, causing the Earth to stabilize and the Lemurian echoes to return to silence.</li>
                    </ul>
                </div>
            </div>

            <!-- Time Period Section -->
            <div style="margin-top: 3rem;">
                <h3 style="color: var(--neon-red); margin-bottom: 1rem;">4. TIME PERIOD OF THE STORY</h3>
                <p style="color: #ccc; line-height: 1.6; margin-bottom: 1rem;"><strong>Approx. 6th–7th Century South India — Irunda Kaalam (இருண்ட காலம்)</strong></p>
                <p style="color: #ccc; line-height: 1.6; margin-bottom: 0.8rem;">
                    The story is set during the Irunda Kaalam, the "Dark Period" after the Kalabhra rule, when:
                </p>
                <ul style="list-style: disc; padding-left: 1.5rem; color: #ccc; line-height: 1.6;">
                    <li>Political records were minimal</li>
                    <li>Dynasties like Chera–Chola–Pandya lost clarity</li>
                    <li>Philosophical works like Thirukkural, Naaladiyar were written</li>
                    <li>No major religion was highlighted — pure ethics & wisdom flourished</li>
                    <li>Small kingdoms, island colonies, and tribal belts existed with cultural freedom</li>
                    <li>Sculpting traditions that would later evolve into Pallava & Chola stone architecture were just beginning</li>
                </ul>
            </div>
        </div>
    </section>
'@

# Replace the entire Context & Lore section (from line 103 to 174)
$oldContextPattern = '(?s)(\s+<!-- Mythology / Context -->.*?</section>)'
$content = $content -replace $oldContextPattern, "`r`n$newContextSection"

# Save the file
$content | Set-Content $htmlPath -Encoding UTF8 -NoNewline

Write-Host "Context & Lore section updated successfully!" -ForegroundColor Green
