let arr = [5, 2, 3, 4, 1];

for (let i = 0; i < arr.length; i++) {
  let id = i;
  for (let j = i + 1; j < arr.length; j++) {
    if (arr[id] > arr[j]) {
      id = j;
    }
  }
  let temp = arr[i];
  arr[i] = arr[id];
  arr[id] = temp;
}

console.log(arr);
