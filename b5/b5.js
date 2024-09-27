let a = +(prompt("nhập a"));
let b = +(prompt("nhập b"));
let c = +(prompt("nhập c"));

if (a>b && b>c){
    console.log(c + " " + b + " " + a);
}

else if(a>c && c>b){
    console.log(b + " " + c + " " + a);
}

else if(b>a && a>c){
    console.log(c + " " + a + " " + b);
}

else if(b>c && c>a){
    console.log(a + " " + c + " " + b);
}

else if(c>b && b>a){
    console.log(a + " " + b + " " + c);
}

else{
    console.log(b + " " + a + " " + c);
}