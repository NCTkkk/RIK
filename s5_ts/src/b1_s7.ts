// BAI 1
console.log("BAI 1");
function swap<T>(inp:[T,T]):[T,T]{
    return [inp[1],inp[0]];
}

console.log(swap<number>([5,3]));
const c : [string,string] = ["MNU","MNC"];
console.log(swap(c));



// BAI 2
console.log("BAI 2");
function getFirst1<T>(ip:T[]):T{
    return ip[0];
}
console.log(getFirst1<number>([1,2,3]));
console.log(getFirst1<string>(["a","b","c"]));



//BAI 3
console.log("BAI 3");
function merge1<T extends object,U extends object>(A:T, B:U):T & U{
    return Object.assign(A,B);
}
console.log(merge1({name:"an"},{age:13}));



//BAI 4
console.log("BAI 4");
function returnValues<T extends object,U extends keyof T>(ip:T[],key : U):string[]{
    return ip.map(item => `${item[key]}`);
}
const users1 = [
    {id:1, name:"alice"},
    {id:2, name:"Bob"},
];
console.log(returnValues(users1,"name"));


// BAI 5
console.log("BAI 5");
function filterByProperty<T extends object,K extends keyof T>(items:T[],property : K, value : T[K]):T[]{
    return items.filter(item => item[property]=== value);
}
const products = [
    {id:1, name:"Laptop", category: "Electronics"},
    {id:2, name:"Phone", category: "Electronics"},
    {id:2, name:"Shoes", category: "Fashion"},
];
console.log(filterByProperty(products,"category", "Fashion"));



// BAI 6
console.log("BAI 6");
function sumByProperty<T extends object,K extends keyof T>(items:T[],property : K):number{
    return items.reduce((sum,item) => sum + item[property] ,0);
}
const orders = [
    {id:1, total:100},
    {id:2, total:200},
    {id:2, total:300},
];
const totalRevenue = sumByProperty(orders, "total")
console.log(totalRevenue); // output 600




