-- DCL(계정생성, 권한부여, 권한박탈, 계정삭제)
-- DDL(제약조건FK, 시퀀스 없음)
-- DML(outer join, and=&&, or=||, 일부단일행함수, rownum이 없어 top-N구문이 다름)

-- Java에서 쓸 데이터 넣어 보고 연습하기
show databases;


-- ★ ★ ★ DCL (계정 생성, 권한 부여, 계정 삭제)
create user usr01 identified by 'mymymy'; -- 계정 생성
grant all on *.* to usr01; -- 권한 부여
revoke all on *.* from usr01; -- 권한 박탈
drop user usr01; -- 계정 삭제

show databases;
use world; -- world 데이터 베이스 영역으로 접속
show tables;
create database dev_user; -- 데이터베이스 생성(dev_user)
show databases;
use dev_user;
show tables;
select database(); -- 현재 들어와 있는 데이터베이스 명


-- ★ ★ ★ DDL
create table emp (
	empno numeric(4) primary key,
    ename varchar(6) not null,
    nickname varchar(6) unique,
    sal numeric(7,2) check(sal>0),
    comm numeric(7,2) default 0
);
desc emp;
insert into emp (empno, ename, nickname, sal)
	values (1111, '김수한무거북', '두루미거북이', 20);
select * from emp;

-- major : mCode(학과번호, 인위적pk), mName(학과이름), mOffice(학과사무실)
-- student : sNo(학번, pk), sName(이름), mCode(학과번호, fk)

create table major(
	mCode int primary key auto_increment,
    mName varchar(10),
    mOffice varchar(30)
);

create table student(
	sNo numeric(4) primary key,
    sName varchar(10),
    mCode int,
    foreign key (mCode) references major(mCode)
);
insert into major (mName, mOffice) values ('컴공', '201호');
insert into major (mName, mOffice) values ('빅데이터', '202호');
insert into major (mName, mOffice) values ('웹디', '203호');
select * from major;
insert into student values (1001, '홍길동', 1);
insert into student values (1002, '신길동', 2);
insert into student values (1011, '대길동', 3);
insert into student values (1011, '박길동', 4);
select * from student;
drop table if exists major;
drop table if exists student;
select * from major;


-- 학번, 이름, 학과번호, 학과명, 학과 사무실
select sno, sname, s.mcode, mname, moffice
	from student s, major m
    where s.mcode=m.mcode;
-- 학번, 이름, 학과번호, 학과명, 학과사무실 (학생이 없는 학과도 출력) -outer join
select sno, sname, s.mcode, mname, moffice
	from student s right outer join major m
    on s.mcode=m.mcode;
    
-- ★ ★ ★ ★ ★ 자바 (JDBC) 수업시간에 쓸 테이블 ★ ★ ★ ★ ★
drop table  if exists personal;
drop table  if exists division;
create table division (
	dno int, -- 부서번호
    dname varchar(20) not null, -- 부서명
    phone varchar(20) unique, -- 부서 전화
    position varchar(20), -- 부서 위치
    primary key(dno)
);
insert into division values (10, 'finance', '02-888-8888', '신림');
insert into division values (20, 'research', '02-2345-8238', '신림');
insert into division values (30, 'sales', '02-2212-2222', '신림');
insert into division values (40, 'cs', '02-3032-8848', '신림');
select * from division;
-- Edit 메뉴 -> Preference메뉴 -> SQL Execution에서 "auto commit mode"
create table personal (
	pno int, -- 사번
    pname varchar(20) not null, -- 사원명
    job varchar(20) not null, -- 직책
    manager int, -- 상사사번
    startdate date, 
    pay int, 	
    bonus int, 
    dno int, -- 부서번호
    primary key (pno),
    foreign key(dno) references division(dno)
);

