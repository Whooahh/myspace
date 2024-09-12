-- [II] SELECT�� - ��ȸ

-- 1. SELECT ���� �ۼ���

SHOW USER;
SELECT * FROM TAB; -- �� ������ ���� �ִ� ���̺� ��ϵ� ���
SELECT * FROM EMP; -- EMP ���̺��� ��� ��(�ʵ�), ��� �� ���
SELECT * FROM DEPT; -- EMP ���̺��� ��� ��(�ʵ�), ��� �� ���
SELECT * FROM SALGRADE; -- ��¥ ǥ��� ���� (YY/MM/DD RR/MM/DD)
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';




-- 2. Ư�� ���� ���
DESC EMP;
    -- EMP ���̺� ����
SELECT  EMPNO, ENAME, SAL, JOB FROM EMP; -- EMP���̺��� EMPNO, ENAME, SAL, JOB �ʵ常 ��� �� 
SELECT  EMPNO, ENAME, COMM FROM EMP; -- EMP���̺��� EMPNO, ENAME, JOB �ʵ常 ��� �� 
SELECT EMPNO AS "�� ��", ENAME AS "�̸�", SAL AS "�޿�" FROM EMP; -- �ʵ�� ��Ī ���
SELECT EMPNO "�� ��", ENAME "�̸�", SAL "�޿�" FROM EMP; --��Ī�� AS ��������
SELECT EMPNO "�� ��", ENAME �̸�, SAL �޿� FROM EMP; -- ��Ī�� SPACE�� ���� ��� "" ��������


-- 3. Ư�� ���� ��� : WHERE �� (������) -- �񱳿����� : ����(=), �ٸ���(!=, ^=, <>), < <= > >=
SELECT EMPNO ���, ENAME �̸�, SAL �޿� FROM EMP WHERE SAL=3000;
SELECT * FROM EMP WHERE SAL<>3000;
SELECT * FROM EMP WHERE SAL!=3000;
SELECT * FROM EMP WHERE SAL^=3000;
    -- �񱳿����ڴ� ����, ����, ��¥�� ��� ����
    -- 'A' < 'AA' < 'AAA' < 'AAAA' < 'AAAB' < 'B'
    -- EX1. ��� �̸��� 'A', 'B', 'C'�� �����ϴ� ����� ��� �ʵ�
    SELECT * FROM EMP WHERE ENAME < 'D';
    -- EX2. 81�⵵ ������ �Ի��� ����� ��� �ʵ�
    SELECT * FROM EMP WHERE HIREDATE < '81/01/01';
ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';


-- 4. �������� �������� : AND, OR, NOT
    -- EX1. �޿�(SAL)�� 2000�̻� 3000������ ������ ��� �ʵ�
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;

    -- EX2. 82�⵵�� �Ի��� ����� ��� �ʵ�(82/01/01�̻�, 82/12/31����)
SELECT * FROM EMP WHERE HIREDATE>='82/01/01' AND HIREDATE<= '82/12/31' ;
    -- EX3. ����(SAL*12)�� 2400�̻��� ������ ENAME,SAL ����(ANNUALSAL)�� ���
SELECT ENAME, SAL, SAL*12 "����" -- (3) 
    FROM EMP
    WHERE SAL*12>= 2400 
    ORDER BY "����";
    -- EX4. 10�� �μ�(DEPTNO)�̰ų� JOB�� MANAGER�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO = 10;

    -- EX5. 10�� �μ��� �ƴ� ������ ��� �ʵ�
SELECT * FROM EMP WHERE NOT DEPTNO != 10;

-- 5. ���������(SELECT ��, WHERE��, ORDER BY��)
SELECT EMPNO, ENAME, SAL, SAL*1.1 UPGRADESAL FROM EMP;
    -- EX. ��� ����� ENAME, SAL(�޿�), COMM(��), ����(SAL*12 + COMM)�� ���
SELECT ENAME, SAL, COMM, SAL*12+COMM ���� FROM EMP;
    -- NVL(�� �ϼ��� �ִ� ��, �� �̸� ��ü�� ��)
SELECT ENAME, SAL, COMM, SAL*12+NVL(COMM,0) ANNUALSAL FROM EMP;
    -- MGR�� ���̸� 'CEO'��� ���
SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR), 'CEO') MGR FROM EMP;

-- 6. ���� ������(||)
SELECT ENAME || '��' || JOB "EMPLOYEE" FROM EMP;
    -- EX. ��� ����� ���� 'SMITH : ����=XXX' �������� ��� (���� = SAL*12+COMM)
SELECT ENAME || ' : ���� = ' || (SAL*12+NVL(COMM,0)) "MESSAGE" FROM EMP;

-- 7. �ߺ�����
SELECT DISTINCT DEPTNO FROM EMP;
SELECT DISTINCT JOB FROM EMP;


