
SELECT * FROM history_tb;
-- 1 -> 1111 
-- 1번 계좌의 출금 내역
SELECT * FROM history_tb WHERE w_account_id = 1;
-- 1번 계좌의 입금 내역
SELECT * FROM history_tb WHERE d_account_id = 1;

-- 1번 계좌 입금 내역의 계좌 번호 정보까지 결과 집합 만들기
SELECT h.id, h.amount, h.d_balance, a.number , h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.d_account_id = a.id
WHERE h.d_account_id = 1;

-- 1번 계좌의 출금 내역 뽑기
SELECT h.id, h.amount, h.w_balance, a.number, h.created_at
FROM history_tb AS h
INNER JOIN account_tb AS a
ON h.w_account_id = a.id
WHERE h.w_account_id = 1;

