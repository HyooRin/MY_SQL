
SELECT * FROM category;
desc category;

-- 샘플데이터 준비
INSERT INTO category(name) VALUES('운동');
INSERT INTO category(name) VALUES('공부');
INSERT INTO category(name) VALUES('연애');
INSERT INTO category(name) VALUES('집안일');

SELECT * FROM category;
UPDATE category SET name = '헬스' WHERE id = '1';


DELETE FROM category WHERE id = 1;



SELECT * FROM category;
-- 샘플데이터 입력해보기 
SELECT * FROM todolist;

CREATE TABLE TodoList(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES category(id)    
);

-- DROP TABLE todolist;


-- id, 제목, 내용, 우선순위, 완료여부, 생성일 
INSERT INTO todolist(title, description, priority, completed,category_id )
VALUES('코딩','내가 이긴다', 1, 10, 3);

UPDATE todolist SET description = '이길꺼야' WHERE title = 'dddd' ;

DELETE FROM todolist WHERE id = '2';



