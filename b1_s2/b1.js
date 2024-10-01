let a = 10;
let n = +(prompt("try to guess the number"));

while (n !==a ){
    if(n>a){
        alert("số bạn lớn quá !!!");
    }
    else{
        alert("số bạn bé quá !!!");
    }
    n = +(prompt("try again"));
}

alert("perfect !!!");