let a = +(prompt("nhập a"));
let b = +(prompt("nhập b"));

if(a===0){
    if(b===0){
        console.log("vô số nghiệm");
    }
    else{
        console.log("vô nghiệm");
    }
}

else{
    let x = (-b)/a;
    console.log("kết quả phương trình là: " + x);
}