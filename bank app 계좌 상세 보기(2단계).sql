
-- 2단계
-- 1번 계좌 출금 내역
SELECT h.id, h.amount, h.w_balance, wa.number AS sender,
	ifnull(h.d_account_id, 'ATM') AS receiver
FROM history_tb AS h
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
WHERE h.w_account_id = 1;

-- 1번 계좌 입금 내역 
SELECT h.id, h.amount, h.d_balance, h.created_at, da.number AS receiver,
		ifnull(h.w_account_id, 'ATM') AS sender
FROM history_tb AS h
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.d_account_id = 1;