
-- CASE WHEN THEN END
SELECT h.id, h.amount, h.w_balance AS balance, h.created_at,
		ifnull(da.number, 'ATM') AS receiver,
        wa.number AS sender
FROM history_tb AS h 
LEFT JOIN account_tb AS wa
ON h.w_account_id = wa.id
LEFT JOIN account_tb AS da
ON h.d_account_id = da.id
WHERE h.w_account_id = 1;

-- -------------------------------------------------------
SELECT h.id, h.amount,
case when h.w_account_id = 1 then (h.w_balance)
	 when h.d_account_id = 1 then (h.d_balance)
     end as balance,
     ifnull(wa.number, 'ATM') AS sender,
     ifnull(da.number, 'ATM') AS receiver,
     h.created_at     
FROM history_tb AS h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.d_account_id = 1 or h.w_account_id = 1 ;

