SELECT USER
FROM DUAL;
/* 
USER
------------------------------
SCOTT
*/

SELECT *
FROM TAB;

-- ▣  휴지통 비우기
PURGE RECYCLEBIN;
-- RECYCLEBIN이(가) 비워졌습니다.

-- ▣ 기존 테이블 제거
DROP TABLE TBL_MEMBER PURGE;
-- DROP TABLE TBL_SCORE PURGE;


-- ▣ 실습 테이블 생성
-- 테이블명 : TBL_MEMBER

CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(30) NOT NULL
, TEL VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);


-- ▣ 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;

-- ▣ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;

-- ▣ 샘플 데이터 입력
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.NEXTVAL, '김한국', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.NEXTVAL, '김이국', '010-2222-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.NEXTVAL, '김삼국', '010-3333-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.NEXTVAL, '김사국', '010-4444-1111');


-- ▣ 테이블 전체 조회 쿼리문 구성(-> 리스트 확인)
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID;


-- ▣ 커밋
COMMIT;


-- ▣ 인원수 확인
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;


-- ▣ SID를 활용한 회원 데이터 검색 쿼리문 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1;

-- ▣ 회원 데이터 수정 쿼리문 구성
UPDATE TBL_MEMBER SET NAME='홍길동' , TEL='010-2222-3333' WHERE SID=2;

-- ▣ 확인 
SELECT * FROM TBL_MEMBER;

-- ▣ 커밋
COMMIT;

-- ▣ 회원 데이터 삭제 쿼리문 구성
DELETE FROM TBL_MEMBER WHERE SID=3;


-- ▣ 확인 
SELECT * FROM TBL_MEMBER;

-- ▣ 롤백
ROLLBACK;


---------------------

-- ▣ 기존 테이블 제거
DROP TABLE TBL_MEMBERSCORE PURGE;


-- ▣ 실습 테이블 생성
-- 테이블명 : TBL_SCORE
CREATE TABLE TBL_MEMBERSCORE
( SID NUMBER
, KOR VARCHAR2(3)
, ENG VARCHAR2(3)
, MAT VARCHAR2(3)
);

-- ▣ 생성된 테이블에 제약조건 추가
ALTER TABLE TBL_MEMBERSCORE
ADD (CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);


-- ▣ 샘플 데이터 입력
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 90, 90);

-- ▣ 커밋
COMMIT;

-- ▣ 입력된 성적 데이터 갯수 확인 쿼리문 구성
SELECT COUNT(*) AS 


-- ▣ 
-- ▣ 
-- ▣ 
-- ▣ 
-- ▣ 
-- ▣ 
-- ▣ 
--
-----------------------------------------------------------------------------
SELECT USER
FROM DUAL;

--○ 기존 테이블 삭제

DROP TABLE TBL_MEMBER;
--==>> Table TBL_MEMBER이(가) 삭제되었습니다.


--○ 테이블 생성(TBL_MEMBER)
CREATE TABLE TBL_MEMBER
( SID   NUMBER
, NAME  VARCHAR2(30) NOT NULL
, TEL   VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;
--==> Table TBL_MEMBER이(가) 생성되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;
--==>> Sequence MEMBERSEQ이(가) 생성되었습니다.

--○ 샘플 데이터 입력(TBL_MEMBER)
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '홍길동', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김하나', '010-2222-2222');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김영국', '010-3333-3333');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김수학', '010-4444-4444');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, '김미국', '010-5555-5555');
--==>> 1 행 이(가) 삽입되었습니다. * 5


--○ 전체 리스트 확인
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID;
--==>>
/*
      SID NAME                           TEL                                     
---------- ------------------------------ ----------------------------------------
         1 홍길동                         010-1111-1111                           
         2 김하나                         010-2222-2222                           
         3 김영국                         010-3333-3333                           
         4 김수학                         010-4444-4444                           
         5 김미국                         010-5555-5555   
*/

--○ 인원 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 회원 정보 검색(SID)

SELECT SID, NAME, TEL
FROM TBL_MEMBER
WHERE SID=1;

--> 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=1
;
--==>> 



--○ 회원 정보 수정
UPDATE TBL_MEMBER
SET NAME='김영국', TEL='010-1100-1100'
WHERE SID=1;
--> 한 줄 구성
UPDATE TBL_MEMBER SET NAME='김영국', TEL='010-1100-1100' WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.




--○ 회원 정보 삭제
DELETE
FROM TBL_MEMBER
WHERE SID=1;
--> 한 줄 구성
DELETE FROM TBL_MEMBER WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 기존 테이블 제거
DROP TABLE TBL_SCORE;
--==>> Table TBL_SCORE이(가) 삭제되었습니다.


DROP TABLE TBL_MEMBERSCORE;

--○ 테이블 생성(TBL_MEMBERSCORE)
CREATE TABLE TBL_MEMBERSCORE
( SID   NUMBER
, KOR   NUMBER(3)
, ENG   NUMBER(3)
, MAT   NUMBER(3)
, CONSTRAINT MEMBERSCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT MEMBERSCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
, CONSTRAINT MEMBERSCORE_SID_FK FOREIGN KEY(SID)
             REFERENCES TBL_MEMBER(SID)
);
--==>> Table TBL_MEMBERSCORE이(가) 생성되었습니다.


