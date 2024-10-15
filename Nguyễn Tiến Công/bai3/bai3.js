let arr = [
  "one",
  "two",
  "three",
  "one",
  "one",
  "four",
  "five",
  "four",
  "five",
  "five",
];

for (let i = 0; i < arr.length - 1; i++) {
  for (j = i + 1; j < arr.length; j++) {
    if (arr[i] === arr[j]) {
      arr.splice(j);
    }
  }
}

console.log(arr);
