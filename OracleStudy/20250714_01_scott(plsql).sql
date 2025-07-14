--/*================[ 7월 14일(월) ]========================*/
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

-- ※참고
/*
1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML 구문이다. (DATA MANIPULATION LANGUAGE)
--COMMIT / ROLLBACK 이 필요하다


2. CREATE, DROP, ALTER, (TRUNCATE)
--===>> DDL(DATA DEFINITION LANGUAGE)
-- 실행하면 자동으로 COMMIT 된다.

3. GRANT , REVOKE
--==>> DCL (DATA CONTROL LANGUGAE)
-- 실행하면 자동으로 COMMIT 된다.

4. COMMT, ROLLBACK
--===>> TCL(TRANSACTION CONTROL LANGUAGE)

-- 정적인 PL/SQL 문 → DML문, TCL 문만 사용 가능하다.
-- 동적인 PL/SQL 문 → DML문, DDL, DCL, TCL 문 사용 가능하다. 

※ 정적 SQL(정적PL/SQL)
기본적으로 사용하는 SQL 구문과 PL/SQL 구문 안에 SQL 구문을 직접 삽입하는 방법
--> 작성이 쉽고 성능이 좋다.

※ 동적 SQL(동적PL/SQL) ▶ EXECUTE IMMEDIATE
-- 완성되지 않는 SQL 구문을 기반으로
   실행 중 변경 가능한 문자열 변수 또는 문자열 상수를 통해
   SQL 구문을 동적으로 완성하여 실행하는 방법.
   사전에 정의되지 않는 SQL 을 실행할 때 완성, 확정하여  실행할 수 있다,
   DML, TCL 외에도 DDL, DCL, TCL 사용이 가능하다. 

*/

--▣▣▣ PROCEDURE(프로시저) ▣▣▣--
/*
1. PL/SQL 에서 가장 대표적인 구조인 스토어드 프로시저는
   개발자가 자주 작성해야 하는 업무의 흐름을
   미리 작성하여 데이터베이스 내에 저장해 두었다가
   필요할 때 마다 호출하여 실행할 수 있도록 처리해주는 구문이다.

2. 형식 및 구조
   CREATE [OR REPLACE] PROCEDURE 프로시저명
   [(매개변수 IN 데이터타입
   , 매개변수 OUT 데이터타입    -- 출력용 매개변수
   , 매개변수 INOUT 데이터타입  -- 입/출력 매개변수
   )]
   IS
       [주요 변수 선언;]
   BEGIN
       -- 실행구문;
       ...
       [EXCEPTION
           -- 예외 처리 구문;]
   END;

*/

-- ※ FUNCTION 과 비교했을 때, 
-- 『RETURN』 반환자료형 부분이 존재하지 않으며,
-- 『RETURN』 문 자체도 존재하지 않으며,
-- 프로시저 실행 시 넘겨주게 되는 매개변수의 종류는
-- IN, OUT, INOUT 으로 구분된다.

--3. 실행(호출)
/*
     EXEC[UTE] 프로시저명[(인수1, 인수2)]
*/

--▣ INSERT 프로시저
-- 실습 테이블 생성  →  『20250714_02_scott.sql』 파일 참조 
-- 테이블명 : TBL_STUDENTS
-- 테이블명 : TBL_IDPW

-- 프로시저 생성
-- 프로시저명 : PRC_STUDENTS_INSERT(아이디, 패스워드, 이름, 전화번호, 주소)
/* 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
(아이디, 패스워드, 이름, 전화번호, 주소)
IS
BEGIN
END; 
*/

