#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Fix encoding issues in the HTML file."""

import codecs

html_path = r"y:\WEBSITE\KarmaRebelsPitch\index.html"

# Read the file with UTF-8 encoding
with codecs.open(html_path, 'r', encoding='utf-8') as f:
    content = f.read()

print("Fixing encoding issues...")

# Define replacements for corrupted characters
replacements = {
    # Fix en-dash (–) appearing as â€"
    'â€"': '–',
    # Fix em-dash (—) appearing as â€"
    'â€"': '—',
    # Fix corrupted Tamil characters
    'à®‡à®°à¯à®£à¯à®Ÿ à®•à®¾à®²à®®à¯': 'இருண்ட காலம்',
}

# Apply replacements
for old, new in replacements.items():
    if old in content:
        count = content.count(old)
        print(f"Replacing '{old}' with '{new}' ({count} occurrences)")
        content = content.replace(old, new)

# Save the file with UTF-8 BOM
with codecs.open(html_path, 'w', encoding='utf-8-sig') as f:
    f.write(content)

print("\nEncoding issues fixed successfully!")
print("File saved with UTF-8 BOM encoding")
