USE bank;
SELECT * FROM user_tb;
SELECT * FROM account_tb;
SELECT * FROM history_tb;

-- 문제 1 
-- history_tb 에서 입금 내역과 입금 계좌 번호를 join 을 사용해서 출력 하시오 
-- 입금 내역 : amount, d_account_id != null , d_balance, created_at -- history_tb
-- 입금 계좌 번호 : number, id                                       -- account_tb
SELECT amount, d_account_id, d_balance, h.created_at, number AS '계좌번호'
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.d_account_id = a.id;

-- not null 추가 
SELECT amount, d_account_id, d_balance, h.created_at, number AS '입금 계좌번호'
FROM history_tb AS h
LEFT JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE d_account_id is NOT NULL;
-- 문제 2 
-- history_tb 에서 출금 내역과 출금 계좌 번호를 join 을 사용해서 출력 하시오 