/* 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID IN VARCHAR2(10)
, V_PW
, V_NAME
, V_TEL
,V_ADDR
)
IS
BEGIN
END;  
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_NAME IN TBL_STUDENTS.NAME%TYPE
, V_TEL  IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
      -- 주요 변수 선언
BEGIN
      -- TBL_IDPW 테이블에 데이터 입력
      INSERT INTO TBL_IDPW(ID, PW)
      VALUES(V_ID, V_PW);
      
      -- TBL_STUDENTS 테이블에 데이터 입력
      INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
      VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
      
      -- 커밋
      COMMIT;
END;
-- ==>> Procedure PRC_STUDENTS_INSERT이(가) 컴파일되었습니다.

--▣ INSERT 프로시저

-- 실습 테이블 생성  →  『20250714_02_scott.sql』 파일 참조 
-- 테이블명 : TBL_SUNGJUK

-- 데이터입력 시 특정 항목의 데이터(학번, 이름, 국어점수,영어점수, 수학점수)만 입력하면
-- 내부적으로 나머지 다른 항목(총점, 평균, 등급)이 함께 입력 처리될 수 있는 프로시저를 작성한다(생성한다.)
-- 프로시저명 : PRC_SUNGJUK_INSERT
/*
 실행 예)
 EXEC PRC_SUNGJUK_INSERT(1, '김한국', 90, 80, 70);

 → 프로시저 호출로 처리된 결과)
 학번   이름 국어점수 영어점수  수학점수   총점  평균   등급
  1   김한국     90      80      70      240   80    B
*/
-----------------[ 강사님 풀이 - START ] ---------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME   IN TBL_SUNGJUK.NAME%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE
)
IS
      -- INSERT 쿼리문을 수행하는데 필요한 주요 변수 선언
      V_TOT TBL_SUNGJUK.TOT%TYPE;
      V_AVG TBL_SUNGJUK.AVG%TYPE;
      V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
      -- 아래의 쿼리문을 수행하기 위해서는
      -- 위에서 선언한 변수들에 값을 담아내야 한다.(V_TOT, V_AVG, V_GRADE)
      V_TOT := V_KOR + V_ENG + V_MAT;
      V_AVG := V_TOT / 3;
      V_GRADE := 'F';

      IF (V_AVG >= 90)
         THEN V_GRADE := 'A';
      ELSIF (V_AVG >= 80)
         THEN V_GRADE := 'B';
      ELSIF (V_AVG >= 70)
         THEN V_GRADE := 'C';
      ELSIF (V_AVG >= 60)
         THEN V_GRADE := 'D';
      ELSE 
         V_GRADE := 'F';
      END IF;

      -- TBL_SUNGJUK 테이블에 데이터 입력
      INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
      VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
      
      -- 커밋
      COMMIT;
END;
-----------------[ 강사님 풀이 - END ] -----------------------

-----------------[ 실습 - START ] ----------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME   IN TBL_SUNGJUK.NAME%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE
)
IS
      -- 주요 변수 선언
      V_TOT TBL_SUNGJUK.TOT%TYPE;
      V_AVG TBL_SUNGJUK.AVG%TYPE;
      V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN

      V_TOT := V_KOR + V_ENG + V_MAT;
      V_AVG := V_TOT / 3;
      V_GRADE := CASE  WHEN V_AVG >= 90 THEN 'A'
                       WHEN V_AVG >= 80 THEN 'B'
                       WHEN V_AVG >= 70 THEN 'C'
                       WHEN V_AVG >= 60 THEN 'D'
                       ELSE 'F'
               END;
      -- TBL_IDPW 테이블에 데이터 입력
      INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
      VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
      
      -- 커밋
      COMMIT;
END;
-- ==>>Procedure PRC_SUNGJUK_INSERT이(가) 컴파일되었습니다.
-----------------[ 실습 - END ] ------------------------------

---------------------[UPDATE 프로시저]----------------------------------
--▣ TBL_SUNGJUK 테이블에서
-- 특정 학생의 점수(학번, 국어점수, 영어점수, 수학점수)
-- 데이터 수정 시 총점, 평균 , 등급까지 수정하는 프로시저를 작성한다.
-- 프로시저명 : PRC_SUNGJUK_UPDATE
/*
   실행 예)
   EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);

   호출로 처리된 결과 
    HAKBUN NAME               KOR        ENG        MAT        TOT        AVG G
---------- ----------- ---------- ---------- ---------- ---------- ---------- -
         1 김한국              50         50         50        150         50 F
         2 김영국              90         50         70        210         70 C
         3 김미국              90         90         95        275       91.7 A
*/

