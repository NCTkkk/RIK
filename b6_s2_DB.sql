CREATE database b6_s2_DB;
USE b6_s2_DB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

/* Thêm dữ liệu cho Customers */
INSERT INTO Customers (CustomerName, Email, Phone)
VALUES 
    ('Nguyen Van A', 'nguyenvana@example.com', '0123456789'),
    ('Tran Thi B', 'tranthib@example.com', '0987654321');
    
/* Thêm dữ liệu cho Orders */
INSERT INTO Orders (OrderDate, CustomerID)
VALUES 
    ('2023-11-01', 1), 
    ('2023-11-02', 2), 
    ('2023-11-03', 1); 
    
    
/* Thêm dữ liệu cho OrderDetails */
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 2, 100.00), 
    (1, 2, 1, 200.00),  
    (2, 1, 3, 100.00),  
    (2, 3, 1, 150.00),  
    (3, 2, 2, 200.00);  
    
/* Cập nhật sđt của một khách hàng cụ thể*/
update Customers
set Phone = 0999999999
where CustomerID = 2;

/* Xóa tất cả các đơn hàng của khách hàng không còn hoạt động*/
delete Orders 
from Orders 
left join Customers on Orders.CustomerID = Customers.CustomerID
where Customers.CustomerID is null;

/* truy vấn để lấy danh sách tất cả khách hàng cùng với tổng số đơn hàng mà họ đã đặt */
SELECT Customers.CustomerID, Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.CustomerName;

/* lấy thông tin về tất cả các chi tiết đơn hàng, bao gồm tên sản phẩm, số lượng, và tổng số tiền của mỗi đơn hàng, phân nhóm theo OrderID. */
SELECT OrderID, ProductID, Quantity, 
       (Quantity * UnitPrice) AS TotalAmount
FROM OrderDetails
ORDER BY OrderID;

    




