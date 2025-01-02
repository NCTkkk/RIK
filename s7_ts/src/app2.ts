interface Sales{
    name: string;
    sale(): void;
}

interface Marketing {
    name: string;
    marketing(): void;
}

class RK implements Sales, Marketing{
    public name: string;

    constructor(name: string){
        this.name = name;
    }

    marketing(): void {
        console.log("Doing marketing");
    }

    sale(): void {
        console.log("Doing Sale");
    }
}


interface Mkt{
    marketing():void;
}

interface DigitalMkt extends Mkt{
    doing():void;
}

class Eng implements DigitalMkt{
    private name:string;
    constructor(name:string) {
        this.name = name;
    }

    doing(): void {
        console.log("dfnvf");
    }

    marketing(): void {
        console.log("sdndv");
    }
}


// giống nhau

interface Person{
    name:string;
    age:string;
}

type Human2 = {
    name:string;
    age:number;
}

