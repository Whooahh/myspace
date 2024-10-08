-- WORD 예제1
DROP TABLE MEMBER;
DROP TABLE MEMBER_LEVEL;
DROP SEQUENCE MEMBER_MNO_SEQ;

CREATE SEQUENCE MEMBER_MNO_SEQ
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;

CREATE TABLE MEMBER_LEVEL(
    LEVELNO NUMBER(4) PRIMARY KEY,
    LEVELNAME VARCHAR2(50)
);

CREATE TABLE MEMBER(
    mNO NUMBER(4) PRIMARY KEY,
    mNAME VARCHAR2(255) NOT NULL,
    mPW VARCHAR2(8),
    mEMAIL VARCHAR2(255) UNIQUE NOT NULL,
    mPOINT NUMBER CHECK (mPOINT >= 0),
    mRDATE DATE DEFAULT CURRENT_DATE,
    LEVELNO NUMBER(4),
    FOREIGN KEY (LEVELNO) REFERENCES MEMBER_LEVEL(LEVELNO)
);
INSERT INTO MEMBER_LEVEL (LEVELNO, LEVELNAME) VALUES (-1, '블랙');
INSERT INTO MEMBER_LEVEL VALUES (0, '일반');
INSERT INTO MEMBER_LEVEL VALUES (1, '실버');
INSERT INTO MEMBER_LEVEL VALUES (2, '골드');

INSERT INTO MEMBER (mNO, mNAME, mPW, mEMAIL, mPOINT, mRDATE, LEVELNO)
    VALUES (MEMBER_MNO_SEQ.NEXTVAL, '홍길동' ,'AA', 'HONG@HONG.COM', 0, SYSDATE, 0);
INSERT INTO MEMBER VALUES(MEMBER_MNO_SEQ.NEXTVAL, '신길동', 'BB', 'SIN@SIN.COM', 1000, SYSDATE, 1);
SELECT mNO, mNAME, mRDATE, mEMAIL, mPOINT, LEVELNAME 
    FROM MEMBER M, MEMBER_LEVEL L
    WHERE M.LEVELNO=L.LEVELNO;