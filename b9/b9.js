let x = +(prompt());

if(x % 4 === 0){
    if(x % 100 ===0){
        if(x % 400 ===0){
            console.log("năm " + x + " là năm nhuận");
        }
        else{
            console.log("năm " + x + " không phải năm nhuận");
        }
    }
    else{
        console.log("năm " + x + " là năm nhuận");
    }
}

else{
    console.log("năm " + x + " không phải năm nhuận")
}