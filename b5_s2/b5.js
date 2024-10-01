let n = parseInt(prompt("Nhập số nguyên dương n:"));
let a = '';
let b = '';
for (let i = 1; i <= n; i++) {

    for (let j = 1; j <= i; j++) {
      a += '*'; 
    }
    console.log(a );
    a = '';   
}

for (let i = 1; i <= n; i++) {

    for (let k = n - i; k >= 1; k--) {
        b += ' '; 
    }

    for (let l = 1; l <= i; l++) {
        b += '*'; 
      }
    console.log(b);
    b = '';
}
