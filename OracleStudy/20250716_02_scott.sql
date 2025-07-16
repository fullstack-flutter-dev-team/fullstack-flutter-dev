--/*================[ 7월 16일(수) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

-- 
-- SET SERVEROUTPUT ON;

SELECT EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP))
FROM DUAL;


--

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1,'김하나','010-1111-1111');
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2,'김한국','010-1221-2211');
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(3,'이이상','010-3331-1331');
-- ==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME = '최하나'
WHERE ID=1;
-- ==>> 1 행 이(가) 업데이트되었습니다.

UPDATE TBL_TEST1
SET NAME = '최한국'
WHERE ID=2;
-- ==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID = 3;
-- ==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID = 2;
-- ==>> 1 행 이(가) 삭제되었습니다.


DELETE
FROM TBL_TEST1
WHERE ID = 1;
-- ==>> 1 행 이(가) 삭제되었습니다.

--
COMMIT;

-- 시간을 오전 8시 이전으로 변경 후 DML 실행
SELECT *
FROM TBL_TEST1;
-- ==>> 선택된 행 없음

INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(1,'김하나','010-1111-1111');
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2,'김한국','010-1221-2211');
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(3,'이이상','010-3331-1331');
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.

-- 시간을 오후 18시 이후로 변경 후 DML 실행
SELECT *
FROM TBL_TEST1;
/* 
        ID NAME                           TEL                                                         
---------- ------------------------------ ------------------------------------------------------------
         1 김하나                         010-1111-1111                                               
         2 김한국                         010-1221-2211                                               
         3 이이상                         010-3331-1331                                               
 */

UPDATE TBL_TEST1
SET NAME = '김하나'
WHERE ID=1;
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


UPDATE TBL_TEST1
SET NAME = '최한국'
WHERE ID=2;
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


DELETE
FROM TBL_TEST1
WHERE ID = 3;
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


DELETE
FROM TBL_TEST1
WHERE ID = 2;
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.



DELETE
FROM TBL_TEST1
WHERE ID = 1;
-- ==>> SQL 오류: ORA-20003: 작업은 08: ~ 18:00 까지만 가능합니다.


SELECT *
FROM TBL_TEST1;
/* 
        ID NAME                           TEL                                                         
---------- ------------------------------ ------------------------------------------------------------
         1 김하나                         010-1111-1111                                               
         2 김한국                         010-1221-2211                                               
         3 이이상                         010-3331-1331                                               
 */




SELECT *
FROM TBL_EVENTLOG;



-------------------------

-- 실습 테이블:  - 부모 테이블
CREATE TABLE TBL_TEST2
( CODE NUMBER
, NAME VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK PRIMARY KEY(CODE)
);
-- ==>> Table TBL_TEST2이(가) 생성되었습니다.


-- 실습 테이블:  - 자식 테이블
CREATE TABLE TBL_TEST3
( SID NUMBER
, CODE NUMBER
, SU   NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
            REFERENCES TBL_TEST2(CODE)
);
-- ==>> Table TBL_TEST3이(가) 생성되었습니다.


