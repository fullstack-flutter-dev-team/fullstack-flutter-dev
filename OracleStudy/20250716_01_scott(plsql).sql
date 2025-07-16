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

--▣▣▣ BEFORE STATEMENT TRIGGER 상황 실습 ▣▣▣---
--※ DML 작업 수행 전에 작업 가능여부 확인
--  (보안 정책 적용 / 업무 규칙 적용 등에 쓰이는 것이다.)


-- 트리거(TRIGGER) 생성
-- 트리거명 : TRG_TEST_DML
CREATE OR REPLACE TRIGGER TRG_TEST_DML
    BEFORE
    INSERT OR UPDATE OR DELETE ON TBL_TEST1
BEGIN
    -- IF (시간이 오전 8시 이전이거나... 오후 6시 이후라면...)
        -- THEN 예외 처리를 하겠다. (해당 작업을 수행하지 못하도록 처리하겠다.)
    -- IF (EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP)) < 8 OR EXTRACT(HOUR FROM CAST(SYSDATE AS TIMESTAMP)) > 18)
    --     THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08: ~ 18:00 까지만 가능합니다.');
    -- IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 이거나 오후 6시 이후라면...)
        -- THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08: ~ 18:00 까지만 가능합니다.');
    IF (TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) < 8 
        OR TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) > 17) --◀ ◀ 18이 아니고 17 CHECK~!!
        THEN RAISE_APPLICATION_ERROR(-20003, '작업은 08: ~ 18:00 까지만 가능합니다.');
    END IF;
END;
-- ==>> Trigger TRG_TEST_DML이(가) 컴파일되었습니다.


--▣▣▣ BEFORE ROW TRIGGER 상황 실습 ▣▣▣---
--※ 참조 관계가 설정된 데이터(자식) 삭제를 먼저 수행하는 모델

--※ 실습 테이블 생성 
-- 테이블명 : TBL_TEST2 - 부모 테이블
-- 테이블명 : TBL_TEST3 - 자식 테이블


-- 트리거(TRIGGER) 생성
-- 트리거명 : TRG_TEST2_DELETE
/* 
CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
    BEFORE
    DELETE ON TBL_TEST2
    FOR EACH ROW
DECLARE
BEGIN
END; 
*/

CREATE OR REPLACE TRIGGER TRG_TEST2_DELETE
    BEFORE
    DELETE ON TBL_TEST2
    FOR EACH ROW
DECLARE
BEGIN
    DELETE
    FROM TBL_TEST3
    WHERE CODE = :OLD.CODE;  -- WHERE CODE = 제거하기 이전 코드
END;
-- ==>> Trigger TRG_TEST2_DELETE이(가) 컴파일되었습니다.

-- ▣ 『:OLD』  -- 사전에 약속된 키워드...
    -- 참조 전 열의 값
    -- INSERT : 입력하기 이전 자료 즉, 입력할 자료
    -- DELETE : 삭제하기 이전 자료 즉, 삭제할 자료
    --사실,,,오라클에는 업데이트라는게없다,,,,,그러면 지금까지 써운거는 뭐다 얘는 UPDATE DELETE + INSERT 이다, 엄밀히 따지면 바꾸는게아니라 삭제하고 새로운값넣는것이다. 

-- ※ UPDATE → 개념적으로 DELETE 그리고 INSERT 가 결합된 형태로 이해
--             이 과정에서 UPDATE 하기 이전의 자료는 『:OLD』  --▶ 특정 메모리 공간에 저장 된 값
--             이 과정에서 UPDATE 한 이후의 자료는 『:NEW』


--▣▣▣ AFTER ROW TRIGGER 상황 실습 ▣▣▣---
-- ※ 참조 관계의 테이블 관련 트랜잭션 처리 모델
-- 테이블명 : TBL_상품, TBL_입고, TBL_출고

--▣ 트리거(TRIGGER) 생성
--  TBL_입고 테이블의 데이터 입력 시(즉, 입고 이벤트 발생 시)
--  TBL_상품 테이블의 재고수량 변동 트리거 작성
--  트리거명 : TRG_IBGO
/*
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고
    FOR EACH ROW

BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 =  재고수량 + 새로입고되는입고수량
             WHERE 상품코드 = 새로입고되는상품코드;
END; 
*/
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT ON TBL_입고   -- INSERT INTO TBL_입고(..) VALUES(...'H001',...,10,...);
    FOR EACH ROW

BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 =  재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    END IF;
END;
-- ===>> Trigger TRG_IBGO이(가) 컴파일되었습니다.
 

