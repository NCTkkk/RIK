"use strict";
class Animal {
    constructor(type) {
        this._type = type;
    }
    get getType() {
        return this._type;
    }
    set setType(type) {
        this._type = type;
    }
    sound() {
        console.log("this is this animal sound");
    }
}
class Dog extends Animal {
    constructor(name, gender) {
        super("carnivore");
        this._name = name;
        this._gender = gender;
    }
    sound() {
        super.sound();
        console.log(`this is ${this._name} . i am a ${this._gender ? "male" : "female"} dog`);
    }
    introduce(input) {
        if (typeof input === "string") {
            console.log(`${this._name}  ${input}`);
        }
        else if (typeof input === "boolean") {
            console.log(`${this._name}  ${input ? "handsome" : "ugly"}`);
        }
        else {
            console.log(`${this._name}`);
        }
    }
}
let newDog = new Dog("goofy", true);
console.log(newDog);
