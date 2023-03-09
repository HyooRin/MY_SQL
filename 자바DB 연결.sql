DESC employees;

SELECT * FROM employeesbuytbl
WHERE emp_no = 10002;

SELECT * FROM buytbl;
SELECT * FROM usetbl;

DESC buytbl;
DESC usetbl;

INSERT INTO 
	usetbl(username, birthYear, addr, mobile)
VALUES('티모', '2000', '대구', '010-1234-234');

-- INSERT 구문 작성 
INSERT INTO 
	buytbl(username, prodName, price, amount)
VALUES('김효린', '맥북', 100, 5);


SELECT * FROM usetbl;

UPDATE usetbl
	SET birthYear = '1999', addr = '천안', mobile = '010-2222-2222'
WHERE username = '야스오2';

DELETE FROM usetbl WHERE username = '티모';

-- 구매테이블에 데이터를 입력할때 유저테이블에 이름이 없으면 입력안됨 
-- 구매 테이블 
SELECT * FROM buytbl;
-- 이승기
-- 100 있다.

-- 자식 테이블에 데이터를 먼저 삭제하고 부모테이블에 정보를 삭제할 수 있다.

UPDATE buytbl
	SET prodName = '아이폰', price = 100, amount = 1
WHERE username = '이승기';

DELETE FROM buytbl WHERE username = '이승기';