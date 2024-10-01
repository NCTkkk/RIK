let n = parseInt(prompt("nhập 1 số nguyên dương"));
let a = 0, b = 1, next;
let sum = a+b;

console.log(a);
console.log(b); 

while (sum<n){
    next = a+b;
    console.log(next); 
    sum += next; 
    a = b; 
    b = next;
}
console.log("sum = " + sum);
