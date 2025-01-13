"use strict";
function getFirstNumber(numbers) {
    return numbers[0];
}
function getFirstString(strings) {
    return strings[0];
}
function getFirstUser(users) {
    return users[0];
}
console.log(getFirstUser([
    { id: 1, name: "sdkvnd" },
    { id: 2, name: "sdvnjsdv" },
]));
function getF(input) {
    return input[0];
}
console.log(getF([
    { id: 1, name: "sdkvnd" },
    { id: 2, name: "sdvnjsdv" },
]));
function getFirst(input) {
    return input[0];
}
console.log(getFirst([1, 2, 3]));
console.log(getFirst(["hello"]));
console.log(getFirst([
    { id: 1, name: "sdkvnd" },
    { id: 2, name: "sdvnjsdv" },
]));
function merge(A, B) {
    return Object.assign(A, B);
}
const mergeO = merge({ name: "cuong" }, { age: 30 });
console.log(mergeO.name);
function count(input) {
    let result = "";
    if (input.length === 0) {
        result = "no element";
    }
    else if (input.length === 1) {
        result = "got 1 element";
    }
    else {
        result = `got ${input.length} elements`;
    }
    return result;
}
console.log(count([1, 2, 3]));
function extractAndConvert(obj, key) {
    return `value: ${obj[key]}`;
}
console.log(extractAndConvert({ name: "sdjbd", age: 20 }, "age"));
// GENERIC CLASS
class Storage1 {
    constructor(data) {
        this.data = data;
    }
    getData() {
        return this.data;
    }
    setData(data) {
        this.data = data;
    }
}
const numberStorage = new Storage1(100);
console.log(numberStorage.getData());
numberStorage.setData(200);
console.log(numberStorage.getData());
const updateU = {
    name: "alice",
};
console.log(updateU);
