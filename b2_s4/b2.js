let s = "hello world";
let n = "old";

function checkSign(s, n) {
  let count = 0;
  for (let i = 0; i < n.length; i++) {
    for (let j = 0; j < s.length; j++) {
      if (n[i] === s[j]) {
        count++;
        break;
      }
    }
  }
  console.log(count);
  if (count === n.length) {
    return true;
    console.log(count);
  } else {
    return false;
    console.log(count);
  }
}

console.log(checkSign(s, n));