-----------------[ 강사님 풀이 - START ] ------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE
)
IS
      -- UPDATE 쿼리문을 수행하는데 필요한 주요 변수 선언
      V_TOT TBL_SUNGJUK.TOT%TYPE;
      V_AVG TBL_SUNGJUK.AVG%TYPE;
      V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN
      -- 아래의 쿼리문 수행을 위해
      -- 위에서 선언한 변수들에 값을 담아내야 한다.(V_TOT, V_AVG, V_GRADE)
      V_TOT := V_KOR + V_ENG + V_MAT;
      V_AVG := V_TOT / 3;
      V_GRADE := 'F';

      IF (V_AVG >= 90)
         THEN V_GRADE := 'A';
      ELSIF (V_AVG >= 80)
         THEN V_GRADE := 'B';
      ELSIF (V_AVG >= 70)
         THEN V_GRADE := 'C';
      ELSIF (V_AVG >= 60)
         THEN V_GRADE := 'D';
      ELSE 
         V_GRADE := 'F';
      END IF;
 
      -- UPDATE 쿼리문 구성
      UPDATE TBL_SUNGJUK
      SET KOR = V_KOR
        , ENG = V_ENG
        , MAT = V_MAT
        , TOT = V_TOT
        , AVG = V_AVG
        , GRADE = V_GRADE
      WHERE HAKBUN = V_HAKBUN;
      
      -- 커밋
      COMMIT;
END;
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR    IN TBL_SUNGJUK.KOR%TYPE
, V_ENG    IN TBL_SUNGJUK.ENG%TYPE
, V_MAT    IN TBL_SUNGJUK.MAT%TYPE
)
IS
      -- 주요 변수 선언
      V_TOT TBL_SUNGJUK.TOT%TYPE;
      V_AVG TBL_SUNGJUK.AVG%TYPE;
      V_GRADE TBL_SUNGJUK.GRADE%TYPE;
BEGIN

      V_TOT := V_KOR + V_ENG + V_MAT;
      V_AVG := V_TOT / 3;
      V_GRADE := CASE  WHEN V_AVG >= 90 THEN 'A'
                       WHEN V_AVG >= 80 THEN 'B'
                       WHEN V_AVG >= 70 THEN 'C'
                       WHEN V_AVG >= 60 THEN 'D'
                       ELSE 'F'
               END;

      -- TBL_SUNGJUK 테이블의 데이터 업데이트
      UPDATE TBL_SUNGJUK
      SET KOR = V_KOR
        , ENG = V_ENG
        , MAT = V_MAT
        , TOT = V_TOT
        , AVG = V_AVG
        , GRADE = V_GRADE
      WHERE HAKBUN = V_HAKBUN;
      
      -- 커밋
      COMMIT;
END;
-- ==>> Procedure PRC_SUNGJUK_UPDATE이(가) 컴파일되었습니다.
-----------------[ 실습 - END ] ------------------------------


--▣ TBL_STUDENTS 테이블에서 
-- 전화번호와 주소 데이터를 변경하는(수정하는) 프로시저를 작성한다.
-- 단, ID와 PW 가 일치하는 경우에는 변경(/수정)을 진행할 수 있도록 처리한다.
-- 프로시저명 : PRC_STUDENTS_UPDATE
/*
   실행 예)
   ▶EXEC PRC_STUDENTS_UPDATE('superman', 'java1111', '010-22222-8765', '인천 서구');
   → 프로시저 호출로 처리된 결과 ( PW가 틀린 경우, UPDATE 미반영)
   superman   김한국         010-1111-5678        제주도 서귀포시                                                                                       

   ▶EXEC PRC_STUDENTS_UPDATE('superman', 'java', '010-22222-8765', '인천 서구');
   → 프로시저 호출로 처리된 결과 ( PW가 맞는 경우, UPDATE 반영)
*/
-----------------[ 강사님 풀이 - START ] ------------------------------
/* 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_TEL  IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
END; 
*/

