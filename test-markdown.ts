import * as fs from 'fs';

const checklist = /\s*\-\s+\[\s*([xX]?)\s*\]\s+(.+?)\.\s+/mg;
const file = fs.readFile('__tests__/example.markdown', "utf8", (e, data) => {
    if (e) throw e;
    var match = checklist.exec(data);
    while (match != null) {
        // matched text: match[0]
        // match start: match.index
        // capturing group n: match[n]
        console.log(match[1], match[2])
        match = checklist.exec(data);
    }
});
