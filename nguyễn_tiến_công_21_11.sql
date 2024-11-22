USE shopee_fake;

SELECT * FROM carts;

ALTER TABLE products
ADD CONSTRAINT FOREIGN KEY (categoryid) REFERENCES categories(categoryid);

ALTER TABLE products
ADD CONSTRAINT FOREIGN KEY (storeid) REFERENCES stores(storeid);

ALTER TABLE products
ADD CONSTRAINT FOREIGN KEY (storeid) REFERENCES stores(storeid);

ALTER TABLE carts
ADD CONSTRAINT FOREIGN KEY (userid) REFERENCES users(userid);

ALTER TABLE carts
ADD CONSTRAINT FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE images
ADD CONSTRAINT FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE order_details
ADD CONSTRAINT FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE order_details
ADD CONSTRAINT FOREIGN KEY (orderid) REFERENCES orders(orderid);

ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY (userid) REFERENCES users(userid);

ALTER TABLE orders
ADD CONSTRAINT FOREIGN KEY (storeid) REFERENCES stores(storeid);

ALTER TABLE reviews
ADD CONSTRAINT FOREIGN KEY (userid) REFERENCES users(userid);

ALTER TABLE reviews
ADD CONSTRAINT FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE stores
ADD CONSTRAINT FOREIGN KEY (userid) REFERENCES users(userid);


-- TRUY VẤN 


-- EX3

-- Liệt kê tất cả các thông tin về sản phẩm (products)
SELECT * FROM products;

-- Tìm tất cả các đơn hàng (orders) có tổng giá trị (totalPrice) lớn hơn 500,000
SELECT orderid, nameOrder, 
			SUM(totalPrice)  AS T
FROM orders
GROUP BY orderid
HAVING T > 500000;

-- Liệt kê tên và địa chỉ của tất cả các cửa hàng (stores)
SELECT storeName, addressStore
FROM stores;

-- tìm tất cả người dùng có địa chỉ email kết thúc bằng '@gmail.com'
SELECT userid, userName , email
FROM users
WHERE email like '%@gmail.com';

-- Hiển thị tất cả các đánh giá với mức giá =5
SELECT * FROM reviews
WHERE rate = 5;

-- liệt kê tất cả các sản phẩm có quantity < 10
SELECT * FROM products
WHERE quantity < 10;

-- Tìm tất cả các sản phẩm thuộc danh mục categoryId = 1.
SELECT * FROM categories
WHERE categoryId=1;

-- Đếm số lượng người dùng (users) có trong hệ thống
SELECT COUNT(userId) FROM users;

-- Tính tổng giá trị của tất cả các đơn hàng (orders).
SELECT SUM(totalPrice) FROM orders;

-- Tìm sản phẩm có giá cao nhất
SELECT MAX(price) FROM products;

-- Liệt kê tất cả các cửa hàng đang hoạt động (statusStore = 1)
SELECT storeid, storeName, statusStore
FROM stores
WHERE statusStore=1;

-- Đếm số lượng sản phẩm theo từng danh mục (categories).
SELECT cg.categoryId, COUNT(p.categoryId) AS num_products
FROM products p
INNER JOIN categories cg 
ON cg.categoryId = p.categoryId
GROUP BY cg.categoryId;

-- Tìm tất cả các sản phẩm mà chưa từng có đánh giá.
SELECT p.productId, p.productName, r.reviewId
FROM products p
LEFT JOIN reviews r
ON p.productId = r.productId
WHERE r.reviewId IS null;

-- Hiển thị tổng số lượng hàng đã bán (quantityOrder) của từng sản phẩm.
SELECT p.productId, p.productName, 
		SUM(od.quantityOrder) `Tổng số lượng đã bán`
FROM products p
INNER JOIN order_details od
ON p.productId = od.productId
GROUP BY productId;

-- Tìm các người dùng (users) chưa đặt bất kỳ đơn hàng nào.
SELECT * FROM users
WHERE userId <> ALL(
	SELECT userID FROM orders
);

-- Hiển thị tên cửa hàng và tổng số đơn hàng được thực hiện tại từng cửa hàng
SELECT s.storeId, s.storeName, 
		SUM(o.orderId)
FROM stores s
JOIN orders o ON o.storeId = s.storeId
GROUP BY s.storeId;

-- Hiển thị thông tin của sản phẩm, kèm số lượng hình ảnh liên quan.
SELECT productId, 
		productName, 
		COUNT(imageProduct) AS num_IMG
