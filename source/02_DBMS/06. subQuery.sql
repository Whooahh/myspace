-- [VI] Sub Query: 메인 Query(SQL문) 안에 내포된 QUERY
-- 1. 서브쿼리 개념과 종류
SELECT MAX(SAL) FROM EMP;
SELECT * FROM EMP WHERE SAL=(SELECT MAX(SAL) FROM EMP); -- VI. 서브쿼리
-- (1) 서브쿼리 종류(1) 단일행 서브쿼리 : 서브쿼리 결과가 단일행 : =, >,>=,<,<=,!=
    --EX. SCOTT과 동일한 부서번호에서 근무하는 사원의 이름과 급여
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT';
SELECT ENAME, SAL FROM EMP WHERE DEPTNO=20;
SELECT ENAME, SAL FROM EMP WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
-- (2) 서브쿼리 종류 (2) 다중행 서브쿼리 : 서브쿼리 결과가 2행이상 : IN, ANY(SOME),EXISTS
    -- EX. SCOTT이나 KING이 동일한 부서번호에서 근무하는 사원의 정보
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT' OR ENAME='KING';
SELECT DEPTNO FROM EMP WHERE ENAME IN ('SCOTT','KING'); -- 서브쿼리가 될 SQL문
SELECT * FROM EMP WHERE DEPTNO IN(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT' OR ENAME='KING');
-- 2. 단일행 서브쿼리  
    -- EX. SCOTT과 동일한 근무지에서 근무하는 사원의 정보
SELECT LOC FROM DEPT D, EMP E WHERE D.DEPTNO=E.DEPTNO AND ENAME='SCOTT';
    -- DEPT에 50번 부서(DALLAS) INSERT, EMP에 50번 근무 직원 INSERT
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
SELECT * FROM DEPT;
ROLLBACK;
    -- EX2. 최초입사일과 최초입사한 사람의 정보
SELECT MIN(HIREDATE) FROM EMP; -- 단일행 서브쿼리
SELECT * FROM EMP WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP); -- 메인쿼리
    -- EX3. 최근 입사일과 최근 입사한 사원의 정보
SELECT HIREDATE, ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
    -- EX4. 최초입사일, 최초입사자이름, 최근 입사일, 최근 입사자 이름
SELECT E1.HIREDATE, E1.ENAME, E2.HIREDATE, E2.ENAME FROM EMP E1, EMP E2 WHERE E1.HIREDATE = (SELECT MIN(HIREDATE) FROM EMP) OR E2.HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
SELECT 
    (SELECT MIN(HIREDATE) FROM EMP) FIRSTDAY,
    (SELECT ENAME FROM EMP WHERE HIREDATE=(SELECT MIN(HIREDATE) FROM EMP)) FIRSTMAN, 
    (SELECT MAX(HIREDATE) FROM EMP) LASTDAY, 
    (SELECT ENAME FROM EMP WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP)) LASTMAN FROM DUAL; 
    -- EX5.SCOTT과 같은 부서에 근무하는 사람들의 급여함
SELECT SUM(SAL) FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
    -- EX6. DALLAS에 근무하는 사원의 이름과 사원번호(서브쿼리, JOIN)
SELECT ENAME, DEPTNO FROM EMP
    WHERE DEPTNO=(SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS');
SELECT ENAME, E.DEPTNO FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND LOC='DALLAS';
    -- EX7. 'KING'이 직속상사인 사원의 이름과 급여(SUBQUERY, JOIN)
SELECT ENAME, SAL FROM EMP
    WHERE MGR=(SELECT EMPNO FROM EMP WHERE ENAME='KING');
SELECT W.ENAME, W.SAL FROM EMP W, EMP M WHERE W.MGR=M.EMPNO AND M.ENAME='KING';
    -- EX8. 평균급여 이하로 받는 사원의 이름, 급여를 출력
SELECT AVG(SAL) FROM EMP;
SELECT ENAME, SAL FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
    -- EX9. 평균급여 이하로 받는 사원의 이름, 급여,평균을 출력
SELECT ENAME, SAL, ROUND((SELECT AVG(SAL) FROM EMP)) FROM EMP
    WHERE SAL<=(SELECT AVG(SAL) FROM EMP);
    -- EX10. 사원이름, 급여, 평균급여의 차이
SELECT ENAME, SAL, (SELECT AVG(SAL) FROM EMP) -SAL "DIFF" FROM EMP;
    -- 단일행 다중열 서브쿼리
    -- EX. SCOTT과 JOB도 같고, 부서번호도 같은 직원의 모든 필드 출력
SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT'; -- 서브쿼리
SELECT * FROM EMP WHERE (JOB, DEPTNO) = (SELECT JOB, DEPTNO FROM EMP WHERE ENAME='SCOTT');
-- 3. 다중행 서브쿼리
-- 연습문제

--1. 사원테이블에서 가장 먼저 입사한 사람의 이름, 급여, 입사일
SELECT HIREDATE, ENAME, SAL 
    FROM EMP 
    WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
-- 2. 회사에서 가장 급여가 적은 사람의 이름, 급여
SELECT ENAME, SAL 
    FROM EMP 
    WHERE SAL = (SELECT MIN(SAL) FROM EMP);
-- 3. 회사 평균보다 급여를 많이 받는 사람의 이름, 급여, 부서코드
SELECT ENAME, SAL, DEPTNO 
    FROM EMP 
    WHERE SAL = (SELECT MAX(SAL) FROM EMP);
--4. 회사 평균 이하의 급여를 받는 사람의 이름, 급여, 부서명
SELECT ENAME, SAL, DNAME 
    FROM EMP E, DEPT D 
    WHERE SAL < (SELECT AVG(SAL) FROM EMP);
--5. SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급
SELECT ENAME, SAL, HIREDATE, GRADE 
    FROM EMP, SALGRADE 
    WHERE SAL BETWEEN LOSAL AND HISAL AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT');
--6. 5번(SCOTT보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급)에 부서명 추가하고 급여가 큰 순 정렬 
SELECT ENAME, JOB, SAL, HIREDATE, GRADE 
    FROM EMP E , DEPT D , SALGRADE
    WHERE SAL BETWEEN LOSAL AND HISAL AND HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME='SCOTT')ORDER BY SAL DESC;
