-- join 연습
select category , yyyy, sum(gmv) total_gmv
from gmv_trend
group by category, yyyy;

select category , yyyy, sum(gmv) total_gmv
from gmv_trend
group by 1,2;

select category , yyyy, sum(gmv) total_gmv
from gmv_trend
where category = '컴퓨터 및 주변기기'
group by 1,2;



select category , mm, platform_type , sum(gmv) as gmv
from gmv_trend
group by category, mm ;

--매출이 높은(1000000) 주요 카테고리만 추출하시오, 이 중 2020년에 해당되는 것을 출력하시오
select category , sum(gmv) as gmv
from gmv_trend
where yyyy = 2020
group by 1
having sum(gmv) >= 10000000;


select *
from gmv_trend
order by category , yyyy, mm, platform_type
;


--매출이 높은 순으로 카테고리를 정렬하시오
select category, sum(gmv) as gmv
from gmv_trend
group by 1
order by gmv desc
;

--매출이 높은 순으로 카테고리를 정렬하시오
select category, yyyy,  sum(gmv) as gmv
from gmv_trend
group by 1,2
order by 1 desc, 3 desc
;


select * from customer A, payment B
where A.customer_id = B.customer_id 
and A.customer_id =2
order by B.payment_date ;


--------------------------------------

select
	A.customer_id 
	B.customer_id 
	
from customer A
,	 payment B
,	 staff C
where 
and 
and 
order by;


-- Left Outer Join













---- film Table, inventory 테이블
select
	f.film_id 
,	f.title
,	i.inventory_id 
from
	film f
left outer join inventory i 
on (f.film_id = i.film_id)
--재고가 없는 영화
--where i.inventory_id is null
order by f.title
;


select
	G.category 
--,	G.gmv 
,	sum(G.gmv) as total_gmv
from gmv_trend G
group by G.category 
order by G.category asc;

-- 성별 매출액 출력하시오
select
	G.category 
--,	G.gmv 
,	sum(G.gmv) as total_gmv
from gmv_trend G
join user_info ui
on G.userid = ui.userid
group by G.category 
order by G.category asc;

-- 카테고리별 주요 상품 명의 매출액을 출력
select 
	c.cate3
,	c.cate2
,	c.cate1
,	i.item_name 
,	sum(gmv) as gmv
,	sum(unitsold) as unitsold
,	sum(gmv) / sum(unitsold) as	price
from online_order oo
join item i on oo.itemid = i.id 
join category c on i.category_id = c.id 
group by 1, 2, 3, 4
order by 1, 5 desc 
;

--남성이 구매하는 아이템을 출력
select 
	ui.gender
,	c.cate1
,	i.item_name 
,	sum(gmv) as gmv
,	sum(unitsold) as unitsold
,	sum(gmv) / sum(unitsold) as	price
from online_order oo
join item i on oo.itemid = i.id 
join category c on i.category_id = c.id 
join user_info ui on oo.userid = ui.userid
where ui.gender = 'M'
group by ui.gender, c.cate1, i.item_name
order by c.cate1 , gmv desc 
;















