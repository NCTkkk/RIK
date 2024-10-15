let string = prompt("nhập chuỗi của bạn");
let string1 = string.toLowerCase();
console.log("string1 " + string1);

let arr = string1.split("");
let arr1 = arr[0].toUpperCase();
console.log(arr1);

let result = [arr1];

for (let i = 1; i < arr.length; i++) {
  if (arr[i - 1] === " ") {
    arr[i].toUpperCase();
    result.push(arr);
  }
}

console.log(result);
