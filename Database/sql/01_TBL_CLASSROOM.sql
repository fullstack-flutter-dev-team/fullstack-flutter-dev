
-- ▣ 테이블 삭제
-- DROP TABLE TBL_CLASSROOM;

-- ▣ 테이블 생성
CREATE TABLE TBL_CLASSROOM
(  
    CR_CODE NUMBER(8) NOT NULL
  , CR_INFO VARCHAR2(128) NOT NULL
  , CONSTRAINT TBL_CLASSROOM_PK PRIMARY KEY(CR_CODE)
);
-- ==> Table TBL_CLASSROOM이(가) 생성되었습니다.

-- ▣ 컬럼 속성 변경
-- ALTER TABLE TBL_CLASSROOM MODIFY CR_INFO VARCHAR2(128);

-- ▣ 컬럼 코멘트 추가
COMMENT ON TABLE TBL_CLASSROOM IS '강의실리스트 정적_테이블';
COMMENT ON COLUMN TBL_CLASSROOM.CR_CODE IS '강의실코드';
COMMENT ON COLUMN TBL_CLASSROOM.CR_INFO IS '강의실정보';
-- ==>> Comment이(가) 생성되었습니다.

-- ▣ 시퀀스 추가
CREATE SEQUENCE SEQ_CLASSROOM
       INCREMENT BY 1
       START WITH 85000001
       MINVALUE 85000001
       MAXVALUE 86000000
       NOCYCLE
       NOCACHE
       NOORDER;
-- ==>> Sequence SEQ_CLASSROOM이(가) 생성되었습니다.


-- ▣ 시퀀스 삭제
-- DROP SEQUENCE SEQ_CLASSROOM

-- ▣ 데이터 삭제
-- DELETE FROM TBL_CLASSROOM;

-- ▣ 데이터 입력
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, ' ');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '101 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '102 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '103 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '104 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '105 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '201 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '202 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '203 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '204 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '205 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '301 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '302 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '303 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '304 호 강의실');
-- INSERT INTO TBL_CLASSROOM (CR_CODE, CR_INFO) VALUES (SEQ_CLASSROOM.NEXTVAL, '305 호 강의실');



-- ▣ 조회
SELECT *
FROM TBL_CLASSROOM;

-- ▣ 커밋
-- COMMIT;
-- ==>> 커밋 완료.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         