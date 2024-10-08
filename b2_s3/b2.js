let Arr = [2, 5, 7, 3, 2, 5, 8, 2, 0, 2, 3, 5];
const count = {};
let result = [];
for (let i = 0; i < Arr.length; i++) {
  count[Arr[i]] = (count[Arr[i]] || 0) + 1;
}
for (let key in count) {
  if (count[key] >= 2) {
    result.push(key);
  }
}
console.log(count);
console.log(result);
