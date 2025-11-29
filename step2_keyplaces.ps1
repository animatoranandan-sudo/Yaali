# Step 2: Add Key Places section and remove location image cards from mythology

$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$html = Get-Content $htmlPath -Raw

# Remove the location cards from mythology section  
$html = $html -replace '(?s)\s*<div class="loc-card">.*?Paazhi Tribe Territory</h3>\s*</div>\s*</div>\s*</div>\s*</section>\s*<!-- Locations', '                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Key Places of the Story -->
    <section id="key-places" class="content-section">
        <h2 class="section-title">KEY PLACES OF THE STORY</h2>
        <div class="container" style="max-width: 1200px;">
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(350px, 1fr)); gap: 2.5rem;">
                
                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-cyan);">
                    <h3 style="color: var(--neon-cyan); margin-bottom: 1rem; font-size: 1.5rem;">1. Stone Forest Ashram</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Located on rocky mountains.</li>
                        <li>• Guru training ground for princes.</li>
                        <li>• Cave of Destiny lies beneath.</li>
                        <li>• Early stone carvings resemble pre-Pallava art.</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-purple);">
                    <h3 style="color: var(--neon-purple); margin-bottom: 1rem; font-size: 1.5rem;">2. Cave of Destiny</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Multi-chamber mystical cave</li>
                        <li style="padding-left: 1.5rem;">- Sword Chamber</li>
                        <li style="padding-left: 1.5rem;">- Wing Core Chamber</li>
                        <li style="padding-left: 1.5rem;">- Echo Halls</li>
                        <li>• Housing relics that choose their owner</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-blue);">
                    <h3 style="color: var(--neon-blue); margin-bottom: 1rem; font-size: 1.5rem;">3. Floating Rock Island</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Ruthra homeland</li>
                        <li>• Floating stones drift on crystalline lake</li>
                        <li>• Underwater tunnels hide entrances and ancient runes</li>
                        <li>• Symbol of Sky Power</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-green);">
                    <h3 style="color: var(--neon-green); margin-bottom: 1rem; font-size: 1.5rem;">4. Pazhi Tribe Territory</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Waterfalls, rock-carved shrines, forest caves</li>
                        <li>• Early Yali carvings - raw, tribal, emotional</li>
                        <li>• Animal guardians roam freely</li>
                        <li>• Home of the Yali philosophy</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-orange);">
                    <h3 style="color: var(--neon-orange); margin-bottom: 1rem; font-size: 1.5rem;">5. Bell-Tower Network</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Towers placed every 5 miles across colonies</li>
                        <li>• Connected by sound signals and fire beacons</li>
                        <li>• Used to hunt the masked thief</li>
                        <li>• Ruthra escapes using Karuppusamy fear illusions</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-red);">
                    <h3 style="color: var(--neon-red); margin-bottom: 1rem; font-size: 1.5rem;">6. The Capital: KING Palace</h3>
                    <p style="color: #fff; margin-bottom: 0.5rem; font-weight: bold;">An early-stage stone kingdom:</p>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Carved base, brick top</li>
                        <li>• Half-built temple</li>
                        <li>• Deep pits for foundation</li>
                        <li>• Treasury vault</li>
                        <li>• Arena for rituals</li>
                        <li>• River source behind palace</li>
                        <li style="color: var(--neon-red); font-weight: bold; margin-top: 0.5rem;">Symbol of Land Power</li>
                    </ul>
                </div>

                <div style="background: rgba(0,0,0,0.6); padding: 2rem; border-radius: 12px; border-left: 4px solid var(--neon-cyan);">
                    <h3 style="color: var(--neon-cyan); margin-bottom: 1rem; font-size: 1.5rem;">7. Water Tunnel System</h3>
                    <ul style="list-style: none; padding: 0; color: #ccc; line-height: 1.8;">
                        <li>• Hidden network beneath island</li>
                        <li>• Navigation only possible with calm breath</li>
                        <li>• Acts as Ruthra stealth route</li>
                    </ul>
                </div>

            </div>
        </div>
    </section>

    <!-- Locations'

$html | Set-Content $htmlPath -NoNewline
Write-Host "Step 2 Complete!" -ForegroundColor Green
