USE hyoblog;

CREATE TABLE hUser(
	id INT PRIMARY KEY
);

CREATE TABLE album(
	id INT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    userId INT,
    FOREIGN KEY(userId)REFERENCES hUser(id)
);

INSERT INTO hUser (id)
VALUES(1),
	  (2);

INSERT INTO album (id, title, userId)
VALUES(1, "오늘 첫날", 1);

DELETE FROM album;
SELECT * FROM album;