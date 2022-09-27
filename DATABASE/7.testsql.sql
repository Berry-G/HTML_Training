-- DBeaver <--> DataGrip COMMIT TEST

select * from category;
SELECT * FROM TB_ACCOUNT;

insert into tb_account values (1, '일반계좌', 15000.45);

select * from tb_account tbac
where tbac.accnt_no = 1;

