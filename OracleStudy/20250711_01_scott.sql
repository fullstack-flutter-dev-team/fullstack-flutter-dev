--/*================[ 7월 10일(목) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.




--▣  TBL_SAWON 테이블 백업(→ 데이터 복사 2025-07-11 09:05:19)
-- 테이블 명 : TBL_SAWONBACKUP
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
-- ==>>  Table TBL_SAWONBACKUP이(가) 생성되었습니다.
-- ==> TBL_SAWON 테이블만 백업을 수행
--      즉, 다른 이름의 테이블 형태로 저장해둔 상황


--▣ 확인
SELECT *
FROM TBL_SAWONBACKUP;
SELECT *
FROM TBL_SAWON;

--▣ 상황 발생
UPDATE TBL_SAWON
SET SANAME= '똘똘이';
COMMIT;

-- SELECT *
-- FROM TBL_SAWON;

-- ROLLBACK;

-- SELECT *
-- FROM TBL_SAWON;

-- 위와 같이 UPDATE 처리 이후에 함께 COMMIT 을 수행하였기 때문에
-- ROLLBACK 은 불가능한 상황이다.
-- 하지만, TBL_SAWONBACKUP 테이블에 데이터를 백업해 두었다.
-- SANAME 컬럼의 내용만 추출하여 '똘똘이' 대신 넣어줄 수 있다는 것이다.

-- UPDATE
-- SET SANAME = 'SSS'
-- WHERE SANO = 1001;

-- UPDATE
-- SET SANAME = 'KKK'
-- WHERE SANO = 1002;
--  ：
--  ：

UPDATE TBL_SAWON
SET SANAME = ( SELECT SANAME
               FROM TBL_SAWONBACKUP SB
               WHERE SB.SANO = TBL_SAWON.SANO);

COMMIT;

-- UPDATE TBL_SAWON
-- SET SANAME = (SELECT SB.SANAME
--               FROM TBL_SAWONBACKUP SB 
--               WHERE SB.SANO = SANO)
-- WHERE (SELECT SANO 
--        FROM TBL_SAWON);



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
