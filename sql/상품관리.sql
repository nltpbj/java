desc product;
drop table product;
drop table sale;
drop sequence seq_sale;

create table product(
    code char(3) not null primary key,
    name varchar(200) not null,
    price int default 0
);
desc product;

create table sale(
    seq int primary key,
    code char(3) not null,
    sale_date date default sysdate,
    qnt int default 1,
    price int default 0,
    foreign key(code) references product(code)
    
);
desc sale;

insert into product(code,name,price)
values('101', '냉장고', 3500000);
insert into product(code,name,price)
values('102', '세탁기', 2300000);
insert into product(code,name,price)
values('103', '스타일러', 1700000);
insert into product(code,name,price)
values('104', '전자레인지', 1200000);

select * from product;

create sequence seq_sale increment by 1 start with 1;
drop sequence seq_sale;
insert into sale(seq, code)
values(seq_sale.nextval,'103');
select * from sale;

delete from product where code='104';
update sale set qnt=12 where seq=1;

delete from sale where seq>0;

select * from view_sale;
insert into sale(seq, code, sale_date)
values(seq_sale.nextval, '103', '24-04-18');


create view view_sale as
select s.*, p.name
from product p, sale s  /* 테이블 join */
where p.code=s.code;

drop view view_sale;

create view sum_sale as


select * from view_sale;

select sale_date, code, sum(qnt), price, name
from view_sale
group by sale_date, code, price, name
order by sale_date, code;

select * from sale;
select * from sale where code='103';

select sale_date, sum(qnt), sum(qnt)*price total
from view_sale
where code='103'
group by sale_date, price;

select sale_date, code, sum(qnt), price, name
from view_sale
group by sale_date, code, price, name
order by sale_date, code;


commit;
select * from view_sale;

insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'101','24-04-01',3,3200000);

insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'101','24-04-02',1,3200000);
insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'101','24-04-02',2,3200000);

insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'101','24-04-02',2,3200000);
insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'102','24-04-02',1,2100000);
insert into sale(seq,code,sale_date,qnt,price)
values(seq_sale.nextval,'102','24-04-03',2,2100000);

select sale_date, code, name, sum(qnt), sum(price*qnt)
from view_sale
group by sale_date, code, name
order by sale_date, code;


select sale_date, code, name, sum(qnt), sum(price*qnt)
from view_sale
group by sale_date, code, name
order by sale_date, code;