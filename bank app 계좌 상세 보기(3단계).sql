
-- 3단계
-- 목표: d_account_id 표시하기 --> 계좌번호 표기
-- 1번 계좌 출금 내역
SELECT h.id, h.amount, h.w_balance, wa.number AS sender,
	ifnull(h.d_account_id, 'ATM') AS receiver,
    da.number 
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- 1번 계좌 입금 내역 + 출금 계좌번호 
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
		ifnull(h.w_account_id, 'ATM') AS sender, wa.number
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1;

-- 출금 내역 + 입금내역
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
		ifnull(h.w_account_id, 'ATM') AS sender, wa.number
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.d_account_id = 1 OR h.w_account_id = 1;