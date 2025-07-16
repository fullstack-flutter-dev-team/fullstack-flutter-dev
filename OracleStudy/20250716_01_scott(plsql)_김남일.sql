--/*================[ 7월 15일(화) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

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




-----------------[트리거 확인 : START]--------------------------------
-- -- 확인
-- SELECT 상품코드, A.재고수량, B.입고수량
-- FROM TBL_상품 A LEFT JOIN TBL_입고 B
-- USING(상품코드)
-- WHERE B.입고번호 = 1;
-- /* 
-- 상품코드                       재고수량       입고수량
-- -------------------- ---------- ----------
-- H004                        150        250
-- */

-- UPDATE TBL_입고
-- SET 입고수량 = 90
-- WHERE 입고번호 = 1;
-- -- ==>> SQL 오류: ORA-20003:  입고수량 변경 불가~!!!
-- /* 
-- V_재고수량 : 150
-- :OLD.입고수량 : 250
-- :NEW.입고수량 : 90
-- :OLD.상품코드 : H004
-- :NEW.상품코드 : H004
-- (:OLD.입고수량 - :NEW.입고수량) : 160
-- */

-- UPDATE TBL_입고
-- SET 입고수량 = 110
-- WHERE 입고번호 = 1;
-- -- ==> 1 행 이(가) 업데이트되었습니다.
-- /* 
-- V_재고수량 : 150
-- :OLD.입고수량 : 250
-- :NEW.입고수량 : 110
-- :OLD.상품코드 : H004
-- :NEW.상품코드 : H004
-- (:OLD.입고수량 - :NEW.입고수량) : 140
-- */

-- SELECT 상품코드, A.재고수량, B.입고수량
-- FROM TBL_상품 A LEFT JOIN TBL_입고 B
-- USING(상품코드)
-- WHERE B.입고번호 = 1;
-- /* 

-- 상품코드                       재고수량       입고수량
-- -------------------- ---------- ----------
-- H004                         10        110
-- */

-- DELETE FROM TBL_입고
-- WHERE 입고번호 = 1;
-- -- ==>> SQL 오류: ORA-20003:  입고수량 삭제 불가~!!!
-- /* 
-- V_재고수량 : 10
-- :OLD.입고수량 : 110
-- :OLD.상품코드 : H004
-- (V_재고수량 - :OLD.입고수량) : -100
-- */

-- SELECT 상품코드, A.재고수량, B.입고수량
-- FROM TBL_상품 A LEFT JOIN TBL_입고 B
-- USING(상품코드)
-- WHERE B.입고번호 = 1;
-- /* 
-- 상품코드                       재고수량       입고수량
-- -------------------- ---------- ----------
-- H004                         10        110
-- */

-- ---
-- SELECT 상품코드, A.재고수량, B.입고수량
-- FROM TBL_상품 A LEFT JOIN TBL_입고 B
-- USING(상품코드)
-- WHERE B.입고번호 = 2;
-- /* 
-- 상품코드                       재고수량       입고수량
-- -------------------- ---------- ----------
-- H002                        150        100
-- */

-- DELETE FROM TBL_입고
-- WHERE 입고번호 = 2;
-- -- ==>> 1 행 이(가) 삭제되었습니다.
-- /* 
-- V_재고수량 : 150
-- :OLD.입고수량 : 100
-- :OLD.상품코드 : H002
-- (V_재고수량 - :OLD.입고수량) : 50
-- */

-- SELECT 상품코드, A.재고수량, B.입고수량
-- FROM TBL_상품 A LEFT JOIN TBL_입고 B
-- USING(상품코드)
-- WHERE B.입고번호 = 2;
-- -- ==>> 선택된 행 없음

-- ---------------------------------------
-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 1;



-- SELECT *
-- FROM TBL_출고
-- WHERE 입고번호 = 2;

-- DESC TBL_츨고;

-- INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(5, 'H002', 100, 1000);
-- INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가) VALUES(8, 'H004', 100, 1000);

-- INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(1, 'H004', 10, 1000);
-- INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(2, 'H002', 10, 1000);

