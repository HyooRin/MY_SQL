
-- USER, BLOG, REPLY
CREATE TABLE user(
	id int PRIMARY KEY, 
    user_name VARCHAR(10) NOT NULL, 
    email VARCHAR(20) UNIQUE NOT NULL 
);

CREATE TABLE blog (
    id INT PRIMARY KEY,
    content TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE reply (
    id INT PRIMARY KEY,
    reply_content VARCHAR(200),
    blog_id INT NOT NULL,
    FOREIGN KEY (blog_id) REFERENCES blog (id)
);
-- 부모 : 자식 
-- pk --> 부모 -> 1
-- fk --> 자식 -> N 

-- 1 홍길동 
-- 2 김근호 

-- 1, 접근 기능 만들기 1 
-- 2, 인터페이스란     1

INSERT INTO user(id, user_name, email )
VALUES(1, "효린", "khl4459@naver.com");
	 
     
INSERT INTO user(id, user_name, email )
VALUES    
     (2, "린", "12345@naver.com");

INSERT INTO blog(id, user_id, content)
VALUES(1, 1, '내용내용') ;

DROP TABLE blog;

SELECT * FROM user;
SELECT * FROM blog;

