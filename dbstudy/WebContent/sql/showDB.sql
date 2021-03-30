show databases;

create table t_member(
     id int NOT NULL AUTO_INCREMENT,
     name varchar(20) NOT NULL,
     passwd varchar(20) NOT NULL,
     PRIMARY KEY(id)
     )default CHARSET=utf8;
     
insert into t_member values(1,'홍길동','길동');
insert into t_member values(2,'강이','강e');

select * from t_member;