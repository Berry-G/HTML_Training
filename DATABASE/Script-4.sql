--날짜관련함수
--AGE함수
select 
	age('2023-01-11', '2022-09-26') as "age('2023-01-11', '2022-09-26')"
,	age(CURRENT_DATE, '2023-01-11') as "age(CURRENT_DATE, '2022-09-26')"
,	age(current_timestamp, current_timestamp-cast('2hour' as interval));


select 
	round(10.78, 0) as "round(10.78, 0)"
,	round(10.78, 1) as "round(10.78, 1)" 
,	round(10.781, 2) as "round(10.781, 2)" 
,	ceil(12.4) as "ceil(12.4)"
,	ceil(12.8) as "ceil(12.8)"
,	ceil(12.1) as "ceil(12.1)"
,	ceil(12.0) as "ceil(12.0)"
,	floor(12.4) 
,	floor(12.8) 
,	floor(12.1) 
,	floor(12.0) 
,	trunc(10.78, 0) as "trunc(10.78,0)"  
,	trunc(10.78, 1) as "trunc(10.78,2)"  
,	trunc(10.78, 2) as "trunc(10.78,1)" ;


select 
	sign(3) as "sign(3)"
,	div(9,2) as "div(9,2)"
,	mod(9,2) as "mod(9,2)"
,	log(10, 1000) as "log(10, 1000)"
,	power(2,3) as "power(2,3)"
,	sqrt(2) as "sqrt(2)"
,	sqrt(4) as "sqrt(4)"
,	random() as	"random()"		-- 0~1까지 실수값 리턴
,	pi() as "pi()"
,	degrees(1) as "degrees(1)"	--라디안 1은 57.2957....


