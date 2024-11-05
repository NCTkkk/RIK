CREATE database CompanyDB;
USE CompanyDB;

/* BAI 1 */
CREATE table Employee(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    LastNmae VARCHAR(45),
    HireDate DATE,
    Salary INT
);

ALTER table Employee
ADD Department 
VARCHAR(45);

ALTER table Employee
MODIFY Salary
decimal(10,2);


/* BAI 2 */
CREATE table Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(45),
    Category VARCHAR(30),
    Price decimal(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
	('laptop', 'điện tử', 20000000, 30),
    ('iphone 16', 'điện tử', 30000000, 2),
    ('nồi inox', 'gia dụng', 150000, 25);



/* BAI 3 */
INSERT INTO Employee (EmployeeID, FirstName, LastNmae, HireDate, Salary, Department)
VALUES 
    (1, 'John', 'Doe', '2023-01-15', 50000.00, 'IT'),
    (2, 'Jane', 'Smith', '2022-06-20', 55000.00, 'HR'),
    (3, 'Mike', 'Johnson', '2021-03-10', 60000.00, 'Sales');

/* Truy vấn tất cả nhân viên thuộc phòng ban cụ thể */
SELECT * 
FROM Employee
WHERE Department = 'IT';

/* Cập nhật thông tin lương của một nhân viên */
UPDATE Employee
SET  Salary = Salary + 15000.00
WHERE EmployeeID = 2;

/* Xóa tất cả nhân viên có mức lương thấp hơn một giá trị nhất định */
DELETE FROM Employee
WHERE Salary < 60000.00;

SELECT * 
FROM Employee;



/* BÀI 4 */
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,       
    Fname VARCHAR(100) NOT NULL,      
    Email VARCHAR(100),              
    Phone VARCHAR(20)               
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                   
    OrderDate DATE NOT NULL,                    
    CustomerID INT,                             
    TotalAmount DECIMAL(10, 2)                  
);

ALTER table Orders 
ADD constraint f_CustomerID foreign key (CustomerID) 
REFERENCES Customers(CustomerID);

ALTER table Orders 
ADD constraint C_TotalAmount check (TotalAmount>=0);





