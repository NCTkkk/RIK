class main{
    static start(): void{
        const manager = new TodoListManager();
        let kkk = true;

        console.log("1. In ra danh sách công việc");
        console.log("2. Thêm công việc");
        console.log("3. Xóa công việc");
        console.log("4. Sửa nội dung công việc");
        console.log("5. Sắp xếp công việc");
        console.log("6. Tìm kiếm công việc");
        console.log("7. Dừng chương trình");

        while(kkk){
            const choice = parseInt(prompt("chọn chức năng từ 1-7" )|| "0");

            switch (choice){
                case 1: 
                    manager.listTodo();
                    break;
                case 2:{
                    const content = prompt("nhập nội dung cv")||"";
                    manager.addTodo(content);
                    break;
                }
                case 3:{
                    const index = +(prompt("nhập vị trí cần xóa")||"-1");
                    manager.removeTodo(index);
                    break;
                }
                case 4:{
                    const index = +(prompt("nhập vị trí cần sửa")||"-1");
                    const content = prompt("nhập nội dung cv")||"";
                    manager.updateTodo(index, content);
                    break;
                }
                case 5:{
                    manager.sortTodo();
                    break;
                }
                case 6:{
                    const content = prompt("nhập nội dung cv")||"";
                    manager.findTodo(content);
                    break;
                }
                case 7:{
                    console.log("CT đã dừng !!!");
                    kkk=false;
                    break;
                }
                default: 
                    console.log("invalid !!!");
            }
        }
    }
}

let app = new main();

class Todo {
    private id: number;
    private content : string;
    private status : boolean;

    constructor(id: number, content: string, status: boolean=false){
        this.id = id;
        this.content = content;
        this.status = status;
    }

    getStatus(): boolean{
        return this.status;
    }

    toggleStatus():void{
        this.status = !this.status;
    }

    getContent():string{
        return this.content;
    }

    setContent(content: string){
        this.content = content;
    }

    toString(): string{
        return `${this.id}: ${this.content} [${this.status? "done" : "not done"}]`;
    }
}

class TodoListManager{

    private todos: Todo[] = [];
    private id : number = 1;

    addTodo(content: string):void{
        if(content.trim() === ""){
            console.log("content not null !!!");
            return ;
        }

        const newTodo = new Todo(this.id++, content);
        this.todos.push(newTodo);
        console.log("add successfully");
        this.listTodo();
    }

    removeTodo(index: number): void{
        if(index < 0 || index > this.todos.length){
            console.log("invalid location");
            return;
        }

        this.todos.splice(index,1);
        console.log("delete successfully");
        this.listTodo();
    }

    updateTodo(index: number, content: string):void{
        if(index < 0 || index > this.todos.length){
            console.log("invalid location");
            return;
        }

        if(content.trim() === ""){
            console.log("content not null !!!");
            return ;
        }

        this.todos[index].setContent(content);
        console.log("update successfully");
        this.listTodo();
    }

    sortTodo(){
        this.todos.sort((a, b) => a.getContent().localeCompare(b.getContent()));
        this.listTodo();
    };

    findTodo(content: string): void{
        const index = this.todos.findIndex(
            todo => todo.getContent() === content);

        if(index === -1){
            console.log("not found");
        } else{
            console.log(`cv ${content} nằm ở vtri ${index}`);
        }
        this.listTodo();
    }

    listTodo():void{
        console.log("danh sách cv: ");
        this.todos.forEach(todo => console.log(todo.toString()));
    }
}

main.start();