FROM products
GROUP BY productId;

-- Hiển thị các sản phẩm kèm số lượng đánh giá và đánh giá trung bình.
SELECT p.productID, 
		p.productName, 
		COUNT(r.reviewID) AS num_reviews,
        AVG(r.rate) AS TB_rate
FROM products p
LEFT JOIN reviews r 
ON r.productID = p.productID
GROUP BY p.productID;

-- Tìm người dùng có số lượng đánh giá nhiều nhất.
SELECT u.userID , u.userName, 
		COUNT(r.reviewID) AS max
FROM users u
LEFT JOIN reviews r 
ON r.userID = u.userID
GROUP BY u.userID
HAVING max=(
	SELECT COUNT(r.reviewID) AS find_max
	FROM users u
	LEFT JOIN reviews r 
	ON r.userID = u.userID
	GROUP BY u.userID
	ORDER BY find_max DESC
	limit 1
);

-- Hiển thị top 3 sản phẩm bán chạy nhất (dựa trên số lượng đã bán)
SELECT  productID, 
		SUM(quantitySold) AS QS
FROM products
GROUP BY productID
ORDER BY QS DESC
LIMIT 3;


-- Tìm sản phẩm bán chạy nhất tại cửa hàng có storeId = 'S001'.
SELECT p.productID, s.storeName, 
		MAX(p.price*p.quantitySold) AS bestSelling
FROM products p
JOIN stores s
ON s.storeID = p.storeID
WHERE s.storeID = 'S001'
GROUP BY p.productID;

-- Hiển thị danh sách tất cả các sản phẩm có giá trị tồn kho lớn hơn 1 triệu (giá * số lượng).
SELECT * FROM products
WHERE (price * quantity) >10000000;

-- Tìm cửa hàng có tổng doanh thu cao nhất
SELECT s.storeID,  
		MAX(p.price*p.quantitySold) AS bestSelling
FROM stores s
LEFT JOIN products p
ON s.storeID = p.storeID
GROUP BY s.storeID
ORDER BY bestSelling DESC
LIMIT 1;


-- Hiển thị danh sách người dùng và tổng số tiền họ đã chi tiêu
SELECT u.userID, SUM(totalPrice) `tổng tiền đã chi`
FROM users u
LEFT JOIN orders o
ON o.userID = u.userID
GROUP BY u.userID;

-- Tìm đơn hàng có tổng giá trị cao nhất và liệt kê thông tin chi tiết
SELECT o.orderID, od.*
FROM orders o
JOIN order_details od
ON  od.orderID = o.orderID
WHERE o.totalPrice=(
	SELECT MAX(totalPrice)
	FROM orders
);


-- Tính số lượng sản phẩm trung bình được bán ra trong mỗi đơn hàng
SELECT o.orderID, AVG(p.quantitySold)
FROM orders o
JOIN order_details od 
ON od.orderID= o.orderID
JOIN products p 
ON p.productID = od.productID
GROUP BY o.orderID;

-- Hiển thị tên sản phẩm và số lần sản phẩm đó được thêm vào giỏ hàng
SELECT p.productName, COUNT(c.cartID)
FROM products p 
LEFT JOIN carts c ON c.productID = p.productID
GROUP BY p.productName;

-- Tìm tất cả các sản phẩm đã bán nhưng không còn tồn kho trong kho hàng
SELECT * FROM products
WHERE (quantitySold <> 0) AND productID =ANY(
	SELECT productID
	FROM products
	WHERE quantity=0
);

-- Tìm các đơn hàng được thực hiện bởi người dùng có email là duong@gmail.com'
SELECT o.orderID, u.email
FROM orders o
LEFT JOIN users u 
ON u.userID = o.userID
WHERE u.email = 'duong@gmail.com';

-- Hiển thị danh sách các cửa hàng kèm theo tổng số lượng sản phẩm mà họ sở hữu
SELECT s.storeID, COUNT(p.productID)
FROM stores s
JOIN products p 
ON p.storeID = s.storeID
GROUP BY  s.storeID;

-- EX 4
-- View hiển thị tên sản phẩm (productName) và giá (price) từ bảng products với giá trị giá (price) lớn hơn 500,000 có tên là expensive_products
CREATE VIEW expensive_products AS
SELECT productName,price FROM products
WHERE price>50000;

-- Truy vấn dữ liệu từ view vừa tạo expensive_products
SELECT * FROM expensive_products;