insert into personal values (1111,'smith','manager', 1001, '1990-12-17', 1000, null, 10);
insert into personal values (1112,'ally','salesman',1116,'1991-02-20',1600,500,30);
insert into personal values (1113,'word','salesman',1116,'1992-02-24',1450,300,30);
insert into personal values (1114,'james','manager',1001,'1990-04-12',3975,null,20);
insert into personal values (1001,'bill','president',null,'1989-01-10',7000,null,10);
insert into personal values (1116,'johnson','manager',1001,'1991-05-01',3550,null,30);
insert into personal values (1118,'martin','analyst',1111,'1991-09-09',3450,null,10);
insert into personal values (1121,'kim','clerk',1114,'1990-12-08',4000,null,20);
insert into personal values (1123,'lee','salesman',1116,'1991-09-23',1200,0,30);
insert into personal values (1226,'park','analyst',1111,'1990-01-03',2500,null,10);
-- ifnull(널 일수도 있는 필드, 널 대체 값) -- 매개변수 2개의 타입은 일치하지 않아도 됨
-- if(조건, 조건이 참일 때 반환 값, 조건이 참이 아닐 때 반환 값)
select pno"no", pname, bonus, pay+ifnull(bonus, 0) from personal;
select pname, pay+if(bonus is null, 0, bonus) sum from personal;
select * from personal;

-- ★ ★ ★  DML ★ ★ ★
-- 1. 사번, 이름, 급여를 출력
select pno, pname, pay from personal;
-- 2. 급여가 2000~5000 사이 모든 직원의 모든 필드
select * from personal where pay between 2000 and 5000;
-- 3. 부서번호가 10또는 20인 사원의 사번, 이름, 부서번호
select pno, pname, dno from personal where dno in (10, 20);
-- 4. 보너스가 null인 사원의 사번, 이름, 급여 급여 큰 순정렬
select pno, pname, pay from personal where bonus is null order by pay desc;
-- 5. 사번, 이름, 부서번호, 급여. 부서코드 순 정렬 같으면 PAY 큰순
select pno, pname, dno, pay from personal order by dno and pay desc;
-- 6. 사번, 이름, 부서명
select pno, p.pname, dname 
	from personal p, division d
	where p.dno=d.dno;
-- 7. 사번, 이름, 상사이름
select * from personal;
select w.pno, w.pname, m.pname manager
	from personal w, personal m 
    where w.manager=m.pno;
-- 8. 사번, 이름, 상사이름(상사가 없는 사람도 출력하되 상사가 없는 경우 ★CEO★로 출력) – 우선
select w.pno, w.pname, ifnull(m.pname, "CEO") manager
	from personal w left outer join personal m 
    on w.manager=m.pno;
-- 8-1 사번, 이름, 상사사번(상사가 없으면 ceo로 출력. ifnull함수의 매개변수의 타입이 상이해도 상관없음)
select w.pno, w.pname, ifnull(m.pno, "CEO") manager
	from personal w left outer join personal m 
    on w.manager=m.pno;
-- 8-2. 사번, 이름, 상사이름, 부서명(상사가 없는 사람도 출력) – 같이 합시다
select w.pno, w.pname, ifnull(m.pname, "CEO") manager, dname
	from division d, personal w left outer join personal m 
    on w.manager=m.pno
    where d.dno=w.dno;
-- 9. 이름이 s로 시작하는 사원 이름 (like 이용, substr함수이용, instr함수 이용등 다양하게 사용 가능)
select pname from personal where pname like 'S%';
-- 10. 사번, 이름, 급여, 부서명, 상사이름
select w.pno, w.pname, w.pay, dname, m.pname manager
	from personal w, personal m, division d
    where w.dno=d.dno and w.manager=m.pno;
-- 11. 부서코드, 급여합계, 최대급여
select dno, sum(pay), max(pay) from personal group by dno;
-- 12. 부서명, 급여평균, 인원수
select dname, avg(pay), count(*) from personal group by dname;
-- 13. 부서코드, 급여합계, 인원수 인원수가 4명 이상인 부서만 출력
select dno, sum(pay), count(*) 
	from personal 
	group by dno
	having count(*) >= 4;
