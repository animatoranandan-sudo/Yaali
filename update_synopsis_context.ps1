# Read the HTML file
$htmlPath = "y:\WEBSITE\KarmaRebelsPitch\index.html"
$content = Get-Content $htmlPath -Raw -Encoding UTF8

# Define the new synopsis text
$newSynopsis = @"
                <p style="margin-bottom: 1rem;"><strong style="color: var(--neon-red);">Setting:</strong> 6th Century Southern India, Age of Shadows.</p>
                <p style="margin-bottom: 1rem;">
                    Prince Ruthra, exiled and living as a thief after the ruthless Emperor Raya usurped his kingdom, is compelled to confront his destiny. Guided by the fierce rebel Kshala, Ruthra learns his lineage holds the last unbroken link to the sunken continent of Lemuria, and its fate is bound to his own.
                </p>
                <p style="margin-bottom: 1rem;">
                    Raya's power stems from the Sword of Pride, a relic infused with the same corrupted Lemurian energy that sank the ancient world. To defeat him, Ruthra must undertake the rigorous Yaali Trials, mastering the profound ancestral philosophy of Fear Transformation.
                </p>
                <p>
                    This is more than a struggle for a throne; it is the final clash between Balance and Corruption. Ruthra's victory is the only path to close the 2,000-year-old karmic loop, restoring Earth's energy equilibrium and ending the tyranny that began in the ancient Cave of Destiny.
                </p>
"@

# Replace the synopsis section
$oldSynopsisPattern = '(?s)(<p style="margin-bottom: 1rem;"><strong style="color: var\(--neon-red\);">Setting:</strong> 6th\r\n\s+century\r\n\s+Southern India</p>\r\n\s+<p>\r\n\s+Prince Ruthra, alienated as a thief.*?Cave of Destiny\.\r\n\s+</p>)'
$content = $content -replace $oldSynopsisPattern, $newSynopsis

# Save the file
$content | Set-Content $htmlPath -Encoding UTF8 -NoNewline

Write-Host "Synopsis section updated successfully!" -ForegroundColor Green
