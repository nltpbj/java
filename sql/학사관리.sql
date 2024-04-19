create table professors(
    pcode char(3) not null,
    pname varchar(15) not null, 
    dept varchar(30), hiredate date, 
    title varchar(15), 
    salary int default 0, 
    primary key(pcode)
);
desc professors;

create table students(
    scode char(8) not null, 
    sname varchar(15) not null, 
    dept varchar(30), 
    year int default 1, 
    birthday date, 
    advisor char(3), 
    primary key(scode), 
    foreign key(advisor) references professors(pcode) /* on delete cascade */
);
desc students;

create table courses(
     lcode char(4) not null, 
     lname varchar(50) not null, 
     hours int, 
     room char(3), 
     instructor char(3), 
     capacity int default 0, 
     persons int default 0, 
     primary key(lcode), /* constraint child_pk foreign key(instructor) references professors(pcode) */
     foreign key(instructor) references professors(pcode)
);
desc courses;

create table enrollments(
    lcode char(4) not null, 
    scode char(8) not null, 
    edate date, 
    grade int default 0, 
    primary key(lcode, scode),
    foreign key(lcode) references courses(lcode), 
    foreign key(scode) references students(scode)
);
desc enrollments;

drop table enrollments;
drop table students;
drop table courses;
drop table professors;

insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','�̺���','����','75/04/03','������',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','���籤','����','91/09/19','�α���',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','������','����','94/06/09','�α���',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','����ȯ','����','92/10/14','������',2000000);
select * from professors;

insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','������','����',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','��â��','����',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','������','����',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','������','����',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','�̿���','����',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','���翵','����',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','������','����',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','�����','����',3,'77/12/22','228');

select * from students;

insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','����ó����', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','�����ͺ��̽�',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','�˰���',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','�ڷᱸ��',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','��ȸ��',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','�ѱ��ǰ��๮ȭ',2,'101','509',120,36);

select * from courses;

