CREATE DATABASE bank;
USE bank;

-- user 테이블 설계 해보기 
CREATE TABLE user_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(30) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- user의 계좌 정보 테이블 설계해보기 
CREATE TABLE account_tb(
	id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,
    balance BIGINT NOT NULL COMMENT '계좌잔액',
    user_id INT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- 입금 내역 저장 
-- 출금 내역 저장 
-- 사용자 간 이체 내역 저장 

-- user의 history 테이블 설계해보기
-- BIGINT 8바이트 크기의 정수형
-- 조(10의 12승) -- 경(10의 16승) -- 해(10의 20승)
-- 자(10의 24승) -- 양(10의 28승) 
CREATE TABLE history_tb(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역 ID',
    amount BIGINT NOT NULL COMMENT '거래 금액',
    w_account_id INT COMMENT '출금 계좌 id', 
    d_account_id INT COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금요청된 계좌의 잔액',
    d_balance BIGINT COMMENT '입금요청된 계좌의 잔액',
    created_at TIMESTAMP NOT NULL DEFAULT now()    
);

INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234',
'고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234',
'애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234',
'마이', now());

SELECT * FROM user_tb;

INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());

SELECT * FROM account_tb;
SELECT * FROM history_tb;

-- DELETE FROM history_tb;
-- ALTER TABLE history_tb AUTO_INCREMENT = 1;

-- 히스토리 추적 내용 (이체, 입금, 출금)
-- history 테이블의 이체 내역을 기록 
-- (1번계좌에서 2번계좌에 100원을 이체한다)
INSERT INTO history_tb(amount, w_balance, d_balance,w_account_id, d_account_id, created_at)
VALUES( 100, 900, 1100, 1, 2, now());   

-- 출금 내역 (1번 계좌에서 100원을 출금 처리)
INSERT INTO history_tb(amount, w_balance, d_balance,w_account_id, d_account_id, created_at)
VALUES(100, 800, null, 1, null, now());

-- 입금 내역 (1번 계좌에 500 입금처리)
INSERT INTO history_tb(amount, w_balance, d_balance,w_account_id, d_account_id, created_at)
VALUES(500, null, 700, null, 1, now());

-- 출금 내역 (3번이 1000원을 출금, 잔액은 0원인 상태 거래내역 기록)
INSERT INTO history_tb(amount, w_balance, d_balance,w_account_id, d_account_id, created_at)
VALUES(1000, 1000, null, 3, null, now());


   
                         