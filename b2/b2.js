t = prompt();
v = prompt();
a = prompt();

toan = +t;
van = +v;
anh = +a;

tB = (toan + van + anh)/3

// if (tB>=8 && tB<=10){
//     console.log("Điểm tB: " + tB + " => xếp loại GIỎI");
// }
// else if (tB>=6.5 && tB<=7.9){
//     console.log("Điểm tB: " + tB + " => xếp loại KHÁ");
// }
// else if (tB>=5 && tB<=6.4){
//     console.log("Điểm tB: " + tB + " => xếp loại TRUNG BÌNH");
// }
// else if (tB<=5){
//     console.log("Điểm tB: " + tB + " => xếp loại YẾU");
// }

switch(true){
    case (tB>=8 && tB<=10):
        console.log("Điểm tB: " + tB + " => xếp loại GIỎI");
        break;
    case (tB>=6.5 && tB<=7.9):
        console.log("Điểm tB: " + tB + " => xếp loại KHÁ");
        break;
    case (tB>=5 && tB<=6.4):
        console.log("Điểm tB: " + tB + " => xếp loại TRUNG BÌNH");
        break;
    case (tB<=5):
        console.log("Điểm tB: " + tB + " => xếp loại YẾU");
        break; 
}