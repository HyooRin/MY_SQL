
-- HProject

CREATE DATABASE mylibrary;

use mylibrary;

CREATE TABLE book(
	id int PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    author VARCHAR(10) NOT NULL,
    content TEXT    
);

CREATE TABLE user(
	id int PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(10) NOT NULL,
    password VARCHAR(10) NOT NULL,
    tel VARCHAR(15) UNIQUE
);

-- DROP TABLE book;
-- DROP TABLE user;

-- DELETE FROM book;
 DELETE FROM user;

SELECT * FROM book;

INSERT INTO book(title, author, content)
VALUES('책1','효린','콘텐츠입니다');

SELECT * FROM book;


INSERT INTO user(userName, password, tel)
VALUES('김','1234','010-2265-8611');

SELECT * FROM user;
