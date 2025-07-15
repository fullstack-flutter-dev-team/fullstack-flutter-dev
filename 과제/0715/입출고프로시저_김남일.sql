--/*================[ 7월 15일(화) ]========================*/
-- SELECT USER
-- FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

--▣ TBL_입고 테이블에서 입고수량을 수정(변경)하는 프로시저를 작성한다.
-- 프로시저명 : PRC_입고_UPDATE(입고번호, 변경할입고수량)
CREATE OR REPLACE PROCEDURE PRC_입고_UPDATE
( V_입고번호        IN TBL_입고.입고번호%TYPE
, V_변경할입고수량   IN TBL_입고.입고수량%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_상품코드   TBL_상품.상품코드%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    V_입고수량   TBL_입고.입고수량%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT 상품코드 INTO V_상품코드
    FROM TBL_입고 
    WHERE 입고번호 = V_입고번호;

    SELECT NVL(재고수량, 0) INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    SELECT NVL(입고수량, 0) INTO V_입고수량
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;

    DBMS_OUTPUT.PUT_LINE('V_입고수량 : ' || V_입고수량);
    DBMS_OUTPUT.PUT_LINE('V_변경할입고수량 : ' || V_변경할입고수량);
    DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
    DBMS_OUTPUT.PUT_LINE('V_입고수량- V_변경할입고수량 : ' || (V_입고수량- V_변경할입고수량));

    IF ((V_입고수량- V_변경할입고수량) > V_재고수량)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ① UPDATE → TBL_입고
    UPDATE TBL_입고
    SET 입고수량 = V_변경할입고수량      -- CHECK~!!!
    WHERE 입고번호 = V_입고번호;

    -- ② UPDATE → TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - (V_입고수량 - V_변경할입고수량)    -- CHECK~!!!
    WHERE 상품코드 = V_상품코드;

    -- 커밋
    COMMIT;

    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, ' 입고수량 변경 불가~!!!');
                ROLLBACK;

        WHEN OTHERS 
            THEN ROLLBACK;
END;
-- ==>> Procedure PRC_입고_UPDATE이(가) 컴파일되었습니다.

---------------------

--▣ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
-- 프로시저명 : PRC_출고_DELETE(출고번호)
CREATE OR REPLACE PROCEDURE PRC_출고_DELETE
( 
      V_출고번호   IN TBL_출고.출고번호%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_상품코드   TBL_상품.상품코드%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    V_출고수량   TBL_출고.출고수량%TYPE;

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT NVL(출고수량, 0), 상품코드 INTO V_출고수량, V_상품코드
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;

    SELECT NVL(재고수량, 0) INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    DBMS_OUTPUT.PUT_LINE('V_상품코드 : ' || V_상품코드);
    DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
    DBMS_OUTPUT.PUT_LINE('V_출고수량 : ' || V_출고수량);
    DBMS_OUTPUT.PUT_LINE('V_재고수량 + V_출고수량 : ' || (V_재고수량 + V_출고수량));

    IF (FALSE)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ① DELETE → TBL_출고
    DELETE 
    FROM TBL_출고
    WHERE 출고번호 = V_출고번호;

    -- ② UPDATE → TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 + V_출고수량    -- CHECK~!!!
    WHERE 상품코드 = V_상품코드;

    -- 커밋
    COMMIT;

    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, ' 출고수량 삭제 불가~!!!');
                ROLLBACK;

        WHEN OTHERS 
            THEN ROLLBACK;

END;
-- ==>> Procedure PRC_출고_DELETE이(가) 컴파일되었습니다.

---------------------

--▣ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
-- 프로시저명 : PRC_입고_DELETE(입고변호)
CREATE OR REPLACE PROCEDURE PRC_입고_DELETE
( 
    V_입고번호        IN TBL_입고.입고번호%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_상품코드   TBL_상품.상품코드%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    V_입고수량   TBL_입고.입고수량%TYPE;

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    SELECT NVL(입고수량, 0), 상품코드 INTO V_입고수량, V_상품코드
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;

    SELECT NVL(재고수량, 0) INTO V_재고수량
    FROM TBL_상품
    WHERE 상품코드 = V_상품코드;

    DBMS_OUTPUT.PUT_LINE('V_입고수량 : ' || V_입고수량);
    DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
    DBMS_OUTPUT.PUT_LINE('V_재고수량 - V_입고수량 : ' || (V_재고수량 - V_입고수량));

    IF ((V_재고수량 - V_입고수량) < 0)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- ① DELETE → TBL_입고
    DELETE 
    FROM TBL_입고
    WHERE 입고번호 = V_입고번호;
    
    -- ② UPDATE → TBL_상품
    UPDATE TBL_상품
    SET 재고수량 = 재고수량 - V_입고수량    -- CHECK~!!!
    WHERE 상품코드 = V_상품코드;

    -- 커밋
    COMMIT;

    -- 예외처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20005, ' 입고수량 삭제 불가~!!!');
                ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;

