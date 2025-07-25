-------------------------------------------------------------------
--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;

-------------------------------------------
--- [1] ---- [TBL_CLASSROOM]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_CLASSROOM
(  
    CR_CODE NUMBER(8) NOT NULL
  , CR_INFO VARCHAR2(128) NOT NULL
  , CONSTRAINT TBL_CLASSROOM_PK PRIMARY KEY(CR_CODE)
);

-- ▣ 컬럼 속성 변경
-- ALTER TABLE TBL_CLASSROOM MODIFY CR_INFO VARCHAR2(128);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_CLASSROOM IS '강의실리스트 정적_테이블';
COMMENT ON COLUMN MIRACLE.TBL_CLASSROOM.CR_CODE IS '강의실코드';
COMMENT ON COLUMN MIRACLE.TBL_CLASSROOM.CR_INFO IS '강의실정보';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_CLASSROOM
  INCREMENT BY 1
  START WITH 85000001
  MINVALUE 85000001
  MAXVALUE 86000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [2] ---- [TBL_CURRICULUM]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_CURRICULUM
(  
  CURRIC_CODE NUMBER(8) NOT NULL
, CURRIC_NAME VARCHAR2(128)  NOT NULL
, CONSTRAINT TBL_CURRICULUM_PK PRIMARY KEY(CURRIC_CODE)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_CURRICULUM IS '과정리스트 정적_테이블';
COMMENT ON COLUMN MIRACLE.TBL_CURRICULUM.CURRIC_CODE IS '과정코드';
COMMENT ON COLUMN MIRACLE.TBL_CURRICULUM.CURRIC_NAME IS '과정명';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_CURRICULUM
  INCREMENT BY 1
  START WITH 80000001
  MINVALUE 80000001
  MAXVALUE 84000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [3] ---- [TBL_SUBJECT]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_SUBJECT
(
  SUBJ_CODE NUMBER(8)  NOT NULL,
  SUBJ_NAME VARCHAR2(128) NOT NULL,
  CONSTRAINT PK_TBL_SUBJECT PRIMARY KEY(SUBJ_CODE)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_SUBJECT IS '과목리스트_정적_테이블';
COMMENT ON COLUMN MIRACLE.TBL_SUBJECT.SUBJ_CODE IS '과목코드';
COMMENT ON COLUMN MIRACLE.TBL_SUBJECT.SUBJ_NAME IS '과목명';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_SUBJECT
       INCREMENT BY 1
       START WITH 73000001
       MINVALUE 73000001
       MAXVALUE 74000000
       NOCYCLE
       NOCACHE
       NOORDER;

-------------------------------------------
--- [4] ---- [TBL_TEXTBOOK]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_TEXTBOOK
(
  TB_CODE     NUMBER(8)  NOT NULL
, TB_NAME     VARCHAR2(128) NOT NULL
, TB_WRITER   VARCHAR2(128)
, TB_PUB_YEAR VARCHAR2(8)
, CONSTRAINT TBL_TEXTBOOK_PK PRIMARY KEY(TB_CODE)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_TEXTBOOK IS '교재리스트_정적_테이블';
COMMENT ON COLUMN MIRACLE.TBL_TEXTBOOK.TB_CODE IS '교재코드';
COMMENT ON COLUMN MIRACLE.TBL_TEXTBOOK.TB_NAME IS '교재명';
COMMENT ON COLUMN MIRACLE.TBL_TEXTBOOK.TB_WRITER IS '저자';
COMMENT ON COLUMN MIRACLE.TBL_TEXTBOOK.TB_PUB_YEAR IS '발생년도';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_TEXTBOOK
  INCREMENT BY 1
  START WITH 74000001
  MINVALUE 74000001
  MAXVALUE 80000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [5] ---- [TBL_DROUP_OUT_STATUS]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_DROUP_OUT_STATUS
(
  DOS_CODE NUMBER(8)    NOT NULL
, DOS_INFO VARCHAR2(128) NOT NULL
, CONSTRAINT TBL_DROUP_OUT_STATUS_PK PRIMARY KEY(DOS_CODE)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_DROUP_OUT_STATUS IS '중도탈락상태_정적_테이블';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT_STATUS.DOS_CODE IS '중도탈락상태코드';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT_STATUS.DOS_INFO IS '중도탈락상세';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_DOS
  INCREMENT BY 1
  START WITH 84000001
  MINVALUE 84000001
  MAXVALUE 85000000
  NOCYCLE
  NOCACHE
  NOORDER;


-------------------------------------------
--- [6] ---- []
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_ADMIN
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

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_ADMIN IS '관리자';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.ADMIN_ID IS '관리자ID';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.NAME IS '관리자명';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.SSN IS '주민번호';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.LOGIN_ID IS '로그인ID';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.LOGIN_PW IS '로그인PW';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.ACTIVATE_YN IS '계정상태';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.REG_DATE IS '등록일자';
COMMENT ON COLUMN MIRACLE.TBL_ADMIN.CHG_DATE IS '변경일자';
-- ==>> Comment이(가) 생성되었습니다.

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_ADMIN
  INCREMENT BY 1
  START WITH 1
  MINVALUE 1
  MAXVALUE 10000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [7] ---- [TBL_STUDENT]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_STUDENT
(
  STUDENT_ID  NUMBER(8)     NOT NULL
, NAME        VARCHAR2(16)  NOT NULL
, SSN         VARCHAR2(14)  NOT NULL
, LOGIN_ID    VARCHAR2(16)
, LOGIN_PW    VARCHAR2(16)
, ACTIVATE_YN CHAR(1)      DEFAULT 'Y' NOT NULL
, REG_DATE    DATE         DEFAULT SYSDATE NOT NULL
, CHG_DATE    DATE
, CONSTRAINT TBL_STUDENT_PK PRIMARY KEY(STUDENT_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_STUDENT IS '학생';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.STUDENT_ID IS '학생ID';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.NAME IS '학생명';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.SSN IS '주민번호';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.LOGIN_ID IS '로그인ID';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.LOGIN_PW IS '로그인PW';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.ACTIVATE_YN IS '계정상태';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.REG_DATE IS '학생등록일자';
COMMENT ON COLUMN MIRACLE.TBL_STUDENT.CHG_DATE IS '정보변경일자';


-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_STUDENT
  INCREMENT BY 1
  START WITH 20000001
  MINVALUE 20000001
  MAXVALUE 30000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [8] ---- [TBL_LECTURER]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_LECTURER
(
  LECTURER_ID NUMBER(8)     NOT NULL
, NAME        VARCHAR2(16)  NOT NULL
, SSN         VARCHAR2(14)  NOT NULL
, LOGIN_ID    VARCHAR2(16)
, LOGIN_PW    VARCHAR2(16)
, ACTIVATE_YN CHAR(1)      DEFAULT 'Y' NOT NULL
, REG_DATE    DATE         DEFAULT SYSDATE NOT NULL
, CHG_DATE    DATE
, CONSTRAINT TBL_LECTURER_PK PRIMARY KEY (LECTURER_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_LECTURER IS '교수자';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.LECTURER_ID IS '교수자ID';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.NAME IS '교수자명';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.SSN IS '주민번호';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.LOGIN_ID IS '로그인ID';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.LOGIN_PW IS '로그인PW';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.ACTIVATE_YN IS '계정상태';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.REG_DATE IS '등록일자';
COMMENT ON COLUMN MIRACLE.TBL_LECTURER.CHG_DATE IS '변경일자';

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_LECTURER
  INCREMENT BY 1
  START WITH 10000001
  MINVALUE 10000001
  MAXVALUE 20000000
  NOCYCLE
  NOCACHE
  NOORDER;


-------------------------------------------
--- [9] ---- [TBL_OFFERED_CURRICULUM]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_OFFERED_CURRICULUM
(
  OCU_ID          NUMBER(8) NOT NULL
, OCU_SDATE       DATE
, OCU_EDATE       DATE
, OCU_SESSION     NUMBER    DEFAULT 1 NOT NULL
, OCU_STUD_MAX    NUMBER    DEFAULT 20 NOT NULL
, OCU_ACTIVATE_YN CHAR(1)   DEFAULT 'Y' NOT NULL
, CURRIC_CODE     NUMBER(8) NOT NULL
, CR_CODE         NUMBER(8) NOT NULL
, REG_DATE        DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_OFFERED_CURRICULUM_PK PRIMARY KEY (OCU_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_OFFERED_CURRICULUM IS '개설과정';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_ID IS '과정ID';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_SDATE IS '과정시작';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_EDATE IS '과정종료';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_SESSION IS '과정회차';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_STUD_MAX IS '개설과정_정원';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_ACTIVATE_YN IS '과정상태';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.CURRIC_CODE IS '과정코드';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.CR_CODE IS '강의실코드';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_CURRICULUM.REG_DATE IS '과정등록일';

-- ▣ 제약조건(외래키) 추가
ALTER TABLE MIRACLE.TBL_OFFERED_CURRICULUM
  ADD CONSTRAINT TBL_CLASSROOM_TO_OCU_FK
    FOREIGN KEY (CR_CODE)
    REFERENCES MIRACLE.TBL_CLASSROOM (CR_CODE);

ALTER TABLE MIRACLE.TBL_OFFERED_CURRICULUM
  ADD CONSTRAINT TBL_CURRICULUM_TO_OCU_FK
    FOREIGN KEY (CURRIC_CODE)
    REFERENCES MIRACLE.TBL_CURRICULUM (CURRIC_CODE);

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_OCU
  INCREMENT BY 1
  START WITH 30000001
  MINVALUE 30000001
  MAXVALUE 40000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [10] ---- [TBL_OFFERED_COURSE]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_OFFERED_COURSE
(
  OCO_ID         NUMBER(8) NOT NULL
, OCO_SDATE      DATE      NOT NULL
, OCO_EDATE      DATE      NOT NULL
, OCO_WGT_WT     NUMBER(3) DEFAULT 35 NOT NULL
, OCO_WGT_PT     NUMBER(3) DEFAULT 35 NOT NULL
, OCO_WGT_ATTEND NUMBER(3) DEFAULT 30 NOT NULL
, OCU_ID         NUMBER(8) NOT NULL
, SUBJ_CODE      NUMBER(8) NOT NULL
, TB_CODE        NUMBER(8) NOT NULL
, LECTURER_ID    NUMBER(8) NOT NULL
, REG_DATE       DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT PK_TBL_OFFERED_COURSE PRIMARY KEY (OCO_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_OFFERED_COURSE IS '개설과목';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_ID IS '과목ID';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_SDATE IS '과목기간_시작';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_EDATE IS '과목기간_종료';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_WGT_WT IS '필기배점';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_WGT_PT IS '실기배점';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCO_WGT_ATTEND IS '출결배점';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.OCU_ID IS '과정ID';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.SUBJ_CODE IS '과목코드';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.TB_CODE IS '교재코드';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.LECTURER_ID IS '교수자ID';
COMMENT ON COLUMN MIRACLE.TBL_OFFERED_COURSE.REG_DATE IS '과목등록일';

-- ▣ 제약조건(외래키) 추가
ALTER TABLE MIRACLE.TBL_OFFERED_COURSE
  ADD CONSTRAINT TEXTBOOK_TO_OFFERED_COURSE_FK
    FOREIGN KEY (TB_CODE)
    REFERENCES MIRACLE.TBL_TEXTBOOK (TB_CODE);

ALTER TABLE MIRACLE.TBL_OFFERED_COURSE
  ADD CONSTRAINT SUBJECT_TO_OFFERED_COURSE_FK
    FOREIGN KEY (SUBJ_CODE)
    REFERENCES MIRACLE.TBL_SUBJECT (SUBJ_CODE);

ALTER TABLE MIRACLE.TBL_OFFERED_COURSE
  ADD CONSTRAINT OCU_TO_OFFERED_COURSE_FK
    FOREIGN KEY (OCU_ID)
    REFERENCES MIRACLE.TBL_OFFERED_CURRICULUM (OCU_ID);

ALTER TABLE MIRACLE.TBL_OFFERED_COURSE
  ADD CONSTRAINT LECTURER_TO_OFFERED_COURSE_FK
    FOREIGN KEY (LECTURER_ID)
    REFERENCES MIRACLE.TBL_LECTURER (LECTURER_ID);

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_OC
  INCREMENT BY 1
  START WITH 40000001
  MINVALUE 40000001
  MAXVALUE 50000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [11] ---- [TBL_REG_COURSE]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_REG_COURSE
(
  RC_ID      NUMBER(8) NOT NULL
, STUDENT_ID NUMBER(8) NOT NULL
, OCU_ID     NUMBER(8) NOT NULL
, REG_DATE   DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_REG_COURSE_PK PRIMARY KEY (RC_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_REG_COURSE IS '수강등록리스트';
COMMENT ON COLUMN MIRACLE.TBL_REG_COURSE.RC_ID IS '수강등록ID';
COMMENT ON COLUMN MIRACLE.TBL_REG_COURSE.STUDENT_ID IS '학생ID';
COMMENT ON COLUMN MIRACLE.TBL_REG_COURSE.OCU_ID IS '개설과정ID';
COMMENT ON COLUMN MIRACLE.TBL_REG_COURSE.REG_DATE IS '수강등록일자';

-- ▣ 제약조건(외래키) 추가
ALTER TABLE MIRACLE.TBL_REG_COURSE
  ADD CONSTRAINT STUDENT_TO_REG_COURSE_FK
    FOREIGN KEY (STUDENT_ID)
    REFERENCES MIRACLE.TBL_STUDENT (STUDENT_ID);

ALTER TABLE MIRACLE.TBL_REG_COURSE
  ADD CONSTRAINT OCU_TO_REG_COURSE_FK
    FOREIGN KEY (OCU_ID)
    REFERENCES MIRACLE.TBL_OFFERED_CURRICULUM (OCU_ID);

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_RC
  INCREMENT BY 1
  START WITH 50000001
  MINVALUE 50000001
  MAXVALUE 60000000
  NOCYCLE
  NOCACHE
  NOORDER;


-------------------------------------------
--- [12] ---- [TBL_SCORE]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_SCORE
(
  SCORE_ID     NUMBER(8) NOT NULL
, SCORE_WT     NUMBER(3)
, SCORE_PT     NUMBER(3)
, SCORE_ATTEND NUMBER(3)
, RC_ID        NUMBER(8) NOT NULL
, OCO_ID       NUMBER(8) NOT NULL
, REG_DATE     DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_SCORE_PK PRIMARY KEY (SCORE_ID)
);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_SCORE IS '성적';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.SCORE_ID IS '성적ID';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.SCORE_WT IS '필기_점수';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.SCORE_PT IS '실기_점수';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.SCORE_ATTEND IS '출결_점수';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.RC_ID IS '수강등록ID';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.OCO_ID IS '개설과목ID';
COMMENT ON COLUMN MIRACLE.TBL_SCORE.REG_DATE IS '성적등록일자';

-- ▣ 제약조건(외래키) 추가
ALTER TABLE MIRACLE.TBL_SCORE
  ADD CONSTRAINT OFFERED_COURSE_TO_SCORE_FK
    FOREIGN KEY (OCO_ID)
    REFERENCES MIRACLE.TBL_OFFERED_COURSE (OCO_ID);

ALTER TABLE MIRACLE.TBL_SCORE
  ADD CONSTRAINT REG_COURSE_TO_SCORE_FK
    FOREIGN KEY (RC_ID)
    REFERENCES MIRACLE.TBL_REG_COURSE (RC_ID);

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_SCORE
  INCREMENT BY 1
  START WITH 60000001
  MINVALUE 60000001
  MAXVALUE 70000000
  NOCYCLE
  NOCACHE
  NOORDER;

-------------------------------------------
--- [13] ---- [TBL_DROUP_OUT]
-- ▣ 테이블 생성
CREATE TABLE MIRACLE.TBL_DROUP_OUT
(
  DO_ID    NUMBER(8) NOT NULL
, RC_ID    NUMBER(8) NOT NULL
, DOS_CODE NUMBER(8) NOT NULL
, DO_DATE  DATE      DEFAULT SYSDATE NOT NULL
, CONSTRAINT TBL_DROUP_OUT_PK PRIMARY KEY (DO_ID)
);


-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE MIRACLE.TBL_DROUP_OUT IS '중도탈락';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT.DO_ID IS '중도탈락ID';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT.RC_ID IS '수강등록ID';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT.DOS_CODE IS '중도탈락상태코드';
COMMENT ON COLUMN MIRACLE.TBL_DROUP_OUT.DO_DATE IS '중도탈락일자';

-- ▣ 제약조건(외래키) 추가
ALTER TABLE MIRACLE.TBL_DROUP_OUT
  ADD CONSTRAINT DROUP_OUT_STATUS_TO_DO_FK
    FOREIGN KEY (DOS_CODE)
    REFERENCES MIRACLE.TBL_DROUP_OUT_STATUS (DOS_CODE);

ALTER TABLE MIRACLE.TBL_DROUP_OUT
  ADD CONSTRAINT REG_COURSE_TO_DO_FK
    FOREIGN KEY (RC_ID)
    REFERENCES MIRACLE.TBL_REG_COURSE (RC_ID);

-- ▣ 시퀀스 추가
CREATE SEQUENCE MIRACLE.SEQ_DO
  INCREMENT BY 1
  START WITH 70000001
  MINVALUE 70000001
  MAXVALUE 73000000
  NOCYCLE
  NOCACHE
  NOORDER;
---------------------------------------------------------------------------------

-- ▣ 커밋
COMMIT;