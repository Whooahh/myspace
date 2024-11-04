-- 테이블 제거
DROP TABLE MEMBER CASCADE CONSTRAINTS;
-- 테이블 생성
CREATE TABLE MEMBER (
  ID   VARCHAR2(30),
  PW   VARCHAR2(30) NOT NULL,
  NAME VARCHAR2(30) NOT NULL,
  BIRTH DATE,                          -- 생일
  RDATE DATE DEFAULT SYSDATE NOT NULL, -- 등록시점
  PRIMARY KEY(ID)  
);
-- 더미 데이터
INSERT INTO MEMBER (ID, PW, NAME, BIRTH)
  VALUES ('aaa','111','홍길동', '99/12/12');
  INSERT INTO MEMBER (ID, PW, NAME, BIRTH)
  VALUES ('ccc','111','홍길동', TO_DATE('2001-12-12', 'YYYY-MM-DD'));
SELECT * FROM MEMBER;
-- DAO에 들어갈 QUERY
-- public int insertMember(Member newMember)
INSERT INTO MEMBER (ID, PW, NAME, BIRTH)
  VALUES ('bbb','111','신길동', '01/12/12');
-- public Member getMember(String id)
-- SELECT * FROM MEMBER WHERE ID='aaa';
-- public int getCountMember(String id)
SELECT count(*) FROM MEMBER WHERE ID='aaa';
-- public ArrayList<Member> getMemberList();
SELECT * FROM MEMBER ORDER BY NAME;
COMMIT;