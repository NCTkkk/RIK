USE 12_11;

ALTER TABLE building 
ADD CONSTRAINT FK_hostID FOREIGN KEY (host_id) 
REFERENCES `host`(id);

ALTER TABLE building 
ADD CONSTRAINT FK_conID FOREIGN KEY (contractor_id) 
REFERENCES `contractor`(id);

ALTER TABLE `work` 
ADD CONSTRAINT FK_buiID FOREIGN KEY (building_id) 
REFERENCES `building`(id);

ALTER TABLE `work` 
ADD CONSTRAINT FK_workerID FOREIGN KEY (worker_id) 
REFERENCES `worker`(id);

ALTER TABLE design 
ADD CONSTRAINT FK_buildID FOREIGN KEY (building_id) 
REFERENCES `building`(id);

ALTER TABLE design 
ADD CONSTRAINT FK_archID FOREIGN KEY (architect_id) 
REFERENCES `architect`(id);


-- EX3
SELECT * FROM building;

-- Công trình có chi phí cao nhất
SELECT `name`,cost
FROM building
WHERE cost = (
	SELECT  MAX(cost) AS `Công trình có chi phí cao nhất`
	FROM building
);

-- thông tin công trình có chi phí lớn hơn tất cả các công trình được xây dựng ở Cần Thơ
SELECT *
FROM building
WHERE cost > ALL (
	SELECT cost FROM building 
    WHERE city = 'can tho'
);

-- Hiển thị thông tin công trình có chi phí lớn hơn một trong các công trình được xây dựng ở Cần Thơ
SELECT *
FROM building
WHERE city <> 'can tho' AND cost > ANY (
	SELECT cost FROM building 
    WHERE city = 'can tho'
);

-- Hiển thị thông tin công trình chưa có kiến trúc sư thiết kế
SELECT * FROM building
WHERE id NOT IN (
	SELECT building_id FROM design
);


-- Hiển thị thông tin các kiến trúc sư cùng năm sinh và cùng nơi tốt nghiệp



-- EX4
-- Hiển thị thù lao trung bình của từng kiến trúc sư
SELECT architect_id, AVG(benefit) AS `thù lao TB`
FROM design
GROUP BY architect_id;

-- Hiển thị chi phí đầu tư cho các công trình ở mỗi thành phố
SELECT city , sum(cost) AS `chi phí`
FROM building 
GROUP BY city;

-- Tìm các công trình có chi phí trả cho kiến trúc sư lớn hơn 50
SELECT building_id, sum(benefit) AS T 
FROM design
GROUP BY building_id;


-- Tìm các thành phố có ít nhất một kiến trúc sư tốt nghiệp
SELECT * FROM architect;


-- EX5

-- Hiển thị tên công trình, tên chủ nhân và tên chủ thầu của công trình đó
SELECT building.fname AS `công trình`,  `host`.fname AS `chủ nhân`, contractor.`name` AS `chủ thầu`
FROM building 
INNER JOIN `host`  ON building.host_id = `host`.id
INNER JOIN contractor ON building.contractor_id = contractor.id;


-- Hiển thị tên công trình (building), tên kiến trúc sư (architect) và thù lao của kiến trúc sư ở mỗi công trình (design)
SELECT b.fname AS `công trình`,  a.`name` AS `kiến trúc sư`, d.benefit AS `thù lao`
FROM building b
INNER JOIN design d ON d.building_id = b.id
INNER JOIN architect a ON d.architect_id = a.id;
 

-- tên và địa chỉ công trình (building) do chủ thầu Công ty xây dựng số 6 thi công (contractor)
SELECT b.fname AS `công trình`,  c.`name` AS `chủ thầu`
FROM building b
INNER JOIN contractor c ON b.contractor_id = c.id
WHERE c.id =1;


