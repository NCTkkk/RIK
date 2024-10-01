let n = parseInt(prompt("Nhập vào một số nguyên dương n:"));

for (let i = n; i >= 1; i--) {
    let line1 = '';

    for (let j = 1; j <= i; j++) {
      line1 += '*'; 
    }

    console.log(line1);
}

for (let i = n; i >= 1; i--) {
    let line2 = '';

    for (let k = 0; k < n - i; k++) {
        line2 += ' '; 
    }
  
      
      for (let j = 1; j <= i; j++) {
        line2 += '*'; 
    }

    console.log(line2);
    
}
