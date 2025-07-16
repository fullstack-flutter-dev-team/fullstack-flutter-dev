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
    
    
    

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
