-- DBeaver <--> DataGrip COMMIT TEST

select * from category;
SELECT * FROM TB_ACCOUNT;

insert into tb_account values (1, '일반계좌', 15000.45);

select * from tb_account tbac
where tbac.accnt_no = 1;


--CHAPTER. UPDATE
drop table if exists tb_link;
create table tb_link
(
    LINK_NO integer primary key
,   URL     varchar(255) not null
,   LINK_NM  varchar(255) not null
,   DSCRPTN   varchar(255) not null
,   LAST_UPDATE_DE date
);
insert into tb_link(LINK_NO, URL, LINK_NM, DSCRPTN, LAST_UPDATE_DE)
VALUES (1, 'www.naver.com', '네이버', '검색사이트', current_date);
insert into tb_link(LINK_NO, URL, LINK_NM, DSCRPTN, LAST_UPDATE_DE)
VALUES (2, 'www.google.com', '구글', '검색사이트', current_date);
insert into tb_link(LINK_NO, URL, LINK_NM, DSCRPTN, LAST_UPDATE_DE)
VALUES (3, 'www.daum.net', '다음', '포털사이트', current_date)
returning *;

select * from tb_link
order by LINK_NO asc;

update tb_link
set link_nm = '이젠에이씨씨오점케이알'
where link_no=1;

update tb_link
    set link_nm = '구글닷컴'
where link_no = 2
returning *;

--update하면서 update한 행에서 link_no, 및 link_nm 컬럼을 출력하시오
update tb_link
set link_nm = '다음 닷넷'
where link_no = 3
returning link_no, link_nm;


commit;


--CHAPTER. UPDATE JOIN
DROP TABLE IF EXISTS TB_PRDT_CL;
CREATE TABLE TB_PRDT_CL
(
    prdt_cl_no integer PRIMARY KEY
,   prdt_cl_nm varchar(50)
,   discount_rate numeric(2,2)
);

INSERT INTO TB_PRDT_CL VALUES (1, 'SMART PHONE', 0.20);
INSERT INTO TB_PRDT_CL VALUES (1, 'SMART PHONE', 0.20);

SELECT * FROM TB_PRDT_CL;

DROP TABLE IF EXISTS TB_PRDT;
CREATE TABLE TB_PRDT
(
    prdt_no integer primary key
,   prdt_nm varchar(50)
,   prc numeric(15)
,   sale_prc numeric(15)
,   prdt_cl_no integer
    FOREIGN KEY(prdt_cl_no) REFERENCES TB_PRDT_CL(prdt_cl_no)
);
SELECT * FROM TB_PRDT;






----upsert
DROP TABLE IF EXISTS TB_CUSTO;
CREATE TABLE TB_CUSTO
(
    cust_no int
,   cust_nm varchar(50) unique
,   email_adres varchar(200) not null
,   valid_yb char(1) not null
,   constraint PK_TB_CUST primary key (cust_no)
);

select A.customer_id
from payment A
group by A.customer_id
order by A.customer_id;

-- customer_id 컬럼 별 amount 합계가 큰 순으로 10건 출력
select A.customer_id,
       sum(A.amount) as AMOUNT_SUM
from payment A
group by A.customer_id
order by AMOUNT_SUM desc
limit 10;


-- first_name 및 last_name 같이 출력하시오
select
    pa.customer_id
,   cu.first_name || ' ' || cu.last_name as FULLNAME
,   sum(pa.amount) as AMOUNT_SUM
from payment pa, customer cu
where pa.customer_id = cu.customer_id
group by pa.customer_id, cu.first_name || ' ' || cu.last_name
order by AMOUNT_SUM desc
limit 10;

--customer_id는 firstname 및 lastname을 결정 지을 수 있는 관계(종속성)이기 때문에
--MAX() 사용가능
select
    pa.customer_id
,   max(cu.first_name) as first_name
,   max(cu.last_name) as last_name
,   sum(pa.amount) as AMOUNT_SUM
from payment pa, customer cu
where pa.customer_id = cu.customer_id
group by pa.customer_id
order by AMOUNT_SUM desc
limit 10;

--HAVING
--AMOUNT SUM >= 200 결과 집합을 추출하시오
select
    pa.customer_id
,   cu.first_name
,   cu.last_name
,   sum(pa.amount) as AMOUNT_SUM
from payment pa, customer cu
where pa.customer_id = cu.customer_id
group by pa.customer_id, CU.first_name, CU.last_name
HAVING sum(pa.amount) >= 200
order by AMOUNT_SUM desc
limit 10;


select
    pa.customer_id
,   cu.first_name
,   cu.last_name
,   count(pa.payment_id) as AMOUNT_SUM
from payment pa, customer cu
where pa.customer_id = cu.customer_id
group by pa.customer_id, CU.first_name, CU.last_name
HAVING sum(pa.amount) >= 200
order by AMOUNT_SUM desc
limit 10;


--UNION
drop table if exists tb_film_grade;
create table tb_film_grade
(
    film_grade_no varchar not null
,   title_nm varchar not null
,   release_year smallint
,   grade_rank int
);

insert into tb_film_grade values (1, '늑대사냥', 2022, 1);
insert into tb_film_grade values (2, '공조2:인터네셔날', 2022, 2);
insert into tb_film_grade values (3, '아바타 리마스터링', 2022, 3);

select * from tb_film_grade;

drop table if exists tb_film_attendance;
create table tb_film_attendance
(
    film_grade_no varchar not null
,   title_nm varchar not null
,   release_year smallint
,   attendance_rank int
);

insert into tb_film_attendance values (1, '아바타 리마스터링', 2022, 1);
insert into tb_film_attendance values (2, '헌트', 2022, 2);
insert into tb_film_attendance values (3, '늑대사냥', 2022, 3);

commit;

select *
from tb_film_attendance;

--중복된 행을 하나씩만 보여주고 중복제거하고 유일한 값만 보여줌
select A.title_nm, A.release_year from tb_film_grade A
union
select A.title_nm, A.release_year from tb_film_attendance A;

--중복된 행도 모두 보여줌
select A.title_nm, A.release_year from tb_film_grade A
union all
select A.title_nm, A.release_year from tb_film_attendance A;

-- 정렬할 때는 as로 정의한 카테고리 name으로 해야함. A.title로 정렬 시 오류
select A.title_nm as 타이틀명, A.release_year as 출시년도 from tb_film_grade A
union
select A.title_nm, A.release_year from tb_film_attendance A
order by 타이틀명;

--INTERSECT
select A.title_nm as 타이틀명, A.release_year as 출시년도 from tb_film_grade A
INTERSECT
select A.title_nm, A.release_year from tb_film_attendance A
order by 타이틀명 desc;
--intersect 연산과 inner join 의 연산결관는 동일

select A.title_nm
,   A.release_year
from tb_film_grade A
inner join tb_film_attendance B
    on (A.title_nm = B.title_nm and A.release_year = B.release_year)
order by title_nm;

commit;

--except 차집합을 구할 수 있음

