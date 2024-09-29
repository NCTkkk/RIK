let year = parseInt(prompt("nhập năm"));
let m = parseInt(prompt("nhập tháng"));

if((year%4 === 0 && year%100 !== 0 ) || (year%400 ===0)){

    console.log("năm " + year + " có 366 ngày");

    if (m<=0 || m>=13){
        console.log("ko có tháng " + m);
    }
    else{
        if(m === 1 || m === 3 || m === 5 || m === 7 || m === 8 || m === 10 || m === 12){
           console.log("tháng " + m + " của năm " + year + " có 31 ngày");
        }
        else if(m === 2){
            console.log("tháng " + m + " của năm " + year + " có 29 ngày");
        }
        else{
            console.log("tháng " + m + " của năm " + year + " có 30 ngày")
        }
    }
}

else{

    console.log("năm " + year + " có 365 ngày");

    if (m<=0 || m>=13){
        console.log("ko có tháng " + m);
    }
    else{
        if(m === 1 || m === 3 || m === 5 || m === 7 || m === 8 || m === 10 || m === 12){
            console.log("tháng " + m + " của năm " + year + " có 31 ngày");
         }
         else if(m === 2){
             console.log("tháng " + m + " của năm " + year + " có 28 ngày");
         }
         else{
             console.log("tháng " + m + " của năm " + year + " có 30 ngày")
         }
    }
}

