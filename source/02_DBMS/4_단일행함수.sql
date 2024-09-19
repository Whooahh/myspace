-- [IV] �������Լ�
-- �Լ� = �������Լ�(4��) + �׷��Լ�(5��)
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD HH24:MI:SS') FROM EMP; -- ������ ����

SELECT AVG(SAL) FROM EMP; -- �׷��Լ�(INPUT 14�� -> OUTPUT 1��)
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO; -- INPUT N�� -> OUTPUT 1��

-- �� �������Լ� = ���ڰ����Լ�, ���ڰ����Լ�, ��¥�����Լ�, ����ȯ�Լ�, NVL, etc..
-- 1. ���ڰ����Լ�
    -- DUAL���̺� : ����Ŭ���� ������ 1��1��¥�� DUMMY TABLE
SELECT * FROM DUAL;
DESC DUAL;
SELECT FLOOR(34.567) FROM DUAL; -- �Ҽ������� ����(����)
SELECT FLOOR(34.567*10)/10 FROM DUAL; -- 345/10 => 34.5
SELECT TRUNC(34.567, 1) FROM DUAL; -- �Ҽ��� ���ڸ����� ����
SELECT TRUNC(34.567) FROM DUAL;
SELECT FLOOR(34.567/10)*10 FROM DUAL; -- ���� �ڸ����� ����
SELECT TRUNC(34.567, -1) FROM DUAL;
    -- EX. EMP���� �̸�, �޿�(���� �ڸ����� ����)
    SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.567) FROM DUAL; -- �Ҽ������� �ø�

SELECT ROUND(34.567) FROM DUAL; -- �Ҽ������� �ݿø�
SELECT ROUND(34.567, 2) FROM DUAL; -- �Ҽ��� ���ڸ����� �ݿø�
SELECT ROUND(34.567, -1) FROM DUAL; -- �����ڸ����� �ݿø�

SELECT MOD(9, 2) FROM DUAL;
    -- Ȧ���⵵�� �Ի��� ����� ��� ���� ���
    SELECT * FROM EMP WHERE MOD( TO_CHAR(HIREDATE, 'RR'), 2)=1;

-- 2. ���ڰ����Լ�
-- (1) ��ҹ��� ����
SELECT UPPER('abcABC') FROM DUAL;
SELECT LOWER('abcABC') FROM DUAL;
SELECT INITCAP('welcome to oracle') FROM DUAL; -- ���������� ������ ù ���ڸ� �빮��
SELECT INITCAP('WELCOME TO ORACLE') FROM DUAL; -- ���������� ������ ù ���ڸ� �빮��
    -- EX. �̸��� SCOTT�� ������ ��� �ʵ�
SELECT * FROM EMP WHERE UPPER (ENAME) = 'SCOTT';
SELECT * FROM EMP WHERE INITCAP(ENAME) = 'Scott';
SELECT * FROM EMP WHERE LOWER(ENAME) = 'scott';
-- (2) ���� ����(CONCAT�Լ�, || ������)
SELECT 'AB'||'CD'||'EF'||'GH' FROM DUAL;
SELECT CONCAT ('AB','CD'), CONCAT('EF','GH') FROM DUAL;
    -- "SMITH�� MANAGER�̴�" �������� EMP ���̺� �����͸� ���
SELECT ENAME || '��' || JOB || '�̴�' FROM EMP;
SELECT CONCAT( ENAME, '��'), CONCAT(JOB, '�̴�') FROM EMP;

-- (3) SUBSTR(STR, ������ġ, ���ڰ���) : STR�� ������ġ���� ���ڰ�����ŭ ���� ����
-- SUBSTRB(STR, ���۹���Ʈ��ġ, ���ڰ���) : STR�� ���ۺ��� ����Ʈ���ڰ�����ŭ ���� ����
        -- O R A C L E
        -- 1 2 3 4 5 6
        -- 6 5 4 3 2 1
