



insert into user_tb( email, password, username, nickname, birth, phone)
values ('khl4459', '1234', '효린', '링스', 950929, 01022658611),
		('jui', '1234', '주이', '주스', 950929, 01022658611);

insert into hobbies(hobby)
value('취미'),
	 ('코딩');

select * from user_tb;
select * from board_tb;
select * from hobbies;
select * from comment_tb;
desc user_tb;
 -- delete from board_tb;
--  auto_increment 초기화
alter table board_tb auto_increment = 1;

alter table user_tb drop constraint user_role;

alter table user_tb modify column user_role varchar(100) not null default 'USER';



insert into COMMENT_TB(content, user_id, board_id)
values('좋아요', 1, 1),
		('싫어요', 2, 1);
insert into COMMENT_TB(content, user_id, board_id)
values('좋아요', 1, 2),
		('싫어요', 2, 2);


-- 글 상세 + 댓글 전체 
-- join
select * 
from board_tb as b
inner join comment_tb as c
on b.id = c.board_id
where b.id = 1;

-- 서브쿼리
select *
from comment_tb
where board_id in (select board_id from board_tb where board_id = 1);
