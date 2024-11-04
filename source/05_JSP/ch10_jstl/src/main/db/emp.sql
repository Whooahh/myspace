-- public ArrayList(Emp) getEmpList()
SELECT * FROM EMP;
-- quiz에 쓸 public ArrayList(Emp) getEmpList(String schName, String schJob)
SELECT * FROM EMP
  WHERE ENAME LIKE '%'||UPPER(TRIM('  s  '))||'%'   
    AND JOB LIKE '%'||TRIM(UPPER(null)) ||'%';