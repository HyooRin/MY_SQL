
CREATE DATABASE shopdb;
USE shopdb;

CREATE TABLE useTBL(
	username CHAR(3) NOT NULL,
    birthYear INT NOT NULL,
    addr CHAR(2) NOT NULL,
    mobile CHAR(13) NOT NULL,
    PRIMARY KEY(username)
);

ALTER TABLE useTBL MODIFY mobiLe VARCHAR(13);

CREATE TABLE buyTBL(
	username CHAR(3) NOT NULL,
    prodName CHAR(3) NOT NULL,
    price INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY(username) REFERENCES useTBL(username)
);

insert into useTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into useTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into useTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

-- 에러발생 
-- 현재 부모테이블 useTBL에 야스오는 없는 사람이기때문에 존재할 수 없다.
insert into buyTBL values('야스오', '책', 10, 3);

SELECT * FROM useTBL;
SELECT * FROM buytbl;

-- inner join
SELECT * 
FROM useTBL
INNER JOIN buyTBL
ON useTBL.username = buyTBL.username;

-- left join
select *
from useTBL 
LEFT JOIN buyTBL 
ON useTBL.username = buyTBL.username;

SELECT * 
FROM useTBL;

-- 야스오 회원가입 함
INSERT INTO useTBL(username, birthYear, addr, mobile)
VALUES('야스오', 2020, '부산', '010-1234-1234');

SELECT *
FROM useTBL
LEFT JOIN buyTBL
ON useTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 다시 inner join 작성해보기
SELECT *
FROM useTBL  AS U
INNER JOIN buyTBL AS B
ON U.username = B.username;

-- 별칭사용해서 LEFT JOIN, LEFT JOIN IS NOT NULL 작성해보기 
SELECT *
FROM useTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM useTBL AS U 
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과 집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다.
SELECT *
FROM buyTBL AS b
LEFT JOIN useTBL AS u
ON b.username = u.username;

-- RIGHT JOIN
SELECT U.username, B.prodName, B.price, B.amount
FROM useTBL AS U
RIGHT JOIN buyTBL AS B
ON U.username = B.username;

--  연산자 사용해보기 
SELECT U.username, B.prodName,B.price, B.amount,(B.price * B.amount) AS 'sum'
FROM useTBL AS U
RIGHT JOIN buyTBL AS B
ON U.username = B.username;


-- INNER JOIN, LEFT JOIN, RIGHT JOIN 문제 만들어 보고 쿼리를 출력해주세요 
-- 1. 사용자 '이승기'의 정보와 구매이력을 같이 볼 수 있도록 해줘 
SELECT *
FROM useTBL AS u
RIGHT JOIN buyTBL AS b
ON u.username = b.username
WHERE u.username = '이승기';

-- 문제풀기 
-- 1. 성이 이씨이면서 태어난 년도가 1999년인 구매한 아이템 정보와 총 구입금액를 표시해주세요!
SELECT prodName, (price * amount) AS '총 구입금액'
FROM buyTBL AS b
INNER JOIN useTBL AS u
ON b.username = u.username
where u.username LIKE '이%' AND u.birthYear = '1999';

-- 2. 기준 테이블은 userTBL로 하고 LEFT JOIN을 사용하여 주문자 이름과, 주소, 전화번호, 상품 이름, 가격, 주문 수량을 출력해보자 
     -- (단, 주문 정보가 없는 경우 출력하지 않는다.)
-- 오류발생 'username' in field list is ambiguous 
-- SELECT username, addr, mobile, prodName, price, amount 
SELECT u.username, addr, mobile, prodName, price, amount 
FROM useTBL AS u 
LEFT JOIN buyTBL AS b 
ON u.username = b.username
WHERE b.username IS NOT NULL; 
     
-- 3. LEFT JOIN 을 사용하여 NULL 값도 확인할 수 있게 출력 
SELECT *
FROM useTBL
LEFT JOIN buyTBL 
ON useTBL.username = buyTBL.username; 

-- 4. userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
SELECT *
FROM useTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.amount >= 3;

-- 5. buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT *
FROM buyTBL AS b
RIGHT JOIN useTBL AS u
ON b.username = u.username
WHERE (u.username = '이승기' OR u.username ='야스오') AND u.username IS NOT NULL;

-- 6. 기준 테이블로 buyTBL을 사용해서 LEFT JOIN을 수행하고, 1999년에 태어난 사람은 총 몇 개의 물품을 구매했는지 구하시오.
SELECT b.amount
FROM buyTBL AS b
LEFT JOIN useTBL AS u
ON b.username = u.username
WHERE u.birthYear = 1999;

-- 7. 기준 테이블로 userTBL을 사용해서 INNER JOIN을 수행하고, '책'을 구매한 사람들의 이름과 전화번호를 출력하시오.
SELECT u.username, mobile
FROM useTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.prodName = '책';

-- 8. 기준 테이블로 buyTBL을 사용해서 RIGHT JOIN을 수행하고, '대구'에 사는 사람이 구매한 물품들을 출력하시오.
SELECT b.prodName 
FROM buyTBL AS b
RIGHT JOIN useTBL AS u
ON u.username = b.username
WHERE addr = '대구'; 






