create database if not exists HOBBIES_SHARE;
use HOBBIES_SHARE;
drop table if exists QUESTION_TB;
drop table if exists ANSWER_TB;
drop table if exists MEMBER_MATCH;
drop table if exists MEMBER_HOBBIES;
drop table if exists USER_MATCH;
drop table if exists USER_HOBBIES;
drop table if exists comment_tb;
drop table if exists board_tb;
drop table if exists HOBBIES;
drop table if exists USER_TB;

-- 유저
create table if not exists USER_TB(
	id bigint primary key auto_increment,
    email varchar(100) unique not null,
    password varchar(100) not null,
    username varchar(100) not null,
	nickname varchar(50) unique not null,
    origin_file_name varchar(100),
    upload_file_name varchar(100),
    birth date not null,
    phone varchar(50),
    user_role varchar(100) not null default 'USER',
    created_at timestamp default now()
);

drop table user_tb;
delete from user_tb where id = 7;
select * from user_tb;

-- 취미목록
create table if not exists HOBBIES(
	id bigint primary key auto_increment,
	hobby varchar(1024) not null
);

-- 게시판
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

-- 댓글
create table if not exists COMMENT_TB(
	id bigint primary key auto_increment,
    content varchar(1024) not null,
	user_id bigint,
    board_id bigint not null,
    created_at timestamp default now(),
    foreign key(user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(board_id) references BOARD_TB(id) on update cascade on delete cascade
);

-- 유저들의 취미(유저는 많은 취미를 가질 수 있음)
create table if not exists USER_HOBBIES(
	id bigint primary key auto_increment,
    hobby bigint not null,
    user_id bigint not null,
    created_at timestamp default now(),
    foreign key(hobby) references HOBBIES(id) on update cascade on delete cascade,
    foreign key(user_id) references USER_TB(id) on update cascade on delete cascade
);

-- 유저 만남 기록
create table if not exists USER_MATCH(
	main_user bigint not null,
    sub_user bigint not null,
    created_at timestamp default now(),
    foreign key(main_user) references USER_TB(id) on update cascade on delete cascade,
    foreign key(sub_user) references USER_TB(id) on update cascade on delete cascade
);

create table if not exists QUESTION_TB(
    id bigint primary key auto_increment,
    user_id bigint not null,
    content TEXT not null,
    proceed tinyint(1) not null default 0,
    foreign key(user_id) references USER_TB(id) on update cascade on delete cascade
);

create table if not exists ANSWER_TB(
    id bigint primary key auto_increment,
    user_id bigint not null,
    content TEXT not null,
    foreign key(user_id) references USER_TB(id) on update cascade on delete cascade
);

alter table q_a rename question_tb;

-- DB 추가 
-- 신고 기능 
create table if not exists report_board_tb(
    id bigint primary key auto_increment,
    report_user_id bigint not null,
    report_board_id bigint not null,
    proceed tinyint(1) not null default 0,
    foreign key(report_user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(report_board_id) references BOARD_TB(id) on update cascade on delete cascade
);

create table if not exists report_comment_tb(
    id bigint primary key auto_increment,
    report_user_id bigint not null,
    report_comment_id bigint not null,
    proceed tinyint(1) not null default 0,
    foreign key(report_user_id) references USER_TB(id) on update cascade on delete cascade,
    foreign key(report_comment_id) references COMMENT_TB(id) on update cascade on delete cascade
);

1	14	16:35:06	create table if not exists report_board_tb(
     id bigint primary key auto_increment,
     report_user_id bigint not null,
     report_board_id bigint not null,
     proceed tinyint(1) not null default 0,
     foreign key(report_user_id) references USER_TB(id) on update cascade on delete cascade,
     foreign key(report_board_id) references BOARD_TB(id) on update cascade on delete cascade
 )	0 row(s) affected, 2 warning(s):
