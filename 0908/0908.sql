select * from all_tables;

create table test(
	name varchar(20),
	email varchar(30)
);

insert into test values ('timo','timo@naver.com');
insert into test values ('ari','ari@naver.com');
insert into test values ('amumu','amumu@naver.com');

select * from test;
drop table test;

create table cafe(
	coff varchar(20) primary key,
	price int not null
);

insert into cafe values ('Espresso',3000);
insert into cafe values ('Americano',3500);
insert into cafe values ('Latte',4000);

select * from cafe;
drop table cafe;
