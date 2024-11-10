CREATE DATABASE S3_DB;
USE S3_DB;

-- BÀI 1
CREATE TABLE Students(
	StudentID INT primary key auto_increment,
    NameStudent VARCHAR(45),
    Age INT,
    Major VARCHAR(45)
);

INSERT INTO Students(NameStudent, Age, Major)
VALUES ('Alice',20,'Computer Science'),
       ('Bob',22,'Mathematics'),
	   ('Charlie',21,'Physics');
       

-- BÀI 2
UPDATE Students
SET Age = 23
WHERE StudentID =2;

select *
from Students;



-- BÀI 3
DELETE FROM Students
WHERE StudentID =1;


-- BÀI 4
SELECT * FROM Students;


-- BÀI 5
CREATE TABLE courses (
	courseID INT PRIMARY KEY AUTO_INCREMENT,
    courseName VARCHAR(100) NOT NULL,
    instructor VARCHAR(50) NOT NULL
);

INSERT INTO courses(courseName, instructor)
VALUES ('Image processing','Nguyễn Thị A'),
       ('C programming','Trần Văn B'),
	   ('SE','Hà Văn C');

UPDATE courses
SET courseName = 'Advanced Mathematics'
WHERE CourseID = 2;

DELETE FROM courses
WHERE courseID = 3;

SELECT * FROM courses;



-- BÀI 6
CREATE TABLE suppliers(
	supplierID INT PRIMARY KEY AUTO_INCREMENT,
    supplierName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    supplierID INT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

ALTER TABLE products
ADD CONSTRAINT FK_supID FOREIGN KEY (supplierID)
REFERENCES  suppliers(supplierID);


INSERT INTO suppliers(supplierName, contactEmail)
VALUES ('Long Chau','lc@gmail.com'),
       ('Hai Viet','hv@gmail.com'),
	   ('Nam Cuong','nc@gmail.com');

INSERT INTO products(productName, supplierID, price, stock)
VALUES ('thuốc an thần',3,250,15),
       ('bánh đậu xanh',1,30,0),
	   ('sơn tường',2,2000,50),
       ('vitamin C',3,20,150);

UPDATE products
SET price = 45.99
WHERE productID = 2; 

UPDATE suppliers
SET supplierName = 'HAI VINH'
WHERE supplierID = 1; 


UPDATE products
SET supplierID = NULL
WHERE supplierID =3; 

DELETE FROM suppliers
WHERE supplierID =3;

DELETE FROM products
WHERE productID =4;

SELECT * FROM suppliers;
SELECT * FROM products;



-- BÀI 7

CREATE TABLE customers (
    customerID INT PRIMARY KEY AUTO_INCREMENT,
    nameKH VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    joinDate DATE
);


CREATE TABLE orders (
    orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATE,
    totalAmount DECIMAL(10, 2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- Thêm 4 khách hàng vào bảng Customers
INSERT INTO customers (nameKH, email, joinDate) VALUES 
('Nguyen Van A', 'nguyenvana@example.com', '2023-01-15'),
('Tran Thi B', 'tranthib@example.com', '2023-02-20'),
('Le Hoang C', 'lehoangc@example.com', '2023-03-05'),
('Pham Minh D', 'phamminhd@example.com', '2023-04-10');

-- Thêm 5 đơn hàng vào bảng Orders với liên kết đến khách hàng
INSERT INTO orders (customerID, orderDate, totalAmount) VALUES 
(1, '2023-05-01', 150.00),
(2, '2023-05-10', 200.00),
(3, '2023-05-15', 250.00),
(1, '2023-05-20', 300.00),
(3, '2023-06-01', 400.00);

-- Cập nhật tổng số tiền của đơn hàng có OrderID = 3 thành 350.00
UPDATE orders
SET totalAmount = 350.00
WHERE orderID = 3;

-- Cập nhật địa chỉ email của khách hàng có CustomerID = 2
UPDATE customers
SET email = 'updatedemail@example.com'
WHERE customerID = 2;

-- Xóa khách hàng với CustomerID = 4 khỏi bảng Customers
DELETE FROM customers
WHERE customerID = 4;

-- Xóa đơn hàng với OrderID = 1 khỏi bảng Orders
DELETE FROM orders
WHERE orderID = 1;

-- truy vấn để lấy tất cả thông tin đơn hàng cùng với tên khách hàng
SELECT orders.*,nameKH FROM orders
INNER JOIN customers ON customers.customerID = orders.customerID;

-- truy vấn để lấy tổng số tiền đơn hàng của từng khách hàng (group by CustomerID)
SELECT customerID , sum(totalAmount) as T
FROM orders
group by customerID;

SELECT customers.nameKH, SUM(orders.totalAmount) AS totalSpent
FROM orders
INNER JOIN customers ON customers.customerID = orders.customerID
GROUP BY customers.customerID, customers.nameKH;



-- BÀI 8
CREATE TABLE invoices (
    invoiceID INT PRIMARY KEY AUTO_INCREMENT,
    invoiceDate DATE,
    customerName VARCHAR(100) NOT NULL
);

CREATE TABLE products_2 (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE invoiceDetails (
    detailID INT PRIMARY KEY AUTO_INCREMENT,
    invoiceID INT,
    productID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (invoiceID) REFERENCES invoices(invoiceID),
    FOREIGN KEY (productID) REFERENCES products_2(productID)
);

-- thêm các bản ghi vào các bảng
INSERT INTO products_2 (productName, price)
VALUES ('Product A', 50.00),
       ('Product B', 30.00),
       ('Product C', 40.00);

INSERT INTO invoices (invoiceDate, customerName)
VALUES ('2024-11-01', 'Customer 1'),
       ('2024-11-02', 'Customer 2');

INSERT INTO invoiceDetails (invoiceID, productID, quantity, price)
VALUES (1, 1, 5, 50.00),
       (1, 2, 3, 30.00),
       (2, 1, 2, 50.00),
       (2, 3, 4, 40.00);
       
-- Cập nhật
UPDATE products_2
SET price = 55.00
WHERE productID = 1;

UPDATE invoiceDetails
SET quantity = 10
WHERE detailID = 2;

-- Xóa
UPDATE invoiceDetails
SET productID =NULL
WHERE productID = 3;

DELETE FROM products_2
WHERE productID = 3;

DELETE FROM invoiceDetails
WHERE detailID = 1;

-- Truy vấn
--  tổng giá trị hóa đơn (giá * số lượng) của từng hóa đơn
SELECT invoiceID , sum(quantity*price) as `Tổng hóa đơn`
FROM invoiceDetails
GROUP BY invoiceID;

--  danh sách tất cả sản phẩm trong từng hóa đơn cùng với số lượng và giá
SELECT productName, quantity, products_2.price
FROM products_2
LEFT JOIN invoiceDetails 
ON products_2.productID = invoiceDetails.productID;




