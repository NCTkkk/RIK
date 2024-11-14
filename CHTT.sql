CREATE DATABASE CHTT;
USE CHTT;

CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100),
    contactName VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATE,
    totalAmount DECIMAL(10,2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orderDetails(
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT,
    unitPrice DECIMAL(10,2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);


-- tạo 1 view để hiển thị tt đơn hàng
CREATE VIEW info_order AS
SELECT * FROM orders;

-- tạo 1 view để hiển thị chi tiết ĐH
CREATE VIEW info_orderDetails AS
SELECT * FROM orderDetails;

-- tạo chỉ mục cho bảng đơn hàng
CREATE INDEX index_order
ON orders (orderDate);

-- tạo chỉ mục cho chi tiết ĐH
CREATE INDEX index_orderDetails
ON orderDetails (quantity);






