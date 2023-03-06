
SHOW CREATE TABLE `order`;
-- DROP TABLE `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  customer_order VARCHAR(50) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

-- 데이터를 입력하는 쿼리 구문을 작성해주세요 
INSERT INTO `order` (id, customer_order, product_name, quantity, order_date)
VALUES(1, '빠른배송', '신라면', 2, '2022-02-25' );

SELECT * FROM `order`;

-- DATE 타입에 값을 넣을 때 작은따옴표나 큰따옴표를 사용해도 되고
-- 정수값을 입력하여도 된다. 단, 날짜 형식에 맞는 값이어야 한다. 
-- 1년은 12개월인데 13이라는 값을 넣으면 알아서 오류를 일으켜준다. 
INSERT INTO `order` (id, customer_order, product_name, quantity, order_date)
VALUES(2, '빠른배송', '신라면', 2, 20220225);

INSERT INTO `order` (id, customer_order, product_name, quantity, order_date)
VALUES(2, '빠른배송', '신라면', 2, 20222225);

INSERT INTO `order` (id, customer_order, product_name, quantity, order_date)
VALUES(2, '빠른배송', '신라면', 2, '20222225');

-- YYYY-MM-DD : mysql 기본 DATE의 데이터 타입 기본 포멧
-- YYYY/MM/DD
-- YYYYMMDD

-- DROP TABLE customer;

-- AUTO_INCREMENT 사용하기
-- 고객 테이블 생성

CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);
INSERT INTO customer(name, email, address)
VALUES 
	('김철수', 'A@naver.com', '서울시 강남구 역삼동'),
    ('박영희', 'B@naver.com', '서울시 강남구 천호동'),
    ('김철수', 'A@naver.com', '서울시 강남구 역삼동');

SELECT * FROM customer;