-- Tìm tên và địa chỉ liên lạc của các chủ thầu (contractor) thi công công trình ở Cần Thơ (building) do kiến trúc sư Lê Kim Dung thiết kế (architect, design)
SELECT c.`name` AS `chủ thầu`,  c.address AS `địa chỉ chủ thầu`, a.`name` AS `kiến trúc sư`
FROM building b
INNER JOIN design d ON d.building_id = b.id
INNER JOIN architect a ON d.architect_id = a.id
INNER JOIN contractor c ON b.contractor_id = c.id
WHERE b.city= 'can tho' AND a.id=2;


-- Hãy cho biết nơi tốt nghiệp của các kiến trúc sư (architect) đã thiết kế (design) công trình Khách Sạn Quốc Tế ở Cần Thơ (building)
SELECT a.`name` AS `kiến trúc sư`, a.place AS `nơi tốt nghiệp`, b.fname AS `công trình`
FROM building b
INNER JOIN design d ON d.building_id = b.id
INNER JOIN architect a ON d.architect_id = a.id
WHERE b.fname = 'khach san quoc te' AND b.city = 'can tho';


-- Cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyên môn hàn hoặc điện (worker) đã tham gia các công trình (work) mà chủ thầu Lê Văn Sơn (contractor) đã trúng thầu (building)
SELECT w.`name`AS `tên công nhân`, w.birthday AS `sinh nhật`, w.`year` AS `năm vào nghề`, w.skill AS `chuyên môn` 
FROM worker w
INNER JOIN `work` wo ON w.id = wo.worker_id
INNER JOIN building b ON wo.building_id = b.id
INNER JOIN contractor c ON c.id = b.contractor_id
WHERE (w.skill = 'han' OR w.skill = 'dien') AND c.`name` = 'le van son';


-- Những công nhân nào (worker) đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ (building) trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994 (work) số ngày tương ứng là bao nhiêu
SELECT w.`name`, wo.total AS `số ngày tương ứng`, b.fname, b.city
FROM worker w
INNER JOIN `work` wo ON wo.worker_id = w.id
INNER JOIN building b ON b.id = wo.building_id
WHERE (wo.`date` between '1994-12-15' and '1994-12-31')
	and b.fname='khach san quoc te' and b.city='can tho';


-- Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP Hồ Chí Minh (architect) và đã thiết kế ít nhất một công trình (design) có kinh phí đầu tư trên 400 triệu đồng (building)
SELECT a.id, a.`name`, a.birthday
FROM architect a
JOIN design d ON d.architect_id = a.id
JOIN building b ON b.id = d.building_id
WHERE a.place = 'tp hcm' AND b.cost > 400;


-- Cho biết tên công trình có kinh phí cao nhất
SELECT max(cost) AS `công trình có kinh phí cao nhất`
FROM building;


-- Cho biết tên các kiến trúc sư (architect) vừa thiết kế các công trình (design) do Phòng dịch vụ sở xây dựng (contractor) thi công vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công
SELECT a.`name`AS `kiến trúc sư`, b.fname AS `công trình`, c.`name` AS `chủ thầu`
FROM architect a
JOIN design d ON d.architect_id = a.id
JOIN building b ON b.id = d.building_id
JOIN contractor c ON c.id = b.contractor_id
WHERE c.`name` = 'phong dich vu so xd' AND c.`name` = 'le van son';  

-- Cho biết họ tên các công nhân (worker) có tham gia (work) các công trình ở Cần Thơ (building) nhưng không có tham gia công trình ở Vĩnh Long
SELECT wr.`name` AS `công nhân`, b.city AS `công trình`
FROM worker wr
JOIN `work` w ON w.worker_id = wr.id
JOIN building b ON b.id = w.building_id
WHERE b.city = 'can tho' AND b.city <> 'vinh long' ;

-- Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí lớn hơn tất cả các công trình do chủ thầu phòng Dịch vụ Sở xây dựng thi công
SELECT c.`name`AS `chủ thầu` , b.`fname` AS `công trình` , b.cost AS `kinh phí`
FROM contractor c
JOIN building b ON c.id = b.contractor_id
WHERE b.cost > all(
	SELECT b.cost  
	FROM building b
	JOIN contractor c ON c.id = b.contractor_id
	WHERE c.`name` = 'phong dich vu so xd'
);



-- Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó dưới giá trị trung bình thù lao thiết kế cho một công trình
SELECT a.`name` AS `kiến trúc sư`
FROM architect a
JOIN design d ON d.architect_id = a.id
WHERE d.benefit < (
	SELECT AVG(benefit) FROM design);
 

-- Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất
SELECT c.`name` AS `chủ thầu`, c.`address` AS `địa chỉ`, b.`fname` AS `công trình`
FROM contractor c
JOIN building b ON b.contractor_id = c.id
WHERE b.cost = (
		SELECT MIN(cost)
        FROM building
);

-- Tìm họ tên và chuyên môn của các công nhân (worker) tham gia (work) các công trình do kiến trúc sư Le Thanh Tung thiet ke (architect) (design)
SELECT wr.`name` AS `công nhân`, wr.`skill` AS `chuyên môn`, a.`name` AS `kiến trúc sư`, b.`fname` AS `công trình`
FROM worker wr
JOIN `work` w ON w.worker_id = wr.id
JOIN building b ON b.id = w.building_id
JOIN design d ON d.building_id = b.id
JOIN architect a ON a.id = d.architect_id
WHERE a.`name` = 'le thanh tung';


-- Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
SELECT b.id AS `id`, c.`name` AS `chủ thầu`, b.fname AS `công trình` 
FROM contractor c
JOIN building b ON b.contractor_id = c.id
GROUP BY b.id;

-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
SELECT c1.`name` AS `chủ thẩu 1`, c2.`name` AS `chủ thầu 2`,  b1.city
FROM building b1
JOIN building b2 ON b1.city = b2.city AND b1.id < b2.id
JOIN contractor c1 ON b1.contractor_id = c1.id
JOIN contractor c2 ON b2.contractor_id = c2.id
WHERE b1.contractor_id <> b2.contractor_id;


-- Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
SELECT c.id, c.`name`, SUM(cost) AS `tổng kinh phí các công trình`
FROM building b
JOIN contractor c ON c.id = b.contractor_id
GROUP BY c.id;


-- Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT a.id, a.`name`, SUM(d.benefit) 
FROM architect a
JOIN design d ON d.architect_id = a.id
GROUP BY a.id, a.`name`
HAVING SUM(d.benefit) >25;

-- Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
SELECT COUNT(*) AS architects_count
FROM (
    SELECT a.id, SUM(d.benefit) AS total_benefit
    FROM architect a
    JOIN design d ON d.architect_id = a.id
    GROUP BY a.id
    HAVING total_benefit > 25
) AS architect_with_benefit;


-- Tìm tổng số công nhân đã than gia ở mỗi công trình
SELECT b.id, COUNT(wr.id) AS `Tổng công nhân tham gia`
FROM building b
JOIN `work` w ON w.building_id = b.id
JOIN worker wr ON wr.id = w.worker_id
GROUP BY b.id;


-- Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
SELECT b.fname, b.address, COUNT(wr.id) AS total_workers
FROM building b
JOIN `work` w ON w.building_id = b.id
JOIN worker wr ON wr.id = w.worker_id
GROUP BY b.id
HAVING total_workers = (
	SELECT COUNT(wr.id) AS max_count
	FROM building b
	JOIN `work` w ON w.building_id = b.id
	JOIN worker wr ON wr.id = w.worker_id
	GROUP BY b.id
	ORDER BY max_count DESC
	limit 1
);


-- Cho biêt tên các thành phố và kinh phí trung bình cho mỗi công trình của từng thành phố tương ứng
SELECT city, AVG(cost) AS `kinh phí TB`
FROM building
GROUP BY city;