--○ 샘플 데이터 입력
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(1, 90, 80, 70);
INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) VALUES(2, 89, 70, 60);
--==>> 1 행 이(가) 삽입되었습니다. * 2

--○ 확인
SELECT SID, KOR, ENG, MAT
FROM TBL_MEMBERSCORE
ORDER BY SID;

--> 한 줄 구성
SELECT SID, KOR, ENG, MAT FROM TBL_MEMBERSCORE ORDER BY SID
;
--==>>
/*
SID    KOR    ENG    MAT
1    90    80    70
2    89    70    60
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 입력된 성적 데이터의 개수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE;

--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE
;
--==>> 2

--○ 성적 데이터 수정
UPDATE TBL_MEMBERSCORE
SET KOR=91, ENG=81, MAT=71
WHERE SID=1;

--> 한 줄 구성
UPDATE TBL_MEMBERSCORE SET KOR=91, ENG=81, MAT=71 WHERE SID=1
;
--==>> 1 행 이(가) 업데이트되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBERSCORE;
--==>> 
/*
SID    KOR    ENG    MAT
1    91    81    71
2    89    70    60
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ 성적 데이터 삭제
DELETE
FROM TBL_MEMBERSCORE
WHERE SID=1;

--> 한 줄 구성
DELETE FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 롤백
ROLLBACK;
--==>> 롤백 완료.


--○ 전체 리스트 조회 쿼리문 구성
SELECT M.SID, M.NAME, M.TEL
     , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID;
--==>>
/*

*/
-- 이렇게 처리하면, 성적 처리가 된 멤버들만 보이게 된다.


--○ 전체 리스트 조회 쿼리문 구성 → 개선 → LEFT JOIN

-- 성적을 첨가(+)로 구성하여 부속적인 조건으로 처리하면
-- 성적이 (null)인 학생들도 출력된다.

SELECT M.SID, M.NAME, M.TEL
     , S.KOR, S.ENG, S.MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
  
*/


--○ 전체 리스트 조회 쿼리문 구성 → 개선 → LEFT JOIN → 개선 → NVL()
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR
     , NVL(S.ENG, -1) AS ENG
     , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>>
/*
      SID NAME                           TEL                                             KOR        ENG        MAT
---------- ------------------------------ ---------------------------------------- ---------- ---------- ----------
         1 홍길동                         010-1111-1111                                    90         80         70
         2 김하나                         010-2222-2222                                    89         70         60
         3 김영국                         010-3333-3333                                    -1         -1         -1
         4 김수학                         010-4444-4444                                    -1         -1         -1
         5 김미국                         010-5555-5555                                    -1         -1         -1
*/

-- 성적처리가 됐는데 0점일 수도 있으니까 -1로 처리.


--○ 전체 리스트 조회 전용 뷰 생성(VIEW_MEMBERSCORE)

CREATE OR REPLACE VIEW VIEW_MEMBERSCORE
AS
SELECT M.SID, M.NAME, M.TEL
     , NVL(S.KOR, -1) AS KOR
     , NVL(S.ENG, -1) AS ENG
     , NVL(S.MAT, -1) AS MAT
FROM TBL_MEMBER M, TBL_MEMBERSCORE S
WHERE M.SID = S.SID(+);
--==>> View VIEW_MEMBERSCORE이(가) 생성되었습니다.


--○ 생성한 뷰(VIEW_MEMBERSCORE)를 활용한 리스트 조회

SELECT SID, NAME, KOR, ENG, MAT
     , (KOR+ENG+MAT) AS TOT
     , (KOR+ENG+MAT)/3 AS AVG
     , RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK
FROM VIEW_MEMBERSCORE
ORDER BY SID;
--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG, RANK() OVER (ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID
;
--==>>
/*

       SID NAME                                  KOR        ENG        MAT        TOT        AVG       RANK
---------- ------------------------------ ---------- ---------- ---------- ---------- ---------- ----------
         1 홍길동                                 90         80         70        240         80          1
         2 김하나                                 89         70         60        219         73          2
         3 김영국                                 -1         -1         -1         -3         -1          3
         4 김수학                                 -1         -1         -1         -3         -1          3
         5 김미국                                 -1         -1         -1         -3         -1          3
*/


--○ 생성한 뷰 (VIEW_MEMBERSCORE)를 활용한 번호 검색
SELECT SID, NAME, KOR, ENG, MAT
FROM VIEW_MEMBERSCORE
WHERE SID=1;

--> 한 줄 구성
SELECT SID, NAME, KOR, ENG, MAT FROM VIEW_MEMBERSCORE WHERE SID=1
;
--==>> 1    노은하    91    81    71

--○ 참조 데이터 레코드 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERSCORE
WHERE SID=1;

--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=1
;
--==>> 1

-- 1이 나오면 성적 처리 완료
-- 0이 나오면 성적 처리가 되지 않은 것.