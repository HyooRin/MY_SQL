
-- bulluetin Board (게시판)

-- USER, board, reply
CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,   
    userName VARCHAR(10) NOT NULL,
    email VARCHAR(20) NOT NULL,
    password VARCHAR(10) NOT NULL,
    nickName VARCHAR(10) UNIQUE NOT NULL
);

DESC user;
DESC board;

CREATE TABLE board (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    content TEXT,    
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    userId int,
    FOREIGN KEY (userId) REFERENCES user (id)
);

-- 아직 생성안함 
 -- CREATE TABLE reply (
    id INT PRIMARY KEY AUTO_INCREMENT,
    replyContent VARCHAR(200),
    boardId INT NOT NULL,
    FOREIGN KEY (boardId) REFERENCES board (id)
); 

--  DROP TABLE user;
-- DROP TABLE board;
-- DROP TABLE reply ;

SELECT * FROM user;
SELECT * FROM board;

INSERT INTO board(title, content, userId )
VALUES ('해보자', '가자', 1 );

SELECT *
FROM user
WHERE userName = 'khl4459' AND email = 'naver.com' AND password = '1234'; 

      
UPDATE user SET nickName = '될까요' WHERE id = '3';
	 
      
SELECT title, content, nickName, date
FROM board
WHERE title = '자바';

SELECT *
FROM user 
WHERE userName = 'khl4459' AND email = 'gmail.com' AND password = '1234';

DELETE FROM user WHERE id = 5;

UPDATE user SET userName = 'khl4459', email = 'gmail.com', 
password = '1234', nickName = '효린스'
WHERE id = 1;  

SELECT * FROM user;
SELECT * FROM board;

DELETE FROM user WHERE id = 4;


SELECT password FROM user WHERE userName = 'khl4459' AND email = 'gmail.com';

-- dto 
desc board;
select * from user where id = 1;

SELECT * FROM board;
SELECT * FROM user;

-- 
select b.*, nickName 
from board as b 
inner join user as u
on b.userId = u.id;

-- where b.userId = 1; 
