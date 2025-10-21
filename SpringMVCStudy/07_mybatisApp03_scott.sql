SELECT USER
FROM DUAL;
--==>> SCOTT
-------------------------------------------------------------------------------------
-- 07_mybatisApp03_scott

--○ 기존 테이블 제거
DROP TABLE TBL_STUDENT;

--○ 실습 테이블 다시 생성
-- 테이블명 : TBL_STUDENT
-- 컬럼명 : SID, NAME, TEL
CREATE TABLE TBL_STUDENT
( SID    NUMBER
, NAME   VARCHAR2(30)
, TEL    VARCHAR2(40)
, CONSTRAINT STUDENT_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_STUDENT created.

--○ 기존 시퀀스 제거
DROP SEQUENCE STUDENTSEQ;

--○ 실습 시퀀스 생성(MEMBERLISTSEQ)
-- 시퀀스 명 : MEMBERLISTSEQ
CREATE SEQUENCE STUDENTSEQ
NOCACHE;
--==>> Sequence STUDENTSEQ created.

--○ 기존 테이블 제거
DROP TABLE TBL_GRADE;

--○ 실습 테이블 다시 생성
-- 테이블명 : TBL_GRADE
-- 컬럼명 : SID, SUB1, SUB2, SUB3
CREATE TABLE TBL_GRADE
( SID    NUMBER
, SUB1   NUMBER(3)
, SUB2   NUMBER(3)
, SUB3   NUMBER(3)
, CONSTRAINT GRADE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT GRADE_STUDENT_SID_FK FOREIGN KEY(SID) 
             REFERENCES TBL_STUDENT(SID)
,CONSTRAINT GRADE_SUB1_CK CHECK(SUB1 BETWEEN 0 AND 100)
,CONSTRAINT GRADE_SUB2_CK CHECK(SUB2 BETWEEN 0 AND 100)
,CONSTRAINT GRADE_SUB3_CK CHECK(SUB3 BETWEEN 0 AND 100)
);
--==>> Table TBL_GRADE created.

--○ 기존 뷰 삭제(STUDENTVIEW)
DROP VIEW STUDENTVIEW;

--○ 실습 뷰 생성
-- 뷰명 : STUDENTVIEW
-- 컬럼명 : SID, NAME, TEL, SUB(참조 레코드 수)
CREATE OR REPLACE VIEW STUDENTVIEW AS
SELECT SID, NAME, TEL
      , (SELECT COUNT(*) FROM TBL_GRADE G WHERE S.SID=G.SID) AS SUB
FROM TBL_STUDENT S
;
--==>> View STUDENTVIEW created.

--○ 기존 뷰 삭제(GRADEVIEW)
DROP VIEW GRADEVIEW;

--○ 실습 뷰 생성
-- 뷰명 : GRADEVIEW
-- 컬럼명 : SID, NAME, SUB1, SUB2, SUB3, TOT(총점), AVG(평균), CH(합격, 과락, 불합격)
CREATE OR REPLACE VIEW GRADEVIEW AS
SELECT S.SID, S.NAME, G.SUB1, G.SUB2, G.SUB3
      , (G.SUB1 + G.SUB2 + G.SUB3) AS TOT
      , ROUND((G.SUB1 + G.SUB2 + G.SUB3) / 3, 2) AS AVG
      , CASE 
          WHEN G.SUB1 < 40 OR G.SUB2 < 40 OR G.SUB3 < 40 THEN '과락'
          WHEN (G.SUB1 + G.SUB2 + G.SUB3) / 3 >= 60 THEN '합격'
          ELSE '불합격'
        END AS CH
FROM TBL_STUDENT S, TBL_GRADE G
WHERE S.SID = G.SID
;
--==>> View GRADEVIEW created.

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 데이터 삽입 쿼리문 구성(TBL_STUDENT)
INSERT INTO TBL_STUDENT (SID, NAME, TEL)
VALUES (STUDENTSEQ.nextval, '김한국', '010-1111-1111')
;
INSERT INTO TBL_STUDENT (SID, NAME, TEL)
VALUES (STUDENTSEQ.nextval, '이하나', '010-2222-1111')
;
INSERT INTO TBL_STUDENT (SID, NAME, TEL)
VALUES (STUDENTSEQ.nextval, '홍길동', '010-3333-1111')
;
INSERT INTO TBL_STUDENT (SID, NAME, TEL)
VALUES (STUDENTSEQ.nextval, '강감찬', '010-4444-1111')
;
-- 1 row inserted. X 4

--○ 데이터 조회 쿼리문 구성(TBL_STUDENT)
SELECT * 
FROM TBL_STUDENT
ORDER BY SID
;
/* 
       SID NAME                           TEL                                     
---------- ------------------------------ ----------------------------------------
         1 김한국                         010-1111-1111                           
         2 이하나                         010-2222-1111                           
         3 홍길동                         010-3333-1111                           
         4 강감찬                         010-4444-1111    
*/

--○ 데이터 삽입 쿼리문 구성(TBL_GRADE)
INSERT INTO TBL_GRADE (SID, SUB1, SUB2, SUB3)
VALUES (1, 85, 90, 95)
;
INSERT INTO TBL_GRADE (SID, SUB1, SUB2, SUB3)
VALUES (2, 7, 20, 7)
;
INSERT INTO TBL_GRADE (SID, SUB1, SUB2, SUB3)
VALUES (3, 55, 45, 56)
;
-- 1 row inserted. X 3

--○ 데이터 조회 쿼리문 구성(TBL_GRADE)
SELECT * 
FROM TBL_GRADE
ORDER BY SID
;
/* 
       SID       SUB1       SUB2       SUB3
---------- ---------- ---------- ----------
         1         85         90         95
         2          7         20          7
         3         55         45         56
*/

--○ 커밋
COMMIT;
--==>> Commit complete.

--○ 데이터 조회 쿼리문 구성(STUDENTVIEW)
SELECT * 
FROM STUDENTVIEW
ORDER BY SID
;
/* 
       SID NAME                           TEL                                             SUB
---------- ------------------------------ ---------------------------------------- ----------
         1 김한국                         010-1111-1111                                     1
         2 이하나                         010-2222-1111                                     1
         3 홍길동                         010-3333-1111                                     1
         4 강감찬                         010-4444-1111                                     0
*/

--○ 데이터 조회 쿼리문 구성(GRADEVIEW)
SELECT * 
FROM GRADEVIEW
ORDER BY SID
;
/* 

       SID NAME                                 SUB1       SUB2       SUB3        TOT        AVG CH 
---------- ------------------------------ ---------- ---------- ---------- ---------- ---------- ---
         1 김한국                                 85         90         95        270         90 합격
         2 이하나                                  7         20          7         34      11.33 과락
         3 홍길동                                 55         45         56        156         52 불합격
*/

--○ 학생수 조회 쿼리문 구성(STUDENTVIEW)
SELECT COUNT(*)
FROM STUDENTVIEW
;
/* 
  COUNT(*)
----------
         4
*/

--○ 성적 레코드 수 조회 쿼리문 구성(GRADEVIEW)
SELECT COUNT(*) 
FROM GRADEVIEW
;
/* 

  COUNT(*)
----------
         3
*/

-------------------------