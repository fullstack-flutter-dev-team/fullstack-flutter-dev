--/*================[ 7월 15일(화) ]========================*/
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
SET SERVEROUTPUT ON;

--※ 실습 테이블 생성 → 『20250715_02_scott.sql』 파일 참조
-- 테이블명 : TBL_출고

--▣ TBL_출고 데이블에 데이터 입력 시(즉, 출고 이벤트 발생 시)
-- TBL_상품 테이블의 해당 상품의 재고수량이 변동되는 프로시저를 작성한다.
-- 단, 출고번호는 입고번호와 마찬가지로 자동 증가.
-- 또한 , 출고 수량이 재고 수량보다 많은 경우...
-- 출고 액션이 처리되지 않도록 구성한다. (출고가 이루어지지 않도록...)
-- 프로시저명 : PRC_출고_INSERT(상품코드, 출고수량, 출고단가)

-----------------[ 강사님 풀이 - START ] ------------------------------
DESC TBL_출고;
/* 
이름   널?       유형           
---- -------- ------------ 
출고번호 NOT NULL NUMBER       
상품코드          VARCHAR2(20) 
출고일자          DATE         
출고수량          NUMBER       
출고단가          NUMBER  
 */
 
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드   IN TBL_상품.상품코드%TYPE
, V_출고수량   IN TBL_출고.출고수량%TYPE
, V_출고단가   IN TBL_출고.출고단가%TYPE
)
IS
      -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
      V_출고번호   TBL_출고.출고번호%TYPE;
      V_재고수량   TBL_상품.재고수량%TYPE;

      -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
      -- USER_DEFINE_ERROR는 EXCEPTION TYPE이다.
      USER_DEFINE_ERROR   EXCEPTION;  -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
BEGIN
      -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
      -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

      -- 쿼리문 수행 이전에 수행여부 확인 → 해당 상품의 기존 재고 확인  → 출고수량과 비교
      SELECT NVL(재고수량, 0) INTO V_재고수량
      FROM TBL_상품
      WHERE 상품코드 = V_상품코드;

      -- DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);

      -- 출고를 정상적으로 진행해 줄 것인지에 대한 여부 확인
      -- → 파악환 재고수량보다 출고수량이 많으면... 예외발생
      IF (V_출고수량 > V_재고수량)
            -- 예외 발생
            THEN RAISE USER_DEFINE_ERROR;
      END IF;

      -- 선언한 변수에 값 담아내기
      SELECT NVL(MAX(출고번호), 0) INTO V_출고번호
      FROM TBL_출고;

      -- ① 쿼리문 구성 → INSERT → TBL_출고
      INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가 )
      VALUES(V_출고번호 + 1, V_상품코드, V_출고수량, V_출고단가);

      -- ② 쿼리문 구성 → UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 - V_출고수량      -- 재고수량 값 CHECK~!!!
      WHERE 상품코드 = V_상품코드;

      -- 예외 처리 구문
      -- 오류가, USER_DEFINE_ERROR라면...
      -- 오라클 내장 에러 함수를 호출한다.
      -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
      
      -- 커밋
      COMMIT;

    
      -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
      EXCEPTION
            WHEN USER_DEFINE_ERROR
                  -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
                  THEN RAISE_APPLICATION_ERROR(-20002, V_상품코드 || ' 재고 부족~~!!!');
                        ROLLBACK;
                        -- 잘못된 데이터를 입력했으므로, 롤백한다!

            -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
            -- 기타 다른 예외가 발생하면...
            WHEN OTHERS 
                  THEN ROLLBACK;  -- 롤백만 해라~!!

            -- 사용자 정의 예외를 여러 개 지정해서
            -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.
END;
-- ==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.

-----------------[ 강사님 풀이 - END ] --------------------------------


-----------------[ 실습 - START ] ----------------------------
DESC TBL_출고;
/* 
이름   널?       유형           
---- -------- ------------ 
출고번호 NOT NULL NUMBER       
상품코드          VARCHAR2(20) 
출고일자          DATE         
출고수량          NUMBER       
출고단가          NUMBER  
 */
 
