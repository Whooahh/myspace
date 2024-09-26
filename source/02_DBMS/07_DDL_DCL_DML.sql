-- [VII] DDL, DCL, DML
    --SQL = DDL(테이블 생성 ,테이블 삭제, 테이블 구조 변경, 테이블 모든 데이터 제거) +
    --  DML (SELECT, INSERT, UPDATE, DELETE)+
    --  DCL (사용자계정생성, 사용자에게 권한 부여, 권한 박탈, 사용자 계정 삭제, 트랜잭션 명령어)
-- ★ ★ ★ DDL ★ ★ ★
    -- 1. 테이블 생성 (CREATE TABLE)
DROP TABLE BOOK;
CREATE TABLE BOOK (
    BOOKID NUMBER(4), --BOOK ID 필드의 타입은 숫자 4자리,
    BOOKNAME VARCHAR2(20), -- BOOKNAME필드의 타입은 문자 20BYTE
    PUBLISHER VARCHAR2(30),-- PUBLISHER 필드의 타입은 문자 30BYTE
    RDATE DATE, -- RDATE 필드의 타입은 DATE
    PRICE NUMBER(8,2), -- PRICE 필드의 타입은 숫자 전체 8자 중 소수점 앞 2자리까지
    PRIMARY KEY(BOOKID) --제약조건 : BOOKID필드가 주키(PRIMARY, KEY:NOT NULL, UNIQUE)
);
SELECT * FROM BOOK;
DESC BOOK;

DROP TABLE BOOK;
CREATE TABLE BOOK (
    BOOKID NUMBER(4), PRIMARY KEY,
    BOOKNAME VARCHAR2(20), 
    PUBLISHER VARCHAR2(30),
    RDATE DATE, 
    PRICE NUMBER(8,2) 
);
SELECT * FROM BOOK;
    --DEPT01 테이블 생성 : DEPTNO(숫자2:PK), DNAME(문자 14자리), LOC(문자 13자리)
DESC DEPT;
CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    PRIMARY KEY(DEPTNO)
);
    -- EX. EMP와 유사한 EMP01테이블 : EMPNO(숫자4-PK), ENAME(문자10), SAL(숫자 7,2)
                        -- DEPTNO(숫자2, DEPT01테이블의 DEPTNO와 연동: 외래키 FK)
CREATE TABLE EMP01 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO) --FK
);
SELECT * FROM DEPT01;
-- 외래키로 연결할 경우 : 참조 테이블(DEPT01)에 데이터를 먼저 INSERT
INSERT INTO EMP01 VALUES (1000, 'HONG', 9000, 10);
INSERT INTO DEPT01 VALUES (10, '신림', 'IT');
COMMIT;
DROP TABLE DEPT01; -- 참조하는 테이블이 있을 경우 테이블 삭제 안 됨
COMMIT;

--서브쿼리를 이용한 테이블 생성
CREATE TABLE EMP02
    AS
    SELECT * FROM EMP;
DESC EMP02;
SELECT * FROM EMP02;

CREATE TABLE EMP03 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP;
SELECT * FROM EMP03;

CREATE TABLE EMP04 -- EMP의 특정 행 (WHERE 절 인용)
    AS
    SELECT * FROM EMP WHERE DEPTNO=10;
SELECT * FROM EMP04;

CREATE  TABLE EMP05 -- EMP 구조 추출 (데이터는 추출X)
    AS
    SELECT * FROM EMP WHERE 0=1;
SELECT * FROM EMP05;

