const fs = require('fs');

const htmlPath = 'y:\\WEBSITE\\KarmaRebelsPitch\\index.html';

// Read the file
let content = fs.readFileSync(htmlPath, 'utf8');

console.log('Fixing encoding issues...');

// Define replacements
const replacements = [
    // Fix en-dash
    ['â€"', '–'],
    // Fix em-dash  
    ['â€"', '—'],
    // Fix Tamil text
    ['à®‡à®°à¯à®£à¯à®Ÿ à®•à®¾à®²à®®à¯', 'இருண்ட காலம்'],
];

// Apply replacements
replacements.forEach(([old, newChar]) => {
    if (content.includes(old)) {
        const count = (content.match(new RegExp(old.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'), 'g')) || []).length;
        console.log(`Replacing '${old}' with '${newChar}' (${count} occurrences)`);
        content = content.split(old).join(newChar);
    }
});

// Save with UTF-8 BOM
const BOM = '\uFEFF';
fs.writeFileSync(htmlPath, BOM + content, 'utf8');

console.log('\nEncoding issues fixed successfully!');
console.log('File saved with UTF-8 BOM encoding');