-- Cho biết họ tên các công nhân có tổng số ngày tham gia vào các công trình lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
-- Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố
-- Cho biết họ tên công nhân có tham gia ở tất cả các công trình


-- EX6
CREATE TABLE department(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nameDP VARCHAR(100) UNIQUE
);

CREATE TABLE nv (
    nv_id INT PRIMARY KEY AUTO_INCREMENT,
    nameNV VARCHAR(45),
    age INT,
    salary FLOAT
);

CREATE TABLE nv_department (
    nv_id INT,
    dp_id INT,
    FOREIGN KEY (nv_id) REFERENCES nv(nv_id),
    FOREIGN KEY (dp_id) REFERENCES department(id),
    PRIMARY KEY (nv_id, dp_id)
);


INSERT INTO department (nameDP) VALUES ('HR'), ('Engineering'), ('Marketing'), ('Sales'),('Accounting');


INSERT INTO nv (nameNV, age, salary) VALUES ('Nguyen Van A', 30, 5000.00), 
                                             ('Tran Thi B', 28, 4500.00),
                                             ('Le Van C', 35, 7000.00),
                                             ('Pham Thi D', 40, 7500.00),
                                             ('Hoang Van E', 26, 4000.00);


INSERT INTO nv_department (nv_id, dp_id) VALUES 
    (1, 1), (1, 2), 
    (2, 3),        
    (3, 4),         
    (4, 2), (4, 5), 
    (5, 1);         

--  liệt kê tất cả các nhân viên trong bộ phận có tên là "Kế toán". Kết quả cần hiển thị mã nhân viên và tên nhân viên
SELECT nv.nv_id, nv.nameNV, d.nameDP
FROM nv 
JOIN nv_department nd ON nd.nv_id = nv.nv_id
JOIN department d ON d.id = nd.dp_id
WHERE d.nameDP = 'Accounting';

-- tìm các nhân viên có mức lương lớn hơn 50,000. Kết quả trả về cần bao gồm mã nhân viên, tên nhân viên và mức lương
SELECT nv_id, nameNV, salary
FROM nv
WHERE salary > 5000.00;

-- hiển thị tất cả các bộ phận và số lượng nhân viên trong từng bộ phận. Kết quả trả về cần bao gồm tên bộ phận và số lượng nhân viên
SELECT nd.dp_id, d.nameDP, COUNT(nd.nv_id)
FROM nv_department nd
JOIN department d ON d.id = nd.dp_id
JOIN nv ON nv.nv_id =  nd.nv_id
GROUP BY nd.dp_id;



-- tìm ra các thành viên có mức lương cao nhất theo từng bộ phận. Kết quả trả về là một danh sách theo bất cứ thứ tự nào. Nếu có nhiều nhân viên bằng lương nhau nhưng cũng là mức lương cao nhất thì hiển thị tất cả những nhân viên đó ra.
-- Viết câu lệnh SQL để tìm các bộ phận có tổng mức lương của nhân viên vượt quá 100,000 (hoặc một mức tùy chọn khác). Kết quả trả về bao gồm tên bộ phận và tổng mức lương của bộ phận đó
SELECT d.id,d.nameDP, SUM(nv.salary) AS total_salary
FROM department d
JOIN nv_department nd ON nd.dp_id = d.id
JOIN nv ON nv.nv_id = nd.nv_id
GROUP BY d.id
HAVING total_salary > 10000.00;


--  liệt kê tất cả các nhân viên làm việc trong hơn 2 bộ phận khác nhau. Kết quả cần hiển thị mã nhân viên, tên nhân viên và số lượng bộ phận mà họ tham gia.
SELECT nv.nv_id, nv.nameNV, COUNT(d.id) AS quantity_dp
FROM nv
JOIN nv_department nd ON nd.nv_id = nv.nv_id
JOIN department d ON d.id = nd.dp_id
GROUP BY nv.nv_id
HAVING quantity_dp >=2;











