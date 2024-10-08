let a = [1, 3, 2, 3, 6, 7, 10, 8, 9];
let b = [];
let c = [];

a.sort((x, y) => x - y);
console.log(a);
for (let i = 0; i < a.length; i++) {
  if (a[i] % 2 !== 0) {
    b.push(a[i]);
  } else {
    c.unshift(a[i]);
  }
}

for (let i = 0; i < c.length; i++) {
  b.unshift(c[i]);
}

console.log(b);
