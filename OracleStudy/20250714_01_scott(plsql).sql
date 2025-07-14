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


--※ 참고

-- 1.


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

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
