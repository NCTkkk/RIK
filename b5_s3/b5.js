let a = [1, 2, 3, 4, 5];
let b = [-3, -1, 0, 1, 5];
let c = [1, 5, 6, 7];
let Arr = [];

for (let i = 0; i < a.length; i++) {
  for (let j = 0; j < b.length; j++) {
    for (let k = 0; k < c.length; k++) {
      if (a[i] === b[j] && b[j] === c[k]) {
        Arr.push(a[i]);
      }
    }
  }
}
console.log(Arr);
