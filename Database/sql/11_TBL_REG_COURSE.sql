-- ▣ 테이블 삭제
-- DROP TABLE TBL_REG_COURSE;


-- ▣ 테이블 생성
CREATE TABLE TBL_REG_COURSE
(
  RC_ID      NUMBER(8) NOT NULL
, STUDENT_ID NUMBER(8) NOT NULL
, OCU_ID     NUMBER(8) NOT NULL
, REG_DATE   DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_REG_COURSE_PK PRIMARY KEY (RC_ID)
);
-- ==>> Table TBL_REG_COURSE이(가) 생성되었습니다.

-- ▣ 컬럼 속성 변경
-- ALTER TABLE TBL_REG_COURSE MODIFY STUDENT_ID NUMBER(8);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE TBL_REG_COURSE IS '수강등록리스트';
COMMENT ON COLUMN TBL_REG_COURSE.RC_ID IS '수강등록ID';
COMMENT ON COLUMN TBL_REG_COURSE.STUDENT_ID IS '학생ID';
COMMENT ON COLUMN TBL_REG_COURSE.OCU_ID IS '개설과정ID';
COMMENT ON COLUMN TBL_REG_COURSE.REG_DATE IS '수강등록일자';
-- ==>> Comment이(가) 생성되었습니다.


------------------[제약조건 추가]---------------------------
-- ▣ 제약조건(외래키) 추가
ALTER TABLE TBL_REG_COURSE
  ADD CONSTRAINT STUDENT_TO_REG_COURSE_FK
    FOREIGN KEY (STUDENT_ID)
    REFERENCES TBL_STUDENT (STUDENT_ID);
--  ==>> Table TBL_REG_COURSE이(가) 변경되었습니다.


ALTER TABLE TBL_REG_COURSE
  ADD CONSTRAINT OCU_TO_REG_COURSE_FK
    FOREIGN KEY (OCU_ID)
    REFERENCES TBL_OFFERED_CURRICULUM (OCU_ID);
-- ==>> Table TBL_REG_COURSE이(가) 변경되었습니다.


------------------[제약조건 삭제]---------------------------
-- ▣ 제약조건(외래키) 삭제
-- ALTER TABLE TBL_REG_COURSE
--   DROP CONSTRAINT STUDENT_TO_REG_COURSE_FK;

-- ALTER TABLE TBL_REG_COURSE
--   DROP CONSTRAINT OCU_TO_REG_COURSE_FK;


-- ▣ 시퀀스 추가
CREATE SEQUENCE SEQ_RC
       INCREMENT BY 1
       START WITH 50000001
       MINVALUE 50000001
       MAXVALUE 60000000
       NOCYCLE
       NOCACHE
       NOORDER;
-- ==>> Sequence SEQ_RC이(가) 생성되었습니다.


-- ▣ 시퀀스 삭제
-- DROP SEQUENCE SEQ_RC


-- 오라클 AMPERSAND(&)등의 특수 문자 insert
SET DEFINE OFF;
SET DEFINE %;

-- ▣ 조회
SELECT *
FROM TBL_STUDENT;

SELECT *
FROM TBL_OFFERED_CURRICULUM;


-- ▣ 데이터 입력


SELECT *
FROM 
(
  SELECT *
  FROM TBL_REG_COURSE RC JOIN  TBL_STUDENT STU
  USING(STUDENT_ID)
) T JOIN TBL_OFFERED_CURRICULUM OCU
USING(OCU_ID)
WHERE OCU_ID = 30000002   

-----[수강리스트-중도탈락 정보확인]

SELECT NAME
FROM 
(
  SELECT *
  FROM
  (
    SELECT STU*
    FROM 
    (
      SELECT *
      FROM TBL_REG_COURSE RC JOIN  TBL_STUDENT STU
      USING(STUDENT_ID)
    ) T JOIN TBL_OFFERED_CURRICULUM OCU
    USING(OCU_ID)
  ) T2 left JOIN TBL_DROUP_OUT
  USING(RC_ID) 
) T3 LEFT JOIN TBL_DROUP_OUT_STATUS
USING(DOS_CODE)
WHERE OCU_ID = 30000002  

---

-- ▣ 조회
SELECT *
FROM TBL_REG_COURSE;


-- ▣ 커밋
-- COMMIT;
-- ==>> 커밋 완료.