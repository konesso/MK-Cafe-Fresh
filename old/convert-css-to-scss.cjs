const fs = require('fs');
const sass = require('sass');

// Read the contents of index-old.scc
const sccContents = fs.readFileSync('./index-old.scc', 'utf8');

// Convert the SCC contents to SCSS
const scssContents = sass.convert({ data: sccContents, syntax: 'scss' }).css.toString();

// Write the SCSS contents to new-index.scss
fs.writeFileSync('new-index.scss', scssContents);
