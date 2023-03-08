
/*
NOW(), CURDATE(),
CURTIME(), 

YEAR(),
MONTH(), DAY(), HOUR()
*/

-- STRING FUNCTION
SELECT ASCII('U');

SELECT char_length('my sql test');
SELECT concat("green","class", "   100%") AS title;
SELECT concat_ws("/", "class","mysql","홍길동");
SELECT find_in_set('q', 's,q,l');
SELECT format(2500.123, 3);
SELECT lcase('HELLO JAVA');
SELECT ucase('hello java');
SELECT trim('  MY S Q L  '); -- 양 끝에 공백제거 
SELECT replace('  MY S Q L  ', ' ' , ''); -- 값의 공백을 빈 공백으로 처리

-- MySql Numveric function
SELECT * FROM buyTBL;

SELECT *, sum(price) AS '상품가격의 총 합' FROM buyTBL;

SELECT * , (SELECT sum(price) FROM buyTBL) AS 총합계
FROM
buyTBL;

-- avg 평균값 계산
SELECT * , avg(price) AS '상품평균가격'
FROM buyTBL;



SELECT *, (SELECT avg(price) FROM buyTBL) AS 평균값 
FROM buyTBL;

-- 올림 함수
SELECT ceil(25.12);
-- 반올림 함수
SELECT round(123.56, 1);
-- 버림 함수
SELECT floor(25.75);

-- max 
SELECT prodName, max(price)
FROM buyTBL;

SELECT *
FROM buyTBL;

SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES';
-- 오류 발생 
-- 0-- 	114	12:32:54	SELECT  prodName, max(price)
--  FROM buyTBL	Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'shopdb.buyTBL.prodName'; this is incompatible with sql_mode=only_full_group_by	0.000 sec