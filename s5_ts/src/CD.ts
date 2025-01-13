function getFirstNumber(numbers:number[]):number{
    return numbers[0];
}

function getFirstString(strings:string[]):string{
    return strings[0];
}

interface User{
    id:number,
    name:string,
}

function getFirstUser(users:User[]):User{
    return users[0];
}

console.log(getFirstUser([
        {id:1,name:"sdkvnd"},
        {id:2,name:"sdvnjsdv"},
    ])
);


type inputType = number | User;
type totalT = inputType[] | string
type returnF = number | string | User;

function getF(input: totalT):returnF{
    return input[0];
}

console.log(getF([
        {id:1,name:"sdkvnd"},
        {id:2,name:"sdvnjsdv"},
    ])
);

function getFirst<T>(input:T[]):T{
    return input[0];
}

console.log(getFirst<number>([1,2,3]));
console.log(getFirst<string>(["hello"]));
console.log(getFirst<User>([
        {id:1,name:"sdkvnd"},
        {id:2,name:"sdvnjsdv"},
    ])
);

function merge<T extends object,U extends object>(A:T, B:U):T & U{
    return Object.assign(A,B);
}

const mergeO = merge<{name:string},{age:number}>(
    {name:"cuong"},
    {age:30}
);

console.log(mergeO.name);


// tù khóa extends 
interface Length{
    length:number;
}

function count<T extends Length>(input:T):string{
    let result = "";
    if(input.length===0){
        result = "no element";
    }else if(input.length===1){
        result = "got 1 element";
    }else{
        result  = `got ${input.length} elements`;
    }
    return result;
}

console.log(count([1,2,3]));

function extractAndConvert<T extends object, U extends keyof T>(obj : T, key:U):string{
    return `value: ${obj[key]}`;
}

console.log(extractAndConvert({name:"sdjbd",age:20},"age"));


// GENERIC CLASS
class Storage1<T>{
    private data:T;

    constructor(data:T) {
        this.data = data;
    }

    getData():T{
        return this.data;
    }

    setData(data:T):void{
        this.data = data;
    }
}

const numberStorage = new Storage1<number>(100);
console.log(numberStorage.getData());

numberStorage.setData(200);
console.log(numberStorage.getData());

// Partial <T>
interface U{
    id:number;
    name:string,
    age:number
}

const updateU: Partial<U> = {
    name:"alice",
};
console.log(updateU);