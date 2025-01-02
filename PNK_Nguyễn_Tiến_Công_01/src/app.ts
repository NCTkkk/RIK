class Person{
    private id:number;
    private name:string;
    private email:string;
    private phone:string;

    constructor(id: number, name: string, email:string, phone:string) {
        this.id=id;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }

    getDetails(){
        return `${this.id}.khách hàng tên:${this.name}, email:${this.email} , sđt: ${this.phone}`
    }

}

abstract class Room{
    public roomId:number;
    public type:string;
    public pricePerNight:number;
    public isAvailable:boolean;

    constructor(roomId: number, type: string, pricePerNight:number, isAvailable:boolean) {
        this.roomId=roomId;
        this.type = type;
        this.pricePerNight = pricePerNight;
        this.isAvailable = isAvailable;
    }

    bookRoom(){
        this.isAvailable=false;
    }

    releaseRoom(){
        this.isAvailable= true;
    }

    abstract calculateCost(nights:number):number;

    abstract getAdditionalServices():string[];

    abstract applyDiscount(discountRate: number): number;

    abstract getCancellationPolicy():string;
}

class StandardRoom extends Room{
    constructor(roomID:number, type:string,pricePerNight:number,isAvailable:boolean) {
        super(roomID, type, pricePerNight, isAvailable);
    }

    calculateCost(nights: number): number {
        return this.pricePerNight*nights;
    }

    getAdditionalServices(): string[] {
        return [];
    }

    applyDiscount(discountRate: number): number {
        return this.pricePerNight*(1-discountRate);
    }

    getCancellationPolicy(): string {
        return `hoàn 100% nếu hủy trước 1 ngày`;
    }
}

class DeluxeRoom extends Room{
    constructor(roomID:number, type:string,pricePerNight:number,isAvailable:boolean) {
        super(roomID, type, pricePerNight, isAvailable);
    }

    calculateCost(nights: number): number {
        return this.pricePerNight*nights;
    }

    getAdditionalServices(): string[] {
        return ["breakfast"];
    }

    applyDiscount(discountRate: number): number {
        return this.pricePerNight*(1-discountRate);
    }

    getCancellationPolicy(): string {
        return `hoàn 50% nếu hủy trước 2 ngày`;
    }
}

class SuitRoom extends Room{
    constructor(roomID:number, type:string,pricePerNight:number,isAvailable:boolean) {
        super(roomID, type, pricePerNight, isAvailable);
    }

    calculateCost(nights: number): number {
        return this.pricePerNight*nights;
    }

    getAdditionalServices(): string[] {
        return ["spa", "minibar"];
    }

    applyDiscount(discountRate: number): number {
        return this.pricePerNight*(1-discountRate);
    }

    getCancellationPolicy(): string {
        return `ko hoàn tiền nếu hủy`;
    }
}

class Booking {
    public bookingID: number;
    public customer: Person;
    public room: Room;
    public nights:number;
    public totalCost:number;

    constructor(bookingID:number,customer:Person, room:Room, nights:number, totalCost:number ) {
        this.bookingID = bookingID;
        this.customer = customer;
        this.room=room;
        this.nights=nights;
        this.totalCost=totalCost;
    }

    getDetails():string{
        return `mã phòng: ${this.bookingID}, khách hàng :${this.customer.getDetails}, phòng:${this.room.roomId} , số đêm: ${this.nights}, tổng chi phí: ${this.totalCost}`
    }
}

class HoltelManager{
    private rooms:Room[];
    private bookings:Booking[];
    private customers:Person[];

    constructor(rooms:Room[]=[], bookings:Booking[]=[],customers:Person[]=[]) {
        this.rooms=rooms;
        this.bookings=bookings;
        this.customers=customers;
    }

    addRoom(type:string, pricePerNight:number, isAvailable:boolean):void{
        const id = this.customers.length +1;
        let room: Room;

        switch(type.toLowerCase()){
            case "standardroom":
                room = new StandardRoom(id, type, pricePerNight,isAvailable);
                break;
            case "deluxeroom":
                room = new DeluxeRoom(id, type, pricePerNight,isAvailable);
                break;
            case "suitroom":
                room = new SuitRoom(id, type, pricePerNight,isAvailable);
                break;
            default:
                throw new Error("invalid");
        }

        this.rooms.push(room);
        console.log(`${id}. phòng loại:${type} , giá : ${pricePerNight}, trạng thái: ${isAvailable}`);
    }

    addCustomers(name:string, email:string, phone:string):Person{
        const id = this.customers.length+1;
        const newCus = new Person(id,name,email,phone);
        this.customers.push(newCus);
        console.log(`${id}. ${name} `);
        return newCus;
    }

