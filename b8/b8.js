let a = +(prompt("nhập a"));
let b = +(prompt("nhập b"));
let c = +(prompt("nhập c"));

// nếu a=0 thì ra pt bậc 1
// nếu a !=0 thì tính delta, d = b**2-4ac 
// nếu d > 0 thì có 2 nghiệm, <0 thì vô nghiệm, = 0 thì có 1 nghiệm x = -b/2a
// trường hợp d > 0 thì nghiệm x1 =  (-b+math.sqrt(d))/2a, x2 = (-b-math.sqrt(d))/2a

if(a===0){
    // bx+c=0
    if(b===0){
        if(c===0){
            console.log("vô số nghiệm");
        }
        else{
            console.log("vô nghiệm");
        }
    }
    else{
        x = (-b)/c;
        console.log("đáp án: "+ x);    
    }
}
else{
    let d = b**2 - 4*a*c
    if(d<0){
        console.log("vô nghiệm");
    }
    else if(d===0){
        let x = (-b)/(2*a)
        console.log("PT có 1 nghiệm là: " + x);
    }
    else{
        let x1= (-b + Math.sqrt(d))/(2*a);
        let x2 = (-b - Math.sqrt(d))/(2*a);
        console.log("PT có 2 nghiệm phân biệt: x1 = " + x1 + " và x2 = " + x2);
    }
}
