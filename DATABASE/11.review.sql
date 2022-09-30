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