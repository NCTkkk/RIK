let users = [];

function valdatedEmail(email) {
  let formEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return formEmail.test(email);
}

function creatUser() {
  while (true) {
    let id = users.length + 1;
    let user_name = prompt("nhập thông tin tên tài khoản");
    let email = prompt("nhập thông tin email");
    let password = prompt("nhập thông tin mật khẩu");

    if (user_name.length < 3) {
      alert("tên tài khoản ko ít hơn 3 ký tự");
      continue;
    }
    if (email === "" || !valdatedEmail(email)) {
      alert("email ko để trống hoặc ko được sai định dạng");
      continue;
    }
    if (password === "" || password.length < 8) {
      alert("mật khẩu ko được trống hoặc dưới 8 ký tự");
      continue;
    }
    let user = {
      id: id,
      user_name: user_name,
      email: email,
      password: password,
    };

    users.push(user);
    alert("thêm thành công");
    break;
  }
}

creatUser();

console.log(users);
