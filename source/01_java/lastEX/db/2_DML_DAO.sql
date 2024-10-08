-- DAO에 쓸 쿼리
-- 1번기능과 2번 기능에서 입력가능한 직업명들 (jnameList

-- 1번 기능 (insertPerson) : PNAME, JNAME, KOR, ENG, MAT를 입력받아 PERSON 테이블 INSERT
INSERT INTO PERSON (pNO, pNAME, jNO, KOR, ENG, MAT) 
    VALUES (PERSON_PNO_SQ.NEXTVAL, '홍길동',
    (SELECT jNO FROM JOB WHERE jNAME='배우'), 90, 95, 99);
    SELECT * FROM PERSON;
-- 2번 기능(getPersonJname : JNAME을 입력받아 RANK, PNAME(PNO), JNAME, KOR, ENG, MAT, SUM을 출력
            -- RANK는 SUM 내림차순으로 순위를 정합니다 (ROWNUM과 INLINE 활용)
SELECT pNAME ||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM PERSON P, JOB J
    WHERE P.jNO=J.jNO
    ORDER BY SUM DESC;
SELECT ROWNUM RANK, A.* FROM (SELECT pNAME ||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM PERSON P, JOB J
    WHERE P.jNO=J.jNO AND jNAME='배우'
    ORDER BY SUM DESC) A;
-- 3번 기능 (getPersonAll) : RANK, PNAME (PNO), JNAME, KOR, ENG, MAT, SUM 출력
SELECT ROWNUM RANK, A.* FROM (SELECT pNAME ||'('||pNO||'번)' pNAME, jNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM
    FROM PERSON P, JOB J
    WHERE P.jNO=J.jNO
    ORDER BY SUM DESC) A;