---------------------------------------------------------------------
--▣ TBL_상품, TBL_입고, TBL_출고 테이블의 관계에서
--   입고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_IBGO 트리거를 수정(REPLACE) 한다.
CREATE OR REPLACE TRIGGER TRG_IBGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_입고   -- INSERT INTO TBL_입고(..) VALUES(...'H001',...,10,...);
    FOR EACH ROW
DECLARE
    V_재고수량 TBL_상품.재고수량%TYPE;
BEGIN
    IF (INSERTING)
        THEN UPDATE TBL_상품
             SET 재고수량 =  재고수량 + :NEW.입고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN 
            SELECT 재고수량 INTO V_재고수량
            FROM TBL_상품
            WHERE 상품코드 = :NEW.상품코드;

            DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.입고수량 : ' || :OLD.입고수량);
            DBMS_OUTPUT.PUT_LINE(':NEW.입고수량 : ' || :NEW.입고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.상품코드 : ' || :OLD.상품코드);
            DBMS_OUTPUT.PUT_LINE(':NEW.상품코드 : ' || :NEW.상품코드);
            DBMS_OUTPUT.PUT_LINE('(:OLD.입고수량 - :NEW.입고수량) : ' || (:OLD.입고수량 - :NEW.입고수량));
            
            IF ((:OLD.입고수량 -:NEW.입고수량) > V_재고수량)
                THEN RAISE_APPLICATION_ERROR(-20003, ' 입고수량 변경 불가~!!!');
            END IF;

            UPDATE TBL_상품
            SET 재고수량 = 재고수량 - (:OLD.입고수량 - :NEW.입고수량)
            WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN 
            SELECT 재고수량 INTO V_재고수량
            FROM TBL_상품
            WHERE 상품코드 = :OLD.상품코드;

            DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.입고수량 : ' || :OLD.입고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.상품코드 : ' || :OLD.상품코드);
            DBMS_OUTPUT.PUT_LINE('(V_재고수량 - :OLD.입고수량) : ' || (V_재고수량 - :OLD.입고수량));

            IF ((V_재고수량 - :OLD.입고수량) < 0)
                THEN RAISE_APPLICATION_ERROR(-20003, ' 입고수량 삭제 불가~!!!');
            END IF;

            UPDATE TBL_상품
            SET  재고수량 = 재고수량 - :OLD.입고수량
            WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
    
    

--▣ TBL_상품, TBL_입고, TBL_출고 테이블의 관계에서
--   입고수량, 재고수량의 트랜잭션 처리가 이루어질 수 있도록
--   TRG_CHULGO 트리거를 수정(REPLACE) 한다.
CREATE OR REPLACE TRIGGER TRG_CHULGO
    AFTER
    INSERT OR UPDATE OR DELETE ON TBL_출고
    FOR EACH ROW
DECLARE
    V_재고수량 TBL_상품.재고수량%TYPE;
