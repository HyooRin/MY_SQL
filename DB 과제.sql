create database shopping;
use shopping;
create table if not exists USER_TB(
	id bigint primary key auto_increment,
    username varchar(100) not null,
    password varchar(100) not null,    
	nickname varchar(50) unique not null,
    phone varchar(50)    
);

create table if not exists product_tb(
	id bigint primary key auto_increment,
    name varchar(100) not null,
    price varchar(50) not null,
    created_at date not null	
);

create table if not exists buy_tb(
	id bigint primary key auto_increment,
    userId bigint,
    productId bigint,
    buyDate date not null,
    foreign key(userId) references user_tb(id),
    foreign key(productId) references product_tb(id)
);

insert into USER_TB (username, password, nickname, phone)
values('김티모', '1234', '티모', '01012341234'),
	  ('김효린', '1234', '야스오', '01012344321'),
	  ('김대영', '1234', '멘토스', '01012341111');

insert into product_tb(name, price, created_at)
values('지갑', '100000', 230428),
		('반팔티', '80000', 230428),
		('셔츠', '20000', 230428);
        
insert into buy_tb(userId, productId, buyDate)
values( 1, 1, 230428),
		( 2, 2, 230428),
        (3, 2, 230428);
        
select p.name, p.price, b.buyDate
from product_tb as p 
inner join buy_tb as b
on p.id = b.productId
where p.name = '지갑';