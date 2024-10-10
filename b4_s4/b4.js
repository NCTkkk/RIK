let n1 = [1, 2, 3, 2, 1];
let n2 = ["z", "z"];
let n3 = [1, 2, 3, 4];

function isDX(arr) {
  for (let i = 0; i < arr.length / 2; i++) {
    if (arr[i] !== arr[arr.length - 1 - i]) {
      return false;
    } else {
      return true;
    }
  }
}

console.log(isDX(n1));
console.log(isDX(n2));
console.log(isDX(n3));
