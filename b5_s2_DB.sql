CREATE database b5_s2_DB;
USE b5_s2_DB;

CREATE table Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price decimal(10,2),
    StockQuantity INT
);

CREATE table Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    ProductID INT,
    Quantity INT,
    TotalAmount decimal(10,2)
);

alter table Orders
ADD constraint fk_Orders foreign key (ProductID)
references Products(ProductID);

/* Thêm dữ liệu */
insert into Products(ProductName, ProductID, Category, Price, StockQuantity)
values ('laptop', 2, 'điện tử', 20000000, 30),
    ('iphone 16', 3, 'điện tử', 30000000, 2),
    ('nồi inox', 1, 'gia dụng', 150000, 25);

insert into Orders(OrderDate, Quantity, TotalAmount)
values ('2023-01-15', 30 , 250.00),
    ('2022-06-20', 2, 100.00),
    ('2021-03-10', 25, 50.00);
    
select *
from Orders;
    
update Products
set Price = 180000
where ProductID = 3; 

select *
from Products;

update Orders
join Products on Products.ProductID = Orders.ProductID
set Orders.TotalAmount = Products.Price * Orders.Quantity;

SELECT ProductID, ProductName, StockQuantity
FROM Products;

select ProductName, Quantity, TotalAmount from Orders
join Products on Products.ProductID = Orders.ProductID;
    