-- 2. 테이블 구조 변경(ALTER TABLE 테이블명 ADD || MODIFY || DROP COLUMN)
-- (1) 필드 추가(ADD)
SELECT * FROM EMP03; -- EMPNO(수4), ENAME(문10), DEPTNO(수2)
ALTER TABLE EMP03 ADD (JOB VARCHAR2(20), SAL NUMBER(7,2));
SELECT * FROM EMP03;-- 추가된 필드의 데이터는 NULL로
ALTER TABLE EMP03 ADD COMM NUMBER(7,2);
-- (2) 필드 수정(MODIFY)
ALTER TABLE EMP03 MODIFY EMPNO VARCHAR2(4); -- 숫자데이터가 들어있으면 숫자로만 변경
ALTER TABLE EMP03 MODIFY EMPNO NUMBER(5);
ALTER TABLE EMP03 MODIFY EMPNO NUMBER(4);--숫자는 줄이는게 불가
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(100);
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(10);--문자데이터필드는 늘이거나 줄이는 거 가능
SELECT MAX(LENGTH(ENAME)) FROM EMP; -- ENAME글자수 최대값
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(6); -- 가능
ALTER TABLE EMP03 MODIFY ENAME VARCHAR2(5); -- 불가능(데이터보다 작은 자리수)
ALTER TABLE EMP03 MODIFY (SAL VARCHAR2(10), COMM NUMBER(3)); -- NULL필드는 마음대로 수정
-- (3) 필드 삭제 (DROP COLUMN)
ALTER TABLE EMP03 DROP COLUMN JOB;
SELECT * FROM EMP03;
ALTER TABLE EMP03 DROP COLUMN SAL;
ALTER TABLE EMP03 DROP COLUMN ENAME; -- 데이터까지 삭제(취소 불가)
SELECT * FROM EMP03;

-- 3. 테이블 삭제(DROP TABLE 테이블명)
DROP TABLE EMP03;
SELECT * FROM EMP03;
DROP TABLE DEPT01; -- EMP01테이블에서 DEPT테이블을 참조할 경우 EMP01을 삭제한 후 DEPT01 테이블 삭제 가능
DROP TABLE EMP01;
DROP TABLE DEPT01;

-- 4. 테이블 모든 데이터 제거 (TRUNCATE TABLE 테이블명)
SELECT * FROM EMP02;
TRUNCATE TABLE EMP02; --ROLLBACK 불가
SELECT * FROM EMP02;
-- 5. 테이블명 변경

