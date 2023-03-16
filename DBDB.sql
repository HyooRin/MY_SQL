SHOW TABLES;

SELECT *
FROM board;

SELECT *
FROM board
WHERE id = 3;

SELECT * FROM user;

INSERT INTO board(title, content, userId)
VALUES('테스트글1', '테스트내용1', 1);

SELECT * FROM board;

DELETE FROM board
WHERE id = 50;