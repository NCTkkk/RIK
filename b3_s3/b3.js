let Arr = [5, 2, 6, 8, 6, -1, 4, 1, 7, 9];
let Brr = [];

for (let i = 0; i < Arr.length; i++) {
  if (Arr[i] > 0) {
    Brr[Arr[i]] = true;
  }
}

let n = 1;
while (Brr[n]) {
  n++;
}

console.log("số bé nhất lớn hơn 0 và chưa có trong mảng là: " + n);
