-- [III] JOIN : 2���̻��� ���̺��� �����Ͽ� �����͸� �˻��ϴ� ���

SELECT * FROM EMP WHERE ENAME='SMITH'; -- 1��
SELECT * FROM DEPT; -- 4��
SELECT * FROM EMP, DEPT WHERE ENAME='SMITH'; -- CROSS JOIN : 4��(1*4)


    -- 1. EQUI JOIN (���� ���� = �����ʵ� ���� ��ġ�Ǵ� ���Ǹ� JOIN)
SELECT * FROM EMP, DEPT WHERE ENAME = 'SMITH' AND EMP.DEPTNO=DEPT.DEPTNO;
SELECT * FROM EMP, DEPT WHERE EMP.DEPTNO=DEPT.DEPTNO;
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
    -- EX. ��� ����� ���, �̸�, ��å, �����, �μ���ȣ, �μ��̸�, �ٹ���
SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
    -- EX. �޿��� 2000�̻��� ������ ���� �̸�, ��å, �޿�, �μ���, �ٹ���
SELECT ENAME, JOB, SAL, DNAME,LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000;
    -- EX. 20�� �μ� ������ �̸�, �μ���ȣ, �ٹ���
SELECT ENAME, D.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=20;
    -- EX. LOC�� CHICAGO�� ����� �̸�, ����, �޿�, �μ���ȣ
SELECT ENAME, JOB, SAL, E.DEPTNO FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='CHICAGO';
    -- EX. 82�⵵�� �Ի��� 10��, 20�� �μ� ������ �̸�, �޿�, �ٹ��� ��� (�޿� ������)
SELECT ENAME, SAL, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND HIREDATE BETWEEN '82/01/01' AND '82/12/31' AND E.DEPTNO IN (10,20) ORDER BY SAL;
SELECT ENAME, SAL, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND HIREDATE LIKE '82/__/__' AND E.DEPTNO IN (10,20) ORDER BY SAL;
    -- źź EX1. NEW WORK���� �ٹ��ϴ� ����� �̸��� �޿��� ���
SELECT ENAME, SAL FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK';
    -- źź EX2. ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի��� ���
SELECT ENAME, HIREDATE FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND DNAME='ACCOUNTING';
    -- źź EX3. ������ MANAGER�� ����� �̸�, �μ��� ���
SELECT ENAME, DNAME FROM EMP E, DEPT D WHERE JOB='MANAGER';
    -- źź EX4. COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �μ���ȣ, �ٹ��� ���
SELECT ENAME, SAL, E.DEPTNO, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
    -- EX. COMM�� NULL�̰� SAL�� 1200�̻��� ����� �̸�, �޿�, �μ���ȣ, �μ��� --(�μ��� ��, �޿�ū �� ����)
SELECT ENAME, SAL, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NULL AND SAL>=1200 ORDER BY DNAME, SAL DESC;

-- 2. NON EQUI JOIN
SELECT * FROM EMP WHERE ENAME='SCOTT'; -- 1�� (��������)
SELECT * FROM SALGRADE; -- 5�� (�޿� ��� ����)
SELECT * FROM EMP, SALGRADE WHERE ENAME='SCOTT'; -- CROSS JOIN
SELECT * FROM EMP, SALGRADE WHERE ENAME='SCOTT' AND SAL BETWEEN LOSAL AND HISAL;
SELECT * FROM EMP, SALGRADE WHERE ENAME='SCOTT' AND SAL>=LOSAL AND SAL<=HISAL;
    --EX. ��� ����� ���, �̸�, �����, �޿�, �޿���� (1���, 2��� ,,,,)
SELECT EMPNO, ENAME, MGR, SAL, GRADE||'���'GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL;
    -- źź EX1. COMM�� NULL�� �ƴ� ����� �̸�, �޿�, �޿����, �μ���ȣ, �μ��̸�, �ٹ��� ���
SELECT ENAME, SAL, GRADE, E.DEPTNO, DNAME, LOC FROM EMP E, DEPT D, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
    -- źź EX2. �̸�, �޿�, �Ի���, �޿����(���Լ�)
SELECT ENAME, SAL, HIREDATE, GRADE FROM EMP, SALGRADE WHERE SAL BETWEEN LOSAL AND HISAL ORDER BY HIREDATE DESC;
    -- źź EX3. �̸�, �޿�, �޿����, ����(SAL+COMM)*12 �μ���(�μ��� ����, ������ ������ ����)
SELECT ENAME, SAL, GRADE, (SAL+NVL(COMM, 0))*12 "ANNUALSAL", DNAME FROM EMP E, SALGRADE, DEPT D WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO=D.DEPTNO ORDER BY DNAME, ANNUALSAL DESC; 
    -- źź EX4. �̸�, ��å, �޿�, ���, �μ���ȣ, �μ���(�޿��� 1000~3000����, ���� ���� = �μ���ȣ��, ��å��, �޿�ū��)