--7. BLAKE 보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL>=(SELECT MAX(SAL) FROM EMP WHERE ENAME='BLAKE');
--8. MILLER보다 늦게 입사한 사원의 사번, 이름, 입사일
SELECT EMPNO, ENAME, HIREDATE 
    FROM EMP 
    WHERE HIREDATE>=(SELECT MAX(HIREDATE) FROM EMP WHERE ENAME='MILLER');
--9. 사원전체 평균 급여보다 급여가 많은 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP);
--10. CLARK와 같은 부서번호이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여
SELECT * FROM EMP;
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME ='CLARK') AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698);
--11. CLARK와 같은 부서명이며, 사번이 7698인 직원의 급여보다 많은 급여를 받는 사원들의 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO AND SAL > (SELECT SAL FROM EMP WHERE EMPNO=7698) 
    AND DNAME = (SELECT DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME = 'CLARK');
--12. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자
SELECT ENAME, HIREDATE 
    FROM EMP 
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE');
--13. 평균 급여 이상을 받는 모든 종업원에 대해서 사원번호와 이름 (단 급여가 많은 순으로 출력)
SELECT EMPNO, ENAME 
    FROM EMP 
    WHERE SAL>(SELECT  AVG(SAL) FROM EMP) ORDER BY SAL DESC;
--14.  이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 직원의 사원 번호,이름,급여(단 사번 순 출력)
SELECT EMPNO, ENAME, SAL 
    FROM EMP 
    WHERE DEPTNO IN (SELECT E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%I%') ORDER BY EMPNO;
--15. 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여
SELECT ENAME, JOB, SAL 
    FROM EMP 
    WHERE DEPTNO IN (SELECT E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC = 'DALLAS');
--16. EMP 테이블에서 King인 사원의 직속부하의 이름과 급여
SELECT ENAME, SAL 
    FROM EMP 
    WHERE MGR IN (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');
--17. SALES부서 사원의 이름, 업무
SELECT ENAME, JOB 
    FROM EMP 
    WHERE DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
--18. 월급이 부서 30의 최저 월급보다 높은 사원의 모든 필드
SELECT * 
    FROM EMP
    WHERE SAL>ANY (SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);
--19. FORD와 업무도 월급도 같은 사원의 모든 필드
SELECT * 
    FROM EMP 
    WHERE (JOB, SAL) IN (SELECT JOB, SAL FROM EMP WHERE ENAME = 'FORD');
--20. 이름이 JONES인 직원의 JOB과 같거나 FORD의 SAL 이상을 받는 사원의 정보를 이름, 업무, 부서번호, 급여 -- 단, 업무별 알파벳 순, 월급이 많은 순으로 출력
SELECT ENAME, JOB, DEPTNO, SAL 
    FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP WHERE ENAME='JAMES') OR SAL IN (SELECT SAL FROM EMP WHERE ENAME='FORD') ORDER BY SAL DESC;
--21. SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여
SELECT ENAME, JOB, SAL 
    FROM EMP 
    WHERE SAL IN (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT' OR ENAME = 'WARD');
--22. CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원들의 이름,업무
SELECT ENAME, JOB 
    FROM EMP 
    WHERE JOB IN (SELECT JOB FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO');
--23. 부서별 평균 월급보다 높은 사원을 사번, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP E 
    WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE JOB=E.JOB);
--24. 업무별 평균 월급보다 적은 월급을 받는 사원을 부서번호, 이름, 급여
SELECT EMPNO, ENAME, SAL 
    FROM EMP E 
    WHERE SAL < ALL(SELECT AVG(SAL) FROM EMP GROUP BY JOB);
--25. 적어도 한 명 이상으로부터 보고를 받을 수 있는 사원을 업무, 이름, 사번, 부서번호를 출력(단, 부서번호 순 으로 오름차순 정렬)
SELECT JOB, ENAME, EMPNO, DEPTNO 
    FROM EMP 
    WHERE EMPNO IN (SELECT DISTINCT MGR FROM EMP);
--26.  말단 사원의 사번, 이름, 업무, 부서번호
SELECT EMPNO, ENAME, JOB, DEPTNO 
    FROM EMP 
    WHERE EMPNO NOT IN(SELECT DISTINCT MGR FROM EMP WHERE MGR IS NOT NULL);