
-- bulluetin Board (게시판)

-- USER, board, reply
CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,     
    email VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(10) NOT NULL,
    nickName VARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE board (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    content TEXT,
    nickName VARCHAR(10),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (nickName) REFERENCES user (nickName)
);

-- 아직 생성안함 
CREATE TABLE reply (
    id INT PRIMARY KEY AUTO_INCREMENT,
    replyContent VARCHAR(200),
    boardId INT NOT NULL,
    FOREIGN KEY (boardId) REFERENCES board (id)
);

DROP TABLE user;
DROP TABLE board;

SELECT * FROM user;
SELECT * FROM board;


INSERT INTO user(userName, email)
VALUES('효린스','khl4459@naver.com'),
	  ('주이스','joi@naver.com');