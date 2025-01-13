"use strict";
// BAI 1
console.log("BAI 1");
function swap(inp) {
    return [inp[1], inp[0]];
}
console.log(swap([5, 3]));
const c = ["MNU", "MNC"];
console.log(swap(c));
// BAI 2
console.log("BAI 2");
function getFirst1(ip) {
    return ip[0];
}
console.log(getFirst1([1, 2, 3]));
console.log(getFirst1(["a", "b", "c"]));
//BAI 3
console.log("BAI 3");
function merge1(A, B) {
    return Object.assign(A, B);
}
console.log(merge1({ name: "an" }, { age: 13 }));
//BAI 4
console.log("BAI 4");
function returnValues(ip, key) {
    return ip.map(item => `${item[key]}`);
}
const users1 = [
    { id: 1, name: "alice" },
    { id: 2, name: "Bob" },
];
console.log(returnValues(users1, "name"));
// BAI 5
console.log("BAI 5");
function filterByProperty(items, property, value) {
    return items.filter(item => item[property] === value);
}
const products = [
    { id: 1, name: "Laptop", category: "Electronics" },
    { id: 2, name: "Phone", category: "Electronics" },
    { id: 2, name: "Shoes", category: "Fashion" },
];
console.log(filterByProperty(products, "category", "Fashion"));
// BAI 6
console.log("BAI 6");
function sumByProperty(items, property) {
    return items.reduce((sum, item) => sum + item[property], 0);
}
const orders = [
    { id: 1, total: 100 },
    { id: 2, total: 200 },
    { id: 2, total: 300 },
];
const totalRevenue = sumByProperty(orders, "total");
console.log(totalRevenue); // output 600