-- 6. 데이터 딕셔너리 (DB자원을 효율적으로 관리하기 위한 시스템 테이블 : 접근불가)
    -- VS. 데이터 딕셔너리뷰(접근 가능한 읽기전용 가상의 테이블)
        -- (1) USER_XXX : 현 계정이 소유하고 있는 객체(테이블, 제약조건, 뷰, 인덱스
            -- USER_TABLES, USER_CONSTRAINTS, USER_VIEWS, USER_INDEXES
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_VIEWS;
SELECT * FROM USER_INDEXES;
    -- (2) ALL_XXX : 현 계정에서 접근 가능한 객체(테이블, 제약조건, 뷰, 인덱스)
        -- ALL_TABLES, ALL_CONSTRAINTS, ALL_VIEWS, ALL_INDEXES
SELECT * FROM ALL_TABLES;
    -- (3) DBA_XXX : DBA권한에서만 접근 가능한 객체
        -- DBA_TABLES, DBA_CONSTRAINTS, DBA_VIEWS, DBA_INDEXES
SELECT * FROM DBA_TABLES;

-- DML --
-- 1. INSERT INTO 테이블 명 VALUES (값1, 값 2, ...); 모든 필드 데이터 입력
 -- INSERT INTO 테이블 명 
SELECT * FROM DEPT01;
INSERT INTO DEPT01 VALUES (50, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT01 VALUES (60, 'SALES', NULL);
INSERT INTO DEPT01 (DEPTNO, DNAME, LOC) VALUES (70, 'RESEARCH', '신림');
INSERT INTO DEPT01 (LOC, DNAME, DEPTNO) VALUES ('신길', 'IT', 80);
INSERT INTO DEPT01 (DEPTNO, DNAME) VALUES (90, 'OPERATION');
SELECT * FROM DEPT01;

-- SUBQUERY를 이용한 INSERT
INSERT INTO DEPT01 SELECT * FROM DEPT WHERE DEPTNO<40;
SELECT * FROM DEPT01;
    -- EX. BOOK(ID는 11, 책이름은 스포츠의 의학, 출판사는 한솔출판, 출판일 오늘, 가격은 90,000)
INSERT INTO BOOK VALUES (11, '스포츠의 의학' , '한솔출판', SYSDATE, TO_NUMBER('90,000', '99,999'));
SELECT * FROM BOOK;
    -- EX. BOOK(ID는 12, 책이름은 스포츠 과학, 출판사는 NULL, 출판일 오늘, 가격은 50,000)
INSERT INTO BOOK (BOOKID, BOOKNAME, RDATE, PRICE)
    VALUES (12, '스포츠 과학' , SYSDATE , TO_NUMBER('50,000', '99,999'));
-- 트랜젝션 명령어 : DML명령어들을 DB에 적용(COMMIT) + DML 명령어들 취소 (ROLLBACK)
COMMIT;
INSERT INTO BOOK (BOOKID, BOOKNAME, RDATE, PRICE)
    VALUES (13, '스포츠 과학', SYSDATE, 50000);
SELECT * FROM BOOK;

-- DDL 연습문제 page1 다음과 같은 구조로 SAM01테이블을 생성하시오. 같은 이름의 테이블이 존재할 경우 DROP TABLE로 삭제 후 생성하시오
DROP TABLE SAM01;
CREATE TABLE SAM01 (
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    SAL NUMBER(7,2)
);
SELECT * FROM SAM01;
SELECT * FROM SAM01;
INSERT INTO SAM01 (EMPNO, ENAME, JOB, SAL) 
    VALUES (1000,'APPLE','POLICE',10000);
INSERT INTO SAM01 VALUES (1010,'BANANA','NURSE',15000);
INSERT INTO SAM01 VALUES (1020,'ORANGE','DOCTOR',25000);
INSERT INTO SAM01 (EMPNO, ENAME, SAL) VALUES (1030,'VERY',25000);
INSERT INTO SAM01 VALUES (1040,'CAT',NULL, 2000);
INSERT INTO SAM01 SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO=10;

-- 2. UPDATE 테이블명 SET 필드명1=값1 [,필드명2=값2,... 필드 N=값N] [WHERE 조건]
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, HIREDATE, SAL, DEPTNO FROM EMP;
    -- EX. 부서번호를 30으로 수정
UPDATE EMP01 SET DEPTNO=30;
SELECT * FROM EMP01;
    -- 모든 직원의 급여를 10%인상
UPDATE EMP01 SET SAL=SAL*1.1;
SELECT * FROM EMP01;
ROLLBACK;
SELECT * FROM EMP01;
    -- EX. 10번 부서 직원의 입사일을 오늘로, 부서번호를 30번으로 수정하시오
UPDATE EMP01 
    SET HIREDATE=SYSDATE, 
        DEPTNO=30
    WHERE DEPTNO=10;
SELECT * FROM EMP01;
    -- EX. SAL이 3000인 사원만 급여를 10% 인상시키시오
UPDATE EMP01
    SET SAL=SAL*1.1
    WHERE SAL >= 3000;
SELECT * FROM EMP01;
    -- EX. DALLAS에 근무하는 직원의 급여를 1000$ 인상시키시오
UPDATE EMP01
    SET SAL=SAL+1000
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
SELECT * FROM EMP01;
    -- EX. SCOTT의 부서번호는 30으로 SAL과 COMM은 500$씩 인상, 상사를 'KING'으로 수정
COMMIT;
UPDATE EMP SET DEPTNO=30,
               SAL = SAL + 500,
               COMM = NVL(COMM,0) + 500,
               JOB = 'MANAGER',
               MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')
            WHERE ENAME = 'SCOTT';
SELECT * FROM EMP WHERE ENAME = 'SCOTT';
ROLLBACK;
 -- DEPT01에서 60번 부서의 지역명을 20번 부서 지역 명으로 변경
SELECT * FROM DEPT01;
UPDATE DEPT01 SET LOC = (SELECT LOC FROM DEPT01 WHERE DEPTNO=20)
    WHERE DEPTNO=60;
SELECT * FROM DEPT01;
    -- EMP01에서 모든 사원의 급여와 입사일을 'KING'의 급여와 입사일로 수정
UPDATE EMP01 SET SAL=(SELECT SAL FROM EMP01 WHERE ENAME='KING'),
                 HIREDATE=(SELECT HIREDATE FROM EMP01 WHERE ENAME='KING');
SELECT * FROM EMP01;
ROLLBACK;

-- 3. DELETE FROM 테이블 명 [WHERE 조건]
SELECT * FROM EMP01;
DELETE FROM EMP01;
SELECT * FROM EMP01; -- DML 명령어는 취소가능 단, DDL은 불가
ROLLBACK;
SELECT * FROM EMP01;
SELECT * FROM DEPT01;

-- DELETE시 다른 테이블에서 참조하는 데이터는 삭제 불가
DROP TABLE EMP01;
DROP TABLE DEPT01;
CREATE TABLE DEPT01 (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13),
    PRIMARY KEY(DEPTNO)
);

CREATE TABLE EMP01 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO) --FK
);
-- 외래키를 연결할 경우 : 참조테이블에 데이터를 먼저 INSERT
INSERT INTO DEPT01 VALUES (10, '신림', 'IT');
INSERT INTO EMP01 VALUES (1000, '홍', 9000, 10);
DELETE FROM DEPT01; -- 참조 데이터가 있을 경우 삭제X

