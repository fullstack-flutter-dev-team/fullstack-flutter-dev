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
DROP TABLE TBL_SCORE PURGE;


-- ▣ 데이터 삭제
-- DELETE FROM TBL_SCORE
-- WHERE SID > 13;

-- ▣ 실습 테이블 생성
-- 테이블명 : TBL_SCORE
CREATE TABLE TBL_SCORE
( SID NUMBER
, NAME VARCHAR2(30)
, KOR VARCHAR2(3)
, ENG VARCHAR2(3)
, MAT VARCHAR2(3)
);

-- ▣ 생성된 테이블에 제약조건 추가
ALTER TABLE TBL_SCORE
ADD (CONSTRAINT SCORE_SID_PK PRIMARY KEY(SID)
, CONSTRAINT SCORE_KOR_CK CHECK(KOR BETWEEN 0 AND 100)
, CONSTRAINT SCORE_ENG_CK CHECK(ENG BETWEEN 0 AND 100)
, CONSTRAINT SCORE_MAT_CK CHECK(MAT BETWEEN 0 AND 100)
);

-- ▣ 기존 시퀀스 제거
DROP SEQUENCE SCORESEQ;

-- ▣ 실습 관련 시퀀스 다시 생성
CREATE SEQUENCE SCORESEQ
NOCACHE;

-- 데이터 입력 쿼리문 구성
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '김한국', 90, 80, 70);
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '이한국', 70, 80, 70);
INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '삼한국', 80, 80, 70);


-- ▣ 확인
SELECT *
FROM TBL_SCORE;


-- ▣ 커밋
COMMIT;

-- ▣ 테이블 전체 조회 쿼리문 구성(-> 리스트 확인)
SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND((KOR+ENG+MAT)/3, 1) AS AVG FROM TBL_SCORE ORDER BY SID;
/* 

       SID NAME                           TEL                                     
---------- ------------------------------ ----------------------------------------
        11 김한국-1                       010-1111-1111                           
        12 김한국-2                       010-2222-1111                           
        13 김한국-3                       010-3333-1111    
*/

-- ▣ 인원수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT FROM TBL_SCORE;
/* 
    COUNT
----------
         3
*/