SELECT ENAME, JOB, SAL, GRADE, E.DEPTNO, DNAME FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND SAL BETWEEN 1000 AND 3000 ORDER BY DEPTNO, JOB, SAL DESC;
    -- źź EX5. �̸�, �޿�, ���, �Ի���, �ٹ���(81�⵵ �Ի��� ������ ��� ū ������ ���)
SELECT ENAME, SAL, GRADE, HIREDATE, LOC FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO AND SAL BETWEEN LOSAL AND HISAL AND HIREDATE LIKE '81%' ORDER BY GRADE DESC;
 
    -- �� <�� ��������> Part 1
    --1. ��� ����� ���� �̸�, �μ���ȣ, �μ����� ����ϴ� SELECT ������ �ۼ��Ͽ���.
SELECT ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;
    --2. NEW YORK���� �ٹ��ϰ� �ִ� ����� ���Ͽ� �̸�, ����, �޿�, �μ����� ���
SELECT ENAME, JOB, SAL, DNAME FROM EMP E, DEPT D WHERE LOC='NEW YORK';
    --3. ���ʽ��� �޴� ����� ���Ͽ� �̸�,�μ���,��ġ�� ���
SELECT ENAME, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL;
    --4. �̸� �� L�ڰ� �ִ� ����� ���Ͽ� �̸�,����,�μ���,��ġ�� ���
SELECT ENAME, JOB, DNAME, LOC FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND ENAME LIKE '%L%';
    --5. ���, �����, �μ��ڵ�, �μ����� �˻��϶�(��, ������������ �������� ����)
SELECT EMPNO, ENAME, E.DEPTNO, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO ORDER BY ENAME ASC;
    --6. ���, �����, �޿�, �μ����� �˻��϶�. 
        --�� �޿��� 2000�̻��� ����� ���Ͽ� �޿��� �������� ������������ �����Ͻÿ�
SELECT EMPNO, ENAME, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND SAL>=2000 ORDER BY SAL ASC;
    --7. ���, �����, ����, �޿�, �μ����� �˻��Ͻÿ�. �� ������ MANAGER�̸� �޿��� 2500�̻��� ����� ���Ͽ� ����� �������� ������������ �����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL, DNAME FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO AND JOB='MANAGER' AND SAL>=2500 ORDER BY EMPNO DESC;
    --8. ���, �����, ����, �޿�, ����� �˻��Ͻÿ�(��, �޿����� ������������ ����)
SELECT EMPNO, ENAME, JOB, SAL, GRADE FROM EMP E, DEPT D, SALGRADE WHERE E.DEPTNO=D.DEPTNO ORDER BY SAL DESC;

    -- 3. SELF JOIN
SELECT EMPNO, ENAME, MGR FROM EMP WHERE ENAME='SMITH';
SELECT W.EMPNO, W.ENAME, W.MGR, M.EMPNO, M.ENAME,M.MGR FROM EMP W, EMP M WHERE W.ENAME='SMITH' AND W.MGR=M.EMPNO;
    -- EX. ��� ����� ���, �̸�, �����, ����̸�
SELECT W.EMPNO, W.ENAME, W.MGR, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO; --13��(KING�� MGR�� NULL�̶� EMPNO�� NULL�� ����)
DESC EMP;
    -- EX. �̸�, ����̸�
SELECT W.ENAME, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;
    -- EX. SMITH�� ���� FORD
SELECT W.ENAME || '�� ����' || M.ENAME "MSG" FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;    
    -- źź �� �غ��۾�(20�μ� : DALLAS)
INSERT INTO DEPT VALUES (50, 'IT', 'DALLAS');
INSERT INTO EMP VALUES (9999, 'ȫ�浿', NULL, NULL, NULL, 3000, NULL, 50);
SELECT * FROM DEPT;
SELECT * FROM EMP;
    -- źź EX1. �Ŵ����� KING�� ������� �̸��� ���� ���
SELECT W.ENAME, W.JOB FROM EMP W, EMP M WHERE W.MGR=M.EMPNO AND M.ENAME ='KING';
    -- źź EX2. SCOTT�� ������ �μ���ȣ���� �ٹ��ϴ� ����� �̸� ���
SELECT E1.ENAME, E1.DEPTNO, E2.ENAME, E2.DEPTNO FROM EMP E1, EMP E2 WHERE E1.ENAME='SCOTT' AND E1.DEPTNO=E2.DEPTNO;
    -- ���� ����
 SELECT E2.ENAME FROM EMP E1, EMP E2 WHERE E1.ENAME='SCOTT' AND E1.DEPTNO=E2.DEPTNO;
    -- źź EX3.SCOTT�� ������ �������� �ٹ��ϴ� ����� �̸� ���
SELECT E1.ENAME, D1.LOC, E2.ENAME, D2.LOC FROM EMP E1, DEPT D1, EMP E2, DEPT D2 WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT' AND E2.DEPTNO=D2.DEPTNO AND D1.LOC=D2.LOC AND E2.ENAME!='SCOTT';
    -- ���� ����
