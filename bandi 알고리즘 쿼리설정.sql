insert into user_tb(username, password, user_role, nick_name, email, birth_date, gender, external) values
('qwe', '1234', 'user', '현우씨', 'aa@sample.com', '1997-01-11', '남성', null),
('asd', '1234', 'user', '민우씨', 'user@sample.com', '1992-12-12', '여성', null),
('qwq', '1234', 'user', '용림씨', 'user2@sample.com', '1992-10-12', '남성', null),
('hyo', '1234', 'user', '효린씨', 'khl4459@naver.com', '1995-09-29', '여성', null),
('hyun', '1234', 'user', '지현씨', 'jhkim900726@gmail.com', '1990-07-26', '남성', null);

insert into genre_tb(name) values
('무협'), ('판타지'), ('로맨스'), ('SF'), ('대체역사');

insert into service_type_tb(name) values
('유료'), ('무료'), ('공모전');

-- user 1-5 
INSERT INTO novel_tb (user_id, genre_id, service_type_id, title, overview, serial_cycle)
		VALUES
		(1, 5, 1, '단종이 너무강함1', '단종이', '월'),
        (1, 5, 1, '회귀수선전1', '회귀해서', '일'),
        (1, 5, 3, '광산이 열렸다1', '어느 날', '일'),
		(1, 3, 1, '너무강함2', '단종이 ', '월'),
        (1, 2, 2, '회귀수선전2', '회귀해서', '일'),
        (1, 1, 3, '내 집에', '어느 날', '일'),
		(1, 2, 1, '단종이 너무강함3', '너무', '월'),
        (2, 1, 2, '회귀수선전3', '회귀해서', '일'),
        (2, 1, 2, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (2, 5, 1, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (2, 3, 2, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (2, 3, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (3, 3, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (3, 1, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (3, 5, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (3, 2, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (3, 3, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (4, 1, 1, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (4, 2, 2, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (4, 3, 1, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (4, 4, 2, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (5, 5, 3, '내 집에 영약 광산이 열렸다3', '어느', '일'),
        (5, 3, 3, '내 집에 영약 광산이 열렸다3', '어느', '일');
		

INSERT INTO user_favorite_tb (user_id, novel_id)
VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(1, 13),
(1, 14),
(2, 1),
(2, 2),
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(2, 11),
(2, 13),
(2, 14),
(3, 1),
(3, 2),
(3, 7),
(3, 8),
(3, 10),
(3, 11),
(3, 13),
(4, 5),
(4, 6),
(4, 8),
(4, 10),
(5, 1),
(5, 4),
(5, 8);


SELECT * FROM user_tb;
SELECT * FROM novel_tb;
SELECT * FROM genre_tb;


-- (즐겨찾기) 많이 보는 장르로 추천하기
select u.nick_name, n.*, title
from user_tb as u
INNER join user_favorite_tb as uf
on u.id = uf.user_id
INNER JOIN novel_tb as n
on uf.novel_id = n.id
WHERE u.id = 1;

select u.nick_name, g.*
from user_tb as u
LEFT join user_favorite_tb as uf
on u.id = uf.user_id
LEFT JOIN novel_tb as n
on uf.novel_id = n.id
LEFT JOIN genre_tb as g
on n.genre_id = g.id
WHERE u.id = 1;

SELECT *
FROM  
genre_tb;

SELECT u.nick_name, g.*
FROM (
	SELECT name, reserveDate, roomNum as  reservedRoom
    FROM reservation
    WHERE roomNum > 1001
) as reservationInfo;

-- 즐겨찾기 중 가장 많은 장르 
-- 유저의 즐겨찾기 가장 많은 장르 
-- 무료 유료 공모전
-- INNER JOIN service_type_tb as st
-- on n.service_type_id = st.id




