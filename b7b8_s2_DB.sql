CREATE database b7b8_s2_DB;
use b7b8_s2_DB;

/* BÀI 7 */
create table Sales(
	SaleID INT primary key auto_increment,
    SaleDate date,
    CustomerID INT,
    TotalAmount decimal(10,2)
);

create table Products(
	ProductID INT primary key auto_increment,
    ProductName varchar(255),
    Category varchar(255),
    Price decimal(10,2)
);

create table SalesDetails(
	SaleDetailID INT primary key auto_increment,
    SalesID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice decimal(10,2),
    foreign key (SalesID) references Sales(SaleID),
    foreign key (ProductID) references Products(ProductID)
);

/* thêm dữ liệu */
INSERT INTO Sales (SaleDate, CustomerID, TotalAmount)
VALUES 
    ('2023-10-01', 1, 150.00),
    ('2023-10-02', 2, 300.00),
    ('2023-10-03', 3, 450.00);

INSERT INTO Products (ProductName, Category, Price)
VALUES 
    ('Product A', 'Electronics', 50.00),
    ('Product B', 'Furniture', 150.00),
    ('Product C', 'Groceries', 20.00);
    
INSERT INTO SalesDetails (SalesID, ProductID, Quantity, UnitPrice)
VALUES 
    (1, 1, 2, 50.00),   
    (2, 2, 1, 150.00),  
    (3, 3, 3, 20.00); 

/* tìm tổng doanh thu theo danh mục sản phẩm trong quý gần nhất */
SELECT 
    Products.Category,
    SUM(SalesDetails.Quantity * SalesDetails.UnitPrice) AS TotalRevenue
FROM 
    SalesDetails 
JOIN 
    Products Products ON SalesDetails.ProductID = Products.ProductID
JOIN 
    Sales  ON SalesDetails.SalesID = Sales.SaleID
WHERE 
    YEAR(Sales.SaleDate) = YEAR(CURDATE()) AND 
    QUARTER(Sales.SaleDate) = QUARTER(CURDATE())
GROUP BY 
    Products.Category;

/* Xác định danh mục sản phẩm nào có doanh thu cao nhất và hiển thị thông tin về doanh thu tổng cộng của danh mục đó.*/
SELECT 
    p.Category,
    SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM 
    SalesDetails sd
JOIN 
    Products p ON sd.ProductID = p.ProductID
JOIN 
    Sales s ON sd.SalesID = s.SaleID
GROUP BY 
    p.Category
ORDER BY 
    TotalRevenue DESC;
    
/*BÀI 8*/
/* Viết một câu lệnh T-SQL để tính toán doanh thu hàng tháng của năm trước.*/
SELECT 
    Products.Category,
    SUM(SalesDetails.Quantity * SalesDetails.UnitPrice) AS TotalRevenue
FROM 
    SalesDetails 
JOIN 
    Products ON SalesDetails.ProductID = Products.ProductID
JOIN 
    Sales  ON SalesDetails.SalesID = Sales.SaleID
WHERE 
    YEAR(Sales.SaleDate) = YEAR(CURDATE())-1
GROUP BY 
    Products.Category;
















