--/*================[ 7월 10일(목) ]========================*/
-- SELECT USER
-- FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.


--▣▣▣  PL/SQL 교재 P. ▣▣▣--
-- 1. 
--   
--   
--   
--   
--   
--   
-- 2. 
--   
--   
--   
-- 3.  
--   
--   
--   
--   
--   
-- 4. 형식 및 구조  
--   
--   
--   

SET SERVEROUTPUT ON;


--▣ 변수에 임의의 값을 대입하고 해당 변수에 담긴 값을 출력하는
--   PL/SQL 구문 작성

DECLARE
   -- 선언부
    D1 NUMBER := 10;
    D2 VARCHAR2(30) := 'HELLO';
    D3 VARCHAR2(20) := 'ORACLE...';
BEGIN
   -- 실행부
   -- System.out.println(D1);
    DBMS_OUTPUT.PUT_LINE('D1 :' || D1);
    DBMS_OUTPUT.PUT_LINE('D2 :' || D2);
    DBMS_OUTPUT.PUT_LINE('D3 :' || D3);
END;

/* 
D1 :10
D2 :HELLO
D3 :ORACLE...

PL/SQL 프로시저가 성공적으로 완료되었습니다.
 */
--▣ 변수에 임의의 값을 대입하고 추가 연산 처리하여
--   행당 변수에 담긴 출력하는 PL/SQL 구문 작성

DECLARE
    -- 선언부
    V1 NUMBER := 20;
    V2 VARCHAR2(20) := 'HELLO';
    V3 VARCHAR2(20) := 'ORACLE...';
BEGIN
    -- 실행부
    V1 := V1 + 10;  -- V1 += 10;
    V2 := V2 || ' WORLD....';
    V3 := V3 || ' DBMS....';
    DBMS_OUTPUT.PUT_LINE('V1 : ' || V1);
    DBMS_OUTPUT.PUT_LINE('V2 : ' || V2);
    DBMS_OUTPUT.PUT_LINE('V3 : ' || V3);
END;

/* 
V1 : 30
V2 : HELLO WORLD....
V3 : ORACLE... DBMS....

PL/SQL 프로시저가 성공적으로 완료되었습니다.
 */


-----------------------------------------------------
--▣  IF문(조건문)
--     IF ~ END IF;
--     IF ~ THEN ~ ELSE ~ END IF;
--     IF ~ THEN ~ ELSIF ~ THEN ~ ELSIF END IF;

--  1.PL/SQL 의 IF 문장은 다른  언어의 IF 조건문과 거의 유사하다.
--    일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--    TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고
--    FALSE 이거나 NULL 이면 ELSE 와 END 사이의 문장을 수행하게 된다.

--  2. 형식 및 구조  
--    
--    
/* 
IF 조건
   THEN 처리구문;
END IF;
 */

/* 
IF 조건
   THEN 처리구문;
ELSE
   처리구문;
END IF;
 */

/* 
IF 조건
   THEN 처리구문;
ELSIF 조건
   THEN 처리구문;
ELSIF 조건
   THEN 처리구문;
ELSE
   처리구문;
END IF;
 */
--  ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ 
/* 
IF (조건)
   THEN 처리구문;
ELSIF (조건)
   THEN 처리구문;
ELSIF (조건)
   THEN 처리구문;
ELSE
   처리구문;
END IF;
 */

--▣ 변수에 담겨있는 값에 따라...
--   Excellent, Good, Fail로 구분하여
--   결과를 출력하는 PL/SQL 구문을 작성한다.
--   

DECLARE
    GRADE CHAR;
BEGIN
    -- GRADE := 'A';
    GRADE := 'B';
    -- GRADE := 'A';

    IF (GRADE = 'A')
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF (GRADE = 'B')
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;

/* 
Excellent
Good
Fail

PL/SQL 프로시저가 성공적으로 완료되었습니다.
 */


 --※ 외부 입력 처리
