class Person1{
    private id:number;
    private name: string;

    constructor(id:number, name:string) {
        this.id = id;
        this.name = name; 
    }

    getName():string{
        return this.name;
    }
}

class Employee extends Person1{
    private role:string;
    constructor(id:number, name:string, role:string) {
        super(id,name);
        this.role = role;
    }

    getRole():string{
        return this.role;
    }
}

class Manager extends Employee{
    private department:string;
    constructor(id:number, name:string, role:string, department:string) {
        super( id, name,role);
        this.department = department;
    }

    getDepartment():string{
        return this.department
    }
}


class Task{
    private id:number;
    private title:string;
    private deadline:Date;
    private isCompleted : boolean;
    constructor(id:number, title:string, deadline:Date, isCompleted:boolean=false) {
        this.id = id;
        this.title = title;
        this.deadline = deadline;
        this.isCompleted = isCompleted;
    }

    complete():void{
        this.isCompleted = true;
    };

    getDetails():string{
        return `${this.id} công việc: ${this.title}, có hạn là ${this.deadline} ${this.isCompleted ? "đã hoàn thành" : "chx hoàn thành"}`;
    }
}

class Assignment{
    private employee:Employee;
    private task : Task;

    constructor(employee:Employee, task : Task) {
        this.employee = employee;
        this.task = task;
    }

    getAssignmentDetails(){
        return `thông tin nhân viên : ${this.employee.getName()} , nhiệm vụ : ${this.task.getDetails()}`
    }
}

class TaskManager{
    private employees : Employee[];
    private managers : Manager[];
    private tasks : Task[];
    private assignments : Assignment[];

    constructor(employees:Employee[]=[], managers:Manager[]=[], tasks:Task[]=[], assignments:Assignment[]=[]) {
        this.employees=employees;
        this.managers = managers;
        this.tasks =tasks;
        this.assignments = assignments;
    }
    
    addEmployee(name:string, role:string): void{
        const id = this.employees.length + 1;
        const employee = new Employee(id,name,role);
        this.employees.push(employee);
        console.log(`thêm thành công: ${name}, chức vụ: ${role}`);
    }

    addManager(name:string, role:string, department:string){
        const id = this.managers.length +1;
        const manager = new Manager(id,name, role, department);
        this.managers.push(manager);
        console.log(`thêm thành công: ${name}, chức vụ : ${role}, bộ phận : ${department}`);
    }

    addTask(title: string, deadline: string){

    }

    assignTask(employeeId: number, taskId: number){
        const employee = this.employees.find(e => e["id"]===employeeId);
        const task = this.tasks.find(t => t["id"]===taskId);
        if(!employee){
            console.log("ko tìm thấy nv này");
            return ;
        }

        if(!task){
            console.log("ko tìm thấy cv này");
            return;
        }

        const assignment= new Assignment(employee,task);
        this.assignments.push(assignment);
        console.log(`nhiệm vụ ${taskId} đã đc phân cho nhân viên ${employeeId}`);
    }

    completeTask(taskId: number){

    }

    listAssignments(){

    }
}

class Main{
    static start():void{
        const newTaskManager = new TaskManager();
        let kkk = true;
        

        console.log("1. thêm nhân viên");
        console.log("2. Thêm quản lý");
        console.log("3. thêm công việc");
        console.log("4. phân công cv cho nv");
        console.log("5. đánh dấu cv hoàn thành");
        console.log("6. hiển thị cv đã phân công");
        console.log("7. Dừng chương trình");

        while(kkk){
            const choice = prompt("chọn chức năng 1-7");
            switch (choice){
                case "1":
                    const nameNV = prompt("nhập tên NV");
                    const roleNV = prompt("nhập chức vụ");
                    newTaskManager.addEmployee(nameNV,roleNV)
                    break;
                case "2": 
                    const nameT = prompt("nhập tên task");
                    const roleT = prompt("nhập chức năng task");
                    const depart = prompt("nhập bộ phận");
                    newTaskManager.addManager(nameT, roleT, depart);
                    break;
                case "3":
                    break;
                case "4":
                    const employeeId = parseInt(prompt("nhập id nv để phân công"));
                    const taskId =  parseInt(prompt("nhập id cv"));
                    newTaskManager.assignTask(employeeId,taskId);
                    break;
                case "5":
                    break;
                case "6":
                    break;
                case "7":
                    kkk = false;
                    console.log("đã out");
                    break;
                default:
                    console.log("invalid");
            }
        }
        
    }
}

Main.start();