let c1 = +(prompt("độ dài cạnh 1 của tam giác"));
let c2 = +(prompt("độ dài cạnh 2 của tam giác"));
let c3 = +(prompt("độ dài cạnh 3 của tam giác"));

if ((c1+c2)>c3 && (c2+c3)>c1 && (c1+c3)>c2){
    console.log("hợp lệ");
}
else{
    console.log("ko hợp lệ");
}