/* 
   1. ACCEPT 문
     A
     
     
     
     
     


 */

 --▣ 정수 2개를 외부로부터(사용자로부터) 입력받아
 --   이들의 덧셈 연산 결과를 출력하는 PL/SQL 구문을 작성한다.

ACCEPT N1 PROMPT '첫 번째 정수를 입력하세요.';
ACCEPT N2 PROMPT '두 번째 정수를 입력하세요.';

DECLARE
    -- 선언부
    --  -> 주요 변수 선언 및 초기화
    -- VNUM1 NUMBER := 10;
    VNUM1 NUMBER := &N1;
    -- VNUM2 NUMBER := 20;
    VNUM2 NUMBER := &N2;
    VRESULT NUMBER := 0;
BEGIN
    -- 실행부
    --  -> 연산 및 처리
    VRESULT := VNUM1 + VNUM2;

    --  -> 결과 처리
    DBMS_OUTPUT.PUT_LINE(VRESULT);
END;



--▣
/* 
     사용자로부터 입력받은 금액을 화폐 단위로 출력하는 프로그램을 작성한다.
      단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
      
      실행 예)
        바인딩 변수 입력 대화창 -> 금액 입력 : 980
        
        입력받은 금액 총액 : 980원
        화폐단위 : 5백원 1, 백원 4, 오십원 1, 십원 3
 */

 ACCEPT INPUT PROMPT '금액 입력';

DECLARE
    -- 주요 변수 선언 및 초기화
    MONEY NUMBER := &INPUT;    -- 연산을 위해 담아둘 변수
    MONEY2 NUMBER := &INPUT;   -- 출력을 위해 담아둘 변수 (-> 연산 과정에서 값이 변하기 때문에..)

    M500  NUMBER;              -- 500원 짜리 갯수를 담아둘 변수
    M100  NUMBER;              -- 100원 짜리 갯수를 담아둘 변수
    M50   NUMBER;              --  50원 짜리 갯수를 담아둘 변수
    M10   NUMBER;              --  10원 짜리 갯수를 담아둘 변수
BEGIN
    -- 연산 및 처리
    --------------
    -- MONEY를 500으로 나눠서 몫을 취하고 나머지는 버린다.  --- 500원의 갯수
    M500 := TRUNC(MONEY/500);
    -- MONEY를 500으로 나눠서 몫을 버리고 나머지를 취한다.  --- 500원의 갯수를 뺀 나머지
    MONEY := MOD(MONEY/500);
    --------------
    -- MONEY를 100으로 나눠서 몫을 취하고 나머지는 버린다.  --- 100원의 갯수
    M100 := TRUNC(MONEY/100);
    -- MONEY를 100으로 나눠서 몫을 버리고 나머지를 취한다.  --- 100원의 갯수를 뺀 나머지
    MONEY := MOD(MONEY/100);

    --------------
    -- MONEY를 50으로 나눠서 몫을 취하고 나머지는 버린다.  --- 50원의 갯수
    M50 := TRUNC(MONEY/50);
    -- MONEY를 50으로 나눠서 몫을 버리고 나머지를 취한다.  --- 50원의 갯수를 뺀 나머지
    MONEY := MOD(MONEY/50);

    --------------
    -- MONEY를 10으로 나눠서 몫을 취하고 나머지는 버린다.  --- 10원의 갯수
    M10 := TRUNC(MONEY/10);
    -- MONEY를 10으로 나눠서 몫을 버리고 나머지를 취한다.  --- 10원의 갯수를 뺀 나머지
    MONEY := MOD(MONEY/10);

    -- 결과 출력
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || MONEY2 || '원');
    DBMS_OUTPUT.PUT_LINE('화폐단위 : 오백원 : ' || M500
                        || ', 백원 : '   || M100
                        || ', 오십원 : ' || M50
                        || ', 십원 : '   || M10);
END;


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
