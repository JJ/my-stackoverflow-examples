const child_process = require("child_process");

const path = require("path");

const targetArchive = "/tmp/example.zip";
const sourceDir = path.join(__dirname, "node_modules", "sprintf-js", "dist");
const args = ["-r", targetArchive, "*"];
child_process.execFileSync("zip", args, { cwd: sourceDir, shell: true });
