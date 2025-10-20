SELECT USER
FROM DUAL;
--==>> SCOTT
-------------------------------------------------------------------------------------
-- 06_mybatisApp02_scott

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBERLIST;

--○ 실습 테이블 다시 생성
-- 테이블명 : TBL_MEMBERLIST
-- 컬럼명 : ID, PW, NAME, TEL, EMAIL
CREATE TABLE TBL_MEMBERLIST
( MID          NUMBER
, NAME         VARCHAR2(30)
, TELEPHONE    VARCHAR2(40)
, CONSTRAINT MEMBERLIST_MID_PK PRIMARY KEY(MID)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.


--○ 기존 시퀀스 제거
DROP SEQUENCE MEMBERLISTSEQ;
--==>> Sequence MEMBERLISTSEQ이(가) 삭제되었습니다.

--○ 실습 시퀀스 생성(MEMBERLISTSEQ)
-- 시퀀스 명 : MEMBERLISTSEQ
CREATE SEQUENCE MEMBERLISTSEQ
NOCACHE;
--==>> Sequence MEMBERLISTSEQ이(가) 생성되었습니다.


--○ 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE) 
VALUES(MEMBERLISTSEQ.NEXTVAL, '김한국', '010-1111-2222')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인(리스트 조회 쿼리문 구성)
SELECT MID, NAME, TELEPHONE
FROM TBL_MEMBERLIST
ORDER BY MID;
/* 
       MID NAME                           TELEPHONE                               
---------- ------------------------------ ----------------------------------------
         1 김한국                         010-1111-2222 
*/


--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 인원 수 확인
SELECT COUNT(*) AS COUNT
FROM TBL_MEMBERLIST
;
--==>> 1
