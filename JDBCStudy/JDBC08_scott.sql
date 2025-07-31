SELECT USER FROM DUAL;
/* 
USER
------------------------------
SCOTT
*/


SELECT *
FROM TBL_MEMBER
ORDER BY SID;
/* 
      SID NAME                 TEL                                               
---------- -------------------- --------------------------------------------------
         6 김한국               010-1111-1234                                     
         7 김한국-2             010-2222-1234                                     
         8 김한국-3             010-3333-1234                                     
         9 김한국-4             010-4444-1234                                     
        10 김한국-5             010-5555-1234     
*/

-- 회원 데이터 입력 쿼리문 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL)
VALUES(11, '김한국-11', '010-1111-5678');

-- 한 줄 구성
INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(11, '김한국-11', '010-1111-5678');

--
COMMIT;

-- 확인 (JDBC08 Test04.java 실행 후)
SELECT *
FROM TBL_MEMBER
ORDER BY SID;

-- 전체 리스트 조회 쿼리문
SELECT *
FROM TBL_MEMBER
ORDER BY SID;

-- 한 중 구문
SELECT SID, NAME, TEL  FROM TBL_MEMBER ORDER BY SID;