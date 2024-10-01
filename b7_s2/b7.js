let a = parseInt(prompt("nhập số dương bất kỳ"));
let b=0;

while (a > 0) {

    let du = a % 10;
    
    b = b * 10 + du;
    a = Math.floor(a / 10);
}

console.log("số đảo ngược là: " + b);