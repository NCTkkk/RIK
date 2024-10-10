function NTinArray(arr) {
  let a = [];

  for (let sub of arr) {
    let isPrime = true;
    if (sub > 1) {
      for (let i = 2; i <= Math.sqrt(sub); i++) {
        if (sub % i === 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) {
        a.push(sub);
      }
    }
  }
  return a;
}
let n = [1, 2, 3, 4, 5, 6, 7, 8, 9];
console.log(NTinArray(n));
