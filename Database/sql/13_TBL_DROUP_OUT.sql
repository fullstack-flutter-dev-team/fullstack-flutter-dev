-- ▣ 테이블 삭제
-- DROP TABLE TBL_DROUP_OUT;


-- ▣ 테이블 생성
CREATE TABLE TBL_DROUP_OUT
(
  DO_ID    NUMBER(8) NOT NULL
, RC_ID    NUMBER(8) NOT NULL
, DOS_CODE NUMBER(8) NOT NULL
, DO_DATE  DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_DROUP_OUT_PK PRIMARY KEY (DO_ID)
);
-- ==>> Table TBL_DROUP_OUT이(가) 생성되었습니다.


-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE TBL_DROUP_OUT IS '중도탈락';
COMMENT ON COLUMN TBL_DROUP_OUT.DO_ID IS '중도탈락ID';
COMMENT ON COLUMN TBL_DROUP_OUT.RC_ID IS '수강등록ID';
COMMENT ON COLUMN TBL_DROUP_OUT.DOS_CODE IS '중도탈락상태코드';
COMMENT ON COLUMN TBL_DROUP_OUT.DO_DATE IS '중도탈락일자';
-- ==>> Comment이(가) 생성되었습니다.

------------------[제약조건 추가]---------------------------
-- ▣ 제약조건(외래키) 추가
ALTER TABLE TBL_DROUP_OUT
  ADD CONSTRAINT DROUP_OUT_STATUS_TO_DO_FK
    FOREIGN KEY (DOS_CODE)
    REFERENCES TBL_DROUP_OUT_STATUS (DOS_CODE);
-- ==>> Table TBL_DROUP_OUT이(가) 변경되었습니다.


ALTER TABLE TBL_DROUP_OUT
  ADD CONSTRAINT REG_COURSE_TO_DO_FK
    FOREIGN KEY (RC_ID)
    REFERENCES TBL_REG_COURSE (RC_ID);
-- ==>> Table TBL_DROUP_OUT이(가) 변경되었습니다.

------------------[제약조건 삭제]---------------------------
-- ▣ 제약조건(외래키) 삭제
-- ALTER TABLE TBL_DROUP_OUT
--   DROP CONSTRAINT DROUP_OUT_STATUS_TO_DO_FK;

-- ALTER TABLE TBL_DROUP_OUT
--   DROP CONSTRAINT REG_COURSE_TO_DO_FK;


-- ▣ 시퀀스 추가
CREATE SEQUENCE SEQ_DO
       INCREMENT BY 1
       START WITH 70000001
       MINVALUE 70000001
       MAXVALUE 73000000
       NOCYCLE
       NOCACHE
       NOORDER;
-- ==>> Sequence SEQ_DO이(가) 생성되었습니다.


-- ▣ 시퀀스 삭제
-- DROP SEQUENCE SEQ_DO

-- ▣ 커밋
-- COMMIT;
-- ==>> 커밋 완료.

-------------------------------------------------------
-- ▣ 데이터 입력[RC_ID = 50000003]
-- ▣ 조회

SELECT *
FROM TBL_DROUP_OUT;


INSERT INTO TBL_DROUP_OUT(DO_ID, RC_ID, DOS_CODE) 
VALUES (SEQ_DO.NEXTVAL, 50000003, 84000003);

---------------------------------------------------------------
-- ▣ 커밋
-- COMMIT;
-- ==>> 커밋 완료.
---------------------------------------------------------------