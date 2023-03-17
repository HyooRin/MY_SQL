
-- HProject

CREATE DATABASE mylibrary;

use mylibrary;

CREATE TABLE book(
	id int PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(20) NOT NULL,
    author VARCHAR(10) NOT NULL,
    content BLOB    
);



SELECT * FROM book;

INSERT INTO book(title, author, content)
VALUES('책1','효린','어ㅔ어ㅔ어에ㅓ에');

-- DELETE FROM book;
