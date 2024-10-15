let books = [
  { author: "J.K", name: "Harry Potter and the Sorcerer's Stone" },
  { author: "George", name: "1984" },
  { author: "Harper", name: "To Kill a Mockingbird" },
  { author: "J.R.R", name: "The Lord of the Rings" },
];

let n = prompt("bạn hãy nhập tên tác giả để tìm sách");

function findBook(author) {
  for (let i = 0; i < books.length; i++) {
    if (books[i].author.toLowerCase() === author.toLowerCase()) {
      return books[i];
    }
  }
  return null;
}

let a = findBook(n);

if (a) {
  console.log("đã tìm thấy : " + a.author + " " + a.name);
} else {
  console.log("không tìm thấy");
}
