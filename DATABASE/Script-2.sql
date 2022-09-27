drop table if exists tb_user_role;
drop table if exists tb_user;

create table tb_user 
( 
	user_NO INT
	,USER_NM VARCHAR(50) not null
	,BIRTH_ DE DATE not null
	,ADDRS VARCHAR(200) null
	,primary key (USER_NO)
);

drop table if exists TB_CONTACT;
drop table if exists TB_cust;

create table TB_CUST
(
CUST_NO INT ,
cust_nm char(10),
primary key(CUST_NO)
)

create table TB_CONTACT
(
	CONTACT_NO INT
	,CONTACT_TYPE_CD CHAR(6) not null,
	CONTACT_INFO VARCHAR(100)
	,CUST_NO INT,
	primary key (CONTACT_NO),
	constraint FK_CUST_NO_TB_CUST foreign key (CUST_NO) references TB_CUST(CUST_NO)
	on delete no ACTION
)

insert into tb_cust (cust_no, cust_nm) values (1, '이순신');
insert into tb_cust (cust_no, cust_nm) values (2, '이방원');

select * from tb_cust;

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (1, 'CTC001', '010-1234-1234', 1);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (2, 'CTC002', 'sclee@gmail.com', 1);

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (3, 'CTC001', '010-7777-5555', 2);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (4, 'CTC002', 'bwlee@gmail.com', 2);

select * from tb_contact;

delete from tb_cust where cust_no = 1;

-------------------------------
drop table if exists TB_CONTACT;
drop table if exists TB_cust;

create table TB_CUST
(
CUST_NO INT ,
cust_nm char(10),
primary key(CUST_NO)
)

create table TB_CONTACT
(
	CONTACT_NO INT
	,CONTACT_TYPE_CD CHAR(6) not null,
	CONTACT_INFO VARCHAR(100)
	,CUST_NO INT,
	primary key (CONTACT_NO),
	constraint FK_CUST_NO_TB_CUST foreign key (CUST_NO) references TB_CUST(CUST_NO)
	on delete set null
)

insert into tb_cust (cust_no, cust_nm) values (1, '이순신');
insert into tb_cust (cust_no, cust_nm) values (2, '이방원');

select * from tb_cust;

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (1, 'CTC001', '010-1234-1234', 1);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (2, 'CTC002', 'sclee@gmail.com', 1);

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (3, 'CTC001', '010-7777-5555', 2);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (4, 'CTC002', 'bwlee@gmail.com', 2);

select * from tb_contact;

delete from tb_cust where cust_no = 1;

--------------------------------------------------------------------------------

drop table if exists TB_CONTACT;
drop table if exists TB_cust;

create table TB_CUST
(
CUST_NO INT ,
cust_nm char(10),
primary key(CUST_NO)
)

create table TB_CONTACT
(
	CONTACT_NO INT
	,CONTACT_TYPE_CD CHAR(6) not null,
	CONTACT_INFO VARCHAR(100)
	,CUST_NO INT,
	primary key (CONTACT_NO),
	constraint FK_CUST_NO_TB_CUST foreign key (CUST_NO) references TB_CUST(CUST_NO)
	on delete cascade
)

insert into tb_cust (cust_no, cust_nm) values (1, '이순신');
insert into tb_cust (cust_no, cust_nm) values (2, '이방원');

select * from tb_cust;

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (1, 'CTC001', '010-1234-1234', 1);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (2, 'CTC002', 'sclee@gmail.com', 1);

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (3, 'CTC001', '010-7777-5555', 2);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (4, 'CTC002', 'bwlee@gmail.com', 2);

select * from tb_contact;

delete from tb_cust where cust_no = 1;

------------------------------------------------------------------------

drop table if exists TB_CONTACT;
drop table if exists TB_cust;


create table TB_CONTACT
(
	CONTACT_NO INT
	,CONTACT_TYPE_CD CHAR(6) not null,
	CONTACT_INFO VARCHAR(100)
	,CUST_NO INT,
	primary key (CONTACT_NO)
)


insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (1, 'CTC001', '010-1234-1234', 1);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (2, 'CTC002', 'sclee@gmail.com', 1);

insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (3, 'CTC001', '010-7777-5555', 2);
insert into tb_contact (CONTACT_NO, CONTACT_TYPE_CD, CONTACT_INFO, CUST_NO)
values (4, 'CTC002', 'bwlee@gmail.com', 2);

select * from tb_contact;

create table TB_CUST
(
CUST_NO INT ,
cust_nm char(10),
primary key(CUST_NO)
)

insert into tb_cust (cust_no, cust_nm) values (1, '이순신');
insert into tb_cust (cust_no, cust_nm) values (2, '이방원');


alter table tb_contact
add constraint FK_tb_contact_1 foreign key (cust_no) references tb_cust(cust_no)
on delete no action;

--------------------------------------------------------------------------
drop table if exists TB_EMP;
create table tb_emp
(
	emp_no serial primary key
,	first_nm varchar(50)
,	last_nm varchar(50)
,	birth_de date check (birth_de > '1900-01-01')
,	join_de date check (join_de > birth_de)
,	sal_amt numeric check (sal_amt > 0)
);

insert into tb_emp (first_nm, last_nm, birth_de, join_de, sal_amt)
values ('순신', '이', '1994-07-21', '2009-01-02', 5000000);

select * from tb_emp;

alter table tb_emp add constraint tb_emp_sal_amt_check check(sal_amt > 0);



---------------------------------------------------------------------
drop table if exists TB_EMP;
create table tb_emp
(
	emp_no serial primary key
,	first_nm varchar(50)
,	last_nm varchar(50)
,	birth_de date check (birth_de > '1900-01-01')
,	join_de date check (join_de > birth_de)
,	sal_amt numeric
);

insert into tb_emp (first_nm, last_nm, birth_de, join_de, sal_amt)
values ('순신', '이', '1994-07-21', '2009-01-02', 5000000);

-- alter table 조건이 맞고 안맞고 테스트
insert into tb_emp (first_nm, last_nm, birth_de, join_de, sal_amt)
values ('순신', '이', '1994-07-21', '2009-01-02', -10000);

alter table tb_emp add constraint tb_emp_sal_amt_check check(sal_amt > 0);

select * from tb_emp;

-----------------------------------------------------------------
drop table if exists TB_PERSON;

create table TB_PERSON
(
	PERSON_NO SERIAL primary key
,	FIRST_NM VARCHAR(50)
,	LAST_NM VARCHAR(50)
,	EMAIL_ADDRESS VARCHAR(50) unique
);

insert into TB_PERSON (FIRST_NM, LAST_NM, EMAIL_ADDRESS)
values('순신', '이', 'sclee@gmail.com');
select * from tb_person];

create unique index IDX_TB_PERSON_01 on TB_PERSON (first_nm, last_nm, email_address);

--유니크 제약조건을 걸어줌
alter table tb_person 
add constraint CONSTRAINT_TB_PERSON_01
unique using index IDX_TB_PERSON_01;


-------------------------

drop table if exists TB_PERSON;

create table TB_PERSON
(
	PERSON_NO SERIAL primary key
,	FIRST_NM VARCHAR(50) null
,	LAST_NM VARCHAR(50) null
,	EMAIL_ADDRESS VARCHAR(50) not null
);

--NOT NULL 위반
insert into tb_person (first_nm, last_nm, email_address)
values('이순','이',NULL);

insert into tb_person (first_nm, last_nm, email_address)
values('방원','이','NULL@gmial.com');


select * from tb_person where first_nm = '방원';
select * from tb_person;

