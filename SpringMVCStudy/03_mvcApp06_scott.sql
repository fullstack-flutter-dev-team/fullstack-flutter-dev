SELECT USER
FROM DUAL;
--==>> SCOTT
-------------------------------------------------------------------------------------
-- mvcApp06_scott.sql

--○ 기존 테이블 제거
DROP TABLE TBL_MEMBERLIST;

--○ 실습 테이블 다시 생성
-- 테이블명 : TBL_MEMBERLIST
-- 컬럼명 : ID, PW, NAME, TEL, EMAIL
CREATE TABLE TBL_MEMBERLIST
( ID    VARCHAR2(30)
, PW    VARCHAR2(20)
, NAME  VARCHAR2(50)
, TEL   VARCHAR2(50)
, EMAIL VARCHAR2(100)
, CONSTRAINT MEMBERLIST_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_MEMBERLIST이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)
VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$')
        ,'김한국', '010-1233-3344', 'korea@test.com');
--==>> 1 행 이(가) 삽입되었습니다.

--> 한 줄 구성
INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) VALUES('admin', CRYPTPACK.ENCRYPT('java006$', 'java006$'),'김한국', '010-1233-3344', 'korea@test.com')
;

set linesize 20;

--○확인
SELECT *
FROM TBL_MEMBERLIST;
/* 

ID                             PW                   NAME                                               TEL                                                EMAIL                                                                                               
------------------------------ -------------------- -------------------------------------------------- -------------------------------------------------- ----------------------------------------------------------------------------------------------------
admin                          �?�^               김한국                                             010-1233-3344                                      korea@test.com                                                                                      

*/

--○커밋
COMMIT;
--==>> 커밋 완료.

--○ 리스트 조회 쿼리문 구성
SELECT ID, NAME, TEL, EMAIL
FROM TBL_MEMBERLIST;

--> 한 줄 구성
SELECT ID, NAME, TEL,EMAIL FROM TBL_MEMBERLIST
;-----------------------------------------------