-- SELECT *
-- FROM TBL_출고;
-- /* 
--      출고번호 상품코드                 출고일자           출고수량       출고단가
-- ---------- -------------------- -------- ---------- ----------
--          1 H004                 16/07/25         10       1000
--          2 H002                 16/07/25         10       1000
-- */

-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 1;
-- /* 

-- 상품코드                       재고수량       출고수량
-- -------------------- ---------- ----------
-- H004                        100         10
--  */

-- INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(3, 'H004', 200, 1000);
-- -- ==>> SQL 오류: ORA-20003:  출고수량 삽입 불가~!!!

-- INSERT INTO TBL_출고(출고번호, 상품코드, 출고수량, 출고단가) VALUES(3, 'H004', 20, 1000);
-- -- ==>> 1 행 이(가) 삽입되었습니다.

-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 1;
-- /* 
-- 상품코드                       재고수량       출고수량
-- -------------------- ---------- ----------
-- H004                         80         10
-- */


-- -------
-- SELECT *
-- FROM TBL_출고;
-- /* 

--       출고번호 상품코드                 출고일자           출고수량       출고단가
-- ---------- -------------------- -------- ---------- ----------
--          1 H004                 16/07/25         10       1000
--          2 H002                 16/07/25         10       1000
--          3 H004                 16/07/25         20       1000
-- */

-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 1;
-- /* 

-- 상품코드                       재고수량       출고수량
-- -------------------- ---------- ----------
-- H004                         80         10
-- */

-- UPDATE TBL_출고
-- SET 출고수량 = 110
-- WHERE 출고번호 = 1;
-- -- ==>> SQL 오류: ORA-20003:  출고수량 변경 불가~!!!
-- /* 
-- V_재고수량 : 80
-- :OLD.출고수량 : 10
-- :NEW.출고수량 : 110
-- :OLD.상품코드 : H004
-- :NEW.상품코드 : H004
-- (:NEW.출고수량 - :OLD.출고수량) : 100
-- (V_재고수량 + :OLD.출고수량) : 90
-- */

-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 1;
-- /* 

-- 상품코드                       재고수량       출고수량
-- -------------------- ---------- ----------
-- H004                         80         10
-- */

-- UPDATE TBL_출고
-- SET 출고수량 = 70
-- WHERE 출고번호 = 1;
-- -- ==>> 1 행 이(가) 업데이트되었습니다.
-- /* 
-- V_재고수량 : 80
-- :OLD.출고수량 : 10
-- :NEW.출고수량 : 70
-- :OLD.상품코드 : H004
-- :NEW.상품코드 : H004
-- (:NEW.출고수량 - :OLD.출고수량) : 60
-- (V_재고수량 + :OLD.출고수량) : 90
-- */

-- -------------------------------------------
-- SELECT *
-- FROM TBL_출고;
-- /* 

--       출고번호 상품코드                 출고일자           출고수량       출고단가
-- ---------- -------------------- -------- ---------- ----------
--          1 H004                 16/07/25         70       1000
--          2 H002                 16/07/25         10       1000
--          3 H004                 16/07/25         20       1000
-- */


-- SELECT 상품코드, A.재고수량, B.출고수량
-- FROM TBL_상품 A LEFT JOIN TBL_출고 B
-- USING(상품코드)
-- WHERE B.출고번호 = 3;
-- /* 
-- 상품코드                       재고수량       출고수량
-- -------------------- ---------- ----------
-- H004                         20         20
-- */

-- SELECT * 
-- FROM TBL_출고
-- WHERE 출고번호 = 3;
-- /* 
--       출고번호 상품코드                 출고일자           출고수량       출고단가
-- ---------- -------------------- -------- ---------- ----------
--          3 H004                 16/07/25         20       1000
-- */

-- DELETE FROM TBL_출고
-- WHERE 출고번호 = 3;
-- -- ==> 1 행 이(가) 삭제되었습니다.

-- SELECT 상품코드, 재고수량
-- FROM TBL_상품
-- WHERE 상품코드 = 'H004';
-- /* 
-- 상품코드                       재고수량
-- -------------------- ----------
-- H004                         40
-- */
-----------------[트리거 확인 : END]--------------------------------