insert into enrollments(lcode, scode, edate, grade) values('C401','92414033','98/03/02',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414033','98/03/02',80);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414033','98/03/02', 0);
insert into enrollments(lcode, scode, edate, grade) values('C401','95414058','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C312','95414058','98/03/03',80);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C421','92514023','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C301','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C421','92414029','98/03/03',0);
insert into enrollments(lcode, scode, edate, grade) values('C312','92414029','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('E221','92414029','98/03/03',75);
insert into enrollments(lcode, scode, edate, grade) values('A109','92414029','98/03/03',90);
insert into enrollments(lcode, scode, edate, grade) values('C301','92514009','98/03/03',70);
insert into enrollments(lcode, scode, edate, grade) values('C401','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('E221','92514009','98/03/03',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C401','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C421','96414404','98/03/04',75);
insert into enrollments(lcode, scode, edate, grade) values('C312','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('E221','92454018','98/03/04',90);
insert into enrollments(lcode, scode, edate, grade) values('A109','95454003','98/03/05',85);
insert into enrollments(lcode, scode, edate, grade) values('C301','95454003','98/03/05',83);
insert into enrollments(lcode, scode, edate, grade) values('E221','95454003','98/03/05',75);

select count(*) from enrollments;

/*�л� ���̺��� '����'�̸鼭 '3'�г� �л����� �̸�, �й�, ��������� �˻��Ͻÿ�. */
select sname, scode,birthday
from students
where dept='����' and year ='3';

/*���� ���̺��� �������� �ٹ��ϴ� �Ҽ��а� �̸��� �˻��Ͻÿ�(�� , �ߺ� ���� �����Ͻÿ�).*/
select distinct dept from professors; /* distinct �ߺ����� */

/*���� ���̺��� '1993��3��1��' ������ �ӿ�� �������� �̸� �Ҽ��а��� �˻��Ͻÿ�.*/
select pname, dept, hiredate
from professors
where hiredate <='93/03/01';

/*�л� ���̺��� ������ȣ�� '221'�� ������ �������� �ʴ� �л����� �˻��Ͻÿ�. */
select *
from students
where advisor != '221';

/*������û ���̺��� ������ 80�� �̻��� �����ȣ, �л���ȣ�� �˻��Ͻÿ�.*/
select lcode, scode, grade
from enrollments
where grade >=80;

/*���� ���̺��� �����̸��� '����'�̶�� �ܾ �����ϴ� ������ ���¹�ȣ, �����̸�, ��米��, ���ǽð����� �˻��Ͻÿ�.*/
select lcode, lname, instructor, hours
from courses
where lname like '%����%';

/*������û ���̺��� 1998�� 3�� 1�Ͽ��� 3��3�� ���̿� ������û �� ���¹�ȣ, �л���ȣ, ������û���� �˻��Ͻÿ�  */
select * 
from enrollments
where edate between '98/03/01' and '98/03/03';

select * 
from enrollments
where edate >='98/03/01' and edate <= '98/03/03';

/*���� ���̺��� ������ '������' �̰ų� '�α���'�� �������� ������ȣ, ������, ������ �˻��Ͻÿ�.  */
select *
from professors
where title = '������' or title='�α���';

select * 
from professors
where title in ('������', '�α���');

/* '����'�� �л����� �й�, �̸�, ��������� �̸��� �������� ��������, ��������� �������� �������� ������ �Ͻÿ�. */
select *
from students
where dept='����'
order by sname asc,sname desc;

/*�л����� �а�, �л��̸�, ���������̸��� �˻��Ͻÿ�.*/
select s.dept ,sname ,pname
from professors p, students s
where p.pcode=s.advisor;  /* innerjoin */

/*���¹�ȣ, ���¸�, �����̸��� �˻��Ͻÿ�.*/
select lcode, lname, pname
from courses, professors
where instructor=pcode;

/*�й�, �л��̸�, �л����� ������û �� ���¹�ȣ, ������û���� �˻��Ͻÿ�*/
select s.scode, sname, e.lcode, e.edate
from students s, enrollments e
where s.scode = e.scode
order by e.scode;
/*�й�, �л����� ������û �� ���¹�ȣ, ���¸�, ������ �˻��Ͻÿ�.*/
create view viewl as
select s.scode, sname, e.lcode, c.lname, e.grade
from students s, enrollments e, courses c
where s.scode=e.scode and e.lcode = c.lcode
order by e.scode;
select * from viewl;

/*'�̺���'�� ������ �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�*/
select s.sname, s.year, s.birthday 
from students s,professors p
where s.advisor=p.pcode;

/*'98/03/03'�� ������û �� �л����� �й�, �л��̸�, ���¹�ȣ�� �˻��Ͻÿ�.*/
select s.scode, sname, lcode
from students s, enrollments e
where s.scode= e.scode
order by lcode;

/*'����'�� �������� �����ϴ� �л����� �̸�, �г�, ��������� �˻��Ͻÿ�.*/
select s.sname, s.year, birthday
from  students s,professors p
where p.dept='����' and s.advisor=p.pcode;

/*�ڷᱸ��'�� �����ϴ� ������ �а���, ���� ���� �˻��Ͻÿ�.*/
select p.dept, pname
from professors p, courses c
where lname='�ڷᱸ��' and pcode=instructor;

/*'����ó����'�� ������û �� �л����� �й�, ������û��, ������ �˻��Ͻÿ�.*/
select e.scode, edate, e.grade
from courses c, enrollments e
where lname='����ó����' and c.lcode=e.lcode;

/*'�ڷᱸ��' ������ ������û �� �л����� �а�, �л��̸�, ������ �˻��Ͻÿ�.*/
select s.dept, sname, s.year
from students s, courses c
where lname='�ڷᱸ��' and instructor=advisor ;

/*'����'�� �л����� �й�, �л��̸�, ������û �� ���¹�ȣ, ���� ��, ������ �˻��Ͻÿ�.*/
select s.scode, sname, c.lcode, lname, e.grade
from students s,courses c, enrollments e
where s.dept='����' and e.scode=s.scode and e.lcode=c.lcode;

/*'����ó����'�� �����ϴ� ������ �̸�, �� ������ �����ϴ� �л����� �й�, �л����� �˻��Ͻÿ�.*/
select pname, s.scode, sname
from professors p, Students s, courses c
where c.lname='����ó����' and  instructor=pcode and advisor=pcode;

/*'�����ͺ��̽�'�� �����ϴ� ������, �� ������ ������û �� �л����� �а�, �̸�, ������ �˻��Ͻÿ�.*/
select pname, s.dept, sname, e.grade
from  courses c, students s, enrollments e, professors
where lname='�����ͺ��̽�' and instructor=pcode and  e.scode=s.scode and c.lcode=e.lcode;

/*������ 80�� �̻��� �л����� �й�, �л��̸�, ���¹�ȣ, ���¸�, ��米�� ���� �˻��Ͻÿ�.*/
select s.scode, s.sname, e.lcode, c.lname, pname
from students s, courses c, professors p, enrollments e 
where grade>=80 and pcode=instructor and c.lcode=e.lcode and s.scode=e.scode;

/*3.��ȸ*/
/*3.�������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors;

/*����� �������� �� �޿��װ� ��� �޿����� ���Ͻÿ�.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors
where dept='����';

/*������û �� ����� �߿��� �ְ� ������ ���� ������ ���Ͻÿ�.*/
select max(grade), min(grade)
from enrollments;

/*����� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(*)
from students
where dept='����';

/*������û �� �л����� ��� �� ������ ���Ͻÿ�.*/
select count(distinct(scode))
from enrollments;

/*�� �а��� �л����� ���� ���Ͻÿ�.*/
select dept, count(scode)
from students
group by dept
order by count(scode) desc;

/*�������� �Ҽ��а���, ���޺��� �з��Ͽ� �� ���޺� ��� �޿��׼��� ���Ͻÿ�.*/
select dept, title, avg(salary), count(pcode)
from professors
group by dept, title
order by dept, title;

/*�� �л��鿡 ���� �й�, �л��̸�, ������û ������� ��� ������ ���Ͻÿ�.*/
select e.scode, sname, avg(grade)
from students s, enrollments e
where s.scode=e.scode
group by e.scode, sname
order by avg(grade) desc;

select e.*, s.*, pname, p.dept
from enrollments e, students s, professors p
where e.scode=s.scode and advisor=pcode;

select scode, sname, dept, avg(grade), pname
from enr_stu_pro
group by scode, sname, dept, pname;

drop view stu_enr_por;

create view stu_enr_pro as
select e.*, sname,s.dept stu_dept, pname, p.dept pro_dept
from enrollments e, students s, professors p
where e.scode=s.scode and advisor=pcode;

select * from stu_enr_pro;

create view enr_stu_cou as
select e.*, s.sname, c.lname
from enrollments e, students s, courses c
where e.scode=s.scode and e.lcode=c.lcode;

select *  from enr_stu_cou;

create view enr_stu_pro as
select e.*, p.pname, s.sname, s.dept
from enrollments e, students s, professors p
where e.scode=s.scode and p.pcode=s.advisor;

select *  from enr_stu_pro;

/*�� �л��鿡 ���� ������û ������� ��� ������ ���Ͻÿ�.*/
select scode, sname, avg(grade)
from enr_stu_pro
where dept='����' or dept='����'
group by scode, sname, pname, dept
having avg(grade)>=75
order by dept, avg(grade) desc;

/*������û �� ������� �л����� �׷����Ͽ� ��� ������ ���� ����, �л���ȣ, ��� ������ ������ ���� ������ �����Ͽ� ����Ͻÿ�.*/
select scode, avg(grade) 
from enr_stu_pro 
group by scode 
order by avg(grade) desc;
/*������û ������� ��� ������ 85�� �̻��� �л����� �л���ȣ, ��� ������ ���Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ�� ��������� ����Ͻÿ�.*/
/*�л����� 3�� �̻��� �а� ���� ����, �а���, �л����� ����Ͻÿ�.*/
/*������û ��������� 85�� �̻��� �л����� �л���ȣ, �л��̸�, ��� ������ ��������� ���� ������ ����Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ���µ��� ���¹�ȣ, ���¸�, ��������� ��������� ���� ������ ����Ͻÿ�.*/

/*4.��ȸ*/
/*'�˰���'�� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select * from professors where pcode in 
(select instructor from courses where lname='�˰���');

/*���ǽ� '510'ȣ���� �����ϴ� ������ ������ȣ, �����̸�, �Ҽ��а��� �˻��Ͻÿ�.*/
select * from professors where pcode in
(select instructor from courses where room='510');

/*'��â��' �л��� �Ҽӵ� �а��� �����ϴ� �������� �̸�, ����, �ӿ����ڸ� �˻��Ͻÿ�.*/
select * from professors where dept =
(select dept from students where sname='��â��');

/*������û ������ ������ 90�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
select * from students where scode in
(select scode from enrollments group by scode having avg(grade)>=80);

/*'����'�� �������� ����ϴ� ������ �̸�, ���ǽð���, ���ǽ��� �˻��Ͻÿ�.*/
/*'98/03/02'�� ������û �� �л����� �а�, �й�, �л��̸�, �г��� �˻��Ͻÿ�.*/
/*'509'ȣ���� ���Ǹ� ��� �л����� �а�, �й�, �л��̸��� �˻��Ͻÿ�.*/
/*������û ������ ��������� 80�� �̻��� �л����� �̸�, �л���ȣ, �Ҽ��а�, �г��� �˻��Ͻÿ�.*/
/*'����'�� �л����� �����ϴ� ������ �̸�, ������ȣ, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*�л����� '3'�� �̻��� �а��� �ٹ��ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*'�̿���'�� ������û�� ������ ��ȣ, �����, ������ �˻��Ͻÿ�.*/
/*'�˰���'�� ������û�� �л����� �й�, �л��̸�, �а��� �˻��Ͻÿ�.*/
/*'1973'��� �л����� �����ϴ� �������� �̸�, �Ҽ��а�, ������ �˻��Ͻÿ�.*/
/*��ü �л��� 30% �̻��� ������û�� ������ ��ȣ�� �˻��Ͻÿ�.*/


/*1.����*/
/*'98414022', '������', '75-05-10', '����' ���� �л����̺� �����Ͻÿ�.*/
insert into students(scode, sname, birthday, dept)
values('98414022', '������', '75-05-10', '����');
select * from students;

create table oldenrollments(
    lcode char(4) not null, 
    scode char(8) not null, 
    edate date, 
    grade int default 0, 
    primary key(lcode, scode),
    foreign key(lcode) references courses(lcode), 
    foreign key(scode) references students(scode)
);
/*�������� ������û ������ ������û(Enrollments)���̺� �����Ͻÿ�.*/

/*'1998�� 1�� 1��' ������ �߻��� ��� ������û �����͸� oldEnrollments���̺�� �����Ͻÿ�.*/
insert into oldenrollments(scode, lcode, edate, grade)
select scode, lcode, edate, grade from enrollments where edate <= '98/03/03';
select * from oldenrollments;

/*4�г� �л����� ��� �л� �����͸� oldstudents ���̺�� �����Ͻÿ�.*/
create table oldstudents(
    scode char(8) not null, 
    sname varchar(15) not null, 
    dept varchar(30), 
    year int default 1, 
    birthday date, 
    advisor char(3), 
    primary key(scode), 
    foreign key(advisor) references professors(pcode) /* on delete cascade */
);
insert into oldstudents
select * from students where year=4;
select * from oldstudents;

/*�л����̺��� '������'�� �����͸� �����Ͻÿ�.*/
/*'1998�� 1�� 1��' ������ ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*������û �� ���� ���� ������ ���� ���� ���� ������û �����͸� �����Ͻÿ�.*/
/*�л����̺��� ����� 3�г� �����͸� 4�г����� �����Ͻÿ�.*/
/*'����ȯ' ������ ������ '������'���� '�α���'�� �����Ͻÿ�.*/
/*'�����' �л��� ��û�� ��� ������û �����͸� �����Ͻÿ�.*/
/*'����'�� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*��� �������� �޿��� 10% ���� ��Ű�ÿ�.*/
/*'����'�� �л����� ��û�� ������û �����͸� ��� �����Ͻÿ�.*/
/*'����'�� ������ ����ϴ� ������ ���ǽ��� ��� '123'ȣ�Ƿ� �����Ͻÿ�.*/

/*2.����*/
/*'���籤' ������ �����ϴ� �л����� ���������� ������ȣ '221'�� �����Ͻÿ�.*/
update stduents set advisor='221'
where advisor=(select pcode from professors where pname='���籤');
select * from students;

/*'����ó����' ������ ������û �� �л����� ������ 5���� ���� ��Ű�ÿ�. */

update enrollments set grade=grade+5
where lcode = (select lcode from courses where lname='����ó����');

/*'����'�� �л����� ������û �� ������û �������� ������ 0�� ó�� �Ͻÿ�.*/
/*'������' �л��� ���������� �����ϴ� ������ ���ǽ��� '304'ȣ�� �����Ͻÿ�.*/
/*'��ȸ��'�� �����ϴ� ������ �޿��� 100000�� �λ��Ͻÿ�.*/
/*������û�ο����� 80�� �̻��� ���¸� �����ϴ� �������� �޿��� 100000�� �λ��Ͻÿ�.*/
/*������' �л��� ��� ���� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� 3�г� �л����� ������û �� ������� ������ 5���� ���� ��Ű�ÿ�.*/
/*'����'�� '�α���'�� �����ϴ� ���ǽð����� 1�� ���� ��Ű�ÿ�.*/
/*������û �� ������3���� �̻��� �л����� �г��� 1�� ���� ��Ű�ÿ�.*/
/*������û ��������� 80�� �̸��� �л����� �г��� 1�� ���ҽ�Ű�ÿ�.*/
/*'����ó����'�� ������û �� �л����� �а��� '����'���� �����Ͻÿ�.*/
/*���º� ��������� 80�� �̻��� ������� ���ǽ��� '509'ȣ�� �����Ͻÿ�.*/
/*'����ȯ' ������ �����ϴ� ���¸� ��û�� ������û �����͸� �����Ͻÿ�.*/
/*'�ڷᱸ��'�� ������û �� �л��� �г��� 1�� ���� ��Ű�ÿ�.*/