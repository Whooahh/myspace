    -- 4. ������ �Լ�
        -- 1
        
        
        
        
        
        
        -- 1. ���� ���� �Լ�
            -- DUAL���̺� : ����Ŭ���� ������ 1�� 1��¥�� DUMMY TABLE
SELECT * FROM DUAL;
DESC DUAL;
SELECT FLOOR(34.567) FROM DUAL; -- �Ҽ������� ����
SELECT FLOOR(34.567*10)/10 FROM DUAL; -- 345/10 => 34.5
SELECT TRUNC(34.567, -1) FROM DUAL;
    -- EX. EMP���̺��� �̸�, �޿�(���� �ڸ����� ����)
SELECT ENAME, SAL, TRUNC(SAL, -2) FROM EMP;
SELECT CEIL(34.567) FROM DUAL; -- �Ҽ������� �ø�

SELECT ROUND(34.567) FROM DUAL; -- �Ҽ������� �ݿø�
SELECT ROUND(34.567, 2) FROM DUAL; -- �Ҽ��� ���ڸ����� �ݿø�
SELECT ROUND(34.567, -1) FROM DUAL; -- ���� �ڸ����� �ݿø�

SELECT MOD(9,2) FROM DUAL;
    -- Ȧ���⵵�� �Ի��� ��� ����� ��� ���� ���
SELECT  * FROM EMP WHERE MOD (TO_CHAR(HIREDATE, 'RR'), 2)=1;