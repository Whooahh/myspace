-- [II] SELECT문 - 조회

-- 1. SELECT 문장 작성법

SHOW USER;
SELECT * FROM TAB; -- 현 계정이 갖고 있는 테이블 목록들 출력
SELECT * FROM EMP; -- EMP 테이블의 모든 열(필드), 모든 행 출력
SELECT * FROM DEPT; -- EMP 테이블의 모든 열(필드), 모든 행 출력
SELECT * FROM SALGRADE; -- 날짜 표기법 셋팅 (YY/MM/DD RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';




-- 2. 특정 열만 출력
DESC EMP;
    -- EMP 테이블 구조
SELECT  EMPNO, ENAME, SAL, JOB FROM EMP; -- EMP테이블의 EMPNO, ENAME, SAL, JOB 필드만 모든 행 
SELECT  EMPNO, ENAME, COMM FROM EMP; -- EMP테이블의 EMPNO, ENAME, JOB 필드만 모든 행 
SELECT EMPNO AS "사 번", ENAME AS "이름", SAL AS "급여" FROM EMP; -- 필드명에 별칭 사용
SELECT EMPNO "사 번", ENAME "이름", SAL "급여" FROM EMP; --별칭에 AS 생략가능
SELECT EMPNO "사 번", ENAME 이름, SAL 급여 FROM EMP; -- 별칭에 SPACE가 없는 경우 "" 생략가능


-- 3. 특정 행을 출력 : WHERE 절 (조건절) -- 비교연산자 : 같다(=), 다르다(!=, ^=, <>), < <= > >=
SELECT EMPNO 사번, ENAME 이름, SAL 급여 FROM EMP WHERE SAL=3000;
SELECT * FROM EMP WHERE SAL<>3000;
SELECT * FROM EMP WHERE SAL!=3000;
SELECT * FROM EMP WHERE SAL^=3000;
    -- 비교연산자는 숫자, 문자, 날짜형 모두 가능
    -- 'A' < 'AA' < 'AAA' < 'AAAA' < 'AAAB' < 'B'
    -- EX1. 사원 이름이 'A', 'B', 'C'로 시작하는 사원의 모든 필드
    SELECT * FROM EMP WHERE ENAME < 'D';
    -- EX2. 81년도 이전에 입사한 사원의 모든 필드
