weight = +(prompt("nhập cân nặng đê"));
height = +(prompt("nhập chiều cao đê"));

bmi = weight/(height**2);

switch(true){
    case(bmi<18.5):
        console.log(bmi + " Gầy");
        break;
    case(bmi>=18.5 && bmi<=24.9):
        console.log(bmi + " Bình thường");
        break;
    case(bmi>=25 && bmi<=29):
        console.log(bmi + " Tiền béo phì");
        break;
    case(bmi>=30 && bmi<=34.9):
        console.log(bmi + " Béo phì độ 1");
        break;
    case(bmi=35 && bmi<=39.9):
        console.log(bmi + " Béo phì độ 2");
        break;
    case(bmi>=40):
        console.log(bmi + " Béo phì độ 3");
        break;
}