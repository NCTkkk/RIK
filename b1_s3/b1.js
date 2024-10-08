let as = [1,5,6,3,2,1,1,5,6,7];
let n = 12;





for(let k=1; k<=as.length-1;k++){
    for (let i=0; i<as.length-k; i++) {
        let subAS = [];
        for(let j=i; j<i+k; j++){
            subAS.push(as[j]);
        }
        let sum =0;
        for(let index in subAS){
            sum +=subAS[index];
        }
        if (sum === n){
            console.log(subAS);
            n = 1;
        }
    }
}