/* 
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_TEL  IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
      -- 주요 변수 선언
BEGIN
      -- UPDATE 쿼리문 구성
      -- TBL_STUDENTS 테이블에 데이터 UPDATE
      UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR FROM TBL_STUDENTS S JOIN TBL_IDPW ON S.ID = I.ID) T
      SET T.TEL = 입력받은전화번호, T.ADDR = 입력받은주소
      WHERE T.ID = 입력받은아이디 AND T.PW = 입력받은PW

      -- 커밋
      COMMIT;
END; 
*/

CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_TEL  IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
      -- 주요 변수 선언
BEGIN
      -- UPDATE 쿼리문 구성
      -- TBL_STUDENTS 테이블에 데이터 UPDATE
      UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR 
               FROM TBL_STUDENTS S JOIN TBL_IDPW I
               ON S.ID = I.ID) T
      SET T.TEL = V_TEL
        , T.ADDR = V_ADDR
      WHERE T.ID = V_ID AND T.PW = V_PW;

      -- 커밋
      COMMIT;
END;
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID IN TBL_IDPW.ID%TYPE
, V_PW IN TBL_IDPW.PW%TYPE
, V_TEL  IN TBL_STUDENTS.TEL%TYPE
, V_ADDR IN TBL_STUDENTS.ADDR%TYPE
)
IS
      -- 주요 변수 선언
BEGIN
      -- TBL_STUDENTS 테이블에 데이터 UPDATE
      UPDATE TBL_STUDENTS
      SET TEL = V_TEL
        , ADDR = V_ADDR
      WHERE ID = (SELECT ID FROM TBL_IDPW WHERE PW = V_PW)
        AND ID = V_ID;

      -- 커밋
      COMMIT;
END;
-- ==>> Procedure PRC_STUDENTS_UPDATE이(가) 컴파일되었습니다.
-----------------[ 실습 - END ] ------------------------------

DESC TBL_INSABACKUP;
/* 
이름       널?       유형           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)   
*/

--▣ TBL_INSABACKUP 테이블을 대상으로 신규 데이터 입력 프로시저를 작성한다.
--   NUM, NMAE, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG
--   구조를 갖고 있는 대상 테이블에 데이터 입력 시
--   NUM 항목(사원번호)의 값은
--   기존 부여된 사원번호 마지막 번호의 그 다음 번호를
--   자동으로 입력 처리할 수 있는 프로시저로 구성한다.
-- 프로시저명 : PRC_INSA_INSERT
/* 
실행 예)
PRC_INSA_INSERT('김한국', '941006-1234567', SYSDATE, '서울', '010-4567-7564', '영업부', '대리', 10000,10000);
*/

-----------------[ 강사님 풀이 - START ] ------------------------------
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NAME        IN TBL_INSABACKUP.NAME%TYPE
, V_SSN         IN TBL_INSABACKUP.SSN%TYPE
, V_IBSADATE    IN TBL_INSABACKUP.IBSADATE%TYPE
, V_CITY        IN TBL_INSABACKUP.CITY%TYPE
, V_TEL         IN TBL_INSABACKUP.TEL%TYPE
, V_BUSEO       IN TBL_INSABACKUP.BUSEO%TYPE
, V_JIKWI       IN TBL_INSABACKUP.JIKWI%TYPE
, V_BASICPAY    IN TBL_INSABACKUP.BASICPAY%TYPE
, V_SUDANG      IN TBL_INSABACKUP.SUDANG%TYPE
)
IS
      -- INSERT 쿼리문 수행에 필요한 주요 변수 선언
      V_NUM TBL_INSABACKUP.NUM%TYPE;
