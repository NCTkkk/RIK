let n = [1, 2, 5, 3, 1, 2, 3, 6, 7, 2];
let k = false;
let m = [];

for (let i = 0; i < n.length; i++) {
  let count = 0;
  for (let j = 0; j < n.length; j++) {
    if (n[i] === n[j]) {
      count++;
    }
  }
  if (count === 1) {
    m.push(n[i]);
  }
}

console.log("Các phần tử phân biệt : " + m);