-- Làm thế nào để cập nhật giá trị của view? Ví dụ, cập nhật giá (price) thành 600,000 cho sản phẩm có tên Product A trong view expensive_products.
-- thực hiện cập nhật bảng ảo giống các bước với bảng chính
UPDATE expensive_products
SET price = 600000
WHERE productName = 'Loa Máy Tính Để Bàn';

-- Làm thế nào để xóa view expensive_products?
DROP VIEW expensive_products;

-- Tạo một view hiển thị tên sản phẩm (productName), tên danh mục (categoryName) bằng cách kết hợp bảng products và categories
CREATE VIEW pro_cate AS
SELECT p.productName, c.categoryName
FROM products p 
INNER JOIN categories c 
ON c.categoryID = p.categoryID;



-- EX 5
-- Làm thế nào để tạo một index trên cột productName của bảng products
CREATE INDEX  idx_productName
ON products(productName);

-- Hiển thị danh sách các index trong cơ sở dữ liệu
SHOW INDEXES FROM products;

-- Trình bày cách xóa index idx_productName đã tạo trước đó
DROP INDEX idx_productName ON  products;

-- Tạo một procedure tên getProductByPrice để lấy danh sách sản phẩm với giá lớn hơn một giá trị đầu vào (priceInput)
DELIMITER //
CREATE PROCEDURE getProductByPrice(IN priceInput INT)
BEGIN
	SELECT * FROM products
    WHERE price > priceInput;
END //
DELIMITER ;


-- Làm thế nào để gọi procedure getProductByPrice với đầu vào là 500000?
CALL getProductByPrice(500000);


-- Tạo một procedure getOrderDetails trả về thông tin chi tiết đơn hàng với đầu vào là orderId?
DELIMITER //
CREATE PROCEDURE getOrderDetails(IN ip_orderID INT)
BEGIN
	SELECT od.* FROM order_details od
    JOIN orders o ON o.orderID = od.orderID
    WHERE orderID = ip_orderID;
END //
DELIMITER ;

-- xóa procedure getOrderDetails
DROP PROCEDURE getOrderDetails; 
-- hoặc chuột phải vào procedure muốn xóa xong chọn DROP STORED PROCEDURE...


-- Tạo một procedure tên addNewProduct để thêm mới một sản phẩm vào bảng products. Các tham số gồm productName, price, description, và quantity
DELIMITER //
CREATE PROCEDURE  addNewProduct(IN ip_productName VARCHAR(255), 
								IN ip_price INT ,
                                IN ip_description LONGTEXT,
                                IN ip_quantity INT)
BEGIN
	INSERT INTO products(productName, 
						price, 
                        `description`, 
                        quantity)
	VALUES
		(ip_productName, ip_price, ip_description, ip_quantity);
END //
DELIMITER ;

-- Tạo một procedure tên deleteProductById để xóa sản phẩm khỏi bảng products dựa trên tham số productId
DELIMITER //
CREATE PROCEDURE  deleteProductById(IN ip_productID INT)
BEGIN
	DELETE FROM products 
    WHERE productID = ip_productID;
END //
DELIMITER ;

-- Tạo một procedure tên searchProductByName để tìm kiếm sản phẩm theo tên (tìm kiếm gần đúng) từ bảng products
DELIMITER //
CREATE PROCEDURE  searchProductByName(IN ip_productName VARCHAR(255))
BEGIN
	SELECT * FROM products
    WHERE productName LIKE concat('%', ip_productName, '%');
END //
DELIMITER ;

-- Tạo một procedure tên filterProductsByPriceRange để lấy danh sách sản phẩm có giá trong khoảng từ minPrice đến maxPrice
DELIMITER //
CREATE PROCEDURE  filterProductsByPriceRange(IN minPrice INT, IN maxPrice INT)
BEGIN
	SELECT * FROM products
    WHERE price BETWEEN minPrice AND maxPrice;
END //
DELIMITER ;


-- Tạo một procedure tên paginateProducts để phân trang danh sách sản phẩm, với hai tham số pageNumber và pageSize
DELIMITER //
CREATE PROCEDURE  paginateProducts(IN pageNumber INT, IN pageSize INT)
BEGIN
	DECLARE KKK INT;
    SET KKK = (pageNumber-1)*pageSize;
	SELECT * FROM products
	LIMIT pageSize
	OFFSET KKK;
END //
DELIMITER ;


