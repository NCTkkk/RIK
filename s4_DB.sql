CREATE DATABASE S4_DB;
USE S4_DB;


-- BÀI 1
CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATE,
    totalAmount DECIMAL(10,2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

INSERT INTO customers (customerName, contactEmail)
VALUES 
('John Doe', 'johndoe@example.com'),
('Jane Smith', 'janesmith@example.com'),
('Michael Brown', 'michaelbrown@example.com'),
('Emily White', 'emilywhite@example.com'),
('Daniel Green', 'danielgreen@example.com');

INSERT INTO orders (customerID, orderDate, totalAmount)
VALUES
(1, '2024-11-01', 150.00),
(2, '2024-11-02', 200.00),
(3, '2024-11-03', 120.50),
(4, '2024-11-04', 300.75),
(5, '2024-11-05', 250.00);

-- TRUY VẤN 
SELECT orders.orderID, orders.orderDate, orders.totalAmount, customers.customerName, customers.contactEmail
FROM orders
INNER JOIN customers ON orders.customerID = customers.customerID;



-- BÀI 2
CREATE TABLE sales (
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT ,
    saleDate DATE  NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO sales (productID, saleDate, quantity, amount)
VALUES 
(1, '2024-11-01', 10, 150.00),
(2, '2024-11-02', 5, 200.00),
(3, '2024-11-03', 8, 120.50),
(1, '2024-11-04', 15, 225.00);

-- truy vấn để đếm số lượng đơn hàng (SaleID) cho mỗi ProductID
SELECT productID, COUNT(saleID) AS `số lượng đơn của mỗi sp`
FROM sales
GROUP BY productID;



-- BÀI 3
CREATE TABLE employeeSalaries (
	employeeID INT PRIMARY KEY AUTO_INCREMENT,
    departmentID INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

INSERT INTO employeeSalaries (departmentID, salary)
VALUES 
		(1, 55000.00),
		(2, 60000.00),
		(3, 45000.00),
		(1, 70000.00),
		(2, 75000.00);

SELECT departmentID, sum(salary) AS `tổng lương`,
					round(AVG(salary) ,2) AS `TB lương`
FROM employeeSalaries
GROUP BY departmentID;



-- BÀI 4
CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (productName, price)
VALUES 
	('Laptop', 1500.00),
	('Smartphone', 800.00),
	('Headphones', 150.00),
	('Tablet', 300.00);

-- TRUY VẤN: tìm sản phẩm có giá cao nhất và thấp nhất
SELECT max(price) AS `Sản phẩm giá cao nhất`
FROM products;

SELECT min(price) AS `Sản phẩm giá thấp nhất`
FROM products;




-- BÀI 5
ALTER TABLE products
DROP column price;

CREATE TABLE orderDetails (
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    FOREIGN KEY (productID) REFERENCES products(productID) 
);

INSERT INTO orderDetails (productID, quantity, price)
VALUES 
(1, 2, 1500.00),   
(2, 1, 800.00),     
(3, 5, 150.00),     
(4, 3, 300.00),     
(1, 1, 1500.00);   


-- TRUY VẤN: Lấy danh sách các sản phẩm cùng với tổng số lượng bán được , sắp xếp theo số lượng bán được giảm dần
SELECT p.productID, p.productName, SUM(od.quantity) AS Total
FROM products p
JOIN orderDetails od ON od.productID = p.productID
GROUP BY p.productID, p.productName
ORDER BY Total DESC;



-- BÀI 6
CREATE TABLE sales_2 (
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    saleDate date NOT NULL ,
    price DECIMAL (10,2) NOT NULL
);

INSERT INTO sales_2 (saleDate, price)
VALUES 
('2024-11-01', 150.00),
('2024-11-02', 200.50),
('2024-11-03', 300.75),
('2024-11-04', 450.00);

UPDATE sales_2
SET saleDate = '2024-10-30'
WHERE saleID=1;

-- TRUY VẤN: tính tổng doanh thu, số lượng đơn hàng và doanh thu trung bình mỗi đơn hàng cho từng tháng
SELECT sum(price) AS total
FROM sales_2;

SELECT count(saleDate) AS sldh
FROM sales_2;

SELECT year(saleDate) AS saleYear,
		month(saleDate ) AS saleMonth,
		AVG(price)
FROM sales_2
GROUP BY saleYear,saleMonth;



-- BÀI 7
ALTER TABLE sales
ADD COLUMN regionID INT;

CREATE TABLE regions(
	regionID INT PRIMARY KEY AUTO_INCREMENT,
    regionName VARCHAR(100) NOT NULL
);

INSERT INTO regions (regionName)
VALUES 
('North America'),
('South America'),
('Europe'),
('Asia'),
('Africa');


ALTER TABLE sales
ADD CONSTRAINT FK_RG FOREIGN KEY (regionID) REFERENCES regions(regionID);

UPDATE sales
SET regionID = 3
WHERE saleID = 1;

UPDATE sales
SET regionID = 2
WHERE saleID = 2;

UPDATE sales
SET regionID = 4
WHERE saleID = 3;

UPDATE sales
SET regionID = 1
WHERE saleID = 4;

INSERT INTO sales (productID, regionID, saleDate, quantity, amount)
VALUES 
(1, 2, '2024-11-11', 9, 1000.00),
(2, 1, '2024-11-12', 6, 500.00),
(3, 3, '2024-11-13', 4, 800.00);

-- TRUY VẤN: tổng doanh thu, số lượng sản phẩm bán ra, và sản phẩm bán chạy nhất trong từng khu vực
select *
from sales;


SELECT sum(quantity*amount) AS totalAmount
FROM sales;

SELECT sum(quantity) AS totalAmount
FROM sales;


SELECT r.regionID, p.productName, MAX(s.quantity) AS bestSeller
FROM sales s
JOIN products p ON s.productID = p.productID
JOIN regions r ON s.regionID = r.regionID
GROUP BY r.regionID, p.productName
ORDER BY r.regionID, bestSeller DESC;






















