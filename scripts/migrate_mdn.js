const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const MDN_REPO_URL = 'https://github.com/mdn/content.git';
const DOCS_DIR = path.resolve(__dirname, '..');
const CLONE_DIR = path.join(DOCS_DIR, 'mdn_clone');
const TARGET_DIR = path.join(DOCS_DIR, 'web-platform', 'mdn');

if (!fs.existsSync(CLONE_DIR)) {
    console.log("Cloning MDN repo...");
    execSync(`git clone --depth 1 ${MDN_REPO_URL} ${CLONE_DIR}`, { stdio: 'inherit' });
}

const sourceBase = path.join(CLONE_DIR, 'files', 'en-us', 'web');

if (!fs.existsSync(sourceBase)) {
    console.error(`Source base directory not found: ${sourceBase}`);
    process.exit(1);
}

let count = 0;

function processDirectory(dir) {
    if (!fs.existsSync(dir)) return;

    let files;
    try {
        files = fs.readdirSync(dir);
    } catch (e) {
        return;
    }

    for (const file of files) {
        const fullPath = path.join(dir, file);
        let stat;
        try {
            stat = fs.statSync(fullPath);
        } catch (e) {
            continue;
        }

        if (stat.isDirectory()) {
            processDirectory(fullPath);
            // Attempt to remove directory if it is now empty
            try { fs.rmdirSync(fullPath); } catch (e) { /* Ignore if not empty */ }
        } else if (file === 'index.md' || file === 'index.html') {
            const relativePath = path.relative(sourceBase, dir);
            const targetEntryDir = path.join(TARGET_DIR, relativePath);
            
            // 1. Create target structure
            fs.mkdirSync(targetEntryDir, { recursive: true });
            
            // 2. Read source content
            const content = fs.readFileSync(fullPath, 'utf8');
            
            // 3. Write README.md
            fs.writeFileSync(path.join(targetEntryDir, 'README.md'), content);
            
            // 4. Create blank V2 templates if they don't exist
            const fringePath = path.join(targetEntryDir, 'fringe-cases.md');
            if (!fs.existsSync(fringePath)) {
                fs.writeFileSync(fringePath, '# Fringe Cases\n\nDocument edge cases here.\n');
            }
            
            const altPath = path.join(targetEntryDir, 'alternatives.md');
            if (!fs.existsSync(altPath)) {
                fs.writeFileSync(altPath, '# Alternatives\n\nDocument alternative patterns here.\n');
            }
            
            const crossPath = path.join(targetEntryDir, 'cross-reference.md');
            if (!fs.existsSync(crossPath)) {
                fs.writeFileSync(crossPath, '# Cross-Reference\n\nLink to equivalent concepts.\n');
            }
            
            // 5. Delete source file
            fs.unlinkSync(fullPath);
            count++;
            
            if (count % 1000 === 0) {
                console.log(`Processed ${count} entries...`);
            }
        }
    }
}

console.log("Processing MDN entries...");
processDirectory(sourceBase);
console.log(`Done. Processed ${count} entries.`);