-- 부모 테이블에 데이터 입력
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(1, '세탁기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(2, '냉장고');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(3, '건조기');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(4, '에어컨');
INSERT INTO TBL_TEST2(CODE, NAME) VALUES(5, '제습기');
-- ==>> 1 행 이(가) 삽입되었습니다.

-- 자식 테이블에 데이터 입력
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 1, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 2, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 3, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 4, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 5, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 6, 5, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 7, 5, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 8, 4, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES( 9, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 2, 20);
-- ==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_TEST2;
/* 
      CODE NAME                                    
---------- ----------------------------------------
         1 세탁기                                  
         2 냉장고                                  
         3 건조기                                  
         4 에어컨                                  
         5 제습기                                  
 */

SELECT *
FROM TBL_TEST3;
/* 
       SID       CODE         SU
---------- ---------- ----------
         1          1         20
         2          1         20
         3          2         20
         4          1         20
         5          3         20
         6          5         20
         7          5         20
         8          4         20
         9          3         20
        10          2         20
10개 행이 선택되었습니다. 
*/


-- 커밋
COMMIT;

SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
/* 
       SID       CODE NAME                                             SU
---------- ---------- ---------------------------------------- ----------
         1          1 세탁기                                           20
         2          1 세탁기                                           20
         3          2 냉장고                                           20
         4          1 세탁기                                           20
         5          3 건조기                                           20
         6          5 제습기                                           20
         7          5 제습기                                           20
         8          4 에어컨                                           20
         9          3 건조기                                           20
        10          2 냉장고                                           20

10개 행이 선택되었습니다. 
*/


SELECT *
FROM TBL_TEST2
WHERE CODE=2;
/* 
      CODE NAME                                    
---------- ----------------------------------------
         2 냉장고                                  
 */


DELETE
FROM TBL_TEST2
WHERE CODE=2;
-- ===>> 오류 보고 - ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found

--------------------------------
--※ 트리거 작성 이후 다시 테스트
-- 부모 테이블에서 냉장고 삭제
DELETE
FROM TBL_TEST2
WHERE CODE=2;
-- ==>>  1 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_TEST2
WHERE CODE=2;
-- ==>> 선택된 행 없음

-- 커밋
COMMIT;
-- ==>> 커밋 완료.

--------------------------------------------------------
--▣ 실습 테이블 정리(AFTER ROW TRIGGER 실습을 위한 테이블) 
SELECT *
FROM TBL_상품;
/* 

상품코드                 상품명                                                                                                       소비자가격       재고수량
-------------------- ---------------------------------------------------------------------------------------------------- ---------- ----------
H001                 홈런볼                                                                                                     1500         15
H002                 새우깡                                                                                                     1200         30
H003                 스윙칩                                                                                                     1000         10
H004                 치토스                                                                                                     1100         10
H005                 포카칩                                                                                                     2000         20
H006                 감자깡                                                                                                     1000          0
H007                 고래밥                                                                                                     1800          0
C001                 오레오                                                                                                     2000          5
C002                 빼빼로                                                                                                     1800         20
C003                 초코칩                                                                                                     1800         10
C004                 에이스                                                                                                     1700         10

상품코드                 상품명                                                                                                       소비자가격       재고수량
-------------------- ---------------------------------------------------------------------------------------------------- ---------- ----------
C005                 다이제                                                                                                     2500         20
C006                 아이비                                                                                                     1300          0
C007                 아이비                                                                                                     1300          0
E001                 마이쮸                                                                                                     1000          5
E002                 엠엔엠                                                                                                     1100         20
E003                 아이셔                                                                                                     1100          9
E004                 비틀즈                                                                                                     1200         10
E005                 아폴로                                                                                                     1000         20
E006                 하리보                                                                                                     1500          0
E007                 새콜당                                                                                                     1400          0

21개 행이 선택되었습니다. 
*/

 UPDATE TBL_상품
 SET 재고수량 = 0;
-- ==>> 21개 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_상품;

COMMIT;
-- ===>> 커밋 완료.

SELECT *
FROM TBL_입고;
-- ==>> 17개 행이 선택되었습니다. 

TRUNCATE TABLE TBL_입고;  -- TRUNCATE AUTO COMMIT 적용됨, 주의...
-- ==>> Table TBL_입고이(가) 잘렸습니다.

TRUNCATE TABLE TBL_출고;
-- ==>> Table TBL_출고이(가) 잘렸습니다.

SELECT *
FROM TBL_입고;
-- ==>> 선택된 행 없음

SELECT *
FROM TBL_출고;
-- ==>> 선택된 행 없음

------------------------------------------------------
--▣ 
INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(1, 'H004', 100, 1000);
-- ==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_입고;
/* 
      입고번호 상품코드                 입고일자           입고수량       입고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25        100       1000
 */

INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(2, 'H002', 100, 1000);
-- ==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_입고;
/* 
      입고번호 상품코드                 입고일자           입고수량       입고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25        100       1000
         2 H002                 16/07/25        100       1000
*/

--
COMMIT;
-- ==>> 커밋 완료.


INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(3, 'H002', 50, 1000);
-- ==>> 1 행 이(가) 삽입되었습니다.

/* 
SELECT *
FROM TBL_입고;

      입고번호 상품코드                 입고일자           입고수량       입고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25        100       1000
         2 H002                 16/07/25        100       1000
         3 H002                 16/07/25         50       1000
*/

SELECT *
FROM TBL_상품
WHERE 상품코드='H002';
/* 
상품코드                 상품명                   소비자가격     재고수량
-------------------- -------------------------- ---------- ----------
H002                 새우깡                           1200        150
*/


SELECT *
FROM TBL_입고
WHERE 입고번호 = 1;


UPDATE TBL_입고
SET 입고수량 = 250
WHERE 입고번호 = 1;

SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 1;

DELETE FROM TBL_입고
WHERE 입고번호 = 1;


-- 확인
SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 1;
/* 
상품코드                       재고수량       입고수량
-------------------- ---------- ----------
H004                        150        250
*/

UPDATE TBL_입고
SET 입고수량 = 90
WHERE 입고번호 = 1;
-- ==>> SQL 오류: ORA-20003:  입고수량 변경 불가~!!!
/* 
V_재고수량 : 150
:OLD.입고수량 : 250
:NEW.입고수량 : 90
:OLD.상품코드 : H004
:NEW.상품코드 : H004
(:OLD.입고수량 - :NEW.입고수량) : 160
*/

UPDATE TBL_입고
SET 입고수량 = 110
WHERE 입고번호 = 1;
-- ==> 1 행 이(가) 업데이트되었습니다.
/* 
V_재고수량 : 150
:OLD.입고수량 : 250
:NEW.입고수량 : 110
:OLD.상품코드 : H004
:NEW.상품코드 : H004
(:OLD.입고수량 - :NEW.입고수량) : 140
*/

SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 1;
/* 

상품코드                       재고수량       입고수량
-------------------- ---------- ----------
H004                         10        110
*/

DELETE FROM TBL_입고
WHERE 입고번호 = 1;
-- ==>> SQL 오류: ORA-20003:  입고수량 삭제 불가~!!!
/* 
V_재고수량 : 10
:OLD.입고수량 : 110
:OLD.상품코드 : H004
(V_재고수량 - :OLD.입고수량) : -100
*/

SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 1;
/* 
상품코드                       재고수량       입고수량
-------------------- ---------- ----------
H004                         10        110
*/

---
SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 2;
/* 
상품코드                       재고수량       입고수량
-------------------- ---------- ----------
H002                        150        100
*/

DELETE FROM TBL_입고
WHERE 입고번호 = 2;
-- ==>> 1 행 이(가) 삭제되었습니다.
/* 
V_재고수량 : 150
:OLD.입고수량 : 100
:OLD.상품코드 : H002
(V_재고수량 - :OLD.입고수량) : 50
*/

SELECT 상품코드, A.재고수량, B.입고수량
FROM TBL_상품 A LEFT JOIN TBL_입고 B
USING(상품코드)
WHERE B.입고번호 = 2;
-- ==>> 선택된 행 없음

---------------------------------------
SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 1;



SELECT *
FROM TBL_출고
WHERE 입고번호 = 2;

DESC TBL_츨고;

INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(5, 'H002', 100, 1000);
INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(8, 'H004', 100, 1000);

INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(1, 'H004', 10, 1000);
INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(2, 'H002', 10, 1000);

SELECT *
FROM TBL_출고;
/* 
     출고번호 상품코드                 출고일자           출고수량       출고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25         10       1000
         2 H002                 16/07/25         10       1000
*/

SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 1;
/* 

상품코드                       재고수량       출고수량
-------------------- ---------- ----------
H004                        100         10
 */

INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(3, 'H004', 200, 1000);
-- ==>> SQL 오류: ORA-20003:  출고수량 삽입 불가~!!!

INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(3, 'H004', 20, 1000);
-- ==>> 1 행 이(가) 삽입되었습니다.

SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 1;
/* 
상품코드                       재고수량       출고수량
-------------------- ---------- ----------
H004                         80         10
*/


-------
SELECT *
FROM TBL_출고;
/* 

      출고번호 상품코드                 출고일자           출고수량       출고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25         10       1000
         2 H002                 16/07/25         10       1000
         3 H004                 16/07/25         20       1000
*/

SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 1;
/* 

상품코드                       재고수량       출고수량
-------------------- ---------- ----------
H004                         80         10
*/

UPDATE TBL_출고
SET 출고수량 = 110
WHERE 출고번호 = 1;
-- ==>> SQL 오류: ORA-20003:  출고수량 변경 불가~!!!
/* 
V_재고수량 : 80
:OLD.출고수량 : 10
:NEW.출고수량 : 110
:OLD.상품코드 : H004
:NEW.상품코드 : H004
(:NEW.출고수량 - :OLD.출고수량) : 100
(V_재고수량 + :OLD.출고수량) : 90
*/

SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 1;
/* 

상품코드                       재고수량       출고수량
-------------------- ---------- ----------
H004                         80         10
*/

UPDATE TBL_출고
SET 출고수량 = 70
WHERE 출고번호 = 1;
-- ==>> 1 행 이(가) 업데이트되었습니다.
/* 
V_재고수량 : 80
:OLD.출고수량 : 10
:NEW.출고수량 : 70
:OLD.상품코드 : H004
:NEW.상품코드 : H004
(:NEW.출고수량 - :OLD.출고수량) : 60
(V_재고수량 + :OLD.출고수량) : 90
*/

-------------------------------------------
SELECT *
FROM TBL_출고;
/* 

      출고번호 상품코드                 출고일자           출고수량       출고단가
---------- -------------------- -------- ---------- ----------
         1 H004                 16/07/25         70       1000
         2 H002                 16/07/25         10       1000
         3 H004                 16/07/25         20       1000
*/


SELECT 상품코드, A.재고수량, B.출고수량
FROM TBL_상품 A LEFT JOIN TBL_출고 B
USING(상품코드)
WHERE B.출고번호 = 3;
/* 
상품코드                       재고수량       출고수량
-------------------- ---------- ----------
H004                         20         20
*/

SELECT * 
FROM TBL_출고
WHERE 출고번호 = 3;
/* 
      출고번호 상품코드                 출고일자           출고수량       출고단가
---------- -------------------- -------- ---------- ----------
         3 H004                 16/07/25         20       1000
*/

DELETE FROM TBL_출고
WHERE 출고번호 = 3;
-- ==> 1 행 이(가) 삭제되었습니다.

SELECT 상품코드, 재고수량
FROM TBL_상품
WHERE 상품코드 = 'H004';
/* 
상품코드                       재고수량
-------------------- ----------
H004                         40
*/

 ----------------------[패키지 확인]-------------------------
--▣ 구성한 패키지가 유효한지 확인(테스트)
-- → 패키지에 논리적으로 구성된 함수 호출 확인

SELECT INSA_PACK.FN_GENDER('757575-1234566') 확인
FROM DUAL;
/* 
확인
-----
남자
 */




-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