SELECT * FROM EMP01;
INSERT INTO EMP01 SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO=10;
    -- 'MILLER' 사원을 퇴사
DELETE FROM EMP01 WHERE ENAME='MILLER';
    -- 10번 부서 직원 삭제
DELETE FROM EMP01 WHERE DEPTNO=10;
    -- 서브쿼리를 내포한 DELETE문 예제: 부서명이 SALES인 사원을 삭제
DELETE FROM EMP01
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
ROLLBACK;
    -- SAM01 : JOB이 정해지지 않은 사원을 삭제
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;
    -- SAM01 : ENAME이 ORANGE인 사원 삭제
DELETE FROM SAM01 WHERE ENAME='ORANGE';
SELECT * FROM SAM01;

--  DDL 연습문제 page3
-- 1. EMP 테이블과 같은 구조와 같은 내용의 테이블 EMP01을 생성(테이블이 있을시 제거한 후)하고, 모든 사원의 부서번호를 30번으로 수정합니다.
SELECT * FROM EMP01;
DROP TABLE EMP01;
CREATE TABLE EMP01
    AS
    SELECT * FROM EMP;
SELECT * FROM EMP01;
UPDATE EMP01 SET DEPTNO=30;
-- 2. EMP01테이블의 모든 사원의 급여를 10% 인상시키는 UPDATE문을 작성
UPDATE EMP01 SET SAL=SAL*1.1;
SELECT * FROM EMP01;
-- 3. 급여가 3000이상인 사원만 급여를 10%인상
UPDATE EMP01 SET SAL=SAL*1.1 WHERE SAL >= 3000;
-- 4. EMP01테이블에서 ‘DALLAS’에서 근무하는 직원들의 연봉을 1000인상
UPDATE EMP01 SET SAL=SAL+1000 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
SELECT * FROM EMP01;
-- 5. SCOTT사원의 부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정
UPDATE EMP01 SET DEPTNO=20, 
                 JOB='MANAGER'
             WHERE ENAME='SCOTT';
SELECT * FROM EMP01;
-- 6. 부서명이 SALES인 사원을 모두 삭제하는 SQL작성
DELETE FROM EMP01
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');
SELECT * FROM EMP01;
ROLLBACK;
-- 7. 사원명이 ‘FORD’인 사원을 삭제하는 SQL 작성
DELETE FROM EMP01
    WHERE ENAME='FORD';
SELECT * FROM EMP01;
-- 8. SAM01 테이블에서 JOB이 NULL인 사원을 삭제하시오
SELECT * FROM SAM01;
DELETE FROM SAM01 WHERE JOB IS NULL;
-- 9. SAM01테이블에서 ENAME이 ORANGE인 사원을 삭제하시오 
DELETE FROM SAM01 WHERE ENAME='ORANGE';
-- 10. 급여가 1500이하인 사람의 급여를 1500으로 수정
UPDATE EMP01 SET SAL=1500 WHERE SAL <= 1500;
SELECT * FROM EMP;
-- 11. JOB이 ‘MANAGER’인 사원의 급여를 10%인하하시오
UPDATE EMP01 SET SAL=SAL*0.9 WHERE JOB='MANAGER';
SELECT * FROM EMP;

-- ◆ DDL 연습문제 page2

