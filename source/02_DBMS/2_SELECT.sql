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
