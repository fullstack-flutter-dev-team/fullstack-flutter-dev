SELECT USER
FROM DUAL;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SET SERVEROUTPUT ON;

----------------[login_ADMIN_ID]-------------
CREATE OR REPLACE procedure proc_admin_login
( P_ID IN VARCHAR2
, P_PW IN VARCHAR2
, R_MSG OUT VARCHAR2
)
IS
    STATUS VARCHAR2(100):= 2;
BEGIN
    -- 기본 ID/PW : ADMIN_ID/SSN 끝 7자
    -- NEW ID/PW : LOGIN_ID/LOGIN_PW
    SELECT NVL2((SELECT  TO_CHAR(ADMIN_ID) FROM TBL_ADMIN WHERE  TO_CHAR(ADMIN_ID)=P_ID OR LOGIN_ID = P_ID), '0', '-1')  INTO STATUS
      FROM DUAL;     
    IF STATUS = -1 THEN
        -- R_MSG := '아이디가 존재하지 않습니다.';
        R_MSG := '-1';
    ELSE -- 아이디가 조회된경우
        SELECT NVL2((SELECT TO_CHAR(ADMIN_ID) FROM TBL_ADMIN
                           WHERE (TO_CHAR(ADMIN_ID) = P_ID AND SUBSTR(SSN, 8) = P_PW )
                            OR (LOGIN_ID = P_ID AND LOGIN_PW = P_PW)), '0', '-2') INTO R_MSG
           FROM DUAL;
    END IF;  
END;
----------------[login_NAME]-------------
CREATE OR REPLACE procedure proc_admin_login
( P_ID IN VARCHAR2
, P_PW IN VARCHAR2
, R_MSG OUT VARCHAR2
)
IS
    STATUS VARCHAR2(100):= 2;
BEGIN
    -- 기본 ID/PW : ADMIN_ID/SSN 끝 7자
    -- NEW ID/PW : LOGIN_ID/LOGIN_PW
    SELECT NVL2((SELECT  NAME FROM TBL_ADMIN WHERE  NAME=P_ID OR LOGIN_ID = P_ID), '0', '-1')  INTO STATUS
      FROM DUAL;     
    IF STATUS = -1 THEN
        -- R_MSG := '아이디가 존재하지 않습니다.';
        R_MSG := '-1';
    ELSE -- 아이디가 조회된경우
        SELECT NVL2((SELECT NAME FROM TBL_ADMIN
                           WHERE (NAME = P_ID AND SUBSTR(SSN, 8) = P_PW )
                            OR (LOGIN_ID = P_ID AND LOGIN_PW = P_PW)), '0', '-2') INTO R_MSG
           FROM DUAL;
    END IF;  
END;

----------------------------------------------
----------------------------------------------
-- 실행
variable r_msg varchar2(300);
exec proc_admin_login('명이충','1264931', :r_msg);
PRINT r_msg;

exec proc_admin_login('명이충','WORld', :r_msg);
PRINT r_msg;

exec proc_admin_login('QUANTUM','WORld', :r_msg);
PRINT r_msg;
----------------------------------------------

SELECT *
FROM TBL_ADMIN
WHERE ADMIN_ID = 3;
----------------------------------------------
UPDATE TBL_ADMIN
SET LOGIN_ID = 'QUANTUM', LOGIN_PW = 'WORld'
WHERE ADMIN_ID = 3;
----------------------------------------------
-- 커밋
COMMIT;