END;
-- ==>> Procedure PRC_입고_DELETE이(가) 컴파일되었습니다.




-----------------------------------------------------------------
--▣ 생성한 프로시저(PRC_입고_UPDATE)가 제대로 작동하는지의 여부 확인
SELECT *
FROM TBL_입고
WHERE 입고번호 = 16;
-- 입고 30

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'E003';
-- 재고 - 20

EXEC PRC_입고_UPDATE(16, 5);
-- ==>> ORA-20003:  입고수량 변경 불가~!!!

EXEC PRC_입고_UPDATE(16, 19);
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
/* 
V_입고수량 : 30
V_변경할입고수량 : 19
V_재고수량 : 20
V_입고수량- V_변경할입고수량 : 11
 */

--- 확인
SELECT *
FROM TBL_입고
WHERE 입고번호 = 16;
-- 입고수량 19

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'E003';
-- 재고수량 9


-----------------------------------------------------------------
--▣ 생성한 프로시저(PRC_출고_DELETE)가 제대로 작동하는지의 여부 확인
SELECT *
FROM TBL_출고
WHERE 출고번호 = 2;
/* 
      출고번호 상품코드            출고일자   출고수량       출고단가
---------- -------------------- ---------- ---------- ----------
         2 C002                 2025-07-15          5       1500
*/

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'C002';
/* 
상품코드                 상품명          소비자가격       재고수량
-------------------- ------------------- ---------- ----------
C002                 빼빼로                    1800         15
 */

EXEC PRC_출고_DELETE(2);
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
/* 
V_상품코드 : C002
V_재고수량 : 15
V_출고수량 : 5
V_재고수량 + V_출고수량 : 20
 */

--- 확인
SELECT *
FROM TBL_출고
WHERE 출고번호 = 2;
-- ==>> 선택된 행 없음
 
SELECT *
FROM TBL_상품
WHERE 상품코드 = 'C002';
/* 
상품코드                 상품명         소비자가격       재고수량
-------------------- ------------------- ---------- ----------
C002                 빼빼로                    1800         20
 */


-----------------------------------------------------------------
--▣ 생성한 프로시저((PRC_입고_DELETE)가 제대로 작동하는지의 여부 확인
SELECT *
FROM TBL_입고
WHERE 입고번호 = 11;
/* 

      입고번호 상품코드            입고일자   입고수량       입고단가
---------- -------------------- ---------- ---------- ----------
        11 C003                 2025-07-14         30       1000
*/

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'C003';
/* 

상품코드                 상품명          소비자가격    재고수량
-------------------- ----------------- ---------- ----------
C003                 초코칩                  1800         10
*/

-- 의도적 예외 발생
EXEC PRC_입고_DELETE(11);
-- ==>> ORA-20005:  입고수량 삭제 불가~!!!

-- 확인 
SELECT *
FROM TBL_입고
WHERE 입고번호 = 11;
/* 
      입고번호 상품코드           입고일자       입고수량     입고단가
---------- -------------------- ---------- ---------- ----------
        11 C003                 2025-07-14         30       1000
 */


--- 확인(PRC_입고_DELETE)
SELECT *
FROM TBL_입고
WHERE 입고번호 = 1;
/* 
   입고번호 상품코드        입고일자    입고수량    입고단가
---------- -------------- ---------- ---------- ----------
         1 H001           2025-07-14         10       1000
*/

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'H001';
/* 
상품코드                 상품명             소비자가격    재고수량
-------------------- ------------------- ---------- ----------
H001                 홈런볼                    1500         25
 */

--- 확인(PRC_입고_DELETE)
EXEC PRC_입고_DELETE(1);
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
/* 
V_입고수량 : 10
V_재고수량 : 25
V_재고수량 - V_입고수량 : 15
 */


--- 확인(PRC_입고_DELETE)
SELECT *
FROM TBL_입고
WHERE 입고번호 = 1;
-- ==>> 선택된 행 없음

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'H001';
/* 
상품코드                 상품명       소비자가격       재고수량
-------------------- --------------- ---------- ----------
H001                 홈런볼                1500         15
*/

-----------------------------------------------------------------------------------