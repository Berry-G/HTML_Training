drop table if exists role;
create table if not exists role
(
    role_id serial primary key
,   role_name varchar(255) unique not null
);

drop table if exists account_role;
create table account_role
(
    user_id integer not null
,   role_id integer not null
,   grant_date timestamp without time zone
,   primary key (user_id, role_id)
,   constraint account_role_role_id_fkey foreign key (role_id)
    references role (role_id)
);

select *
from role;
insert into role values (1, '아저씨');


insert into account_role values (1, 1, CURRENT_TIMESTAMP);
select *
from account_role;

--참조키 제약조건 위배
insert into account_role values (1, 2, current_timestamp);
--참조키 제약조건 위배
insert into account_role values (2, 1, current_timestamp);
--기본키 제약조건 위배
insert into account_role values (1,1,current_timestamp);
--기본키 제약조건 위배
update account_role set user_id = 2 where user_id = 1;
--참조키 제약조건 위배
delete from role where role_id = 1;


create table if not exists action_film as
select
    a.film_id
,   a.title
,   a.release_year
,   a.length
,   a.rating
from film A, film_category B
where a.film_id = b.film_id
and b.category_id = 1;

select *
from action_film;


--테이블 구조 변경
create table LINKS
(
    LINK_ID SERIAL PRIMARY KEY
,   TITLE VARCHAR(500) NOT NULL
,   URL varchar(1024) NOT NULL UNIQUE
);

SELECT * FROM LINKS;

--ACTIVE 컬럼 추가
ALTER TABLE LINKS ADD COLUMN ACTIVE BOOLEAN;
--ACTIVE 컬럼 삭제
ALTER TABLE LINKS DROP COLUMN ACTIVE;

--테이블 이름 변경
create table vendors
(
    id serial primary key
,   name varchar not null
);

select *
from vendors;

alter table vendors rename to suppliers;

select *
from vendors;

select *
from suppliers;

--suppliers_grops 테이블 생성
create table suppliers_groups
(
    id serial primary key
,   name varchar not null
);

alter table suppliers_groups add column group_id int not null;
alter table suppliers_groups add foreign key (group_id)
    references suppliers_groups (id);

--뷰 생성
--뷰는 테이블처럼 실체하는 데이터가 아닌 보기 전용으로 만들어진 데이터베이스 객체
create view supplier_data as
select
    s.id
,   s.name
from suppliers s, suppliers_groups g
where g.id = s.group_id;

alter table suppliers_groups rename to groups;

select * from suppliers_groups;
select * from groups;




--payment
select *
from payment;

select *
from customer;

--dvd-렌탈 시스템의 관리자 입장에서 고객별 매출 순위를 알고 싶습니다.
--신규 테이블로 고객의 매출 순위를 관리하고 싶습니다.
--테이블 이름은 customer_rank 이고
--table 구성은 customer, payment 활용해서 구성
--ctas 기법을 이용하여 신규테이블을 생성하고 데이터를 입력하시오

create table customer_rank as customer, payment




--반납일자가 2005년 5월 29일인 렌탈 내역의 film_id를 조회하시오.
select *
from rental
join inventory i on i.inventory_id = rental.inventory_id
where return_date > '2005-05-29' and return_date < '2005-05-30';
--inventory id
select * from inventory;
--film id
select * from film;