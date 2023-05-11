-- UTF-8 언어 확인
show variables like 'character_set%';
show variables like 'c%';
-- java : utf-8 -> 1~4 동적으로 처리
-- mysql : utf-8 : 3byte
-- mysql : utf-8mb4 확장 : 4byte

-- 데이터 베이스 생성하기
create database green_blog;

-- 사용자 생성 및 권한 처리 
create user 'ten'@'%' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'%';

create user 'ten'@'localhost' identified by '1q2w3e4r5t!';
grant all privileges on *.* to 'ten'@'localhost';

flush privileges;
-- 사용자 확인
use mysql;
select user, host from user;

