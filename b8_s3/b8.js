let n = [1, 2, 3, 1, 2, 3, 4, 5, 5, 6];
let m = [1, 1, 2, 2, 3, 3];
let k = false;
for (let i = 0; i < m.length; i++) {
  let count = 0;
  for (let j = 0; j < m.length; j++) {
    if (m[i] === m[j]) {
      count++;
    }
  }
  if (count === 1) {
    console.log("Phần từ độc nhất đầu tiên của mảng là: " + n[i]);
    k = true;
    break;
  }
}

if (!k) {
  console.log("Ko có phần tử độc nhất trong mảng này !!!");
}