-- 1. 아래의 구조를 만족하는 MY_DATA 테이블을 생성하시오. 단 ID가 PRIMARY KEY이다
CREATE TABLE MY_DATA(
    ID NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10),
    USERID VARCHAR2(30),
    SAL NUMBER(10,2)
);
SELECT * FROM MY_DATA;
-- 2. 생성된 테이블에 위의 도표와 같은 값을 입력하는 SQL문을 작성하시오.
INSERT INTO MY_DATA VALUES (1,'SCOTT','SSCOTT',1000000);
INSERT INTO MY_DATA VALUES (2,'FORD','FFORD',1300000);
INSERT INTO MY_DATA VALUES (3,'PATEL','PPATEL',3300000);
INSERT INTO MY_DATA VALUES (4,'REPORT','RREPORT',2350000);
INSERT INTO MY_DATA VALUES (5,'GOOD','GGOOD',4445000);
-- 3. TO_CHAR 내장 함수를 이용하여 입력한 자료를 위의 도표와 같은 형식으로 출력하는 SQL문을 작성하시오.
SELECT ID, ENAME, USERID, TO_CHAR(SAL, '9,999,999.99') FROM MY_DATA;
-- 4. 자료를 영구적으로 데이터베이스에 등록하는 명령어를 작성하시오.
COMMIT;
-- 5. ID가 3번인 사람의 급여를 65000.00으로 갱신하고 영구적으로 데이터베이스에 반영하라.
UPDATE MY_DATA SET SAL=6500000 WHERE ID=(SELECT ID FROM MY_DATA WHERE ID=3);
SELECT * FROM MY_DATA;
COMMIT;
-- 6. NAME이 Ford인 사람을 삭제하고 영구적으로 데이터베이스에 반영하라.
DELETE FROM MY_DATA WHERE ENAME='FORD';
SELECT * FROM MY_DATA;
COMMIT;
-- 7. SALARY가 15,000.00 이하인 사람의 급여를 15,000.00으로 변경하라
UPDATE MY_DATA SET SAL=1500000 WHERE SAL <= 1500000;
SELECT * FROM MY_DATA;
-- 8. 위에서 생성한 테이블을 삭제하라.
DROP TABLE MY_DATA;
SELECT * FROM MY_DATA;


-- 제약조검
    -- (1) PRIMARY KEY : 테이블의 각 행을 유일한 값으로 식별하기 위한 필드
    -- (2) FOREIGN KEY : 테이블의 열이 다른 테이블의 열을 참조
    -- (3) NOT NULL : NULL을 미포함
    -- (4) UNIQUE : 모든 행의 값이 유일. NULL 값은 허용(NULL은 여러개 입력 가능)
    -- (5) CHECK(조건) : 해당 조건이 만족 (NULL값 허용)
    -- DEFAULT 기본값 : 기본값 설정 (INSERT 시 해당 열을 입력하지 않으면 NULL이 아닌 기본값으로 출력
    
    
    
-- 설계된 DEPT1 & EMP1 테이블
DROP TABLE EMP1;
DROP TABLE DEPT1;

CREATE TABLE DEPT1 (
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14) NOT NULL UNIQUE,
    LOC VARCHAR2(13) NOT NULL
);
CREATE TABLE EMP1 (
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) NOT NULL,
    MGR NUMBER(4),
    HIREDATE DATE DEFAULT SYSDATE,
    SAL NUMBER(7,2) CHECK (SAL>0),
    COMM NUMBER(7,2) CHECK (COMM>0),
    DEPTNO NUMBER(2),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT1(DEPTNO)
);
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1001, 'HONG', 'MANAGER', 10); -- ERROR (10번 부서 참조 오류)
INSERT INTO DEPT1 SELECT * FROM DEPT;
SELECT * FROM DEPT;
SELECT * FROM EMP1;
INSERT INTO EMP1 (DEPTNO, LOC, DNAME)
    VALUES (40, '신림', 'IT'); -- PK 오류
