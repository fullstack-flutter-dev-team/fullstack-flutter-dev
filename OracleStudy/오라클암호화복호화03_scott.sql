SELECT USER
FROM DUAL;
--==>> SCOTT

--------------------------------------------------------------
-- ▣▣▣ 오라클암호화복호화03_scott ▣▣▣

SELECT *
FROM TAB;

--○ 실습 테이블 생성
-- 테이블 명: TBL_EXAM
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(30)
);
--Table TBL_EXAM이(가) 생성되었습니다.

--○ 데이터 입력(암호화x)
INSERT INTO TBL_EXAM(ID,PW) VALUES(1,'super1234');

--○ 확인
SELECT *
FROM TBL_EXAM;
/* 
        ID PW                            
---------- ------------------------------
         1 super1234    
*/
--○ 롤백
ROLLBACK;
--==>> 롤백 완료.

--○ 다시 데이터 입력(→ 암호화/복호화 패키지의 함수를 활용)
INSERT INTO TBL_EXAM(ID,PW) VALUES(1, CRYPTPACK.ENCRYPT('super1234','superman'));


--○ 확인
SELECT *
FROM TBL_EXAM;
/* 

        ID PW                            
---------- ------------------------------
         1 i�����
*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.

--○ 테스트 및 관찰
SELECT ID, PW
FROM TBL_EXAM;
--==>> 1 i�����

--○ 데이터 조회(복호화)
SELECT ID, CRYPTPACK.DECRYPT(PW,'superman') AS PW
FROM TBL_EXAM;
--==>> 1 super1234

SELECT ID, CRYPTPACK.DECRYPT(PW,'batman') AS PW
FROM TBL_EXAM;
--==>> 1 Y��sfp���

SELECT ID, CRYPTPACK.DECRYPT(PW,'spiderman') AS PW
FROM TBL_EXAM;
--==>> 1 l�/�X6T):�




--
-----
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

