-- ▣ 모든 테이블 삭제
------------------------------------------------
--- [13] ---- [TBL_TEXTBOOK]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_TEXTBOOK;

-- ▣ 테이블 삭제
DROP TABLE TBL_TEXTBOOK;


------------------------------------------------
--- [10] ---- [TBL_CLASSROOM]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_CLASSROOM;

-- ▣ 테이블 삭제
DROP TABLE TBL_CLASSROOM;



------------------------------------------------
--- [11] ---- [TBL_SUBJECT]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_SUBJECT;

-- ▣ 테이블 삭제
DROP TABLE TBL_SUBJECT;



------------------------------------------------
--- [12] ---- [TBL_DROUP_OUT_STATUS]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_DOS;

-- ▣ 테이블 삭제
DROP TABLE TBL_DROUP_OUT_STATUS;
------------------------------------------------
--- [1] ---- [TBL_OFFERED_COURSE]
-- ▣ 제약조건(외래키) 삭제
ALTER TABLE TBL_OFFERED_COURSE
  DROP CONSTRAINT TEXTBOOK_TO_OFFERED_COURSE_FK;

ALTER TABLE TBL_OFFERED_COURSE
  DROP CONSTRAINT SUBJECT_TO_OFFERED_COURSE_FK;

ALTER TABLE TBL_OFFERED_COURSE
  DROP CONSTRAINT OCU_TO_OFFERED_COURSE_FK;

ALTER TABLE TBL_OFFERED_COURSE
  DROP CONSTRAINT LECTURER_TO_OFFERED_COURSE_FK;

-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_OC;

-- ▣ 테이블 삭제
DROP TABLE TBL_OFFERED_COURSE;

------------------------------------------------
--- [2] ---- [TBL_OFFERED_CURRICULUM]
-- ▣ 제약조건(외래키) 삭제
ALTER TABLE TBL_OFFERED_CURRICULUM
  DROP CONSTRAINT TBL_CLASSROOM_TO_OCU_FK;

ALTER TABLE TBL_OFFERED_CURRICULUM
  DROP CONSTRAINT TBL_CURRICULUM_TO_OCU_FK;

-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_OCU;

-- ▣ 테이블 삭제
DROP TABLE TBL_OFFERED_CURRICULUM;


------------------------------------------------
--- [3] ---- [TBL_REG_COURSE ]
-- ▣ 제약조건(외래키) 삭제
ALTER TABLE TBL_REG_COURSE
  DROP CONSTRAINT STUDENT_TO_REG_COURSE_FK;

ALTER TABLE TBL_REG_COURSE
  DROP CONSTRAINT OCU_TO_REG_COURSE_FK;

-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_RC;

-- ▣ 테이블 삭제
DROP TABLE TBL_REG_COURSE;

------------------------------------------------
--- [4] ---- [TBL_SCORE]
-- ▣ 제약조건(외래키) 삭제
ALTER TABLE TBL_SCORE
  DROP CONSTRAINT OFFERED_COURSE_TO_SCORE_FK;

ALTER TABLE TBL_SCORE
  DROP CONSTRAINT REG_COURSE_TO_SCORE_FK;

-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_SCORE;

-- ▣ 테이블 삭제
DROP TABLE TBL_SCORE;

------------------------------------------------

------------------------------------------------
--- [9] ---- [TBL_CURRICULUM]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_CURRICULUM;

-- ▣ 테이블 삭제
DROP TABLE TBL_CURRICULUM;

------------------------------------------------
--- [5] ---- [TBL_DROUP_OUT]
-- ▣ 제약조건(외래키) 삭제
ALTER TABLE TBL_DROUP_OUT
  DROP CONSTRAINT DROUP_OUT_STATUS_TO_DO_FK;

ALTER TABLE TBL_DROUP_OUT
  DROP CONSTRAINT REG_COURSE_TO_DO_FK;

-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_DO;

-- ▣ 테이블 삭제
DROP TABLE TBL_DROUP_OUT;

------------------------------------------------
--- [6] ---- [TBL_ADMIN]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_ADMIN;

-- ▣ 테이블 삭제
DROP TABLE TBL_ADMIN;



------------------------------------------------
--- [7] ---- [SEQ_LECTURER]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_LECTURER;

-- ▣ 테이블 삭제
DROP TABLE TBL_LECTURER;

------------------------------------------------
--- [8] ---- [TBL_STUDENT]
-- ▣ 시퀀스 삭제
DROP SEQUENCE SEQ_STUDENT;

-- ▣ 테이블 삭제
DROP TABLE TBL_STUDENT;


COMMIT;




------------------------------------------------------