-- 14. 사번, 이름, 급여 회사에서 제일 급여를 많이 받는 사람
select pno, pname, pay from personal
	where pay = (select max(pay) from personal);
-- 15. 회사 평균보다 급여를 많이 받는 사람 이름, 급여, 부서번호
select pname, pay, dno from personal
	where pay > (select avg(pay) from personal);
-- 16. 회사 평균 급여보다 많이 받는 사원의 사번, 이름, 급여, 부서명을 출력(부서명순 정열 같으면 급여 큰순 정렬)
select pname, pay, dname
	from personal p, division d
    where p.dno=d.dno && pay > (select avg(pay) from personal)
    order by dname, pay desc;
-- 17. 자신이 속한 부서의 평균보다 많인 받는 사람의 이름, 급여, 부서번호, 반올림한 해당부서평균 (where절의 subQuery를 이용하거나 inline view를 이용)
select pname, pay, dno, 
		round((select avg(pay) from personal where dno=p.dno)) avg
    from personal p
    where pay > (select avg(pay) from personal where dno=p.dno);
-- 18. 입사가 가장 빠른 사람의 이름, 급여, 부서명
  select pname, pay, dname, startdate
	from personal p, division d
    where p.dno=d.dno and 
		startdate = (select min(startdate) from personal);
-- 19. 이름, 급여, 해당부서평균(select절의 subQuery를 이용하거나 inline view를 이용)
select pname, pay, 
	(select avg(pay) from personal where dno=p.dno) dnoavg
	from personal p;
-- 20. 이름, 급여, 부서명, 해당부서평균(select절의 subQuery를 이용하거나 inline view를 이용)
select pname, pay, dname, 
		(select avg(pay) from personal where dno=p.dno) dnoavg
	from personal p, division d
	where p.dno=d.dno;
    
-- Oracle에서의 단일행 함수와 다른 부분
	-- ex. smith는 job이다
select concat (pname, '는' , job, '이다')"message" from personal;
select round(35.78,1); -- from절 없이도 실행 가능


-- 시스템으로부터 현재시점, 현재날짜, 현재시간
select sysdate(), now();
select curdate(), curtime();

-- date_format(날짜/시간, 포맷) => 날짜/ 시간형을 문자형으로 변환
-- date_format(문자, 포맷) => 문자를 날짜/시간형으로 변환
 -- 포맷 : %Y(년도 4자리), %y(년도 2자리)
 -- 	  %m(01,02,...), %c(1,2,...)
 -- 	  %d(01,02,...), %e(1,2,...)
 -- 	  %W(monday,...), %a(mon,...)
 -- 	  %H(24시), %h(12시), %p(오전, 오후), %i(분) %s(초)
 select date_format(now(), '%y년%m월%e일 %p %h시 %i분 %s초') now;
 select year(now()), weekday(now());
 select case weekday(now())
	when '0' then '월요일'
    when '1' then '화요일'
    when '2' then '수요일'
    when '3' then '목요일'
    when '4' then '금요일'
    when '5' then '토요일'
    when '6' then '일요일' end dayofweek;
    
 --   format (숫자, 소숫점자리수) -- 소수점자리수까지 출력하고 세자리마다
 select format (pay, 0) from personal; -- 세자리 마다 ,
 select format (pay, 2) from personal; -- 세자리 마다 ,
 
 -- ★ ★ ★ ★ ★ top-N 구문 (rownum이 없고, limit이용)
 select pname, pay from personal order by pay desc limit 0, 5;
-- limit n ==  limit 0, n(1~n등까지)
-- limit n1, n2 (n1번째 부터 n2개, 첫번째는 0번째)
-- pay순으로 1page (1~3등)
select pname, pay from personal order by pay desc limit 0, 3;
-- 2page (4~6등)
select pname, pay from personal order by pay desc limit 3, 3;
-- 3page (7~9등)
select pname, pay from personal order by pay desc limit 6, 3;