SELECT E2.ENAME FROM EMP E1, DEPT D1, EMP E2, DEPT D2 WHERE E1.DEPTNO=D1.DEPTNO AND E1.ENAME='SCOTT' AND E2.DEPTNO=D2.DEPTNO AND D1.LOC=D2.LOC AND E2.ENAME!='SCOTT';
    -- DML(������ ���۾� : INSERT, DELETE, UPDATE, SELECT)���� ���� ��� : ROLLBACK
    ROLLBACK;
    SELECT * FROM EMP;
    SELECT * FROM DEPT;    
    -- 4. OUTER JOIN : JOIN�� ���ǿ� �������� �ʴ� ����� ��� (������ ������ �ʿ� + ��ȣ)
    -- (1) SELF JOIN������ OUTER JOIN
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
    -- SMITH�� ���� FORD��(��簡 ���� ������ KING�� ���� ���ٰ� ���)
SELECT W.ENAME || '�� ����' || NVL(M.ENAME, '��') || '��' "MESSAGE" FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
SELECT W.ENAME, W.MGR, M.EMPNO, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
    -- ���� ���
SELECT M.EMPNO, M.ENAME FROM EMP W, EMP M WHERE W.MGR(+)=M.EMPNO AND W.ENAME IS NULL;
    -- (2) EQUI JOIN������ OUTER JOIN
SELECT * FROM EMP E, DEPT D WHERE E.DEPTNO=D.DEPTNO;

    -- 2. ���� ����
        --1. �̸�, ���ӻ���
SELECT W.ENAME, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;
        --2. �̸�, �޿�, ����, ���ӻ���
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO;
        --3. �̸�, �޿�, ����, ���ӻ��� . (��簡 ���� �������� ��ü ���� �� ���. ��簡 ���� �� '����'���� ���)
SELECT W.ENAME, W.SAL, W.JOB, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);    
        --4. �̸�, �޿�, �μ���, ���ӻ���
SELECT W.ENAME, W.SAL, DNAME, M.ENAME FROM EMP W, EMP M, DEPT D WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO;
        --5. ��簡 ���� ������ ��簡 �ִ� ���� ��ο� ���� �̸�, �޿�, �μ��ڵ�, �μ���, �ٹ���, ���ӻ����� ����Ͻÿ�(��, ���ӻ�簡 ���� ��� ���ӻ����� ������������ ��� ����Ͻÿ�)
SELECT W.ENAME, W.SAL, W.DEPTNO, LOC, M.ENAME FROM EMP W, EMP M, DEPT D WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO;
        --6. �̸�, �޿�, ���, �μ���, ���ӻ���. �޿��� 2000�̻��� ���
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME FROM EMP W, EMP M, DEPT D, SALGRADE WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO AND W.SAL>=2000;
        --7. �̸�, �޿�, ���, �μ���, ���ӻ���, (���ӻ�簡 ���� �������� ��ü���� �μ��� �� ����)
SELECT W.ENAME, W.SAL, GRADE, DNAME, M.ENAME FROM EMP W, EMP M, DEPT D, SALGRADE WHERE W.MGR=M.EMPNO(+) AND W.DEPTNO=D.DEPTNO;
        --8. �̸�, �޿�, ���, �μ���, ����, ���ӻ���. ����=(�޿�+comm)*12���� ���
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM, 0))*12 "ANNUALSAL", M.ENAME FROM EMP W, EMP M, DEPT D, SALGRADE WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL;
SELECT * FROM SALGRADE;
        --9. 8���� �μ��� �� �μ��� ������ �޿��� ū �� ����
SELECT W.ENAME, W.SAL, GRADE, DNAME, (W.SAL+NVL(W.COMM, 0))*12 "ANNUALSAL", M.ENAME FROM EMP W, EMP M, DEPT D, SALGRADE WHERE W.MGR=M.EMPNO AND W.DEPTNO=D.DEPTNO AND W.SAL BETWEEN LOSAL AND HISAL ORDER BY W.SAL DESC;
        --10. ������̺��� �����, ����� ��縦 �˻��Ͻÿ�(��簡 ���� �������� ��ü).
SELECT W.ENAME, M.ENAME FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
        --11. �����, ����, ����� ������ �˻��Ͻÿ�(self join)
SELECT W.ENAME, W.MGR, M.ENAME,M.MGR FROM EMP W, EMP M, EMP MM WHERE W.MGR=M.EMPNO AND M.MGR=MM.EMPNO;
        --12. ���� ������� ���� ��簡 ���� ��� ������ �̸��� ��µǵ��� �����Ͻÿ�(outer join)
SELECT W.ENAME, W.MGR, M.ENAME,M.MGR FROM EMP W, EMP M, EMP MM WHERE W.MGR=M.EMPNO(+) AND M.MGR=MM.EMPNO(+);


    