SELECT SUBSTR('ORACLE', 4, 2) FROM DUAL;
SELECT SUBSTRB('ORACLE', 4, 2) FROM DUAL;
SELECT SUBSTR('�����ͺ��̽�', 4,2) FROM DUAL;
SELECT SUBSTRB('�����ͺ��̽�', 4,3) FROM DUAL;
    -- 9���� �Ի��� ����� ��� �ʵ� (��¥�� ǥ�� 'RR/MM/DD')
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4,2) = '09'; -- DATE(��¥)���� ����
DESC EMP;
    -- 9�Ͽ� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 7,2) = '09';
    -- (4) LENGTH (STR) : STR�� ���� ��
        -- LENGTHB (STR) : STR�� ����Ʈ ��
SELECT LENGTH('ABCD') FROM DUAL;
SELECT LENGTHB('ABCD') FROM DUAL;
SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ') FROM DUAL;
    -- (5) LPAD(STR, �ڸ���, ä�﹮��): STR�� �ڸ� �� ��ŭ Ȯ���ϰ� ���� ���ڸ��� ä�﹮�ڷ� ���
    -- LPAD(STR, �ڸ���) : STR�� �ڸ��� ��ŭ Ȯ���ϰ� ���� ���ڸ��� ''�� ���
    -- RPAD(STR, �ڸ���, ä�﹮��) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ä�﹮�ڷ� ���
    -- RPAD(STR, �ڸ���) : STR�� �ڸ�����ŭ Ȯ���ϰ� ������ ���ڸ��� ''�� ���
SELECT LPAD('ORACLE', 10, '#') FROM DUAL;
SELECT LPAD('ORACLE', 10) FROM DUAL;
DESC EMP;
    -- ENAME : ���� 10����, SAL: 5�ڸ�, 2�ڸ�
SELECT LPAD(ENAME, 10, '-'), LPAD(SAL, 5, '$') FROM EMP;
    -- EX. ���, �̸�(7369 S**** / 1111 W*** / 2222 M*****) - RPAD, SUBSTR