BEGIN
    IF (INSERTING)
        THEN 
            SELECT 재고수량 INTO V_재고수량
            FROM TBL_상품
            WHERE 상품코드 = :NEW.상품코드;

            IF (:NEW.출고수량 >  V_재고수량)
                THEN RAISE_APPLICATION_ERROR(-20003, ' 출고수량 삽입 불가~!!!');
            END IF;

            UPDATE TBL_상품
             SET 재고수량 =  재고수량 - :NEW.출고수량
             WHERE 상품코드 = :NEW.상품코드;
    ELSIF (UPDATING)
        THEN 
            SELECT 재고수량 INTO V_재고수량
            FROM TBL_상품
            WHERE 상품코드 = :NEW.상품코드;

            DBMS_OUTPUT.PUT_LINE('V_재고수량 : ' || V_재고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.출고수량 : ' || :OLD.출고수량);
            DBMS_OUTPUT.PUT_LINE(':NEW.출고수량 : ' || :NEW.출고수량);
            DBMS_OUTPUT.PUT_LINE(':OLD.상품코드 : ' || :OLD.상품코드);
            DBMS_OUTPUT.PUT_LINE(':NEW.상품코드 : ' || :NEW.상품코드);
            DBMS_OUTPUT.PUT_LINE('(:NEW.출고수량 - :OLD.출고수량) : ' || (:NEW.출고수량 - :OLD.출고수량));
            DBMS_OUTPUT.PUT_LINE('(V_재고수량 + :OLD.출고수량) : ' || (V_재고수량 + :OLD.출고수량));
            
            IF ((V_재고수량 + :OLD.출고수량) <  :NEW.출고수량)
                THEN RAISE_APPLICATION_ERROR(-20003, ' 출고수량 변경 불가~!!!');
            END IF;

            UPDATE TBL_상품
            SET 재고수량 = 재고수량 - (:NEW.출고수량 - :OLD.출고수량)
            WHERE 상품코드 = :NEW.상품코드;
    ELSIF (DELETING)
        THEN 
            SELECT 재고수량 INTO V_재고수량
            FROM TBL_상품
            WHERE 상품코드 = :OLD.상품코드;

            UPDATE TBL_상품
            SET  재고수량 = 재고수량 + :OLD.출고수량
            WHERE 상품코드 = :OLD.상품코드;
    END IF;
END;
-- ==> Trigger TRG_CHULGO이(가) 컴파일되었습니다.
    
--▣▣▣ PACKAGE(패키지) ▣▣▣---
/*
1. PL/SQL 의 패키지는 관계되는 타입, 프로그램 객체, 
   서브 프로그램(PROCEDUER, FUNCTION 등)을
   논리적으로 묶어놓은 것으로
   오라클에서 제공하는 패키지 중 하나가 바로 『DBMS_OUTPUT』 이다.
   (ex. DBMS_OUTPUT.PUT_LINE(...))


2. 패키지는 서로 유사한 업무에 사용되는 여러 개의 프로시저와 함수를
   하나의 패키지로 만들어 관리함으로써 향후 유지보수가 편리하고
   전체 프로그램을 모듈화 할 수 있는 장점이 있다.

3. 패키지는 명세부(PACKAGE SPECIFICATION) 와
   몸체부(PACKAGE BODY)로 구성되어 있으며
   명세부분에는 TYPE, CONSTRAINT, VARIABLE, EXCEPTION, CURSOR, SUBPROGRAM 이 선언되고
   몸체부분에는 이들의 실제 내용이 존재하게 된다.
   그리고 호출할 때에는 『패키지명.프로시저명 형식』의 참조를 이용해야 한다.


4. 형식 및 구조(명세부)
CREATE [OR REPLACE] PACKAGE 패키지명
IS
    전역변수 선언;
    커서 선언;
    예외 선언;
    함수 선언;
    프로시저 선언;
       :
       
END 패키지명;



--5. 형식 및 구조(몸체부)
CREATE [OR REPLACE] PACKAGE BODY 패키지명
IS
    FUNCTION 함수명 [(인수, ...)]
    RETURN 자료형
    IS
        변수 선언;
    BEGIN
        함수 몸체 구성 코드;
        RETURN 값;
    END;
    
    PROCEDURE 프로시저명[(인수, ...)]
    IS
        변수선언;
    BEGIN
        프로시저 몸체 구성 코드;
    END;    
    
END 패키지명;
*/

--▣ 주민번호 입력 시 성별을 반환하는 함수
--   이 함수를 구성요소로 취하는 패키지 작성

-- 함수 준비
CREATE OR REPLACE FUNCTION FN_GENDER(V_SSN VARCHAR2)
RETURN VARCHAR2
IS
    V_RESULT     VARCHAR2(20);
BEGIN
    IF SUBSTR(V_SSN, 8, 1) IN ('1','3') 
        THEN V_RESULT := '남자';
    ELSIF SUBSTR(V_SSN, 8, 1) IN ('2','4') 
        THEN V_RESULT := '여자';
    ELSE
        V_RESULT := '성별 확인불가';
    END IF;

    RETURN V_RESULT;
END;
-- ===>> Function FN_GENDER이(가) 컴파일되었습니다.

/* 
-- 패키지 등록
--1 명세부 작성(패키지)

--2. 몸체부 작성(패키지)
 */

 ----------------------[패키지 등록]-------------------------
-- 패키지 등록
-- 1 명세부 작성(패키지)
CREATE OR REPLACE PACKAGE INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
    RETURN VARCHAR2;
END INSA_PACK;
-- ==>> Package INSA_PACK이(가) 컴파일되었습니다.

-- 2. 몸체부 작성(패키지)
CREATE OR REPLACE PACKAGE BODY INSA_PACK
IS
    FUNCTION FN_GENDER(V_SSN VARCHAR2)
        RETURN VARCHAR2
    IS
        V_RESULT     VARCHAR2(20);
    BEGIN
        IF SUBSTR(V_SSN, 8, 1) IN ('1','3') 
            THEN V_RESULT := '남자';
        ELSIF SUBSTR(V_SSN, 8, 1) IN ('2','4') 
            THEN V_RESULT := '여자';
        ELSE
            V_RESULT := '성별 확인불가';
        END IF;

        RETURN V_RESULT;
    END;
END INSA_PACK;
-- ==>> Package Body INSA_PACK이(가) 컴파일되었습니다.


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
