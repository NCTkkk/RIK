abstract class Rikkei{
    private _taxCode: string;
    private _stakeholders: any[];
    constructor(taxCode:string){
        this._taxCode = taxCode;
        this._stakeholders = [{name: "minh cuong", share:"100&"}]
    }

    protected showTaxCode(){
        console.log(`Rikkei Tax Code is ${this._taxCode}`);
    }

    abstract payTaxes():void;
}


// khi tiến hành kế thừa  từ 1 lớp trừu tượng

class RikEdu extends Rikkei{
    private _bod: string[];
    constructor(bod: string[]) {
        super("348543875");
        this._bod = bod;
    }

    override payTaxes(): void {
        console.log("dong thue !!!");
    }
}

let kkk = new RikEdu (["grfg","sngf"]);

console.log(kkk);

abstract class Human{
    private _gene:string;
    constructor(gene:string) {
        this._gene = gene; 
    }

    abstract rep ():void;
}

abstract class person extends Human{
    private _gender:boolean;
    constructor(gender: boolean, gene:string) {
        super (gene);
        this._gender = gender;
    }

    abstract hunt():void;
}

class student extends person{
    private _name: string;
    constructor(name:string, gene:string, gender:boolean) {
        super(gender, gene);
        this._name = name;
    }

    study(){
        console.log("work work work");
    };

    rep(): void {
        console.log("ss di");
    }

    hunt(): void {
        console.log("kiem an di");
    }
}