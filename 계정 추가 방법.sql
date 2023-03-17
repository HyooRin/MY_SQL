create database myblog;
-- 계정추가 
use myblog;

create user 'bloguser'@'%' identified by '1q2w3e4r5t';

use mysql;

select user, host from user;

select * from user where user = 'bloguser';
grant all privileges on *.* to  'bloguser'@'%';
flush privileges;




-- 서버 프로그램 구현 -MySQL <-- 서버
-- DB 생성
CREATE DATABASE library;
USE library;

-- 사용자 생성
CREATE USER 'Hproject'@'%' IDENTIFIED BY '092939';
--  사용자 기본 권한 조회
-- DB를 선택
use mysql;
SELECT user, host from user;

-- '%' 어디서든지 접근 가능한 권한(IP주소 개념)
SELECT * FROM user where user = 'Hproject';
GRANT ALL PRIVILEGES ON *.* TO 'Hproject'@'%';
-- 방금 권한 변경을 즉시 적용하려면 한가지 명령어를 더 해야 한다.
FLUSH PRIVILEGES;


