let n = parseInt(prompt("nhập tháng:"));

if (n<=0 || n>=13){
    console.log("ko có tháng này");
}

else{
    if(n === 1 || n === 3 || n === 5 || n === 7 || n === 8 || n === 10 || n === 12){
        console.log("tháng " + n + " có 31 ngày");
    }
    else if(n === 2){
        console.log("tháng " + n + " có 28 hoặc 29 ngày");
    }
    else{
        console.log("tháng " + n + " có 30 ngày");
    }
}


