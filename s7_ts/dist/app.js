"use strict";
class Rikkei {
    constructor(taxCode) {
        this._taxCode = taxCode;
        this._stakeholders = [{ name: "minh cuong", share: "100&" }];
    }
    showTaxCode() {
        console.log(`Rikkei Tax Code is ${this._taxCode}`);
    }
}
// khi tiến hành kế thừa  từ 1 lớp trừu tượng
class RikEdu extends Rikkei {
    constructor(bod) {
        super("348543875");
        this._bod = bod;
    }
    payTaxes() {
        console.log("dong thue !!!");
    }
}
let kkk = new RikEdu(["grfg", "sngf"]);
console.log(kkk);
class Human {
    constructor(gene) {
        this._gene = gene;
    }
}
class person extends Human {
    constructor(gender, gene) {
        super(gene);
        this._gender = gender;
    }
}
class student extends person {
    constructor(name, gene, gender) {
        super(gender, gene);
        this._name = name;
    }
    study() {
        console.log("work work work");
    }
    ;
    rep() {
        console.log("ss di");
    }
    hunt() {
        console.log("kiem an di");
    }
}
