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
