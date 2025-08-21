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
DROP TABLE TBL_MEMBER;

-- ▣ 시퀀스 제거
DROP SEQUENCE MEMBERSEQ;

-- ▣ 데이터 삭제
DELETE FROM TBL_MEMBER
WHERE SID > 13;

-- ▣ 실습 테이블 생성
-- 테이블명 : TBL_MEMBER
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(30)
, TEL VARCHAR2(40)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY(SID)
);

-- ▣ 시퀀스 생성
CREATE SEQUENCE MEMBERSEQ
NOCACHE;

-- 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.nextval, '김한국-1', '010-1111-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.nextval, '김한국-2', '010-2222-1111');
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBER_SEQ.nextval, '김한국-3', '010-3333-1111');


-- ▣ 확인
SELECT *
FROM TBL_MEMBER;


-- ▣ 커밋
COMMIT;

-- ▣ 테이블 전체 조회 쿼리문 구성(-> 리스트 확인)
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID;
/* 

       SID NAME                           TEL                                     
---------- ------------------------------ ----------------------------------------
        11 김한국-1                       010-1111-1111                           
        12 김한국-2                       010-2222-1111                           
        13 김한국-3                       010-3333-1111    
*/

-- ▣ 인원수 확인 쿼리문 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;
/* 
    COUNT
----------
         3
*/