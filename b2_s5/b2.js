let products = [
  { id: 1, name: "iphone 12", price: 20000000 },
  { id: 2, name: "iphone 11", price: 10000000 },
  { id: 3, name: "samsung note 10", price: 500000000 },
];

// let new_pro = products.map(function(product){
//     product
// });

let new_pro = products.sort((a, b) => a.price - b.price);
console.log(new_pro);
