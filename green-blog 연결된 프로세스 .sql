
-- 연결된 프로세스 확인하기 
SHOW PROCESSLIST;
SHOW FULL PROCESSLIST;

-- lock 걸린 경우, kill 사용해서 처리할 수 있음
-- KILL 21;

-- id : 프로세스 아이디
-- User : 스레드가 접속하고 있는 Mysql 사용자명
-- host : 사용자 컴퓨터 주소, IP Address
-- command : 스레드의 현재 상태
-- Time : 프로세스가 현재 커맨드 된 상태에서 동작 시간 
-- State : 사람이 읽을 수 있는 스레드 상태 정보 
-- info : 현재 실행되는 SQL 

SELECT * from user;
SELECT * from board;
SELECT * from reply;
SELECT * from board_reply;

desc user;
desc board;
desc reply;

DROP TABLE board_reply;

DELETE FROM user WHERE id in(2, 3, 4, 5);
