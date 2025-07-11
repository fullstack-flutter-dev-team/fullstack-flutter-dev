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
-- 1. PL/SQL (Procedual Language extension to SQL) 은
--    프로그래밍 언어의 특성을 가지는 sql 의 확장이며, 
--    데이터 조작과 질의 문장은 pl/sql 의 절차적 코드 안에 포함된다,
--    또한 pl/sql 을 사용하려면 sql로 할 수 없는 절차적 작업이 가능하다.
--    여기에서 절차적 이라는 단어가 가지는 의미는 어떤 것이 어떤 과정을
--    거쳐 어떻게 완료되는지 그 방법을 정확하게 코드에 기술한다는 것을 의미한다


-- 2. pl/sql 은 절차적으로 표현하기 위해 변수를 선언할 수 있는 기능,
--    참과 거짓을 구별할 수 있는 기능,
--    실행 흐름을 컨트롤 할 수 있는 기능들을 제공 한다,

-- 3. PL/SQL 은 블럭 구조로 되어있으며
--    블럭은 선언/ 실행 / 예외처리 부분의 세 부분으로 구성되어 있다.
--    또한, 반드시 실행 부분은 존재해야 하며, 구조는 다음과 같다

-- 4. 형식 및 구조
/*
  [DECLARE]
      --선언문(DECLATATIONS)
  BEGIN
      --실행문(STATEMENT)
      [EXCEPTION]
      --예외처리문(EXCEPTION HANDLERS)
  
  END;
*/

--(엄밀히 따지면 예외처리문은 실행문에 포함되는 것)


--5. 변수 선언

/*
  DECLARE
      변수명 자료형;
      변수명 자료형 := 초기값; (:=이게 대입연산자이다 . 우측에 있는걸 좌측으로 )
      
  BEGIN
      PL/SQL구문;
  END;
*/

/*
이미지로 이해하기로는 := <= 이렇게 이해하면 된다 이런애는 없어요
이렇게 작성했다고 이렇게 한다 아니에요 자바와 같이 우를 좌에 대입하는데
그 약속이 이렇게 구성되어 있다, 처리하는실행구문을 작성하게됩니다
써봅시다 
*/


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
--     IF ~ THEN ~ ELSIF ~ THEN ~ ELSIF ~ THEN ~ ELSE ~ END IF;

--  1. PL/SQL 의 IF 문장은 다른 언어의 IF 조건문과 거의 유사하다.
--     일치하는 조건에 따라 선택적으로 작업을 수행할 수 있도록 한다.
--     TRUE 이면 THEN 과 ELSE 사이의 문장을 수행하고
--     FALSE 이거나 NULL 이면 ELSE 와 END 사이의 문장을 수행하게 된다.

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

--▣  CASE문(조건문)
--  CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. 형식 및 구조
/*
  CASE 변수
      WHEN 값1
          THEN 실행문;
      WHEN 값2
          THEN 실행문;
      ELSE
          실행문;
  END CASE; 
*/

--▣ 변수에 들어있는 값에 따라...
-- Excellent, Good, Fail 로 구분하여
-- 결과를 출력하는 PL/SQL 구문을 작성한다.

DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'A';
    CASE GRADE
        WHEN 'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
        ELSE DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
/*
Excellent

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


 --※ 외부 입력 처리
/* 
  1. ACCEPT 문
     - ACCEPT 변수명 PROMPT '메세지';
     - 외부 변수로부터 입력받은 데이터를 내부 변수에 전달할 때
       『&외부변수명 형태로 접근하게 된다.
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



--▣ 사용자로부터 입력받은 금액을 화폐 단위로 출력하는 프로그램을 작성한다.
--   단, 반환 금액은 편의상 1천원 미만, 10원 이상만 가능하다고 가정한다.
--   실행 예)
--     바인딩 변수 입력 대화창 -> 금액 입력 : 980
--     
--     입력받은 금액 총액 : 980원
--     화폐단위 : 5백원 1, 백원 4, 오십원 1, 십원 3

ACCEPT VAR1 PROMPT ' 금액 입력 : ';

DECLARE
    TOTAL   NUMBER := &VAR1; 
    FHUN    NUMBER := TRUNC(&VAR1/500);
    HUN     NUMBER := TRUNC(MOD(&VAR1,500)/100);
    FIF     NUMBER := TRUNC(MOD(MOD(&VAR1,500),100)/50);
    TEN     NUMBER := MOD(MOD(MOD(&VAR1,500),100),50)/10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('입력받은 금액 총액 : ' || TOTAL||'원');
    DBMS_OUTPUT.PUT_LINE('오백원 : ' || FHUN ||' 백원 : ' || HUN || '  오십원 : ' || FIF || '  십원 : ' ||TEN ); 
END;
/*
입력받은 금액 총액 : 990원
오백원 : 1 백원 : 4  오십원 : 1  십원 : 4

PL/SQL 프로시저가 성공적으로 완료되었습니다.
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

--▣ 기본 반복문
--▣ LOOP 반복문
-- LOOP ~ END LOOP;
-- 1. 조건과 상관없이 무조건 반복하는 구문.
-- 2. 형식 및 구조
    -- *EXIT는 반복문에서 구성되는 것이 아니라, 반복문을 빠져나가기 위해 수행하는 것*
/*
LOOP
    -- 실행문
    
    EXIT WHEN 조건;   -- 조건이 참인 경우 반복문을 빠져나간다.
END LOOP;
*/


