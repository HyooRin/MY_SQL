
select * from reservation;
select * from customer;

-- 주소가 서울인 고객이 예약한 예약 정보만을 뽑아주세요 (중첩서브쿼리)
SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN(SELECT name FROM customer WHERE address = '서울');

SELECT id, reserveDate, roomNum, name
FROM reservation
WHERE name IN('홍길동', '장길산');

-- JOIN을 사용해서 주소가 서울인 고객이 예약한 예약 정보만을 뽑아주세요 
SELECT *
FROM reservation
LEFT JOIN customer
ON reservation.name = customer.name
WHERE customer.address = '서울'; 

-- from 절 서브쿼리  
SELECT name, reservedRoom
FROM (
	SELECT name, reserveDate, roomNum as  reservedRoom
    FROM reservation
    WHERE roomNum > 1001
) as reservationInfo;

/*
	서브쿼리의 특징 
    서브쿼리를 사용하면 다음과 같은 장점을 얻을 수 있다
    1. 서브쿼리를 사용하면 쿼리를 구조화 시키므로 쿼리의 각 부분을 명확히 구분할 수 있게 해준다
    2. 서브쿼리는 복잡한 join 이나 union 과 같은 동작을 수행할 수 있는 또 다른 방법을 제공합니다
    3. 서브쿼리는 읽기 편하다 
    
    ! 스칼라 서브쿼리는 가능한 사용하지 말자 ! 
        
*/

-- 서브쿼리를 이용해보자 
-- 2020-04-02 예약 정보확인
SELECT *
FROM reservation
WHERE reserveDate = '2020-04-02';


-- 2020-04-02 일자로 예약한 고객의 id 와 이름 조회하기 
SELECT id, name
FROM( 
	SELECT *
    FROM reservation 
    WHERE reserveDate = '2020-04-02'
)AS reservedcustomer;

-- 고객 테이블에서 실제 예약한 고객중  30살 이상이 고객 id,
--          이름, 나이, 주소, 예약일, 예약한 방 정보 출력 

SELECT name, age, address
FROM customer
WHERE age >= 30;

SELECT * FROM reservation;

SELECT c.name, age, address
FROM customer AS c
RIGHT JOIN reservation AS r
ON c.name = r.name
WHERE age IN( SELECT age FROM customer WHERE age >= 30);





