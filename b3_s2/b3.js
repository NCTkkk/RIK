let n = parseInt(prompt("hãy nhập một số nguyên dương"));

while (n<2){
    n = parseInt(prompt("nhập lại"));
}

for (let i = 2; i < n; i++) {
    let isPrime = true; 
    
    for (let j = 2; j <= Math.sqrt(i); j++) {
      if (i % j === 0) {
        isPrime = false; 
        break; 
      }
    }
    if (isPrime) {
      console.log(i); 
    }
}