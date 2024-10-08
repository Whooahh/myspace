-- [8장] Sequence : 순차번호 생성기, 인위적인 PK 사용용도
DROP SEQUENCE FRIEND_SEQ;
CREATE SEQUENCE FRIEND_SEQ
    START WITH 1 --1부터 시작
    INCREMENT BY 1 --1씩 증가
    MAXVALUE 9999 --최대값
    MINVALUE 1 --최소값
    NOCACHE
    NOCYCLE;
SELECT FRIEND_SEQ.NEXTVAL FROM DUAL;
SELECT FRIEND_SEQ.CURRVAL FROM DUAL;
    --FRIEND테이블 (NO20240924001, 날짜002-PK, NAME, TEL, ADDRESS, LAST_MODIFY)
DROP SEQUENCE FRIEND_SEQ;
CREATE SEQUENCE FRIEND_SEQ MAXVALUE 99999 NOCACHE NOCYCLE;
DROP TABLE FRIEND;
CREATE TABLE FRIEND (
    NO NUMBER(11) PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    TEL VARCHAR2(20) UNIQUE, -- NULL 허용, NULL이 아닐 때는 유일한 값
    ADDRESS VARCHAR2(255),
    LAST_MODIFY DATE DEFAULT SYSDATE
);
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(1, '000') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD')||TRIM(TO_CHAR(33, '000')) FROM DUAL;
INSERT INTO FRIEND (NO, NAME, TEL, ADDRESS)
    VALUES (TO_CHAR(SYSDATE, 'YYYYMMDD') ||TRIM(TO_CHAR(FRIEND_SEQ.NEXTVAL, '000')), 
            '홍길동', NULL, '서울시 관악구'); 
SELECT * FROM FRIEND;

