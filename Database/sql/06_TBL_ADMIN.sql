-- ▣ 테이블 삭제
-- DROP TABLE TBL_ADMIN;

-- ▣ 테이블 생성
CREATE TABLE TBL_ADMIN
(
  ADMIN_ID    NUMBER(8)    NOT NULL
, NAME        VARCHAR2(16) NOT NULL
, SSN         VARCHAR2(14) NOT NULL
, LOGIN_ID    VARCHAR2(16)
, LOGIN_PW    VARCHAR2(16)
, ACTIVATE_YN CHAR(1)   DEFAULT 'Y' NOT NULL
, REG_DATE    DATE      DEFAULT SYSDATE NOT NULL
, CHG_DATE    DATE
, CONSTRAINT TBL_ADMIN_PK PRIMARY KEY(ADMIN_ID)
);
-- ==>> Table TBL_ADMIN이(가) 생성되었습니다.

-- ▣ 컬럼 속성 변경
-- ALTER TABLE TBL_ADMIN MODIFY STUDENT_ID NUMBER(8);
-- ALTER TABLE TBL_ADMIN MODIFY NAME VARCHAR2(16);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE TBL_ADMIN IS '관리자';
COMMENT ON COLUMN TBL_ADMIN.ADMIN_ID IS '관리자ID';
COMMENT ON COLUMN TBL_ADMIN.NAME IS '관리자명';
COMMENT ON COLUMN TBL_ADMIN.SSN IS '주민번호';
COMMENT ON COLUMN TBL_ADMIN.LOGIN_ID IS '로그인ID';
COMMENT ON COLUMN TBL_ADMIN.LOGIN_PW IS '로그인PW';
COMMENT ON COLUMN TBL_ADMIN.ACTIVATE_YN IS '계정상태';
COMMENT ON COLUMN TBL_ADMIN.REG_DATE IS '등록일자';
COMMENT ON COLUMN TBL_ADMIN.CHG_DATE IS '변경일자';
-- ==>> Comment이(가) 생성되었습니다.

-- ▣ 시퀀스 삭제
-- DROP SEQUENCE SEQ_ADMIN

-- ▣ 시퀀스 추가
CREATE SEQUENCE SEQ_ADMIN
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 10000000
       NOCYCLE
       NOCACHE
       NOORDER;
-- ==>> Sequence SEQ_ADMIN이(가) 생성되었습니다.

 

-- ▣ 데이터 삭제
-- DELETE FROM TBL_ADMIN;

-- ▣ 데이터 입력
 


-- ▣ 조회
SELECT *
FROM TBL_ADMIN;

-- ▣ 커밋
-- COMMIT;
-- ==>> 커밋 완료.