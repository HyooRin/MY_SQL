-- bandi Project
CREATE DATABASE bandi;

-- 회원
CREATE TABLE user_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    user_role VARCHAR(10) NOT NULL
);

insert into user_tb(username, password, user_role)
VALUES ( '효',  '1234' ,'user'),
	   ('린', '1234' ,'user');


-- 1:1 문의(질문) -- 카테고리 추가
CREATE TABLE question_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    faq_category_id INT NOT NULL,
    proceed INT NOT NULL DEFAULT 0 COMMENT '답장여부 확인안하면 0 확인하면 1',
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    FOREIGN KEY(user_id) REFERENCES user_tb(id),
    FOREIGN KEY(faq_category_id) REFERENCES faq_category_tb(id)
);


-- 1:1 문의(답) -- fk 추가 
CREATE TABLE answer_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,    
    user_id INT NOT NULL,
    content TEXT NOT NULL,    
    question_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
	FOREIGN KEY(user_id) REFERENCES user_tb(id),
    FOREIGN KEY(question_id) REFERENCES question_tb(id) on update cascade on delete cascade
);

SELECT * FROM user_tb;
SELECT * FROM question_tb;
SELECT * FROM answer_tb;

-- DROP TABLE question_tb;
-- DROP TABLE answer_tb;

insert into question_tb(user_id, title, content, faq_category_id)
VALUES (1, '제목1' ,'내용1',2),
	   (2, '제목2','내용2', 3);
       


insert into answer_tb(user_id, content,  question_id)
VALUES (1, '내용1', 1),
	   (2, '내용2', 2);
       
insert into answer_tb(user_id, content,  question_id)
VALUES (1, '내용1', 3);
	   

-- DELETE from answer_tb;
SELECT * FROM question_tb;
SELECT * FROM answer_tb;

-- insert into answer_tb (user_id, content, qu)

-- question list
-- title, categoryId(name), username(userId), createdAt
select q.*, u.username, fc.category_name
from question_tb as q
inner join user_tb as u
on q.user_id = u.id
INNER join faq_category_tb as fc
on q.faq_category_id = fc.id
where proceed = 0;


select * from question_tb;

update question_tb set title = '제목'
WHERE id = 1;

select * from faq_category_tb;

delete from question_tb where id = 3;
-- a.*,
select *  
from answer_tb as a 
inner join question_tb as q 
on a.question_id = q.id
inner join 
where question_id = 1;



-- answer 

-- 마이페이지에서 질문 및  답변확인 
select q.*, a.content, a.created_at, fc.category_name
from question_tb as q
left join answer_tb as a 
on q.id = a.question_id
inner join faq_category_tb as fc
on q.faq_category_id = fc.id
where q.user_id = 1 ;






-- faq 카테고리
CREATE TABLE faq_category_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);
insert into faq_category_tb(category_name)
values('고객'), 
	  ('작가'),
	  ('포인트'),
	  ('이벤트'),
	  ('공모전'),
	  ('기타' );
select * from faq_category_tb; 

-- faq
CREATE TABLE faq_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    faq_category_id INT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    FOREIGN KEY(faq_category_id) REFERENCES faq_category_tb(id)
);

insert into faq_tb(faq_category_id, question, answer)
values (2, '공짜는 없나요', '무료'),	  
	   (3, '작가될래요', '신청하세요'),	  
	   (4, '이벤트언제합니까', '내일');	  
select * from faq_tb; 
SELECT * From faq_tb where faq_category_id = 2;

-- 연재문의 -- title 추가 
CREATE TABLE application_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    filename VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
	FOREIGN KEY(user_id) REFERENCES user_tb(id)
);