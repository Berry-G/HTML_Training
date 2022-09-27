select first_name 
from customer;

select
	first_name || ' ' || last_name as first_last_name
, 	email from customer;


------트정 컬럼 추출하기
select category as 카테고리, yyyy 년도, mm 월
from gmv_trend;

------중복값 없이 특정 컬럼 추출하기
select distinct category as 카테고리
from gmv_trend;

------앨리어스 사용

select A.customer_id as cust_id
,		A.first_name || ' ' || last_name as "FULL NAME"
,		A.email as 이메일
from customer as A;

-------조건이 하나일 때 문자열
select *
from gmv_trend
where category != '컴퓨터 및 주변기기';

select *
from gmv_trend
where category = '컴퓨터 및 주변기기';

-------amount 컬럼의 값 11.00보다 큰 행 추출

select A.payment_id
,	A.amount 
,	A.payment_date 
from payment A
where A.amount > 11.00;





select A.payment_id
,	A.amount 
,	A.payment_date 
from payment A
where A.amount > 11.00;


select A.customer_id
,	A.payment_id 
,	A.amount 
from payment A
where A.amount not between 10 and 11;
--where A.amount < 11.00 and A.amount > 10.00;

select 
	a.customer_id
,	a.first_name
,	length(a.last_name) as LENGTH_LAST_NAME
,	a.last_name 
from customer a
order by LENGTH_LAST_NAME  asc;

---------------------------------
drop table if exists tb_sort_test;
create table tb_sort_test
( NUM int );

insert into tb_sort_test values (1);
insert into tb_sort_test values (2);
insert into tb_sort_test values (3);
insert into tb_sort_test values (NULL);
select * from tb_sort_test order by num desc;
select * from tb_sort_test order by num nulls first;
select * from tb_sort_test order by num nulls last;
select * from tb_sort_test order by num asc nulls first;


---- IN 연산자
select * from gmv_trend gt
where gt.category in ('컴퓨터 및 주변기기', '생활용품');

select * from gmv_trend gt
where gt.category not in ('컴퓨터 및 주변기기', '생활용품');


select 
	r.customer_id 
,	r.rental_id 
,	r.return_date 
from rental r 
where r.customer_id in (1, 2) 
order by r.return_date;

--in 연산자와 or연산자는 결과집합이 동일함
select 
	r.customer_id 
,	r.rental_id 
,	r.return_date 
from rental r 
where r.customer_id = 1 or r.customer_id = 2
order by r.return_date;

--rental_date 컬럼을 기준으로 내림차순 정렬한 후 정렬된 집합 중에서
--10건만 출력하시오
select *
from rental as A
order by A.rental_date desc 
limit 10;


select 
	f.film_id 
,	f.title 
,	f.release_year 
from film f 
order by f.film_id 
fetch first 5 row
only;

select 
	f.film_id 
,	f.title 
,	f.release_year 
from film f 
order by f.film_id 
fetch first 5 row
only;

select 
	f.title 
,	f.length 
, case when length > 0 and length <= 50 then 'short'
	 when length > 50 and length <= 100 then 'mediuem'
	 when length > 100 then 'long'
	 end duration
from film f 
order by f.title
;

select 
	f.title 
,	f.length 
, case when length > 0 and length <= 50 then 'short'
	 when length > 50 and length <= 100 then 'mediuem'
	 when length > 100 then 'long'
	 end duration
from film f 
order by case when length > 0 and length  <50 then 1
				when length >50 and length <=100 then 2
				when length > 120 then 3
				end desc 
;

