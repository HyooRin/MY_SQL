desc student;
-- 테이블 제약 사항에 NULL 허용 의미와 NOT NULL 허용 의미 
CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50)
);
-- 이미 생성된 테이블 제약 사항 변경하기
 ALTER TABLE student MODIFY grade INT NULL;
 
 INSERT INTO student(student_id, name, major)
 VALUES(1, '홍길동', '검술학과');
 
 -- grade 제약을 NOT NULL로 변경해보기 
 -- 테이블 값이 하나 들어가 있는 상태
 ALTER TABLE student MODIFY grade INT NOT NULL;
 
 SELECT * FROM student;
 -- 하나의 행을 삭제하는 쿼리 -where절 (조건절)
 DELETE FROM student where student_id = 1;
 desc student;
 
 -- major 컬럼 제약을 NOT NULL로 변경해주세요
 ALTER TABLE student MODIFY major VARCHAR(50) NOT NULL;
 
 -- 컬럼 선언 부분을 생략도 가능하다. 단 전부 값을 넣을려고 하는 상황일때
INSERT INTO student VALUES(2, '홍길동2', 3, '검술학과');
SELECT * FROM student;

-- insert 구문 컬럼명 선언 방식alter
-- 1. 전부 작성하는 방법
-- 2. 제약사항이 null인 열이 있다면 넣고 싶은 열만 지정해서 구문을 작성할 수 있다.
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언부분 생략가능하다.

 -- NOT NULL과 디폴트 값 사용
 
 -- DROP TABLE student;
 
 CREATE TABLE student(
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) DEFAULT '미정' NOT NULL
 );
 desc student;
 
 -- 디폴트 제약을 사용했을때 값을 넣는 방법 1
 INSERT INTO student(student_id, name, grade, major)
 VALUES
	  (1, 'john', 3, '경영학과'),
      (2, 'jane', 2, '경영학과'),
      (3, 'Mike', 1, DEFAULT),
      (4, 'David', 2, DEFAULT);

SELECT * FROM student;
 -- 디폴트 제약을 사용했을때 값을 넣는 방법 2
 INSERT INTO student (student_id, name, grade)
 VALUES 
	  (5, '홍길동1', 2),
      (6, '홍길동2', 3),
      (7, '홍길동3', 1),
      (8, '홍길동4', 3);

-- professor 컬럼 제약 사항을 default로 추가하고 값을 빈 문자열로 만들어주세요
-- 빈 문자열의 의미는 "" 처리하면 됩니다.
CREATE TABLE subject (
  subject_id INT PRIMARY KEY,
  subject_name VARCHAR(50) NOT NULL,
  credit INT NOT NULL,
  department VARCHAR(50) NOT NULL,
  professor VARCHAR(50) DEFAULT '' NOT NULL
);
-- 테이블이 생성되어있을때, 제약 변경 default 구문 추가 
ALTER TABLE subject MODIFY professor VARCHAR(30) NOT NULL DEFAULT '';



      
      
 
 
 