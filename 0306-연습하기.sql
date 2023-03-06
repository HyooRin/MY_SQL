
-- practice ---
-- 문제 : TABLE 만들기 
DROP TABLE event;

CREATE TABLE event(
	id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    insta_id VARCHAR(50) NOT NULL,
	phone_number INT NOT NULL,
    address VARCHAR(50) NOT NULL,
    wish_item VARCHAR(30),
    result VARCHAR(10) DEFAULT ''
);
desc event;
SELECT * FROM event;
-- result 컬럼 제약을 NOT NULL로 변경해주세요 
ALTER TABLE event MODIFY result VARCHAR(10) NOT NULL;

-- 데이터를 넣어주세요 
INSERT INTO event(customer_name, insta_id, phone_number, address, wish_item, result)
VALUES
	()
	