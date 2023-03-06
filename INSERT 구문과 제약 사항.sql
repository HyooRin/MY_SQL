
-- 데이터 저장 (한줄 주석)
/*
여러줄 주석
*/

-- DROP TABLE student;
-- DROP TABLE subject;
-- DROP TABLE product;

CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);

-- 기본 문구 모양
-- INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES (값1, 값2);
INSERT INTO student(student_id, name, grade, major)
VALUES (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student(student_id, name, grade, major)
VALUES (2, '김철수', 4, '전자공학과');

INSERT INTO student(student_id, name,grade, major)
VALUES (3, '이영희', 2, '경영학과');

INSERT INTO student(student_id, name, grade, major)
VALUES(4, '티모', 1, '롤학과');


-- 테이블에 데이터를 삭제하는 명령어 사용해보기 
DELETE FROM student; -- 테이블 안에 있는 데이터만 삭제하는 명령어이다.

-- 복수형으로 insert 쿼리문 작성하기 
INSERT INTO student(student_id, name, grade, major)
VALUES 
	(1001, '김철수', 2, '컴퓨터공학과'),
    (1002, '김영희', 3, '수학과'),
    (1003, '박민수', 1, '전자공학과');

-- 복수형으로 데이터 3행을 넣어주세요 단 VALUE로 사용해보세요

INSERT INTO student(student_id, name, grade,major)
VALUE
	(1004, '김효린', 4, '경영학과'),
	(1005, '김영수', 3, '수학과'),
    (1006, '박민희', 1, '전자공학과');
-- insert 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
-- 데이터는 항상 저장되지 않는다. 
INSERT INTO student(student_id, name, grade, major)
VALUES 
	(1007, '김철수3', 2, '컴퓨터공학과'),
    (1008, '김영희3', 3, '수학과'),
    (1008, '박민수3', 1, '전자공학과');    

SELECT * FROM  student;

-- 실습1
INSERT INTO employee(id, name, age, department)
VALUES 
	(1, '김효린', 23, '1팀'),
    (2,'김치성', 27, '2팀'),
    (3, '김민수', 25, '3팀');
    
SELECT * FROM  employee;
    
INSERT INTO customer ( id, name, email, address)
VALUES
	(1, '김효린', 'khl4459@naver.com', '부산해운대구'),
    (2, '이미리','','부산해운대구'),
    (3, '민수', 'minsu@hanmail.net', '서울');
    
SELECT * FROM  customer;

-- 실습2 
CREATE TABLE product(
	id INT PRIMARY KEY,
    name VARCHAR(20) NOT NULL 
    
);