-----------------[select lecturer]---------------------------
CREATE OR REPLACE PROCEDURE proc_admin_select (
    -- P_USER_CD           VARCHAR2,
    C_ADMIN   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_ADMIN FOR 
    SELECT * FROM TBL_ADMIN;
END;
-------------------------------------------------------------
variable rc refcursor;
EXECUTE proc_admin_select(:rc);
print rc;


VAR rc REFCURSOR;
EXEC proc_admin_select(:rc);
PRINT rc;

-----------------[select lecturer]---------------------------
CREATE OR REPLACE PROCEDURE proc_lecturer_select (
    -- P_USER_CD           VARCHAR2,
    C_LECTURER   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_LECTURER FOR 
    SELECT * FROM TBL_LECTURER;
END;
-------------------------------------------------------------
variable rc refcursor;
EXECUTE proc_lecturer_select(:rc);
print rc;


VAR rc REFCURSOR;
EXEC proc_lecturer_select(:rc);
PRINT rc;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE proc_student_select (
    -- P_USER_CD           VARCHAR2,
    C_STUDENT   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_STUDENT FOR 
    SELECT * FROM TBL_STUDENT;
END;
-------------------------------------------------------------
variable rc refcursor;
EXECUTE proc_student_select(:rc);
print rc;


VAR rc REFCURSOR;
EXEC proc_student_select(:rc);
PRINT rc;

------------------------------------------------------------------------------
-- 커밋
COMMIT;
------------------------------------------------------------------------------



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

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20003, ' 입고수량 변경 불가~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.
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
    
    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

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

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.

    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20004, ' 출고수량 삭제 불가~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.
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

    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성
    
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

    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20005, ' 입고수량 삭제 불가~!!!');
                ROLLBACK;
                -- 잘못된 데이터를 입력했으므로, 롤백한다!

        -- 우리가 규정한 에러 : USER_DEFINE_ERROR가 아닌 것이 발생할 수도 있다!
        -- 기타 다른 예외가 발생하면...
        WHEN OTHERS 
            THEN ROLLBACK;  -- 롤백만 해라~!!

        -- 사용자 정의 예외를 여러 개 지정해서
        -- 각 에러의 경우에 따라 다른 안내 메시지가 출력되도록 처리할 수도 있겠다.
END;
-- ==>> Procedure PRC_입고_DELETE이(가) 컴파일되었습니다.

--- ▣▣▣ CURSOR(커서) ▣▣▣ -----------  
--1. 오라클에서 하나의 레코드가 아닌 여러 레코드로 구성된 작업 영역에서
--   SQL 문을 실행하고 그 과정에서 발생한 정보를
--   저장하기 위하여 커서를 사용하며
--   커서에는 암시적 커서와 명시적 커서가 있다.

-- 2. 암시적 커서는 모든 SQL 문에 존재하며,
--    SQL 실행 후 오직 하나의 행(ROW)만 출력하게 된다.
--    그러나 SQL 문을 실행한 결과문 (RESULT SET)이
--    여러 행(ROW) 으로 구성된 경우
--    CURSOR(커서)를 명시적으로 선언해야 여러 행(ROW)을 다룰 수 있다.
   
 
---▣ 커서 이용 전 상황(단일 행 접근 시)
SET SERVEROUTPUT ON;
-- ==>> 작업이 완료되었습니다.

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
BEGIN
    SELECT NAME, TEL INTO V_NAME,V_TEL
    FROM TBL_INSA
    WHERE NUM=1001;

    DBMS_OUTPUT.PUT_LINE(V_NAME || ' , ' || V_TEL);
END;
/* 
홍길동 , 011-2356-4528

PL/SQL 프로시저가 성공적으로 완료되었습니다.
 */


---▣ 커서 이용 전 상황(다중 행 접근 시)
SET SERVEROUTPUT ON;
-- ==>> 작업이 완료되었습니다.

DECLARE
    V_NAME  TBL_INSA.NAME%TYPE;
    V_TEL   TBL_INSA.TEL%TYPE;
    V_NUM   TBL_INSA.NUM%TYPE := 1001;
BEGIN
    LOOP
        SELECT NAME, TEL INTO V_NAME,V_TEL
        FROM TBL_INSA
        WHERE NUM = V_NUM;

        DBMS_OUTPUT.PUT_LINE(V_NAME || ' , ' || V_TEL);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM >= 1061;
    END LOOP;

END;

/* 
홍길동 , 011-2356-4528
이순신 , 010-4758-6532
이순애 , 010-4231-1236
김정훈 , 019-5236-4221
한석봉 , 018-5211-3542
이기자 , 010-3214-5357
장인철 , 011-2345-2525
김영년 , 016-2222-4444
나윤균 , 019-1111-2222
김종서 , 011-3214-5555
유관순 , 010-8888-4422
정한국 , 018-2222-4242
조미숙 , 019-6666-4444
황진이 , 010-3214-5467
이현숙 , 016-2548-3365
이상헌 , 010-4526-1234
엄용수 , 010-3254-2542
이성길 , 018-1333-3333
박문수 , 017-4747-4848
유영희 , 011-9595-8585
홍길남 , 011-9999-7575
이영숙 , 017-5214-5282
김인수 , 
김말자 , 011-5248-7789
우재옥 , 010-4563-2587
김숙남 , 010-2112-5225
김영길 , 019-8523-1478
이남신 , 016-1818-4848
김말숙 , 016-3535-3636
정정해 , 019-6564-6752
지재환 , 019-5552-7511
심심해 , 016-8888-7474
김미나 , 011-2444-4444
이정석 , 011-3697-7412
정영희 , 
이재영 , 011-9999-9999
최석규 , 011-7777-7777
손인수 , 010-6542-7412
고순정 , 010-2587-7895
박세열 , 016-4444-7777
문길수 , 016-4444-5555
채정희 , 011-5125-5511
양미옥 , 016-8548-6547
지수환 , 011-5555-7548
홍원신 , 011-7777-7777
허경운 , 017-3333-3333
산마루 , 018-0505-0505
이기상 , 
이미성 , 010-6654-8854
이미인 , 011-8585-5252
권영미 , 011-5555-7548
권옥경 , 010-3644-5577
김싱식 , 011-7585-7474
정상호 , 016-1919-4242
정한나 , 016-2424-4242
전용재 , 010-7549-8654
이미경 , 016-6542-7546
김신제 , 010-2415-5444
임수봉 , 011-4151-4154
김신애 , 011-4151-4444

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


---▣ 커서 이용 상황(다중 행 접근 시 - 반복문 활용)
DECLARE
    -- 주요 변수 선언
    V_NAME TBL_INSA.NAME%TYPE;
    V_TEL TBL_INSA.TEL%TYPE;

    -- 커서 이용을 위한 커서 변수 선언( → 커서 정의)
    -- 커서를 정의해서 쓴다고 생각하자...
    CURSOR CUR_INSA_SELECT
    IS
    SELECT NAME, TEL
    FROM TBL_INSA;

    -- 예외변수명 EXCEPTION;
BEGIN
    -- 커서 오픈(OPEN)
    OPEN CUR_INSA_SELECT;

    -- 커서 사용
    --  → 커서 오픈 시 쏟아져 나오는 데이터들 처리(잡아서 출력  → 반복)
    LOOP
        -- 커서로부터 한 행 한 행 가져오는 행위  → 『FETCH』
        FETCH CUR_INSA_SELECT INTO V_NAME, V_TEL;

        -- 반복문을 빠져나가는 조건 → 커서의 데이터 모두 소진 시....NOTFOUND
        EXIT WHEN CUR_INSA_SELECT%NOTFOUND;
        --        ------------------------
        --          → 커서의 상태        

        -- 출력
        DBMS_OUTPUT.PUT_LINE(V_NAME || ' , ' || V_TEL);

    END LOOP;

    -- 커서 종료
    CLOSE CUR_INSA_SELECT;

    -- 커서 클로즈(CLOSE)

END;
/* 
홍길동 , 011-2356-4528
이순신 , 010-4758-6532
이순애 , 010-4231-1236
김정훈 , 019-5236-4221
한석봉 , 018-5211-3542
이기자 , 010-3214-5357
장인철 , 011-2345-2525
김영년 , 016-2222-4444
나윤균 , 019-1111-2222
김종서 , 011-3214-5555
유관순 , 010-8888-4422
정한국 , 018-2222-4242
조미숙 , 019-6666-4444
황진이 , 010-3214-5467
이현숙 , 016-2548-3365
이상헌 , 010-4526-1234
엄용수 , 010-3254-2542
이성길 , 018-1333-3333
박문수 , 017-4747-4848
유영희 , 011-9595-8585
홍길남 , 011-9999-7575
이영숙 , 017-5214-5282
김인수 , 
김말자 , 011-5248-7789
우재옥 , 010-4563-2587
김숙남 , 010-2112-5225
김영길 , 019-8523-1478
이남신 , 016-1818-4848
김말숙 , 016-3535-3636
정정해 , 019-6564-6752
지재환 , 019-5552-7511
심심해 , 016-8888-7474
김미나 , 011-2444-4444
이정석 , 011-3697-7412
정영희 , 
이재영 , 011-9999-9999
최석규 , 011-7777-7777
손인수 , 010-6542-7412
고순정 , 010-2587-7895
박세열 , 016-4444-7777
문길수 , 016-4444-5555
채정희 , 011-5125-5511
양미옥 , 016-8548-6547
지수환 , 011-5555-7548
홍원신 , 011-7777-7777
허경운 , 017-3333-3333
산마루 , 018-0505-0505
이기상 , 
이미성 , 010-6654-8854
이미인 , 011-8585-5252
권영미 , 011-5555-7548
권옥경 , 010-3644-5577
김싱식 , 011-7585-7474
정상호 , 016-1919-4242
정한나 , 016-2424-4242
전용재 , 010-7549-8654
이미경 , 016-6542-7546
김신제 , 010-2415-5444
임수봉 , 011-4151-4154
김신애 , 011-4151-4444

PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/
------------------------------------------------------------------------------

--- ▣▣▣ TRIGGER(트리거) ▣▣▣ -----------  
-- 사전적 의미 : 방아쇠, 촉발시키다, 야기하다, 유발하다...

-- 1. TRIGGER(트리거)란 , DML작업 즉, INSERT, UPDATE, DELETE와 같은 작업이 
--    일어날 때, 자동적으로 실행되는(유발되는, 촉발되는) 객체로
--    이와 같은 특징을 강조하여(부각시켜) DML TRIGGER 라고 부르기도 한다.
--    TRIGGER(트리거)는 데이터 무결성 뿐 아니라 
--    다음과 같은 작업에도 널리 사용된다.
--      ⊙ 자동으로 파생된 열 값 생성
--      ⊙ 잘못된 트랜잭션 방지
--      ⊙ 복잡한 보안 권한 강제 수행
--      ⊙ 분산 데이터베이스 노드 상에서 참조 무결성 강제 수행(다른 지역에 있는 DB 서버..)
--      ⊙ 복잡한 업무 규칙 강제 적용
--      ⊙ 투명한 이벤트 로깅 제공(로그 기록 → 출입 기록)
--      ⊙ 복잡한 감사 제공
--      ⊙ 동기 테이블 복제 유지관리
--      ⊙ 테이블 액세스 통계 수집

-- 2. TRIGGER(트리거) 내에서는 COMMIT, ROLLBACK 구문을 사용할 수 없다.  ★★★★

-- 3. 특징 및 종류  
--    ⊙ BEFORE STATEMENT TRIGGER : SQL 구문이 실행되기 전에 그 문장에 대해 한 번 실행
--    ⊙ BEFORE ROW TRIGGER(FOR EACH ROW) : SQL 구문이 실행되기 전에(DML작업을 수행하기 전에) 각 행(ROW) 에 대해 한 번씩 실행
--    ⊙ AFTER STATEMENT TRIGGER : SQL 구문이 실행된 후 그 문장에 대해 한 번 실행
--    ⊙ AFTER ROW TRIGGER(FOR EACH ROW) : SQL 구문이 실행된 후에(DML작업을 수행한 후에) 각 행(ROW)에 대해 한 번씩 실행


-- 4. 형식 및 구조
/*
CREATE [OR REPLACE] TRIGGER 트리거명
    [BEFORE] | [AFTER]
    이벤트1 [OR 이벤트2 [OR 이벤트3]] ON 테이블명
    [FOR EACH ROW [WHEN TRIGGER 조건]]  -- STATEMENT/ROW TRIGGER
[DECLARE]
    -- 선언 구문;
BEGIN
    -- 실행 구문;
END;

*/



--▣▣▣ AFTER STATEMENT TRIGGER ▣▣▣---

--▣ 트리거(TRIGGER) 생성
-- 트리거명 :TRG_EVENTLOG
CREATE OR REPLACE TRIGGER TRG_EVENTLOG
    AFTER 
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
DECLARE
BEGIN
    -- 이벤트 종류 구분(→ 조건문을 통한 분기)
    -- 조건에 대한 키워드 CHECK~!!!
    IF (INSERTING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
             VALUES('INSERT 쿼리문이 수행되었습니다.');
    ELSIF (UPDATING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('UPDATE 쿼리문이 수행되었습니다.');
    ELSIF (DELETING)
        THEN INSERT INTO TBL_EVENTLOG(MEMO)
            VALUES('DELETE 쿼리문이 수행되었습니다.');
    END IF;
END;
-- ==>> Trigger TRG_EVENTLOG이(가) 컴파일되었습니다.




-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
