CREATE DATABASE s6_DB;
USE s6_DB;

-- BAI 3
CREATE TABLE customers(
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE orders(
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    orderDate DATETIME,
    totalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE sales(
	saleID INT PRIMARY KEY AUTO_INCREMENT,
    orderID int,
    saleDate DATE,
    saleAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

CREATE TABLE promotions(
	promotionID INT PRIMARY KEY AUTO_INCREMENT,
    promotionName VARCHAR(100) NOT NULL,
    discountPercentage DECIMAL(10,2)
);

CREATE TABLE products(
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    promotionID INT ,
    FOREIGN KEY (promotionID) REFERENCES promotions(promotionID)
);

CREATE TABLE orderDetails(
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    productID INT,
    quantity INT NOT NULL,
    unitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (orderID) REFERENCES orders(orderID)
);

INSERT INTO customers (firstName, LastName, Email) VALUES
('John', 'Doe', 'johndoe@example.com'),
('Jane', 'Smith', 'janesmith@example.com'),
('Robert', 'Brown', 'robertbrown@example.com'),
('Emily', 'Davis', 'emilydavis@example.com');

INSERT INTO promotions (promotionName, discountPercentage) VALUES
('Holiday Sale', 10.00),
('Clearance Sale', 20.00),
('New Year Discount', 15.00),
('Black Friday', 25.00);

INSERT INTO products (productName, price, promotionID) VALUES
('Laptop', 1500.00, 1),
('Smartphone', 800.00, 2),
('Tablet', 500.00, 3),
('Headphones', 200.00, NULL);

INSERT INTO orders (customerID, orderDate, totalAmount) VALUES
(1, '2024-9-01 10:00:00', 1500.00),
(2, '2024-9-05 14:30:00', 800.00),
(3, '2024-11-10 16:45:00', 1000.00),
(4, '2024-11-15 19:00:00', 700.00);

INSERT INTO orderDetails (orderID, productID, quantity, unitPrice) VALUES
(1, 1, 1, 1500.00),
(2, 2, 1, 800.00),
(3, 3, 2, 500.00),
(4, 4, 3, 200.00);

INSERT INTO sales (orderID, saleDate, saleAmount) VALUES
(1, '2024-9-02', 1500.00),
(2, '2024-9-06', 800.00),
(3, '2024-11-11', 1000.00),
(4, '2024-11-16', 700.00);

DELIMITER //
CREATE PROCEDURE UpdateOrderTotalAmount(
		IN inOrderID INT, 
        IN inNewTotalAmount DECIMAL(10,2)
)
BEGIN
	UPDATE orders
    SET totalAmount = inNewTotalAmount
    WHERE orderID = inOrderID;
END //
DELIMITER ;



-- BAI 2
DELIMITER //
CREATE PROCEDURE AddNewCustomer(
		IN inFirstName VARCHAR(50), 
		IN inLastName  VARCHAR(50),
        IN inEmail VARCHAR(100)
)
BEGIN
	INSERT INTO customers(firstName, lastName, email)
    VALUES (inFirstName, inLastName, inEmail);
END //
DELIMITER ;



-- BAI 1
DELIMITER //
CREATE PROCEDURE GetCustomerTotalRevenue(
		IN inCustomerID INT, 
		IN inStartDate  DATE,
        IN inEndDate DATE,
        OUT totalRevenue DECIMAL(10,2)
)
BEGIN
	SELECT SUM(totalAmount) 
    INTO totalRevenue
	FROM customers c
    JOIN orders o ON o.customerID = c.customerID
    WHERE c.customerID = inCustomerID 
			AND (orderDate BETWEEN inStartDate AND inEndDate);
END //
DELIMITER ;

CALL GetCustomerTotalRevenue(1, '2024-01-01', '2024-12-31', @totalRevenue);
SELECT @totalRevenue;



-- BAI 4
DELIMITER //
CREATE PROCEDURE DeleteOrderAndSales(
		IN inOrderID INT
)
BEGIN
	DELETE FROM orders
    WHERE orderID = inOrderID;
END //
DELIMITER ;




-- BAI 5
DELIMITER //
CREATE PROCEDURE GetMonthlyRevenueByCustomer (
		IN inCustomerID INT,
        IN inMonthYear VARCHAR(30)
)
BEGIN
	SELECT SUM(totalAmount) AS totalRevenue
	FROM orders o
    WHERE customerID = inCustomerID 
		AND DATE_FORMAT(orderDate, '%Y-%m') = inMonthYear;
END //
DELIMITER ;



-- BAI 6
DELIMITER //
CREATE PROCEDURE UpdateOrderTotalAndApplyPromotion(
		IN inOrderID INT,
        IN inNewTotalAmount  DECIMAL(10,2),
        IN inRevenueThreshold DECIMAL(10,2)
)
BEGIN
	UPDATE orders
    SET totalAmount = inNewTotalAmount
    WHERE orderID = inOrderID;
    
    IF inNewTotalAmount > inRevenueThreshold THEN
    INSERT INTO promotions(promotionName, discountPercentage)
    VALUES
		('HIGH VENUE DISCOUNT', 15.00);
    END IF;
END //
DELIMITER ;


SELECT * FROM promotions;

CALL UpdateOrderTotalAndApplyPromotion(1, 1200.00, 1000.00);


-- BAI 7



