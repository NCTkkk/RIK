"use strict";
// class Todo{
//     private _id:number;
//     private _content: string;
//     private _status : boolean;
//     constructor(id: number, content: string, status:boolean = false){
//         this._id = id;
//         this._content = content;
//         this._status = status;
//     }
//     get id(){
//         return this._id;
//     }
//     get content(){
//         return this._content;
//     }
//     get status(){
//         return this._status;
//     }
// }
// class TodoListManager{
//     private _todos: Todo[];
//     constructor(){
//         this._todos = [];
//     }
//     addTodo(content: string):void{
//         let id = Math.random();
//         let newTodo = new Todo(id, content);
//         this._todos.push(newTodo);
//         this.listTodos();
//     }
//     removeTodo(index: number) :void{
//         this._todos.splice(index-1,1);
//     }
//     updateTodo(index:number, content: string):void{
//     }
//     sortTodo():void{
//     }
//     findTodo(content:string):number{
//         return -1;
//     }
//     listTodos():void{
//         console.log("***************");
//         if(this._todos.length===0){
//             console.log("chưa có bất kỳ cv nào");
//         }
//         else{
//             this._todos.forEach(function(element:Todo, index:number){
//                 console.log(`${index+1}. ${element.content} - ${element.status ? "hoàn thành" : "chưa HT"}`);
//             });
//         }
//         console.log("***************");
//     }
//     getTodoLength():number{
//         return this._todos.length;
//     }
// }
// class Main{
//     private _todoManager: TodoListManager;
//     constructor() {
//         this._todoManager = new TodoListManager;
//     }
//     bootstrap():void{
//         let loop: boolean= true;
//         while(loop){
//             console.log("CT bắt đầu");
//             console.log("1.in ra");
//             console.log("2.thêm");
//             console.log("3.xóa");
//             console.log("4.sửa");
//             console.log("5.sắp xếp");
//             console.log("6.tìm kiếm");       
//             console.log("7.dừng");
//             let choice = prompt("mời b nhập vào lực chọn (1-7) để điều khiển CT");
//             switch(choice){
//                 case "1":
//                     this._todoManager.listTodos();
//                     break;
//                 case "2":
//                     let content = prompt("mời b nhập vào cv");
//                     if (!content){
//                         console.log("cv thêm mới ko hợp lệ");
//                     }else{
//                         this._todoManager.addTodo(content);
//                     }
//                     break;
//                 case "3":
//                     let input = prompt("mời b nhập vào nd cần xóa");
//                     if(!input){
//                         console.log("vtri can xoa ko hop le ");
//                     }
//                     else{
//                         let deleteIndex = +(input);
//                         if(Number.isNaN(deleteIndex || deleteIndex>this._todoManager.getTodoLength())){
//                             console.log("invalid");
//                         }
//                         else{
//                             this._todoManager.removeTodo(deleteIndex);
//                             this._todoManager.listTodos();
//                         }
//                     }
//                     break;
//                 case "4":
//                     break;
//                 case "5":
//                     break;
//                 case "6":
//                     break;
//                 case "7":
//                     console.log("hẹn gặp lại");
//                     loop = false;
//                     break;  
//                 default :
//                 console.log("lựa chọn ko hợp lệ");
//                     break;
//             }
//         }
//     }
// }
// const app = new Main();
// app.bootstrap();
class Employee {
    constructor(id, name) {
        this._id = id;
        this._name = name;
    }
    get id() {
        return this._id;
    }
    get name() {
        return this._name;
    }
}
class Task {
    constructor(id, title, deadline, isComplete = false) {
        this._id = id;
        this._title = title;
        this._deadline = deadline;
        this._isComplete = isComplete;
    }
    get id() {
        return this._id;
    }
    get title() {
        return this._title;
    }
    get deadline() {
        return this._deadline;
    }
    get isComplete() {
        return this._isComplete;
    }
}
class Assignment {
    constructor(employee, task) {
        this._employee = employee;
        this._task = task;
    }
    get employee() {
        return this._employee;
    }
    get task() {
        return this._task;
    }
}
class TaskManager {
    constructor(employees = [], tasks = [], assignments = []) {
        this._employees = employees;
        this._tasks = tasks;
        this._assignments = assignments;
    }
    addEmployee(name) {
        let newID = Math.random();
        let newEmployee = new Employee(newID, name);
        this._employees.push(newEmployee);
        this.listTasks();
    }
    addTask(title, deadline) {
        let newID = Math.random();
        let newTask = new Task(newID, title, deadline);
        this._tasks.push(newTask);
        this.listTasks();
    }
    assignTask(employeeId, taskId) {
    }
    completeTask(taskId) {
    }
    listTasks() {
        this._employees.forEach(function (element, index) {
            console.log(`${index}.${element.name}`);
        });
        console.log("***************");
        this._assignments.forEach(function (element, index) {
            console.log(`${index}.${element.employee} ${element.task}`);
        });
        console.log("***************");
        this._tasks.forEach(function (element, index) {
            console.log(`${index}.${element.deadline} ${element.title} ${element.isComplete}`);
        });
    }
}
class Main {
    constructor() {
        this._nv = new TaskManager;
        this._nvu = new TaskManager;
    }
    bootstrap() {
        let loop = true;
        while (loop) {
            console.log("CT bắt đầu");
            console.log("1.in ra");
            console.log("2.thêm nv");
            console.log("3. thêm task");
            console.log("4.gán task cho nv");
            console.log("5.đánh dấu task đã hoàn thành");
            console.log("6.dừng");
            let choice = prompt("mời b nhập vào lực chọn (1-6) để điều khiển CT");
            switch (choice) {
                case "1":
                    break;
                case "2":
                    let nameInput = prompt("nhập vào tên nv mới");
                    if (!nameInput) {
                        console.log("ko bỏ trống");
                    }
                    else {
                        this._nv.addEmployee(nameInput);
                    }
                    break;
                case "3":
                    let newTitle = prompt("nhập tên cv");
                    let deadline = prompt("nhập hạn cv (MM-DD-YYYY)");
                    if (newTitle === null || newTitle.trim() === "" || deadline === null || deadline.trim() === "") {
                        console.log("Invalid input. Vui lòng nhập đầy đủ thông tin.");
                    }
                    else {
                        this._nvu.addTask(newTitle.trim(), deadline.trim());
                    }
                    break;
                case "4":
                    break;
                case "5":
                    break;
                case "6":
                    console.log("hẹn gặp lại");
                    loop = false;
                    break;
                default:
                    console.log("lựa chọn ko hợp lệ");
                    break;
            }
        }
    }
}
const app = new Main();
app.bootstrap();
