function countTG(arr) {
  let n = arr.length;
  let count = 0;

  arr.sort((a, b) => a - b);

  for (let i = 0; i < n - 2; i++) {
    for (let j = i + 1; j < n - 1; j++) {
      for (let k = j + 1; k < n; k++) {
        if (arr[i] + arr[j] > arr[k]) {
          count++;
        } else {
          break;
        }
      }
    }
  }
  return count;
}

let arr = [4, 6, 3, 7];
num = countTG(arr);
console.log(num);
