function sortString(string) {
  let a = [];
  let b = [];
  let c = [];
  for (let char of string) {
    if (/[a-zA-Z]/.test(char)) {
      a.push(char);
    } else if (/[0-9]/.test(char)) {
      b.push(char);
    } else {
      c.push(char);
    }
  }
  return a.concat(b).concat(c);
}
let n = prompt("nhập chuỗi của bạn");
console.log("chuỗi ban đầu của bạn : " + n);
console.log("chuỗi sau khi được sắp xếp: " + sortString(n));