CREATE OR REPLACE PROCEDURE PRC_출고_INSERT
( V_상품코드   IN TBL_출고.상품코드%TYPE
, V_출고수량   IN TBL_출고.출고수량%TYPE
, V_출고단가   IN TBL_출고.출고단가%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_출고번호   TBL_출고.출고번호%TYPE;
    V_재고수량   TBL_상품.재고수량%TYPE;
    
    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
      -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
      -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

      SELECT NVL(재고수량, 0) INTO V_재고수량
      FROM TBL_상품
      WHERE 상품코드=V_상품코드;

      IF (V_출고수량 > V_재고수량)
            THEN RAISE USER_DEFINE_ERROR;
      END IF;

    -- 선언한 변수에 값 담아내기
      SELECT NVL(MAX(출고번호), 0) INTO V_출고번호
      FROM TBL_출고;

      -- ① 쿼리문 구성 → INSERT
      INSERT INTO TBL_출고(출고번호, 상품코드, 출고일자, 출고수량, 출고단가 )
      VALUES(V_출고번호 + 1, V_상품코드, SYSDATE, V_출고수량, V_출고단가);
      
      -- ② UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 - V_출고수량      -- CHECK~!!!
      WHERE 상품코드 = V_상품코드;

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20001, V_상품코드 || ' 재고 수량이 모자랍니다.');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.

    -- 커밋
    COMMIT;

END;
-- ==>> Procedure PRC_출고_INSERT이(가) 컴파일되었습니다.
-----------------[ 실습 - END ] ------------------------------

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
------------------------------------------------------------------------------------
--▣ TBL_출고 테이블에서 출고수량을 변경(수정)하는 프로시저를 작성한다.
-- 프로시저명 : PRC_출고_UPDATE(출고번호, 변경할수량)
-----------------[ 강사님 풀이 - START ] ------------------------------
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( 
  -- ① 매개변수 구성
  V_출고번호   IN TBL_출고.출고번호%TYPE
, V_출고수량   IN TBL_출고.출고수량%TYPE
)
IS
      -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언

      -- ③ 주요 변수 선언
      V_상품코드   TBL_상품.상품코드%TYPE;

      -- ⑤ 주요 변수 추가 선언
      V_이전출고수량  TBL_출고.출고수량%TYPE;

      -- 8. 주요 변수 추가 선언
      V_재고수량   TBL_상품.재고수량%TYPE;
    
      -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
      -- USER_DEFINE_ERROR는 '예외타입'이다.

      -- 11. 주요 변수 추가 선언 -> 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
      USER_DEFINE_ERROR   EXCEPTION;
BEGIN
      -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
      -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

      -- ④ 상품코드 파악 / 
      SELECT 상품코드, 출고수량 INTO V_상품코드, V_이전출고수량
      FROM TBL_출고
      WHERE 출고번호 = V_출고번호;

      -- 9. 
      SELECT NVL(재고수량, 0) INTO V_재고수량
      FROM TBL_상품
      WHERE 상품코드 = V_상품코드;

      -- 10. 파악한 재고수량, 이전출고수량, 출고수량에 따라 데이터 변경 실시 가능여부 판단
      -- -> [재고수량 + 이전출고수량 < 현재출고수량] 인 상황이라면...예외발생

      DBMS_OUTPUT.PUT_LINE('V_상품코드 : ' || V_상품코드);
      DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
      DBMS_OUTPUT.PUT_LINE('V_이전출고수량 : ' || V_이전출고수량);
      DBMS_OUTPUT.PUT_LINE('V_변경수량 : ' || V_출고수량);
      DBMS_OUTPUT.PUT_LINE('V_재고수량 + V_출고수량 : ' || (V_재고수량 + V_출고수량));

      IF (V_변경수량 > (V_재고수량 + V_이전출고수량))
            -- 예외 발생
            THEN RAISE USER_DEFINE_ERROR;
      END IF;

      -- ② 수행 쿼리문 구성
      -- ① UPDATE → TBL_출고
      UPDATE TBL_출고
      SET 출고수량 = V_출고수량      -- CHECK~!!!
      WHERE 출고번호 = V_출고번호;
      
      -- ② 수행 쿼리문 구성
      -- ② UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 - (V_출고수량 - V_이전출고수량)    -- CHECK~!!!
      WHERE 상품코드 = V_상품코드;
      
      -- 커밋
      COMMIT;

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20003, ' 재고 부족~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.
END;

-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
SELECT *
FROM TBL_출고;
/* 
      출고번호 상품코드           출고일자  출고수량      출고단가
---------- -------------------- -------- ---------- ----------
         1 C002                 15/07/25          5       1500
         2 C002                 15/07/25          5       1500
         3 H001                 15/07/25          5       1500
         4 H003                 15/07/25         20       1000
         5 C001                 15/07/25          5       1500
         6 C003                 15/07/25         20       1000
         7 E001                 15/07/25          5        500
         8 E003                 15/07/25         20       1000
8개 행이 선택되었습니다. 
*/

