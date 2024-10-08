let n = [5, 2, 7, 9, 2, 3, 5, 7, 1];

n1 = n.sort((x, y) => x - y);
console.log("Sắp xếp theo chiều tăng dần: " + n1);

n2 = n.sort((x, y) => y - x);
console.log("Sắp xếp theo chiều giảm dần: " + n2);
