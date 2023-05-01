
create table if not exists BOARD_TB(
	id bigint primary key auto_increment,
    title varchar(100) not null,
    content TEXT not null,
    user_id bigint not null,
    hobby_id bigint not null,
    created_at timestamp default now(),
    foreign key(user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(hobby_id) references HOBBIES(id) on update cascade on delete cascade
);

insert into board_tb( title, content, user_id, hobby_id)
values('두번째', '글', 5, 5 );


insert into user_tb( email, password, username, nickname, birth, phone)
values ('khl4459', '1234', '효린', '링스', 950929, 01022658611),
		('jui', '1234', '주이', '주스', 950929, 01022658611);

insert into hobbies(hobby)
value('영화'),
	 ('독서');

select * from user_tb;
select * from hobbies;
select * from comment_tb;

delete from user_tb;

insert into user()
values ();

select * from board_tb;
select * from hobbies;
select * from comment_tb;
desc user_tb;
 -- delete from board_tb;
--  auto_increment 초기화
alter table board_tb auto_increment = 1;
alter table user_tb auto_increment = 1;


alter table user_tb drop constraint user_role;

alter table user_tb modify column user_role varchar(100) not null default 'USER';

select * from board_tb;
delete from board_tb;
alter table board_tb auto_increment = 1;

insert into COMMENT_TB(content, user_id, board_id)
values('좋아요', 1, 1);


insert into COMMENT_TB(content, user_id, board_id)
values('좋아요', 2, 1);
        
select * from comment_tb;
update comment_tb set content = '새로' where id = 1;


-- 글 상세 + 댓글 전체 
-- join
select * 
from board_tb as b
inner join comment_tb as c
on b.id = c.board_id
where b.id = 1;

delete from comment_tb where id = 13;
-- 서브쿼리
select *
from comment_tb
where board_id in (select board_id from board_tb where board_id = 1);

select * from board_tb;
select * from user_tb;
desc user_tb;
desc hobbies;

-- findAll
select b.*, nickname, hobby
from board_tb as b
inner join user_tb as u
ON b.user_id = u.id
inner join hobbies as h
on b.hobby_id = h.id
order by id desc;

-- findById
select b.*, nickname, hobby
from board_tb as b
inner join user_tb as u
on b.user_id = u.id
inner join hobbies as h
on b.hobby_id = h.id
where b.id = 1;

-- findByBoardId
select c.*, nickname
from comment_tb as c
inner join user_tb as u
on c.user_id = u.id
where board_id in (select board_id from board_tb where board_id = 8)
order by id asc;

-- hobby
		select u.*, h.hobby
		from user_tb as u
		join user_hobbies as uh
		on u.id = uh.user_id
		join hobbies as h
		on uh.hobby = h.id
		order by u.id;

select * from hobbies;
select * from board_tb;
select * from comment_tb;
-- delete from hobbies;
-- delete from comment_tb;


alter table hobbies auto_increment = 1;
alter table comment_tb auto_increment = 1;
select * from comment_tb;
select * from hobbies;
desc hobbies;
-- delete from user_tb;
-- delete from hobbies;
alter table hobbies auto_increment = 1;

		select b.*, nickname
		from board_tb as b
		inner join user_tb as u
		on b.user_id = u.id
		inner join hobbies as h
		on b.hobby_id = h.id
		where h.id = 1;
        
-- 신고테이블 
create table if not exists report_board_tb(
    id bigint primary key auto_increment,
    report_user_id bigint not null,
    report_board_id bigint not null,
    proceed tinyint(1) not null default 0,
    foreign key(report_user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(report_board_id) references BOARD_TB(id) on update cascade on delete cascade
);

insert into report_board_tb(report_user_id, report_board_id)
values(1, 1);

select * from report_board_tb;
select * from user_tb;
select * from report_comment_tb;
SELECT * from comment_tb WHERE id = 1;

create table if not exists report_comment_tb(
    id bigint primary key auto_increment,
    report_user_id bigint not null,
    report_comment_id bigint not null,
    proceed tinyint(1) not null default 0,
    foreign key(report_user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(report_comment_id) references COMMENT_TB(id) on update cascade on delete cascade
);

insert into report_comment_tb(report_user_id, report_comment_id)
values (2, 2);

CREATE TABLE if not exists message_tb(
	id bigint primary key auto_increment,
    sender bigint not null,
    receiver bigint not null,
    message  TEXT not null,
    created_at timestamp default now(),
    foreign key(sender) references USER_TB(id) on update cascade on delete cascade,
    foreign key(receiver) references USER_TB(id) on update cascade on delete cascade
); 
DESC message_tb;
SELECT * FROM message_tb;
SELECT * FROM board_tb;
SELECT * FROM hobbies;
SELECT * FROM user_tb;

INSERT into message_tb (sender, receiver, message)
values(1, 2, '하이하이');

select * from USER_TB;
desc user_tb;

SELECT * from message_tb WHERE receiver = 1;
-- receiver 기준 - 받은 메세지 목록 
-- 추가 : sender 의 nickname /  + user_tb
select m.*, nickname
from message_tb as m
inner join user_tb as u
on m.sender = u.id 
where m.receiver = 2;

-- 보낸 메세지 목록
-- 추가 : receiver의 nickname + user_tb
select m.*, u.nickname
from message_tb as m
inner join user_tb as u 
on m.receiver = u.id
where m.sender = 1;
		