SELECT *
FROM TBL_상품
WHERE 상품코드 = 'E003';

DESC TBL_출고;
/* 
이름   널?       유형           
---- -------- ------------ 
출고번호 NOT NULL NUMBER       
상품코드          VARCHAR2(20) 
출고일자          DATE         
출고수량          NUMBER       
출고단가          NUMBER  
 */
 
CREATE OR REPLACE PROCEDURE PRC_출고_UPDATE
( V_출고번호   IN TBL_출고.출고번호%TYPE
, V_변경수량   IN TBL_출고.출고수량%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_재고수량   TBL_상품.재고수량%TYPE;
    V_출고수량   TBL_출고.출고수량%TYPE;
    
    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
      -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
      -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

      SELECT NVL(재고수량, 0) INTO V_재고수량
      FROM TBL_상품
      WHERE 상품코드 = (SELECT 상품코드 
                        FROM TBL_출고 
                        WHERE 출고번호 = V_출고번호);

      SELECT NVL(출고수량, 0) INTO V_출고수량
      FROM TBL_출고
      WHERE 출고번호=V_출고번호;

      DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
      DBMS_OUTPUT.PUT_LINE('V_변경수량 : ' || V_변경수량);
      DBMS_OUTPUT.PUT_LINE('V_재고수량 + V_출고수량 : ' || (V_재고수량 + V_출고수량));

      IF (V_변경수량 > (V_재고수량 + V_출고수량))
            THEN RAISE USER_DEFINE_ERROR;
      END IF;

      -- ① UPDATE → TBL_출고
      UPDATE TBL_출고
      SET 출고수량 = V_변경수량      -- CHECK~!!!
      WHERE 출고번호 = V_출고번호;
      
      -- ② UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 - (V_변경수량 - V_출고수량)    -- CHECK~!!!
      WHERE 상품코드 = (SELECT 상품코드 
                        FROM TBL_출고 
                        WHERE 출고번호 = V_출고번호);

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20003, ' 출고수량 변경 불가~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.

    -- 커밋
    COMMIT;

END;
-- ==>> Procedure PRC_출고_UPDATE이(가) 컴파일되었습니다.
-----------------[ 실습 - END ] ------------------------------

-- 입출고프로시저_홍길동.sql;
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
    
    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
      -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
      -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성
      
      SELECT 상품코드 INTO V_상품코드
      FROM TBL_입고 
      WHERE 입고번호 = V_입고번호;

      SELECT NVL(재고수량, 0) INTO V_재고수량
      FROM TBL_상품
      WHERE 상품코드 = V_상품코드;

      SELECT NVL(입고수량, 0) INTO V_입고수량
      FROM TBL_입고
      WHERE 입고번호=V_입고번호;

      DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
      DBMS_OUTPUT.PUT_LINE('V_입고수량 : ' || V_입고수량);
      DBMS_OUTPUT.PUT_LINE('V_변경할입고수량 : ' || V_변경할입고수량);
      DBMS_OUTPUT.PUT_LINE('V_재고수량 + V_입고수량 : ' || (V_재고수량 + V_입고수량));

      IF (V_변경수량 > (V_재고수량 + V_출고수량))
            THEN RAISE USER_DEFINE_ERROR;
      END IF;

      -- ① UPDATE → TBL_출고
      UPDATE TBL_입고
      SET 입고수량 = V_변경할입고수량      -- CHECK~!!!
      WHERE 입고번호 = V_입고번호;
      
      -- ② UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 - (V_변경수량 - V_출고수량)    -- CHECK~!!!
      WHERE 상품코드 = (SELECT 상품코드 
                        FROM TBL_출고 
                        WHERE 출고번호 = V_출고번호);

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20003, ' 출고수량 변경 불가~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.

    -- 커밋
    COMMIT;

END;

--▣ TBL_출고 테이블에서 출고수량을 삭제하는 프로시저를 작성한다.
-- 프로시저명 : PRC_출고_DELETE(출고번호)
     
--▣ TBL_입고 테이블에서 입고수량을 삭제하는 프로시저를 작성한다.
-- 프로시저명 : PRC_입고_DELETE(입고변호)
     
     



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
