select 1 + 1 as 일더하기일;

create table TB_EMP
(
	EMP_NO CHAR(10),
	EMP_NM VARCHAR(50),
	SELF_INTRO TEXT
);

drop table tb_emp;

create table TB_EMP
(
	EMP_NO SERIAL primary key,		--SERIAL이 정의되면 자동으로 1,2,3,.... 부여
	AGE smallint,
	GRADE_POINT NUMERIC(3,2),		--0.00~4.50
	SAL NUMERIC(9),
	TOT_ASSET INT
);

insert into tb_emp (AGE, grade_point, SAL, tot_asset)
values(35, 4.25, 58700000, 1250000000);

insert into tb_emp (AGE, grade_point, SAL, tot_asset)
values(40, 3.14, 34500000, 1050000000);

select * from tb_emp;


drop table tb_emp;

create table TB_EMP
(
	BIRTH_DE DATE,
	JOIN_DT TIMESTAMP,
	JOIN_DT_WITHOUT_TIMEZONE TIMESTAMP,
	TASK_BEGIN_TM TIME
);

insert into tb_emp 
values ('2022-09-21', '2022-09-21 123456.123456', '2022-09-22 123456.123456' at TIME zone 'America/Santiago');

select * from tb_emp;

show TIMEZONE;

drop table tb_emp;

select current_date as "current_date"		-- 현재 날짜 가져오기
,	current_time as "current_time"			-- 현재 시간 가져오기
;

create table tb_user
(
	used_id char(10) primary key
	, used_nm varchar(255) not null
)

create table tb_role
(
	role_id char(10) primary key
	,role_nm varchar(255) not null
);

create table tb_user_role
(
	used_id char(10) not null
	,role_id char(10) not null
	,primary key (used_id, role_id)
	,foreign key (role_id) references tb_role(role_id)
	,foreign key (used_id) references tb_user(used_id)
);

------------------------------------------------------------------------------
drop table if exists tb_link;
create table tb_link
(
	LINK_ID SERIAL primary key
	,title varchar(512) not null
	,URL varchar(1024) not null
);

alter table tb_link add column active_yn char(1);
select * from tb_link;

alter table tb_link drop column active_yn;

alter table tb_link rename column title to Link_title;

alter table tb_link add column target varchar(10);

alter table tb_link alter column target set default '_BLANK';

insert into tb_link (link_title, url) values ('애플', 'https://www.apple.com');
select * from tb_link;

alter table tb_link add check (TARGET in('_blank', '_parent', '_self', '_top'));
select * from tb_link;

-- TARGET 컬럼에 제약에 없는 item을 insert 하려고해서 오류 발생
insert into tb_link (link_title, url, target)
values('피그마', 'https://www.figma.com/', '없는 거');


insert into tb_link (link_title, url, target)
values('피그마', 'https://www.figma.com/', '_self');

insert into tb_link (link_title, url)
values('피그마', 'https://www.figma.com/');


-----------------------------------------------------------------------------------

