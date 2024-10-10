let n = parseInt(prompt());

function b5(n) {
  let arr = [];
  let sum = 0;
  for (let i = 1; i < n; i += 2) {
    arr.push(i);
    sum = sum + i;
  }
  if (sum % 2 === 0) {
    let a = arr.pop();
    sum -= a;
  }
  console.log("sum = " + sum);

  return arr;
}

console.log(b5(n));
