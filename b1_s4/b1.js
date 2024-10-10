let n = [1, 4, 6, 1, 2, 7, 9, 3, 12];
let a = +prompt("nhập vào 1 số nguyên");

function ham(n, a) {
  let sum = 0;
  let m = [];
  for (let i = 0; i < n.length - 1; i++) {
    for (let j = i + 1; j < n.length; j++) {
      sum = n[i] + n[j];
      if (sum === a) {
        m.push(n[i]);
        m.push(n[j]);
        console.log("cặp số đó là: " + m);
      }
    }
    break;
  }
}

ham(n, a);