BEGIN
      DBMS_OUTPUT.PUT_LINE('>>>SQLCODE: ' + SQLCODE);
      SELECT MAX(NUM) + 1 INTO V_NUM FROM TBL_INSABACKUP;
      
      -- TBL_INSABACKUP 테이블에 데이터 입력
      INSERT INTO TBL_INSABACKUP(NUM     
                               , NAME    
                               , SSN     
                               , IBSADATE
                               , CITY    
                               , TEL     
                               , BUSEO   
                               , JIKWI   
                               , BASICPAY
                               , SUDANG)
      VALUES(V_NUM     
           , V_NAME    
           , V_SSN     
           , V_IBSADATE
           , V_CITY    
           , V_TEL     
           , V_BUSEO   
           , V_JIKWI   
           , V_BASICPAY
           , V_SUDANG);

      DBMS_OUTPUT.PUT_LINE('>>>SQLERRM: ' + SQLERRM);

      -- 커밋
      COMMIT;
END;
-- ==> Procedure PRC_INSA_INSERT이(가) 컴파일되었습니다.
-----------------[ 강사님 풀이 - END ] --------------------------------

PRC_INSA_INSERT('김한국', '941006-1234567', SYSDATE, '서울', '010-4567-7564', '영업부', '대리', 500000,500000);

--▣ 실습 테이블 생성 -> [20250714_02_scott.sql] 참조
-- 테이블명 : TBL_상품
-- 테이블명 : TBL_입고
--   TBL_상품, TBL_입고 테이블을 대상으로
--   TBL_입고 테이블에 데이터 입력 시(즉, 입고 이벤트 발생 시)
--   TBL_상품 테이블의 해당 상품에 대한 재고수량이 함께 변동될 수 있는 기능을 가진
--   프로시저를 작성한다.
--   단, 이 과정에서 입고 번호는 자동 증가 처리한다. (시퀀스 사용 안함)
--   TBL_입고 테이블 구성 컬럼은
--   입고번호, 상품코드, 입고일자, 입고수량, 입고단가 이며
--   프로시저 호출을 통해 전달할 파라미터는 상품코드, 입고수량, 입고단가 이다.
--   프로시저명 : PRC_입고_INSERT(상품코드, 입고수량, 입고단가)
/* 
실행 예)
EXEC PRC_입고_INSERT('HOO1', 10, 1000);

 → 이 프로시저 호출로 처리되는 업무 ⓐ
H001 홈런볼 1500 10

 → 이 프로시저 호출로 처리되는 업무 ⓑ
1 H001 2025-07-14 10 1000
 */
-----------------[ 강사님 풀이 - START ] ------------------------------
-- ① INSERT → TBL_입고
--    INSERT INTO TBL_입고(입고번호, 상품코드, 입고일자, 입고수량, 입고단가)
--    VALUES(1, 'H001', SYSDATE, 20, 1000);
-- ② UPDATE → TBL_상품
--    UPDATE TBL_상품
--    SET 재고수량 = 기존재고수량 + 입고수량      -- CHECK~!!!
--    WHERE 상품코드 = 'H001';
CREATE OR REPLACE PROCEDURE PRC_입고_INSERT
( V_상품코드    IN TBL_입고.상품코드%TYPE
, V_입고수량    IN TBL_입고.입고수량%TYPE
, V_입고단가    IN TBL_입고.입고단가%TYPE
)
IS
      -- 선언부
      -- 아래의 쿼리문을 수행하기 위해 필요한 데이터 변수로 추가 선언
       V_입고번호  TBL_입고.입고번호%TYPE;
BEGIN
      -- 실행부
      -- 선언한 변수에 값 담아내기
      -- SELECT 쿼리문 수행 → 입고번호 확인
      SELECT NVL(MAX(입고번호), 0) INTO V_입고번호
      FROM TBL_입고;
      
      -- 쿼리문 구성
      -- ① INSERT → TBL_입고
      INSERT INTO TBL_입고(입고번호, 상품코드, 입고수량, 입고단가)
      VALUES((V_입고번호+1), V_상품코드, V_입고수량, V_입고단가);
      
      -- ② UPDATE → TBL_상품
      UPDATE TBL_상품
      SET 재고수량 = 재고수량 + V_입고수량      -- CHECK~!!!
      WHERE 상품코드 = V_상품코드;

      -- 커밋
      COMMIT;

      -- 예외 처리
      EXCEPTION
            WHEN OTHERS THEN ROLLBACK;