--1. emp ���̺��� ���� ���
DESC EMP;
--2. emp ���̺��� ��� ������ ��� 
SELECT * FROM EMP;
--3. �� scott �������� ��밡���� ���̺� ���
SELECT * FROM TAB;
--4. emp ���̺��� ���, �̸�, �޿�, ����, �Ի��� ���
SELECT EMPNO, ENAME, SAL, JOB, HIREDATE FROM EMP;
--5. emp ���̺��� �޿��� 2000�̸��� ����� ���, �̸�, �޿� ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <= 2000;
--6. �Ի����� 81/02���Ŀ� �Ի��� ����� ���, �̸�, ����, �Ի��� ���
SELECT EMPNO, ENAME, JOB, HIREDATE FROM EMP WHERE HIREDATE >= '81/02/01';
--7. ������ SALESMAN�� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE JOB = 'SALESMAN';
--8. ������ CLERK�� �ƴ� ����� ��� �ڷ� ���
SELECT * FROM EMP WHERE NOT JOB = 'CLERK';
--9. �޿��� 1500�̻��̰� 3000������ ����� ���, �̸�, �޿� ���
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= 1500 AND  SAL <= 3000;
--10. �μ��ڵ尡 10���̰ų� 30�� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = '10' OR DEPTNO = '30';
--11. ������ SALESMAN�̰ų� �޿��� 3000�̻��� ����� ���, �̸�, ����, �μ��ڵ� ���
SELECT EMPNO, ENAME, JOB, DEPTNO FROM EMP WHERE JOB = 'SALESMAN' OR SAL >= 3000;
--12. �޿��� 2500�̻��̰� ������ MANAGER�� ����� ���, �̸�, ����, �޿� ���
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE SAL >= 2500 AND JOB = 'MANAGER';
--13.��ename�� XXX �����̰� ������ XX�١� ��Ÿ�Ϸ� ��� ���(������ SAL*12+COMM)
SELECT ENAME, JOB || ' : ���� = ' || (SAL*12+NVL(COMM,0)) "MESSAGE" FROM EMP;





-- 8. SQL ������ (BETWEEN, IN, LIKE)
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= 1500 AND SAL<=3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1500 AND 3000;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 3000 AND 1500;
  -- EX. SAL�� 1500�̸�, 3000�ʰ��ϴ� ������ ��� �ʵ�
SELECT * FROM EMP WHERE SAL<1500 OR SAL>3000;
SELECT * FROM EMP WHERE SAL NOT BETWEEN 1500 AND 3000;
    -- EX. 82�⵵�� �Ի��� ������ ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE BETWEEN '82/01/01' AND '82/12/31';


-- (2) IN
    --EX. �μ���ȣ�� 10,20,40�� �μ��� ������ ��� �ʵ�
SELECT * FROM EMP WHERE DEPTNO=10 OR DEPTNO=20 OR DEPTNO=40;
SELECT * FROM EMP WHERE DEPTNO IN (10,20,40);
    -- EX. �μ���ȣ�� 10,20,40���� ������ �μ��� ������ ��� ����
SELECT * FROM EMP WHERE DEPTNO NOT IN(10,20,40);
SELECT * FROM EMP WHERE DEPTNO!=10 AND DEPTNO!=20 AND DEPTNO!=40;
    -- EX. ��å�� MAANGER�̰ų� ANALYST�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE JOB IN ('MANAGER', 'ALALYST');

-- (3) LIKE ���� : %(0���� �̻�), _(1����)�� ������ ����
    --EX. �̸��� M���� �����ϴ� ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE 'M%';
    --EX. �̸��� N�� ���� ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE '%N%';
    --EX. �̸��� N�� ���ų� JOB�� N�� ���� ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE '%N%' OR JOB LIKE '%N%';
    -- EX. �̸��� S�� ������ ����� ��� �ʵ�
SELECT * FROM EMP WHERE ENAME LIKE '%S';
    -- EX. SAL�� 5�� ������ ����� ��� �ʵ�
SELECT * FROM EMP WHERE SAL LIKE '%5';
    -- EX. 82�⵵�� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE LIKE '82/__/__';
    -- EX. 1���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE HIREDATE LIKE '__/01/__';

-- (4) IS NULL
    -- EX. COMM�� NULL�� ����� ��� �ʵ�
SELECT * FROM EMP WHERE COMM IS NULL;
    -- EX. COMM(��)�� ���� ���� ����� ��� �ʵ�
SELECT * FROM EMP WHERE COMM IS NULL OR COMM=0;
    -- EX. COMM�� NULL�� �ƴ� ���
SELECT * FROM EMP WHERE COMM IS NOT NULL;


-- 9. ���� (��������, ��������) ; ORDER BY ��
SELECT ENAME, SAL FROM EMP ORDER BY SAL; -- �޿� �������� ����
SELECT ENAME, SAL FROM EMP ORDER BY SAL DESC; -- �޿� �������� ����
    -- �޿� �������� ����(�޿� ������ �Ի� ��������)
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC, HIREDATE;
    -- �޿� �������� ����(�޿� ������ ���Ի����)
SELECT ENAME, SAL, HIREDATE FROM EMP ORDER BY SAL DESC, HIREDATE DESC;
SELECT * FROM EMP ORDER BY ENAME; -- ABC������ ����
SELECT * FROM EMP ORDER BY ENAME DESC; -- ZYX������ ����
SELECT ENAME, SAL*12 ANNUALSAL FROM EMP ORDER BY ANNUALSAL;








