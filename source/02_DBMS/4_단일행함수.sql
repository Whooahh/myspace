    -- 4. 단일행 함수
        -- 1
        
        
        
        
        
        
        -- 1. 숫자 관련 함수
            -- DUAL테이블 : 오라클에서 제공한 1행 1열짜리 DUMMY TABLE
SELECT * FROM DUAL;
DESC DUAL;
SELECT FLOOR(34.567) FROM DUAL; -- 소수점에서 내림
SELECT FLOOR(34.567*10)/10 FROM DUAL; -- 345/10 => 34.5
SELECT TRUNC(34.567, -1) FROM DUAL;
    -- EX. EMP테이블에서 이름, 급여(십의 자리에서 내림)
SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.567) FROM DUAL; -- 소수점에서 올림

SELECT ROUND(34.567) FROM DUAL; -- 소수점에서 반올림
SELECT ROUND(34.567, 2) FROM DUAL; -- 소수점 두자리에서 반올림
SELECT ROUND(34.567, -1) FROM DUAL; -- 일의 자리에서 반올림

SELECT MOD(9,2) FROM DUAL;
    -- 홀수년도에 입사한 모든 사원의 모든 정보 출력
SELECT  * FROM EMP WHERE MOD (TO_CHAR(HIREDATE, 'RR'), 2)=1;