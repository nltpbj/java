create table professors(
    pcode char(3) primary key,
    pname varchar(15),
    dept varchar(30),
    hiredate date,
    title varchar(15),
    salary int
);

drop table professors;

insert into professors(pcode,pname,dept,hiredate,title,salary)
values('221', '�̺���', '����', '75/04/03', '������', 3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('228','���籤','����','91/09/19','�α���',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('311','������','����','94/06/09','�α���',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) 
values('509','����ȯ','����','92/10/14','������',2000000);


/*���� ���̺��� ��� �����͸� ��� */
select * from professors;

/*���� ���̺� ��� �����͸� ���� */
delete from professors where pcode is not null;

/*221�� ������ �̸��� �躴�ķ� ����*/
update professors set pname='�̺���', dept='����'
where pcode='221';

select * from professors;
select * from professors where dept='����';
select * from professors where pname like '%��%';
select * from professors order by salary desc;

commit;

select max(pcode)+1 as code from professors;

select * from professors where pcode='228';

select * from professors;
delete from professors where pcode='222';

update professors set dept='����', hiredate='24/04/16', title='������',salary=4000000
where pcode='510';