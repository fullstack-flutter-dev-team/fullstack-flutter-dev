SELECT USER
FROM DUAL;
-- ==>> SCOTT

-- 기존 테이블 제거
DROP TABLE TBL_MEMBER;
-- ==>> Table TBL_MEMBER이(가) 삭제되었습니다.

-- 실습 테이블 생성
-- 테이블명 : TBL_MEMBER
CREATE TABLE TBL_MEMBER
( SID NUMBER
, NAME VARCHAR2(20)
, TEL  VARCHAR2(50)
, CONSTRAINT MEMBER_SID_PK PRIMARY KEY (SID)
);
-- ==>> Table TBL_MEMBER이(가) 생성되었습니다.

-- 확인
SELECT *
FROM TBL_MEMBER;
-- ==>> 선택된 행 없음

-- 테이블 구조 확인
DESC TBL_MEMBER;
/* 
이름   널?       유형           
---- -------- ------------ 
SID  NOT NULL NUMBER       
NAME          VARCHAR2(20) 
TEL           VARCHAR2(50) 
*/


-- 제약조건 확인
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_MEMBER';
/* 
TABLE_NAME                     CONSTRAINT_NAME                C
------------------------------ ------------------------------ -
TBL_MEMBER                     MEMBER_SID_PK                  P
*/

-- 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME , TEL) VALUES(1, '김한국', '010-1234-5678');
-- ==>> 1 행 이(가) 삽입되었습니다.

-- 확인
SELECT *
FROM TBL_MEMBER;
/* 
      SID NAME                 TEL                                               
---------- -------------------- --------------------------------------------------
         1 김한국               010-1234-5678  
*/


-- SELECT 쿼리문 준비
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;

-- 한 줄 구성
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID
;
--       SID NAME                 TEL                                               
------------ -------------------- --------------------------------------------------
--         1 김한국               010-1234-5678                                     
--         2 김한국2              010-2222-3456                                     
--         3 김한국3              010-3333-3456                                     
--         4 김한국4              010-4444-1234                                     
--        11 김한국11             010-1111-1111   

-- 롤백
-- ROLLBACK;
-- ==>> 롤백 완료.

COMMIT;



--○ 기존 데이터 삭제
DELETE 
FROM TBL_MEMBER;
--==> 5개 행 이(가) 삭제되었습니다.


--○ 확인
SELECT *
FROM TBL_MEMBER;

==> 선택된 행 없음

--○ 커밋
COMMIT;


DELETE FROM TBL_MEMBER;
DROP SEQUENCE MEMBER_SEQ;
COMMIT;

--○ 시퀀스 생성
CREATE SEQUENCE MEMBER_SEQ
NOCACHE;
--==>> Sequence MEMBER_SEQ이(가) 생성되었습니다.

--○생성한 시퀀스를 활용한 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME , TEL) VALUES(MEMBER_SEQ.nextval, '김한국', '010-1234-5678');
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT *
FROM TBL_MEMBER;
--       SID NAME                 TEL                                               
------------ -------------------- --------------------------------------------------
--         1 김한국               010-1234-5678    


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 인원 수 조회 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBER;
--     COUNT
------------
--         1

--○ 한 줄 구성 
SELECT COUNT(*) AS COUNT FROM TBL_MEMBER;

--○ 전체 리스트 조회 쿼리문 구성
SELECT SID, NAME, TEL
FROM TBL_MEMBER
ORDER BY SID;

--○ 한 줄 구성  
SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID;
/*       SID NAME                 TEL                                               
---------- -------------------- --------------------------------------------------
         1 김한국               010-1234-5678   
*/