    bookingRoom(customerID:number, roomID:number, nights:number):Booking{
        const customer = this.customers.find(c => c["id"]===customerID);
        const room = this.rooms.find(r => r.roomID===roomID)
        const bookingID = this.bookings.length+1;

        if (!customer) throw new Error("Customer not found.");
        if (!room) throw new Error("Room not found.");
        if (!room.isAvailable) throw new Error("Room is not available.");

        room.bookRoom;
        const totalCost = room.calculateCost(nights);
        const booking = new Booking(bookingID, customer, room,nights, totalCost)
        this.bookings.push(booking);
        console.log(`Booking successful. ID: ${bookingID}`);
        return booking;
    }

    releaseRoom(roomId: number): void{
        const room = this.rooms.find(r => r.roomId === roomId);
        if (!room) throw new Error("Room not found.");
        room.releaseRoom();
        console.log(`Room ${roomId} has been released.`);
    }

    listAvailableRooms(): void{
        const availableRooms = this.rooms.filter(r => r.isAvailable);
        availableRooms.forEach(r => {
            console.log(`Room ID: ${r.roomId}, Type: ${r.type}, Price per night: ${r.pricePerNight}`);
        });
    }

    listBookingsByCustomer(customerId: number): void{
        const customerBookings = this.bookings.filter(b => b.customer['id'] === customerId);
        if (customerBookings.length === 0) {
            console.log("No bookings found for this customer.");
        } else {
            customerBookings.forEach(b => {
                console.log(b.getDetails());
            });
        }
    }

    calculateTotalRevenue(): number{
        const totalRevenue = this.bookings.reduce((acc, booking) => acc + booking.totalCost, 0);
        console.log(`Total Revenue: ${totalRevenue}`);
        return totalRevenue;
    }

    getRoomTypesCount(): void{

    }

    applyDiscountToRoom(roomId: number, discountRate: number): void{

    }

    getRoomServices(roomId: number): void{

    }

    getCancellationPolicy(roomId: number): void{

    }
}

class Main{
    static start():void{
        const newHM = new HoltelManager();
        let kkk=true;

        console.log("1. thêm khách hàng");
        console.log("2. thêm phòng");
        console.log("3. đặt phòng");
        console.log("4. trả phòng");
        console.log("5. Hiển thị danh sách phòng còn trống");
        console.log("6. Hiển thị danh sách đặt phòng của khách hàng");
        console.log("7. Tính tổng doanh thu từ các đặt phòng");
        console.log("8. Đếm số lượng từng loại phòng");
        console.log("9. Áp dụng giảm giá cho phòng");
        console.log("10. Hiển thị các dịch vụ bổ sung của phòng");
        console.log("11. Hiển thị chính sách hủy phòng");
        console.log("12. Dừng chương trình");

        while(kkk){
            const choice = prompt("chọn chức năng 1-7");
            switch(choice){
                case 1:
                    const nameCus = prompt("nhập tên khách hàng");
                    const email = prompt("nhập email KH");
                    const phone = prompt("nhập sđt");
                    newHM.addCustomers(nameCus, email, phone);
                    break;
                case 2:
                    const type= prompt("nhập loại phòng");
                    const pricePerNight=prompt("giá mỗi đêm")
                    const isAvailable = true;
                    newHM.addRoom(type,pricePerNight,isAvailable);
                    break;
                case 3:
                    const customerID = +prompt("Enter Customer ID:");
                    const roomID = +prompt("Enter Room ID to book:");
                    const nights = +prompt("Enter number of nights:");
                    try {
                        const booking = newHM.bookingRoom(customerID, roomID, nights);
                        console.log(`Booking successful! Booking Details: ${booking.getDetails()}`);
                    } catch (error) {
                        console.log(`Error: ${(error as Error).message}`);
                    }
                    break;
                case 4:
                    const roomId = +prompt("Enter Room ID to release:");
                    newHM.releaseRoom(roomId);
                    break;
                case 5:
                    newHM.listAvailableRooms();
                    break;
                case 6:
                    const customerId = +prompt("Enter Customer ID to list bookings:");
                    newHM.listBookingsByCustomer(customerId);
                    break;
                case 7:
                    newHM.calculateTotalRevenue();
                    break;
                case 8:
                    break;
                case 9:
                    break;
                case 10:
                    break;
                case 11:
                    break;
                case 12:
                    break;
                default: 
                    console.log("invalid");
            }
        }
    }
}

Main.start();