SELECT USER
FROM DUAL;
--==>> SCOTT

----------------------
DESC TBL_MEMBERLIST;
--==>> 
/*
이름    널?       유형            
----- -------- ------------- 
ID    NOT NULL VARCHAR2(30)  
PW    NOT NULL VARCHAR2(50)  
NAME  NOT NULL VARCHAR2(50)  
TEL   NOT NULL VARCHAR2(50)  
EMAIL          VARCHAR2(100) 
*/

DROP TABLE TBL_MEMBERLIST;
--==>> Table TBL_MEMBERLIST이(가) 삭제되었습니다.

--○ 실습 테이블 다시 생성
-- 테이블명: TBL_MEMBERLIST
CREATE TABLE TBL_MEMBERLIST
( MID       NUMBER
, NAME      VARCHAR2(30)
, TELEPHONE VARCHAR2(50)
, CONSTRAINT MEMBERLIST_MID_PK PRIMARY KEY(MID)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.


--○ 시퀀스 생성(MEMBERLISTSEQ)
-- 시퀀스명 : MEMBERLISTSEQ
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
--==>> Sequence MEMBERLISTSEQ이(가) 생성되었습니다.

--○ 입력 쿼리문 구성 및 샘플 데이터 입력
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)
VALUES(MEMBERLISTSEQ.NEXTVAL, '김한국', '010-1111-2222');

--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '이하나', '010-2222-33333')
;
--==>> 1 행 이(가) 삽입되었습니다.

--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) VALUES(MEMBERLISTSEQ.NEXTVAL, '삼한국', '010-3333-4444')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
--> 한 줄 구성
SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST ORDER BY MID
;
--==>>
/*
  MID NAME          TELEPHONE      
-------- ------------- ---------------
   1 김한국        010-1111-2222  
   2 이하나        010-2222-33333 
   3 삼한국        010-3333-4444  
*/

-- 업데이트
UPDATE TBL_MEMBERLIST
SET NAME='육길동', TELEPHONE='010-6666-7777'
WHERE MID=6;
/*
  MID NAME          TELEPHONE      
-------- ------------- ---------------
   1 김한국        010-1111-2222  
   2 이하나        010-2222-3333 
   3 삼한국        010-3333-4444  
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 인원 수 조회 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST;

--> 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST
;
--==>> 3

-------------------------------------------------------------------------------------