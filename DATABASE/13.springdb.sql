--사용자 테이블
drop table if exists t_user;
create table t_user
(
    id       varchar(30) not null primary key,
    pwd      varchar(50),
    name     varchar(30),
    email    varchar(30),
    birth    date,
    sns      varchar(30),
    reg_date date
)
;

select * from t_user;

insert into public.t_user(id, pwd, name, email, birth, sns, reg_date)
values ('ezen', '0111', 'ezen', 'ezen@gmail.com','2000-11-01', 'youtube', now());
insert into public.t_user(id, pwd, name, email, birth, sns, reg_date)
values ('ezen2', '0111', 'ezen2', 'ezen2@gmail.com','2001-11-01', 'facebook', now());