-- 1 부터 10 까지의 수 출력(LOOP문 활용)
DECLARE
    N   NUMBER;
BEGIN
    N := 1;
    
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        
        EXIT WHEN N>=10;
        N := N+1;           -- N++; N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
*/

--▣ WHILE 반복문
-- WHILE LOOP ~ END LOOP;
-- *와일, 루프시작했다, 엔드, 루프끝났다~*
 
-- 1. 제어 조건이 TRUE 인 동안 일련의 문장을 반복하기 위해
--      WHILE LOOP 구문을 사용한다.
--      조건은 반복이 시작되는 시점에 체크하게 되어
--      LOOP 내의 문장이 한 번도 수행되지 않을 경우도 있다.
--      LOOP 를 시작할 때 조건이 FALSE 이면, 반복 문장을 탈출하게 된다.
 
-- 2. 형식 및 구조
/*
WHILE 조건 LOOP   -- 조건이 참인 경우 반복 수행
    -- 실행문;
END LOOP;
*/
 
-- 1부터 10 까지의 수 출력(WHILE LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    
    WHILE N<10 LOOP
        N := N+1;
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


--▣ FOR 반복문
-- FOR LOOP ~ END LOOP;
-- *FOR문보다 향상된 FOR문에 가까움*
/*
FOR(INT N : 자료구조)
 
*/
 
-- 1. <시작수>에서 1씩 증가하여 <끝냄수> 가 될 때까지 반복 수행한다.
 
-- 2. 형식 및 구조
/*
FOR 카운터 LOOP 시작수.. 끝냄수 LOOP
    -- 실행문;
END LOOP
*/
 
-- 1 부터 10 까지의 수 출력(FOR LOOP 문 활용)
DECLARE
    N NUMBER;
BEGIN
    FOR N IN 1 .. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/*
1
2
3
4
5
6
7
8
9
10
 
 
PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
 


--▣ 사용자로부터 임의의 단(구구단)을 입력받아
--    해당 단수의 구구단을 출력하는 PL/SQL 구문을 작성한다.
--    LOOP, WHILE LOOP, FOR LOOP 를 통해 해결한다.
/*
2 * 1 = 2
2 * 2 = 2
    :
2 * 9 = 18
*/

-- 1. LOOP 문의 경우
ACCEPT INPUT_DAN PROMPT '단을 입력하세요.';

DECLARE
   -- 
   DAN NUMBER := &INPUT_DAN;
   NUM1 NUMBER := 1;
BEGIN
   --
   DBMS_OUTPUT.PUT_LINE(DAN || ' - DAN');
   LOOP
      DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || NUM1 || ' = ' || (DAN*NUM1));
      NUM1 := NUM1+1;
      EXIT WHEN NUM1 > 9;
   END LOOP;

END;

-- 2. WHILE-LOOP 문의 경우
ACCEPT INPUT_DAN PROMPT '단을 입력하세요.';

DECLARE
   DAN NUMBER := &INPUT_DAN;
   NUM1 NUMBER := 1;
BEGIN
   WHILE NUM1 < 9 LOOP
      NUM1 := NUM1+1;
      DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || NUM1 || ' = ' || (DAN*NUM1));
   END LOOP;
END;

-- 3. FOR-LOOP 문의 경우
ACCEPT INPUT_DAN PROMPT '단을 입력하세요.';
DECLARE
   DAN NUMBER := &INPUT_DAN;
   NUM1 NUMBER := 1;
BEGIN

END;


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
