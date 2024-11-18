CREATE DATABASE S5_DB;
USE S5_DB;

-- BÀI 1

CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    createAt datetime
);



CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    price DECIMAL(10,2)
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    totalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE orderDetails(
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT ,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10,2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

INSERT INTO customers (customerName, phone, createAt)
VALUES 
('Nguyen Van A', '0901234567', '2024-11-01 10:00:00'),
('Tran Thi B', '0907654321', '2024-11-02 14:30:00'),
('Le Van C', '0912345678', '2024-11-03 09:15:00'),
('Pham Thi D', '0923456789', '2024-11-04 16:45:00');

INSERT INTO products (productName, category, price)
VALUES 
('Laptop Dell XPS', 'Electronics', 1500.00),
('iPhone 15', 'Mobile', 1200.00),
('Samsung Galaxy S23', 'Mobile', 1100.00),
('Sony WH-1000XM5', 'Accessories', 350.00);

INSERT INTO orders (customerID, totalAmount, orderDate)
VALUES 
(1, 2700.00, '2024-11-05 12:00:00'),
(2, 1500.00, '2024-11-06 13:45:00'),
(3, 1100.00, '2024-11-07 15:30:00'),
(4, 350.00, '2024-11-08 10:00:00');

INSERT INTO orderDetails (orderID, productID, quantity, unitPrice)
VALUES 
(1, 1, 1, 1500.00), 
(1, 2, 1, 1200.00),
(3, 3, 1, 1100.00),
(4, 4, 1, 350.00);  

CREATE INDEX idx_phone
ON customers(phone);

CREATE INDEX idx_totalAmount
ON orders(totalAmount);

ALTER TABLE orders ADD COLUMN orderDate DATETIME;

-- BÀI 2
CREATE VIEW customerOrders AS
SELECT o.orderID, c.customerName, o.orderDate, o.totalAmount
FROM orders o
JOIN customers c ON c.customerID = o.customerID;

-- BÀI 3
CREATE INDEX idx_orderID
ON orderDetails (orderID);

SHOW INDEXES FROM orderDetails;

-- BÀI 4
CREATE VIEW customerOrders AS
SELECT o.orderID, c.customerName, o.orderDate, o.totalAmount
FROM orders o
JOIN customers c ON c.customerID = o.customerID;

UPDATE customerOrders
SET totalAmount = 250.00
WHERE  orderID = 1;

SELECT * FROM orders;

-- BÀI 5
CREATE TABLE sales(
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NOT NULL,
    saleDate DATE,
    saleAmount DECIMAL(10,2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

CREATE VIEW customerOrderSummary AS
SELECT c.customerID,
		c.customerName,
        COUNT(o.orderID),
        SUM(o.totalAmount) AS totalAmountSpent
FROM customers c
LEFT JOIN orders o ON o.customerID = c.customerID
GROUP BY c.customerID, c.customerName;

SELECT * FROM CustomerOrderSummary;

SELECT * FROM CustomerOrderSummary
WHERE totalAmountSpent > 500.00;

-- BÀI 6
CREATE INDEX idx_productID
ON orderDetails (productID);

CREATE VIEW ProductRevenueSummary AS
SELECT 
    p.productID,
    p.productName,
    SUM(od.quantity) AS TotalQuantitySold,
    SUM(od.quantity * od.unitPrice) AS TotalRevenue
FROM 
    products p
LEFT JOIN 
    orderDetails od ON p.productID = od.productID
GROUP BY 
    p.productID, p.productName;


SELECT * FROM ProductRevenueSummary
WHERE TotalRevenue > 1000.00 
ORDER BY TotalRevenue DESC;



-- BÀI 7
CREATE INDEX idx_orderDate
ON orders(orderDate);

CREATE INDEX idx_saleDate
ON sales(saleDate);

INSERT INTO sales (orderID, saleDate, saleAmount) VALUES
(1, '2024-11-01', 200.00),
(2, '2024-11-05', 150.00),
(3, '2024-11-10', 300.00),
(4, '2024-11-15', 450.00);


CREATE VIEW customerMonthlySales AS
SELECT c.customerID, 
		C.customerName, 
		CONCAT(MONTH(s.saleDate) , '-' , YEAR(s.saleDate)) AS MonthYear,
        SUM(s.saleAmount) AS TotalSales
FROM customers c
JOIN orders o ON o.customerID = c.customerID 
JOIN sales s ON s.orderID = o.orderID
GROUP BY c.customerID, c.customerName, YEAR(s.saleDate), MONTH(s.saleDate);

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

DROP VIEW customerMonthlySales;
SELECT * FROM customerMonthlySales;
SELECT @@sql_mode;
SET SESSION sql_mode = 'NO_ENGINE_SUBSTITUTION';


SELECT * FROM customerMonthlySales
WHERE TotalSales > 200.00 AND MonthYear = '11-2024';




















