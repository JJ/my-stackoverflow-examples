let rexed = "[x]";
["[", "]"].forEach((element) => {
  rexed.replace(element, String.raw`\${element}`);
});

console.log(rexed);

const re1 = new RegExp(rexed);
console.log(re1);
console.log(re1.test("x"));
