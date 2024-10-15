let m = +prompt("nhập tháng");
if (m < 1 || m > 12) {
  alert("ko hop le");
} else {
  if (
    m === 1 ||
    m === 3 ||
    m === 5 ||
    m === 7 ||
    m === 8 ||
    m === 10 ||
    m === 12
  ) {
    let d = +prompt("nhập ngày");
    if (d < 1 || d > 31) {
      alert("ko hop le");
    } else {
      let year = +prompt("nhap nam");
      console.log(d + "/" + m + "/" + year);
    }
  } else if (m === 2) {
    let year = +prompt("nhap nam");
    if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
      let d = +prompt("nhập ngày");
      if (d < 1 || d > 29) {
        alert("ko hop le");
      } else {
        console.log("năm " + year + " có 366 ngày");
        console.log(d + "/" + m + "/" + year);
      }
    } else {
      let d = +prompt("nhập ngày");
      if (d < 1 || d > 28) {
        alert("ko hop le");
      } else {
        console.log("năm " + year + " có 365 ngày");
        console.log(d + "/" + m + "/" + year);
      }
    }
  } else {
    let d = +prompt("nhập ngày");
    if (d < 1 || d > 30) {
      alert("ko hop le");
    } else {
      let year = +prompt("nhap nam");
      console.log(d + "/" + m + "/" + year);
    }
  }
}
