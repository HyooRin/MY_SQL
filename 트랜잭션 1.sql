
-- 트랜젝션 처리해보기

START TRANSACTION;

insert into user_tb(username, password, fullname)
value('john', '1234', 'kim');

insert into user_tb(username, password, fullname)
value('Mike', '1234', 'Lee');


ROLLBACK;

COMMIT;