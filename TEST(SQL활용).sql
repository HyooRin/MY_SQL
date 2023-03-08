
CREATE TABLE student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    grade VARCHAR(5) NOT NULL,
    major VARCHAR(10)    
);

CREATE TABLE product(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(5, 1) NOT NULL,
    expiration_date DATE     
);
INSERT INTO product(name, price, expiration_date)
VALUES
	('아이패드', 100, '2025-03-08'),
    ('애플워치', 50.3, '2024-03-08'),
    ('에어팟맥스', 80.2, '2026-03-08');
    
CREATE TABLE `order`(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    product_id INT,
    order_date VARCHAR(50) NOT NULL,
    FOREIGN KEY(product_id) REFERENCES product(id)
);
INSERT INTO `order`( customer_id, customer_name, product_id, order_date)
VALUES
	(1, '김효린', 3, '2023-03-08'),
    (2, '김수현', 2, '2022-02-08');
    
SELECT *
FROM `order` AS o
INNER JOIN product AS p
ON o.product_id = p.id;

    