END;
-- ==>> Procedure PRC_입고_INSERT이(가) 컴파일되었습니다.
-----------------[ 강사님 풀이 - END ] --------------------------------


--▣▣▣ 프로시저 내에서의 예외 처리 ▣▣▣--
--▣ TBL_MEMBER 테이블에 데이터를 입력하는 프로시저를 생성
--   단, 이 프로시저를 통해 데이터를 입력할 경우
--   CITY(지역) 항목에 '서울', '경기', '대전'만 입력이 가능하도록 구성한다.
--   이 지역 외의 다른 지역을 프로시저 호출을 통해 입력하려는 경우
--   (즉, 유효하지 않은 데이터 입력을 시도하려는 경우)
--   예외에 대한 처리를 하려고 한다.
--   프로시저명 : PRC_MEMBER_INSERT(이름, 전화번호, 지역)

/*
실행 예)
      EXEC PRC_MEMBER_INSERT('박범구', '010-1111-1111', '서울');
      --> 데이터 입력 ○

      EXEC PRC_MEMBER_INSERT('김한국', '010-2222-2222', '부산');
      --> 데이터 입력 Ⅹ
*/


CREATE OR REPLACE PROCEDURE PRC_MEMBER_INSERT
( V_NAME    IN TBL_MEMBER.NAME%TYPE
, V_TEL     IN TBL_MEMBER.TEL%TYPE
, V_CITY    IN TBL_MEMBER.CITY%TYPE
)
IS
    -- 실행 영역의 쿼리문 수행을 위해 필요한 변수 추가 선언
    V_NUM   TBL_MEMBER.NUM%TYPE;
    
    -- 사용자 정의 예외를 변수처럼 선언하여, IF문에서 처리하자.
    -- USER_DEFINE_ERROR는 '예외타입'이다.

    -- 사용자 정의 예외에 대한 변수 선언 CHECK~!!!
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 프로시저를 통해 입력 액션 처리를 정상적으로 진행해야 할 데이터인지 아닌지의 여부를
    -- 가장 먼저 확인할 수 있도록 해당 위치에 코드 구성

    -- 매개변수로 입력받은 값(V_CITY)이, 서울, 경기, 대전 중 어느 하나도 아닐 경우.
    IF (V_CITY NOT IN ('서울', '경기', '대전'))
        -- 예외 발생    CHECK~!!!
        -- *[RAISE] : 일으키다, 발생시키다.
        -- 서울, 경기, 대전이 아닐 경우 USER_DEFINE_ERROR를 발생시킬 것이다.
        -- 예외를 일으키는 구문은 항상 COMMIT보다 먼저 작성하자.
        
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
      
    -- 선언한 변수에 값 담아내기
    SELECT NVL(MAX(NUM), 0) INTO V_NUM
    FROM TBL_MEMBER;
      
    -- 쿼리문 구성 → INSERT
    INSERT INTO TBL_MEMBER(NUM, NAME, TEL, CITY)
    VALUES(V_NUM + 1, V_NAME, V_TEL, V_CITY);
      
    -- 예외 처리 구문
    -- 오류가, USER_DEFINE_ERROR라면...
    -- 오라클 내장 에러 함수를 호출한다.
    -- 2만 1번부터 유저가 부여할 수 있는 에러 번호이다.
    
    -- ★★ 예외처리 [JAVA]의 TRY~CATCH 와 유사함.
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            -- THEN RAISE_APPLICATION_ERROR(에러코드(-20000 ~ -20999), '서울, 경기, 에러내용기술);
            THEN RAISE_APPLICATION_ERROR(-20001, '서울, 경기, 대전만 입력이 가능합니다.');
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
-- ==>> Procedure PRC_MEMBER_INSERT이(가) 컴파일되었습니다.

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