INSERT INTO DEPT1 VALUES (50, 'SALES', '신림'); -- UNIQ 오류
INSERT INTO DEPT1 VALUES (50, 'IT', NULL); -- NN 오류
INSERT INTO DEPT1 (DEPTNO, DNAME) VALUES (50, 'IT'); -- NULL IS EMPTY, NN 오류
SELECT * FROM EMP1;
INSERT INTO EMP1 (EMPNO, ENAME, JOB, DEPTNO)
    VALUES (1001, 'HONG', 'MANAGER', 10);
INSERT INTO EMP1 (EMPNO, JOB, DEPTNO)
    VALUES (1002, 'MANAGER', 10);
INSERT INTO EMP1 (EMPNO, ENAME, JOB,SAL,COMM, DEPTNO)
    VALUES (1002, 'LEE', 'MANAGER', 0, NULL, 20);
INSERT INTO EMP1 (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
    VALUES (1003, 'PARK', 'MANAGER', '24/01/01', 1000, 20);
SELECT * FROM EMP1;

-- DCL --

CREATE USER scott2 IDENTIFIED BY tiger;
GRANT CREATE SESSION TO scott2;
GRANT CREATE TABLE TO scott2;
GRANT ALL ON EMP TO scott2;
REVOKE ALL ON EMP FROM scott2;
DROP USER scott2 CASCADE;


DROP TABLE BOOK;
DROP TABLE BOOKCATEGORY;
SELECT * FROM TAB;


CREATE TABLE BOOKCATEGORY(
    cCODE NUMBER(3) PRIMARY KEY,
    cNAME VARCHAR2(100) UNIQUE,
    OFFICE_LOC VARCHAR2(100)
);
CREATE TABLE BOOK(
    cCODE NUMBER(3),
    bNO VARCHAR2(20),
    bNAME VARCHAR2(60) NOT NULL,
    PUBLISHER VARCHAR(50),
    PUBYEAR NUMBER(4) DEFAULT TO_CHAR(SYSDATE, 'YYYY'),
    FOREIGN KEY(cCODE) REFERENCES BOOKCATEGORY(cCODE),
    PRIMARY KEY(bNO)
);

-- 데이터 INSERT
INSERT INTO BOOKCATEGORY (cCODE, cNAME, OFFICE_LOC)
    VALUES(100, '철학', '3층 문학실');
INSERT INTO BOOKCATEGORY VALUES(400, 'IT', '4층 과학실');
INSERT INTO BOOK (cCODE, BNO, BNAME, PUBLISHER)
    VALUES(100, '100A01', '철학자의 삶', 'MBC출판');
INSERT INTO BOOK VALUES (400, '400A01', '이것이 DB다', '다음출판', '2022');
SELECT * FROM BOOK;

-- 데이터 출력
SELECT BNO, BNAME, PUBLISHER, PUBYEAR, CNAME, OFFICE_LOC
    FROM BOOKCATEGORY C, BOOK B
    WHERE C.cCODE=B.cCODE;
    
    
-- PDF 연습문제
DROP TABLE MAJOR;
DROP TABLE STUDENT;
CREATE TABLE MAJOR (
    MAJOR_CODE NUMBER(2) NOT NULL,
    MAJOR_NAME VARCHAR2(50) UNIQUE,
    MAJOR_OFFICE_LOC VARCHAR2(255) NOT NULL
);
CREATE TABLE STUDENT (
    STUDENT_CODE VARCHAR2(10) NOT NULL,
    STUDENT_NAME VARCHAR2(50) NOT NULL,
    SCORE NUMBER CHECK (SCORE BETWEEN 0 AND 100),
    MAJOR_CODE NUMBER(2)
);
INSERT INTO MAJOR (MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC)
    VALUES(1, '컴퓨터 공학', 'A101호');
INSERT INTO MAJOR VALUES (2, '빅데이터', 'A102호');
SELECT * FROM MAJOR;

INSERT INTO STUDENT (STUDENT_CODE, STUDENT_NAME, SCORE, MAJOR_CODE)
    VALUES (101, '홍길동', 99, '1');
INSERT INTO STUDENT VALUES(102, '신길동', 100, '2');
SELECT STUDENT_CODE, STUDENT_NAME, SCORE, M.MAJOR_CODE, MAJOR_NAME, MAJOR_OFFICE_LOC
    FROM MAJOR M, STUDENT S
    WHERE M.MAJOR_CODE=S.MAJOR_CODE;