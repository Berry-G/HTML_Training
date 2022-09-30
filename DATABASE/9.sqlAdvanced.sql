drop table if exists tb_ord;
create table tb_ord
(
    ord_no char(6) primary key
,   ord_de char(8)
,   prdt_nm varchar(50)
,   brand_nm varchar(50)
,   ord_amt numeric(15,0)
,   ord_cnt int
);

insert into tb_ord values ('10001', '20221002', '겔럭시 S22 Ultra', 'SAMSUNG', 600000, 1);
insert into tb_ord values ('10002', '20221001', '겔럭시 S22 Ultra', 'SAMSUNG', 600000, 2);
insert into tb_ord values ('10003', '20221003', '겔럭시 S22 Ultra', 'SAMSUNG', 600000, 4);
insert into tb_ord values ('10004', '20221005', '겔럭시 S22 Ultra', 'SAMSUNG', 600000, 3);
insert into tb_ord values ('10005', '20221005', 'iPhone 14 pro', '애플', 600000, 7);
insert into tb_ord values ('10006', '20221006', 'iPhone 15 pro', '애플', 600000, 9);
insert into tb_ord values ('10007', '20221008', 'iPhone 15 pro', '애플', 600000, 8);
insert into tb_ord values ('10008', '20221009', 'iPad 13', '애플', 600000, 3)

select *
from tb_ord;

-- group by : prdt_nm, brand_nm
select
    ord.prdt_nm
,   ord.brand_nm
,   sum(ord.ord_amt) as SUM_ORD_AMT
,   SUM(ord.ord_cnt) as SUM_ORD_CNT
from tb_ord ord
group by ord.prdt_nm, ord.brand_nm
order by ord.prdt_nm, ord.brand_nm;

---grouping sets()
select tb.prdt_nm
,   tb.brand_nm
,   sum(tb.ord_amt) AS SUM_ORD_AMT
,   sum(tb.ord_cnt) as SUM_ORD_CNT
from tb_ord tb
GROUP BY
grouping sets  (
    (tb.prdt_nm, tb.brand_nm)
,   (prdt_nm)
,   (brand_nm)
,   ()
)
order by 1,2;

--CUBE 절
select
    a.prdt_nm
,   a.brand_nm
,   sum(a.ord_amt) as sum_amt
,   sum(a.ord_cnt) as sum_cnt
from tb_ord A
group by cube(a.prdt_nm, a.brand_nm)
order by a.prdt_nm, a.brand_nm;

--ROLLUP 절
select
    a.prdt_nm
,   a.brand_nm
,   sum(a.ord_amt) as sum_amt
,   sum(a.ord_cnt) as sum_cnt
from tb_ord A
group by rollup(a.prdt_nm, a.brand_nm)
order by a.prdt_nm, a.brand_nm;

select
    a.film_id
,   a.title
,   a.description
,   a.release_year
,   a.length
from film a
where a.length =
      (
          select max(a.length) as max_length
          from film a
          )
order by a.title;

--영화들의 평균 길이가 115.27보다 길이가 크거나 같은 영화들의 리스트를 출력하시오.
select
    a.film_id
,   a.title
,   a.description
,   a.release_year
,   a.length
from film a
where a.length >=
      (
          select avg(a.length) as avg_length
          from film a
          having avg(a.length) >= 115.27
          )
order by a.length, a.title;

select
    avg(rental_rate)
from film;

-- RENTAL_RATE의 평균보다 큰 RENTAL_RATE 집합을 구하시오
select
    film_id
,   title
,   rental_rate
from film
where rental_rate > 2.98;

-- 중첩 서브쿼리 => where 절에 쿼리 삽입
select
    film_id
,   title
,   rental_rate
from film
where rental_rate >
      (
          select
              avg(rental_rate)
          from film
          );


--인라인 뷰의 활용 => from 안에 쿼리
select
    a.film_id
,   a.title
,   a.rental_rate
from film a
,   (   select
            avg(rental_rate) as AVG_RENTAL_RATE
        from film
    ) B
where a.rental_rate > b.AVG_RENTAL_RATE;

select
    a.film_id
,   a.title
,   a.rental_rate
from
    (
    select a.film_id
    , a.title
    , a.rental_rate
    , (
        select avg(rental_rate)
        from film L
        ) as AVG_RENTAL_RATE
    from film a
    ) A
where a.rental_rate > A.AVG_RENTAL_RATE;

--all연산자
----서브쿼리에 의해 반환된 값과 비교함
----서브쿼리의 모든 값이 만족을 해야만 조건이 성립
----여러개의 레코드의 and 효과
----가장 큰 값보다 큰
select film_id
     , title
     , length
from film
where length > all
      (select rating
       from film
       group by rating)
order by length;

--IN/EXISTS 연산자
----서브쿼리 내에 집합이 존재하는지 존재 여부만 판단
----결과값 중에 있는 것 중에서의 의미
----in은 전체 레코드를 스캔함, EXISTS 존재여부만 확인하고 스캔하진 않음(속도가 빠름)
----존재하는 TRUE
----연산 부하가 줄어듦.
select c.first_name
     , c.last_name
     , c.customer_id
from customer c
where not exists(
        select 1
        from payment p
        where (p.customer_id = c.customer_id
            and p.amount > 11)
        order by c.first_name, c.last_name)
;


--재고가 없는 영화를 추출하시오
select film_id, title
from film
except
select distinct inventory.film_id
, film.title
from inventory
inner join film
on film.film_id = inventory.film_id
order by title;

--except 연산을 사용하지 않고 같은 결과 도출
select film_id, title
from film A
where not exists(
    select 1
    from inventory B, film C
    where B.film_id = C.film_id
    and A.film_id = C.film_id
    )
order by title;

DROP TABLE IF EXISTS ACCOUNT

CREATE TABLE ACCOUNT
(
    USER_ID SERIAL PRIMARY KEY

)