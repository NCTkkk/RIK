let string = prompt("nhập vào chuỗi của bạn");

let arr = string.split("");
let arr2 = [];

for (let i = arr.length; i >= 0; i--) {
  arr2.push(arr[i]);
}

let result = arr2.join("");
console.log("chuỗi bạn nhập vào: " + string);
console.log("chuỗi sau khi đảo ngược: " + result);
