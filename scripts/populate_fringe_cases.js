const fs = require('fs');
const path = require('path');

const DOCS_DIR = path.resolve(__dirname, '..');
const TARGET_DIR = path.join(DOCS_DIR, 'web-platform', 'mdn');

function extractFringeCases(markdown) {
    const lines = markdown.split('\n');
    let exceptionsContent = [];
    let securityContent = [];
    let warningsContent = [];
    
    let currentSection = null; // 'exceptions' or 'security'
    let currentHeaderLevel = 0;
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        const trimmed = line.trim();
        
        // Check for headers
        const headerMatch = line.match(/^(#{2,4})\s+(Exceptions|Security)\b/i);
        if (headerMatch) {
            currentSection = headerMatch[2].toLowerCase();
            currentHeaderLevel = headerMatch[1].length;
            continue;
        }
        
        if (currentSection) {
            // Check if we hit a header of equal or higher level (less or equal number of #)
            const nextHeaderMatch = line.match(/^(#{2,4})\s+/);
            if (nextHeaderMatch && nextHeaderMatch[1].length <= currentHeaderLevel) {
                currentSection = null;
                currentHeaderLevel = 0;
            } else {
                if (currentSection === 'exceptions') {
                    exceptionsContent.push(line);
                } else if (currentSection === 'security') {
                    securityContent.push(line);
                }
            }
        }
        
        // Capture warning/note blockquotes
        if (trimmed.startsWith('>')) {
            const lowerLine = trimmed.toLowerCase();
            if (
                lowerLine.includes('**warning:**') || 
                lowerLine.includes('**note:**') || 
                lowerLine.includes('**caution:**') ||
                lowerLine.includes('[!warning]') ||
                lowerLine.includes('[!caution]') ||
                lowerLine.includes('[!note]') ||
                lowerLine.includes('[!important]')
            ) {
                let blockquote = [line];
                // Read ahead to capture the rest of this blockquote block
                while (i + 1 < lines.length && lines[i + 1].trim().startsWith('>')) {
                    i++;
                    blockquote.push(lines[i]);
                }
                warningsContent.push(blockquote.join('\n'));
            }
        }
    }
    
    return {
        exceptions: exceptionsContent.join('\n').trim(),
        security: securityContent.join('\n').trim(),
        warnings: warningsContent.join('\n\n').trim()
    };
}

let totalProcessed = 0;
let actualFringeCasesCount = 0;

function traverseDirectory(dir) {
    if (!fs.existsSync(dir)) return;
    
    const files = fs.readdirSync(dir);
    
    for (const file of files) {
        const fullPath = path.join(dir, file);
        const stat = fs.statSync(fullPath);
        
        if (stat.isDirectory()) {
            traverseDirectory(fullPath);
        } else if (file === 'README.md') {
            const readmeContent = fs.readFileSync(fullPath, 'utf8');
            const { exceptions, security, warnings } = extractFringeCases(readmeContent);
            
            const fringeFilePath = path.join(dir, 'fringe-cases.md');
            
            let newContent = '';
            
            if (exceptions || security || warnings) {
                newContent += `# Fringe Cases\n\n`;
                
                if (warnings) {
                    newContent += `## Warnings & Notes\n\n${warnings}\n\n`;
                }
                if (exceptions) {
                    newContent += `## Exceptions\n\n${exceptions}\n\n`;
                }
                if (security) {
                    newContent += `## Security Notes\n\n${security}\n\n`;
                }
                
                actualFringeCasesCount++;
            } else {
                newContent = `# Fringe Cases\n\nNo explicit exceptions, security issues, or warnings are documented for this entry in the MDN sources.\n`;
            }
            
            fs.writeFileSync(fringeFilePath, newContent);
            totalProcessed++;
            
            if (totalProcessed % 1000 === 0) {
                console.log(`Evaluated ${totalProcessed} entries...`);
            }
        }
    }
}

console.log("Analyzing MDN documentation for fringe cases...");
traverseDirectory(TARGET_DIR);
console.log(`Done. Processed ${totalProcessed} entries. Populated ${actualFringeCasesCount} files with actual fringe case data.`);
