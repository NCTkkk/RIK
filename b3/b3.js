let a = +(prompt("nhập a"));
let b = +(prompt("nhập b"));
let c = +(prompt("nhập c"));

let max;

if(a>=b && a>=c){
    max = a;
} 
else if(b>=a && b>=c){
    max = b;
}
else{
    max = c;
}

console.log("Số lớn nhất là - " + max);
