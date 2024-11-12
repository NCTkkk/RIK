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






