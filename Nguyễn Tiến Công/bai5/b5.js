let list = [
  {
    id: 1,
    name: "Nguyễn Văn A",
    age: 20,
  },
  {
    id: 2,
    name: "Nguyễn Văn B",
    age: 21,
  },
  {
    id: 3,
    name: "Nguyễn Văn C",
    age: 22,
  },
];

let n = prompt("nhập yêu cầu của bạn").toLowerCase();

if (n === "c") {
  let id = list.length + 1;
  let name = prompt("nhập tên");
  let age = prompt("nhập tuổi");

  let li = {
    id: id,
    name: name,
    age: age,
  };
  list.push(li);
  for (let index in list) {
    console.log(list[index]);
  }
} else if (n === "r") {
  for (let index in list) {
    console.log(list[index]);
  }
} else if (n === "u") {
  let name = prompt("nhập tên người cần sửa");
  let index = list.findIndex(function (el, index) {
    return el.name === name;
  });
  if (index === -1) {
    console.log("ko tìm thấy");
  } else {
    let id = list.length + 1;
    let age = prompt("nhập tuổi");
    list[index].age = age;
    for (let index in list) {
      console.log(list[index]);
    }
  }
} else if (n === "d") {
  let name = prompt("nhập tên người cần xóa");
  let index = list.findIndex(function (el, index) {
    return el.name === name;
  });
  if (index === -1) {
    console.log("ko tìm thấy");
  } else {
    list.splice(index, 1);
    for (let index in list) {
      console.log(list[index]);
    }
  }
} else {
  alert("ko hợp lệ");
}
