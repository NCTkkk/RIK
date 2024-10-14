function upperEndSign(string) {
  let words = string.split(" ");
  let result = words.map((word) => {
    if (word.length > 0) {
      let rest = word.slice(0, word.length - 1);
      let lastChar = word.charAt(word.length - 1).toUpperCase();
      return rest + lastChar;
    }
    return word;
  });
  return result.join(" ");
}

let string = prompt("hãy nhập ký tự của bạn");
console.log(upperEndSign(string));
