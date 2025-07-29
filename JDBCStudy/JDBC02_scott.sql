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

-- 롤백
ROLLBACK;
-- ==>> 롤백 완료.

COMMIT;