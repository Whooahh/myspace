-- 모든 getEmpList
SELECT * FROM EMP;
-- quiz에 쓸 Query getEmpList(String schName, schJob);
SELECT * FROM EMP
    WHERE ENAME LIKE '%'||UPPER(TRIM('S '))||'%' AND
        JOB LIKE '%'|| TRIM(UPPER(NULL)) || '%';