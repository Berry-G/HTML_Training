--payment 테이블에서 customer_id 별 건수를 구하시오
select payment.customer_id, count(payment.customer_id) as cnt
from payment
group by payment.customer_id;

select * from payment
where customer_id = 184;

select pa.customer_id, count(pa.customer_id) as cnt
from payment pa
group by pa.customer_id
order by cnt desc
limit 1
;

-- amount 값 중 유일한 값만 출력하시오
select distinct p.amount as amount
from payment p
order by amount;

-- payment 테이블에서 amount 컬럼값이 유일값의 개수를 리턴함
select count(distinct p.amount) as amount
from payment p
order by amount;

-- payment 테이블에서 customer_id 별 amount 컬럼의 유일값의 개수를 리턴하시오.
select p.customer_id, count(distinct p.amount) as amount_cnt
from payment p
group by customer_id
order by customer_id asc;

-- amount 컬럼의 유일값의 개수가 11개 이상인 행들을 출력하시오
select p.customer_id , count(distinct p.amount) as amount_cnt
from payment p
group by customer_id
having count(distinct p.amount) >= 11
order by customer_id asc;

-- max(), min()

-- payment 테이블에서 최대 amount 값과 최소 amount 값을 구하시오
select
    max(p.amount) as max_amount
,   min(p.amount) as min_amount
from payment p;

-- payment 테이블에서 customer_id 별 최대 amonut 값과 최소 amount 값을 구하시오
select
    p.customer_id
,    max(p.amount) as max_amount
,   min(p.amount) as min_amount
from payment p
group by p.customer_id
order by p.customer_id;

--그 중 최대 amount 값이 11.00보다 큰 집합을 출력하시오.
select
    p.customer_id
,    max(p.amount) as max_amount
,   min(p.amount) as min_amount
from payment p
group by p.customer_id
having max(p.amount) >= 11.00
order by p.customer_id;

-- AVG(), SUM()
-- PAYMENT테이블에서 AMOUNT의 평균값과 AMOUNT의 합계값을 구하시오
-- 단 소수점 이하 2자리까지 출력하시오
SELECT round(avg(p.amount), 2) as AVG, sum(p.amount) as SUM
FROM payment p;


-- PAYMENT 테이블에서 CUSTOMER_ID 별 AMOUNT 의 평균값과 AMOUNT 의 합계값읅 구하시오
-- AMOUNT 합계값을 기준으로 내림차순 정렬하시오.
SELECT
    p.customer_id
,   round(avg(p.amount), 2) as AVG
,   sum(p.amount) as SUM
FROM payment p
group by p.customer_id
order by SUM desc;

-- PAYMENT 테이블에서 AMOUNT 의 평균값이 5.0 이상인 결과집합을 구하시오
-- AMOUNT 합계값을 기준으로 내림차순 정렬하시오.
SELECT
    p.customer_id
,   round(avg(p.amount), 2) as AVG
,   sum(p.amount) as SUM
FROM payment p
group by p.customer_id
having avg(p.amount) >= 5.00
order by SUM desc;

--CUSTOMER_ID, FIRST_NAME, LAST_NAME 별 AMOUNT 평균값과 AMOUNT 합계값을 구하시오
SELECT
    p.customer_id
,   c.first_name
,   c.last_name
,   round(avg(p.amount), 2) as AVG
,   sum(p.amount) as SUM
FROM PAYMENT P, customer C
group by p.customer_id, c.first_name, c.last_name;

SELECT
    p.customer_id
,   c.first_name
,   c.last_name
,   round(avg(p.amount), 2) as AVG
,   sum(p.amount) as SUM
FROM PAYMENT P
inner join customer c on c.customer_id = P.customer_id
group by p.customer_id, c.first_name, c.last_name;

drop table if exists tb_avg_sum_test;
create table tb_avg_sum_test
(
    val1 int primary key
,   val2 numeric
,   val3 numeric
);

insert into tb_avg_sum_test values('100001', 200.00, NULL);
insert into tb_avg_sum_test values('100002', 100.00, 100.00);
insert into tb_avg_sum_test values('100003', 100.00, NULL);
insert into tb_avg_sum_test values('100004', NULL, NULL);
insert into tb_avg_sum_test values('100005', 100.00, NULL);
insert into tb_avg_sum_test values('100006', 100.00, NULL);
insert into tb_avg_sum_test values('100007', NULL, NULL);

select *
from tb_avg_sum_test;

-- 평균을 구할 때 NULL은 갯수에 포함 자체가 되지 않았음.
select round(avg(val2),2) as avg_amount
,   round(sum(val3),2) as sum_amount
from tb_avg_sum_test;

-- 사칙연산 시 NULL과 연산을 시도하면 NULL이 됨.
select val2 + val3
from tb_avg_sum_test;

-- yyyy-mm--dd로 표현하기
select
    DT
,   left(cast(DT as varchar), 4) as yyyy
,   substring(cast(dt as varchar), 5, 2) as mm
,   right(cast(dt as varchar), 2) as dd
,   concat(left(cast(DT as varchar), 4),'-',substring(cast(dt as varchar), 5, 2),'-',right(cast(dt as varchar), 2))  as yyyymmdd
from online_order oo;

-- null 값인 경우 임의값으로 변경해주기
select
    coalesce(ui.gender, 'NA') as gender
,   coalesce(ui.age_band, 'na') AS AGE_BAND
,   sum(oo.gmv)
from online_order oo
left join user_info ui on oo.userid = ui.userid
group by 1,2
order by 1,2;

select distinct case
    when gender = 'M' then '남성'
    when gender = 'F' then '여성'
    else 'NA'
    end as gender
from user_info ui;

-- 연령대 그룹을 만들어 출력하시오
-- 연령대 별 매출액을 출력하시오
select
    ui.age_band
,   sum(oo.gmv) as sum_gmv
from user_info ui
inner join online_order oo on ui.userid = oo.userid
group by ui.age_band
order by ui.age_band
;

select case
    when ui.age_band = '20~24' then '20대'
    when ui.age_band = '25~29' then '20대'
    when ui.age_band = '30~34' then '30대'
    when ui.age_band = '35~39' then '30대'
    when ui.age_band = '40~44' then '40대'
    else 'NA'
    end as age
,   sum(oo.gmv) as sum_gmv
from online_order oo
left join user_info ui on oo.userid = ui.userid
group by age
order by 1;