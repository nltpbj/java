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

insert into professors(pcode,pname,dept,hiredate,title,salary) values('221','이병렬','전산','75/04/03','정교수',3000000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('228','이재광','전산','91/09/19','부교수',2500000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('311','강승일','전자','94/06/09','부교수',2300000);
insert into professors(pcode,pname,dept,hiredate,title,salary) values('509','오문환','건축','92/10/14','조교수',2000000);
select * from professors;

insert into students(scode,sname,dept,year,birthday,advisor) values('92414029','서연우','전산',3,'73/10/06','228');
insert into students(scode,sname,dept,year,birthday,advisor) values('92414033','김창덕','전산',4,'73/10/26','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514009','이지행','전자',4,'73/11/16','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92514023','김형명','전자',4,'73/08/29','311');
insert into students(scode,sname,dept,year,birthday,advisor) values('92454018','이원구','건축',3,'74/09/30','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95454003','이재영','건축',4,'76/02/06','509');
insert into students(scode,sname,dept,year,birthday,advisor) values('95414058','박혜경','전산',4,'76/03/12','221');
insert into students(scode,sname,dept,year,birthday,advisor) values('96414404','김수정','전산',3,'77/12/22','228');

select * from students;

insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C301','파일처리론', 3 ,'506','221',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C401','데이터베이스',3,'414','221',80,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C421','알고리즘',3,'510','228',80,72);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('C312','자료구조',2,'510','228',100,60);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('E221','논리회로',3,'304','311',100,80);
insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values('A109','한국의건축문화',2,'101','509',120,36);

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

/*학생 테이블에서 '전산'이면서 '3'학년 학생들의 이름, 학번, 생년월일을 검색하시오. */
select sname, scode,birthday
from students
where dept='전산' and year ='3';

/*교수 테이블에서 교수들이 근무하는 소속학과 이름을 검색하시오(단 , 중복 값은 제거하시오).*/
select distinct dept from professors; /* distinct 중복제거 */

/*교수 테이블에서 '1993년3월1일' 이전에 임용된 교수들의 이름 소속학과를 검색하시오.*/
select pname, dept, hiredate
from professors
where hiredate <='93/03/01';

/*학생 테이블에서 교수번호가 '221'인 교수가 지도하지 않는 학생들을 검색하시오. */
select *
from students
where advisor != '221';

/*수강신청 테이블에서 성적이 80점 이상인 과목번호, 학생번호를 검색하시오.*/
select lcode, scode, grade
from enrollments
where grade >=80;

/*강좌 테이블에서 강좌이름이 '건축'이라는 단어를 포함하는 강좌의 강좌번호, 강좌이름, 담당교수, 강의시간수를 검색하시오.*/
select lcode, lname, instructor, hours
from courses
where lname like '%건축%';

/*수강신청 테이블에서 1998년 3월 1일에서 3월3일 사이에 수강신청 한 강좌번호, 학생번호, 수강신청일을 검색하시오  */
select * 
from enrollments
where edate between '98/03/01' and '98/03/03';

select * 
from enrollments
where edate >='98/03/01' and edate <= '98/03/03';

/*교수 테이블에서 직급이 '정교수' 이거나 '부교수'인 교수들의 교수번호, 교수명, 직급을 검색하시오.  */
select *
from professors
where title = '정교수' or title='부교수';

select * 
from professors
where title in ('정교수', '부교수');

/* '전산'과 학생들의 학번, 이름, 생년월일을 이름을 기준으로 오름차순, 생년월일을 기준으로 내림차순 정렬을 하시오. */
select *
from students
where dept='전산'
order by sname asc,sname desc;

/*학생들의 학과, 학생이름, 지도교수이름을 검색하시오.*/
select s.dept ,sname ,pname
from professors p, students s
where p.pcode=s.advisor;  /* innerjoin */

/*강좌번호, 강좌명, 교수이름을 검색하시오.*/
select lcode, lname, pname
from courses, professors
where instructor=pcode;

/*학번, 학생이름, 학생들이 수강신청 한 강좌번호, 수강신청일을 검색하시오*/
select s.scode, sname, e.lcode, e.edate
from students s, enrollments e
where s.scode = e.scode
order by e.scode;
/*학번, 학생들이 수강신청 한 강좌번호, 강좌명, 성적을 검색하시오.*/
create view viewl as
select s.scode, sname, e.lcode, c.lname, e.grade
from students s, enrollments e, courses c
where s.scode=e.scode and e.lcode = c.lcode
order by e.scode;
select * from viewl;

/*'이병렬'과 교수가 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오*/
select s.sname, s.year, s.birthday 
from students s,professors p
where s.advisor=p.pcode;

/*'98/03/03'에 수강신청 한 학생들의 학번, 학생이름, 강좌번호를 검색하시오.*/
select s.scode, sname, lcode
from students s, enrollments e
where s.scode= e.scode
order by lcode;

/*'전산'과 교수들이 지도하는 학생들의 이름, 학년, 생년월일을 검색하시오.*/
select s.sname, s.year, birthday
from  students s,professors p
where p.dept='전산' and s.advisor=p.pcode;

/*자료구조'를 강의하는 교수의 학과명, 교수 명을 검색하시오.*/
select p.dept, pname
from professors p, courses c
where lname='자료구조' and pcode=instructor;

/*'파일처리론'을 수강신청 한 학생들의 학번, 수강신청일, 점수를 검색하시오.*/
select e.scode, edate, e.grade
from courses c, enrollments e
where lname='파일처리론' and c.lcode=e.lcode;

/*'자료구조' 과목을 수강신청 한 학생들의 학과, 학생이름, 성적을 검색하시오.*/
select s.dept, sname, s.year
from students s, courses c
where lname='자료구조' and instructor=advisor ;

/*'전자'과 학생들의 학번, 학생이름, 수강신청 한 강좌번호, 강좌 명, 성적을 검색하시오.*/
select s.scode, sname, c.lcode, lname, e.grade
from students s,courses c, enrollments e
where s.dept='전자' and e.scode=s.scode and e.lcode=c.lcode;

/*'파일처리론'을 강의하는 교수의 이름, 이 교수가 지도하는 학생들의 학번, 학생명을 검색하시오.*/
select pname, s.scode, sname
from professors p, Students s, courses c
where c.lname='파일처리론' and  instructor=pcode and advisor=pcode;

/*'데이터베이스'를 강의하는 교수명, 이 과목을 수강신청 한 학생들의 학과, 이름, 성적을 검색하시오.*/
select pname, s.dept, sname, e.grade
from  courses c, students s, enrollments e, professors
where lname='데이터베이스' and instructor=pcode and  e.scode=s.scode and c.lcode=e.lcode;

/*성적이 80점 이상인 학생들의 학번, 학생이름, 강좌번호, 강좌명, 담당교수 명을 검색하시오.*/
select s.scode, s.sname, e.lcode, c.lname, pname
from students s, courses c, professors p, enrollments e 
where grade>=80 and pcode=instructor and c.lcode=e.lcode and s.scode=e.scode;

/*3.조회*/
/*3.교수들의 총 급여액과 평균 급여액을 구하시오.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors;

/*전산과 교수들의 총 급여액과 평균 급여액을 구하시오.*/
select sum(salary) salary_sum, avg(salary) salary_avg
from professors
where dept='전산';

/*수강신청 한 과목들 중에서 최고 점수와 최저 점수를 구하시오.*/
select max(grade), min(grade)
from enrollments;

/*전산과 학생들은 모두 몇 명인지 구하시오.*/
select count(*)
from students
where dept='전산';

/*수강신청 한 학생들은 모두 몇 명인지 구하시오.*/
select count(distinct(scode))
from enrollments;

/*각 학과별 학생들의 수를 구하시오.*/
select dept, count(scode)
from students
group by dept
order by count(scode) desc;

/*교수들을 소속학과별, 직급별로 분류하여 각 직급별 평균 급여액수를 구하시오.*/
select dept, title, avg(salary), count(pcode)
from professors
group by dept, title
order by dept, title;

/*각 학생들에 대해 학번, 학생이름, 수강신청 과목들의 평균 점수를 구하시오.*/
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

/*각 학생들에 대해 수강신청 과목들의 평균 점수를 구하시오.*/
select scode, sname, avg(grade)
from enr_stu_pro
where dept='전산' or dept='전자'
group by scode, sname, pname, dept
having avg(grade)>=75
order by dept, avg(grade) desc;

/*수강신청 한 과목들을 학생별로 그룹핑하여 평균 점수를 구한 다음, 학생번호, 평균 점수를 성적이 높은 순으로 정렬하여 출력하시오.*/
select scode, avg(grade) 
from enr_stu_pro 
group by scode 
order by avg(grade) desc;
/*수강신청 과목들의 평균 점수가 85점 이상인 학생들의 학생번호, 평균 점수를 구하시오.*/
/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호와 평균점수를 출력하시오.*/
/*학생수가 3명 이상인 학과 구한 다음, 학과명, 학생수를 출력하시오.*/
/*수강신청 평균점수가 85점 이상인 학생들의 학생번호, 학생이름, 평균 점수를 평균점수가 높은 순으로 출력하시오.*/
/*강좌별 평균점수가 80점 이상인 강좌들의 강좌번호, 강좌명, 평균점수를 평균점수가 높은 순으로 출력하시오.*/

/*4.조회*/
/*'알고리즘'을 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
select * from professors where pcode in 
(select instructor from courses where lname='알고리즘');

/*강의실 '510'호에서 강의하는 교수의 교수번호, 교수이름, 소속학과를 검색하시오.*/
select * from professors where pcode in
(select instructor from courses where room='510');

/*'김창덕' 학생이 소속된 학과에 재직하는 교수들의 이름, 직급, 임용일자를 검색하시오.*/
select * from professors where dept =
(select dept from students where sname='김창덕');

/*수강신청 과목의 점수가 90점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
select * from students where scode in
(select scode from enrollments group by scode having avg(grade)>=80);

/*'전산'과 교수들이 담당하는 강좌의 이름, 강의시간수, 강의실을 검색하시오.*/
select * from courses where instructor in
(select pcode from professors where dept='전산');
/*'98/03/02'에 수강신청 한 학생들의 학과, 학번, 학생이름, 학년을 검색하시오.*/
/*'509'호에서 강의를 듣는 학생들의 학과, 학번, 학생이름을 검색하시오.*/
/*수강신청 과목의 평균점수가 80점 이상인 학생들의 이름, 학생번호, 소속학과, 학년을 검색하시오.*/
/*'건축'과 학생들을 지도하는 교수의 이름, 교수번호, 소속학과, 직급을 검색하시오.*/
/*학생수가 '3'명 이상인 학과에 근무하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*'이원구'가 수강신청한 과목의 번호, 과목명, 점수를 검색하시오.*/
/*'알고리즘'을 수강신청한 학생들의 학번, 학생이름, 학과를 검색하시오.*/
/*'1973'년생 학생들을 지도하는 교수들의 이름, 소속학과, 직급을 검색하시오.*/
/*전체 학생의 30% 이상이 수강신청한 강좌의 번호를 검색하시오.*/


/*1.갱신*/
/*'98414022', '노진순', '75-05-10', '전산' 값을 학생테이블에 삽입하시오.*/
insert into students(scode, sname, birthday, dept)
values('98414022', '노진순', '75-05-10', '전산');
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
/*노진순의 수강신청 내용을 수강신청(Enrollments)테이블에 삽입하시오.*/

/*'1998년 1월 1일' 이전에 발생한 모든 수강신청 데이터를 oldEnrollments테이블로 복사하시오.*/
insert into oldenrollments(scode, lcode, edate, grade)
select scode, lcode, edate, grade from enrollments where edate <= '98/03/03';
select * from oldenrollments;

/*4학년 학생들의 모든 학생 데이터를 oldstudents 테이블로 복사하시오.*/
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

/*학생테이블에서 '노진순'의 데이터를 삭제하시오.*/
/*'1998년 1월 1일' 이전에 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*수강신청 한 과목에 대해 성적을 아직 받지 못한 수강신청 데이터를 삭제하시오.*/
/*학생테이블에서 전산과 3학년 데이터를 4학년으로 변경하시오.*/
/*'오문환' 교수의 직급을 '조교수'에서 '부교수'로 변경하시오.*/
/*'건축과' 학생이 신청한 모든 수강신청 데이터를 삭제하시오.*/
/*'전산'과 교수들의 급여를 10% 증가 시키시오.*/
/*모든 교수들의 급여를 10% 증가 시키시오.*/
/*'전자'과 학생들이 신청한 수강신청 데이터를 모두 삭제하시오.*/
/*'전산'과 교수가 담당하는 강좌의 강의실을 모두 '123'호실로 변경하시오.*/

/*2.갱신*/
/*'이재광' 교수가 지도하는 학생들의 지도교수를 교수번호 '221'로 변경하시오.*/
update stduents set advisor='221'
where advisor=(select pcode from professors where pname='이재광');
select * from students;

/*'파일처리론' 과목을 수강신청 한 학생들의 점수를 5점씩 증가 시키시오. */

update enrollments set grade=grade+5
where lcode = (select lcode from courses where lname='파일처리론');

/*'전자'과 학생들이 수강신청 한 수강신청 데이터의 점수를 0점 처리 하시오.*/
/*'서연우' 학생의 지도교수가 강의하는 강좌의 강의실을 '304'호로 변경하시오.*/
/*'논리회로'를 강의하는 교수의 급여를 100000원 인상하시오.*/
/*수강신청인원수가 80명 이상인 강좌를 강의하는 교수들의 급여를 100000원 인상하시오.*/
/*서연우' 학생의 모든 과목 점수를 5점씩 감소 시키시오.*/
/*'전산'과 3학년 학생들이 수강신청 한 과목들의 성적을 5점씩 증가 시키시오.*/
/*'전산'과 '부교수'가 강의하는 강의시간수를 1씩 증가 시키시오.*/
/*수강신청 한 과목이3과목 이상인 학생들의 학년을 1씩 증가 시키시오.*/
/*수강신청 평균점수가 80점 미만인 학생들의 학년을 1씩 감소시키시오.*/
/*'파일처리론'을 수강신청 한 학생들의 학과를 '건축'으로 수정하시오.*/
/*강좌별 평균점수가 80점 이상인 과목들의 강의실을 '509'호로 변경하시오.*/
/*'오문환' 교수가 강의하는 강좌를 신청한 수강신청 데이터를 삭제하시오.*/
/*'자료구조'를 수강신청 한 학생의 학년을 1씩 증가 시키시오.*/