SELECT EMPNO, RPAD (SUBSTR(ENAME, 1,1), LENGTH(ENAME), '*') FROM EMP;
    -- EX. ���, �̸�, ��å(9�ڸ� Ȯ��), �Ի���
    -- 7369 SMITH ____****K 80/12/**
    -- 7566 JONES __*****R 81/02/**
SELECT EMPNO, INITCAP(ENAME) ENAME, LPAD(LPAD(SUBSTR(JOB, -1,1), LENGTH(JOB), '*'),9) JOB, TO_CHAR(HIREDATE, 'RR/MM')|| '*' FROM EMP;
    -- (6) INSTR(STR, ã������) : STR���� ã�����ڰ� ù��°�� ������ ��ġ (ó��1, ������0)
    -- INSTR(STR, ã������, ������ġ) : STR�� ������ġ���� ã�� ���ڰ� ������ ��ġ
SELECT INSTR('ABCABCABC','B'), INSTR('ABCABCABC', 'B', 3) FROM DUAL;
    -- EX. 9���� �Ի��� ����� ��� �ʵ� (��¥ RR/MM/DD)
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 4)=4;
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 4, 2) = '09';
SELECT * FROM EMP WHERE HIREDATE LIKE '__/09/__';
    -- EX. 9�Ͽ� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 7)=7;
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 7, 2) = '09';
SELECT * FROM EMP WHERE HIREDATE LIKE '__/__/09';
    -- EX. 9���� �ƴ� ���� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE INSTR(HIREDATE, '09', 7)=0;
SELECT * FROM EMP WHERE HIREDATE NOT LIKE '%/09';
SELECT * FROM EMP WHERE SUBSTR(HIREDATE, 7,2) != '09';
    -- (7) �������� : TRIM(STR), LTRIM(STR), RTRIM(STR)
SELECT '    ORACLE  ' "MSG" FROM DUAL;
SELECT TRIM ('    ORACLE  ') "MSG" FROM DUAL;
SELECT LTRIM ('    ORACLE  ') "MSG" FROM DUAL;
SELECT RTRIM ('    ORACLE  ') "MSG" FROM DUAL;
    --(8) REPLACE(STR, '�ٲ���� ����', '�ٲܹ���')
SELECT REPLACE(ENAME, 'A', 'XX') FROM EMP;
SELECT REPLACE(SAL, '0', 'X') FROM EMP;
SELECT REPLACE(HIREDATE, 0, 'X') FROM EMP;

    -- 3. ��¥ ���� �Լ�
    -- (1) SYSDATE : ����
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI') FROM DUAL;
    -- (2) ��¥ ��� : ����Ŭ �⺻ Ÿ�� (����, ����, ��¥) �� ����, ��¥ Ÿ���� ���� ����
SELECT TO_CHAR(SYSDATE, 'RR/MM/DD HH:MI'), TO_CHAR(SYSDATE+1, 'RR/MM/DD HH:MI') FROM DUAL;
    -- �������� ���� ������� �� �� ������?
SELECT SYSDATE-TO_DATE('24/08/26 09:30', 'RR/MM/DD HH24:MI') FROM DUAL;
    -- ������� ������� ���� ���ҳ�?
SELECT TRUNC(TO_DATE('25/03/07 18:00', 'RR/MM/DD HH24:MI')- SYSDATE) FROM DUAL;
    -- EMP���� �̸�, �Ի���, �ٹ��ϼ�
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) FROM EMP;
    -- EMP���� �̸�, �Ի���, �ٹ��ϼ�, �ٹ��ּ�, �ٹ����
SELECT ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE) DAY, TRUNC( (SYSDATE-HIREDATE)/7) WEEK, TRUNC( (SYSDATE-HIREDATE) /365) YEAR FROM EMP;
     -- (3) MONTHS_BETWEEN(��¥��1, ��¥��2) : �� ��¥�� ������ �� ���� �� (��¥ ��1�� ū ����)
     -- EX. �̸�, �Ի���, �ٹ�����
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) MONTH FROM EMP;
    -- EX2. ����������� ���� ���� ��
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, TO_DATE('25/03/07 18;00', 'RR/MM/DD HH24:MI')),2) FROM DUAL;
    -- (4) NEXT_DAY(Ư������, '��') : Ư���������� ó�� ���ƿ��� �����
SELECT NEXT_DAY(SYSDATE, '��') FROM DUAL;
    -- (5) ADD_MONTHS(Ư������, ������) : Ư���������� �� ���� ��
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;
    -- EX. �̸�, �Ի���, ��������Ⱓ (�����Ⱓ�� �Ի��Ϸκ��� 6��������)
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;
    -- �Ի����� 8�� 31�Ϸ�
INSERT INTO EMP VALUES (9999, 'ȫ�浿', NULL, NULL, '80/08/31', 900, NULL, 40);
SELECT * FROM EMP;
ROLLBACK; -- DML���(�������Է�, ����, ����) ���
    -- (6) LAST_DAY(Ư������) : Ư�������� ����(28,29,30,31)
SELECT LAST_DAY(SYSDATE) FROM DUAL;
    -- EX. �̸�, �Ի���, ù ���޳�(����)
SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) FROM EMP;
    -- (7) ROUND(��¥, XX) : ��¥ �ݿø� (XX:'YEAR', 'MONTH', 'DAY', ����)
    -- TRUNC(��¥, XX) : ��¥ ����
SELECT ROUND(34.56), ROUND(34.56, 1) FROM DUAL;
SELECT TO_CHAR(ROUND(SYSDATE), 'MM/DD HH24:MI') FROM DUAL;
SELECT ROUND(SYSDATE, 'DAY') FROM DUAL; -- ����� �Ͽ���
SELECT ROUND(SYSDATE, 'MONTH') FROM DUAL; -- ����� 1��
SELECT ROUND(SYSDATE, 'YEAR') FROM DUAL; -- ����� 1�� 1��

SELECT TO_CHAR(ROUND(SYSDATE), 'MM/DD HH24:MI') FROM DUAL;
SELECT TRUNC(SYSDATE, 'DAY') FROM DUAL; -- ���� �Ͽ���
SELECT TRUNC(SYSDATE, 'MONTH') FROM DUAL; -- �̹� �� 1��
SELECT TRUNC(SYSDATE, 'YEAR') FROM DUAL; -- ���� 1�� 1��
    -- EX. �̸�, �Ի���, ù���޳�
SELECT ENAME, HIREDATE, ROUND(HIREDATE, 'MONTH')+15 ���޳� FROM EMP;
    -- EX. �̸�, �Ի���, ù ���޳� (15��) : ROUND���� 15/16�� 14/15��
SELECT ENAME, HIREDATE, ROUND(HIREDATE+1, 'MONTH')+14 ���޳� FROM EMP;
    -- EX. �̸�, �Ի���, ù ���޳� (12��) : ROUND���� 15/16�� 11/12��
SELECT ENAME, HIREDATE, ROUND(HIREDATE+4, 'MONTH')+11 ���޳� FROM EMP;
    -- EX. �̸�, �Ի���, ù ���޳� (25��) : ROUND���� 15/16�� 24/25��
SELECT ENAME, HIREDATE, ROUND(HIREDATE-9, 'MONTH')+24 ���޳� FROM EMP;

    -- 4. ����ȯ�Լ� (TO_CHAR:���ڷ� ��ȯ��Ű�� �Լ�, TO_DATE:��¥������ ��ȯ��Ű�� �Լ�)
    -- TO_CHAR(��¥��, '�������')
    -- YYYY�⵵ 4�ڸ� / RR �⵵ 2�ڸ� / MM �� / DD ��/ DY �� / DAY �����
    -- HH24 / HH12 / HH(12�ð�) / MI �� / SS �� / AM ����/����
SELECT ENAME, HIREDATE FROM EMP;
DESC EMP;
SELECT ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD DAY HH24:MI:SS') FROM EMP;
SELECT ENAME, TO_CHAR(HIREDATE, 'RR"��"MM"��"DD"��" DY"����" AM HH"��"MI"��"SS"��"')FROM EMP;
    -- (2) TO_CHAR(����, '�������')
        -- 0 : �ڸ���. ��������� �ڸ����� ������ 0���� ä��
        -- 9 : �ڸ���, ��������� �ڸ����� ���Ƶ� ���ڸ�ŭ ���
        -- , : ���ڸ����� ,
        -- . : �Ҽ���
        -- $ : ��ȭ����
        -- L : ������ȭ ������ ���
SELECT TO_CHAR(SAL, 'L99,999') FROM EMP;
SELECT TO_CHAR(SAL, '$00,000.9')FROM EMP;
SELECT TO_CHAR(1234.56, '9,999.9') FROM DUAL;
    -- (3) TO_DATE(����, '����')
        -- EX. 81/5/1 ~ 83/5/1 ���̿� �Ի��� ����� ��� �ʵ�
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'RR/MM/DD') BETWEEN '81/05/01' AND '83/05/01';
SELECT * FROM EMP WHERE HIREDATE BETWEEN TO_DATE('81/05/01', 'RR/MM/DD') AND TO_DATE('83/05/01', 'RR/MM/DD');

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
    -- (4) TO_NUMBER (����, '����')
SELECT TO_NUMBER('3,456', '9,999') + 1 FROM DUAL;

    -- 5. NVL(�� �ϼ��� �ִ� ������, ���̸� ����� ��) - �Ű����� 2���� Ÿ����ġ
    -- EX. ����̸�, ���ӻ���̸�(���ӻ�簡 ������ CEO�� ���)
SELECT W.ENAME, NVL(M.ENAME, 'CEO') FROM EMP W, EMP M WHERE W.MGR=M.EMPNO(+);
    -- EX. ����̸�, ���ӻ���� ��� (���ӻ�簡 ������ CEO�� ���)
SELECT ENAME, NVL(TO_CHAR(MGR), 'CEO') FROM EMP;
    -- 6. ETC
    -- (1) EXTRACT : ��¥�� �����Ϳ��� �⵵, ��, �ϸ� �����ϰ��� �� ��
SELECT HIREDATE, EXTRACT(YEAR FROM HIREDATE) FROM EMP; -- ���ڷ� ���ڸ� ����
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY') FROM EMP; -- ���ڷ� �⵵�� ����
SELECT HIREDATE, EXTRACT(MONTH FROM HIREDATE) FROM EMP; -- ���� ���ڷ� ����
SELECT HIREDATE, TO_CHAR(HIREDATE, 'MM') FROM EMP;
SELECT HIREDATE, EXTRACT(DAY FROM HIREDATE) FROM EMP;
SELECT HIREDATE, TO_CHAR(HIREDATE, 'DD') FROM EMP;
    -- (2) ������ ���
SELECT * FROM EMP; -- �������� ���


-- 1.  ���� ��¥�� TITLE�� Current Date�� ��Ī���� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT SYSDATE FROM DUAL;
--2.  EMP ���̺��� ���� �޿��� 15%�� ������ �޿��� �����ȣ,�̸�,����,�޿�,������ �޿�(New Salary),������(Increase) �� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT EMPNO, ENAME, JOB, SAL*1.15, SAL*0.15 FROM EMP;
--3.  EMP ���̺��� �̸�,�Ի���,�Ի��Ϸκ��� 6���� �� ���ƿ��� ������ ���Ͽ� ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6), '������') FROM EMP;
--4.  EMP ���̺��� �̸�,�Ի���, �Ի��Ϸκ��� ��������� ����,�޿�, �Ի��Ϻ��� ��������� �޿��� �Ѱ踦 ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)), TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))*SAL FROM EMP;
--5.  EMP ���̺��� ��� ����� �̸��� �޿�(15�ڸ��� ��� ������ �� ���� ��*���� ��ġ)�� ����ϴ� SELECT ������ ��� �Ͻÿ�.
SELECT LPAD(ENAME,15,'*')"�̸�",LPAD(SAL,15,'*')"�޿�" FROM EMP;
--6.  EMP ���̺��� ��� ����� ������ �̸�,����,�Ի���,�Ի��� ������ ����ϴ� SELECT ������ ����Ͻÿ�.
SELECT ENAME, JOB, HIREDATE "�Ի���", TO_CHAR(HIREDATE, 'DAY')"�Ի��� ����" FROM EMP;
--7.  EMP ���̺��� �̸��� ���̰� 6�� �̻��� ����� ������ �̸�,�̸��� ���ڼ�,������ ����ϴ� SELECT ������ ����� �ÿ�.
SELECT ENAME, LENGTH(ENAME) FROM EMP WHERE LENGTH(ENAME)=6;
--8.  EMP ���̺��� ��� ����� ������ �̸�, ����, �޿�, ���ʽ�, �޿�+���ʽ��� ����ϴ� SELECT ������ ����Ͻÿ�
SELECT ENAME, JOB,SAL, COMM, SAL+COMM FROM EMP;
--9.  ��� ���̺��� ������� 2��° ���ں��� 3���� ���ڸ� �����Ͻÿ�. 
SELECT EMPNO, ENAME, SUBSTR(ENAME, 2,3) FROM EMP;
--10. ��� ���̺��� �Ի����� 12���� ����� ���, �����, �Ի����� �˻��Ͻÿ� (EXTRACT�Լ�, TO_CHAR�Լ�)
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD')"�Ի���" FROM EMP WHERE EXTRACT(MONTH FROM HIREDATE)=12; 
-- 10. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ� EMPNO, ENAME, �޿� 7369 SMITH *******800, 7499 ALLEN ******1600, 7521 WARD ******1250
SELECT EMPNO, ENAME, LPAD(TO_CHAR(SAL), 10, '*') "�޿�" FROM EMP;
--11. ������ ���� ����� �˻��� �� �ִ� SQL ������ �ۼ��Ͻÿ� EMPNO, ENAME. �Ի��� 7369 SMITH 1980-12-17
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY-MM-DD') "�Ի���" FROM EMP;
--13. ��� ���̺��� �μ���ȣ�� 20�� ����� ���, �̸�, ����, �޿��� ����Ͻÿ�(�޿��� �տ� $�� �����ϰ� 3�ڸ��� �� ,�� ����Ѵ�
SELECT EMPNO, ENAME, JOB, TO_CHAR(SAL, '$99,999') FROM EMP WHERE DEPTNO=20;