let n = parseInt(prompt());
let s=1;
c=0;

for (i=2; i<=n; i++){
    s = s + 1/(i**3);
}

console.log("s= " + s);

// let rounded = s.toFixed(5); 
// console.log("s làm tròn: " + rounded);

let rounded = Math.round(s * 100000) / 100000; 
console.log("s làm tròn: " + rounded);