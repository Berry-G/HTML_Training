drop table to_contact;
drop table tb_contact_bak ;

create table to_contact
(
	primary key contact_no char(10),
	EMAIL_ADDRESS char(10) not null,
	first_nm char(20) not null,
	lasst_nm char(20) not null
);

create table tb_contact_bak
	as table to_contact;

select * from tb_contact_bak;

alter table tb_contact_bak;

alter table tb_contact_bak add primary key(contact_no);
alter table tb_contact_bak add unique(EMAIL_ADDRESS);
alter table tb_contact_bak alter column first_nm set not null;
alter table tb_contact_bak alter column last_nm set not null;

insert into tb_contact_bak (CONTACT_NO, first_nm, last_nm, email_adrress)
values (3, '방간', '이', 'bglee@gmail.com');
insert into tb_contact_bak (CONTACT_NO, first_nm, last_nm, email_adrress)
values (4, '성계', '이', 'sglee@gmail.com');
