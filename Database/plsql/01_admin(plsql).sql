SELECT USER
FROM DUAL;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SET SERVEROUTPUT ON;

-----------------------------[주민번호 유효성 검사]----------------------------------------------------------
CREATE OR REPLACE FUNCTION FUNC_IS_SSN_VALID
( 
    IN_JUMIN_NO IN VARCHAR2
) RETURN INTEGER
  IS       
    SSN VARCHAR2(13);  
    SSN_CHECK_BIT VARCHAR2(12) := '234567892345'; --검증값   
    TOTAL_SUM NUMBER := 0;
    VALID_CHECK_RESULT NUMBER := 0;
    OUT_RETURN INTEGER := 0;  
  BEGIN
    SSN := REPLACE(TRIM(IN_JUMIN_NO), '-', '');
    
    FOR i IN 1..12
    LOOP
       TOTAL_SUM := TOTAL_SUM  
                 + TO_NUMBER(SUBSTR(SSN, i, 1)) 
                 * TO_NUMBER(SUBSTR(SSN_CHECK_BIT, i, 1));
    END LOOP; 
    
    IF TO_NUMBER(SUBSTR(SSN, 7, 1)) IN (5, 6, 7, 8) THEN 
        --외국인
        VALID_CHECK_RESULT := MOD(13 - (MOD(TOTAL_SUM, 11)), 10);
    ELSE 
        --내국인
        VALID_CHECK_RESULT := MOD(11 - (MOD(TOTAL_SUM, 11)), 10);
    END IF; 
    
    IF TO_NUMBER(SUBSTR(SSN, 13, 1)) = VALID_CHECK_RESULT THEN        
        OUT_RETURN := 0;
    ELSE
        OUT_RETURN := -1;
    END IF;    
 
    RETURN OUT_RETURN;
    
    EXCEPTION
        WHEN OTHERS THEN RETURN -1;
 
  END;


-------------------------[관리자 등록]----------------------------------------------------
--- [6] ---- [TBL_ADMIN][관리자]
-- ▣ 데이터 입력
-- INSERT INTO MIRACLE.TBL_ADMIN (ADMIN_ID, NAME, SSN) VALUES (MIRACLE.SEQ_ADMIN.NEXTVAL, '임창요', '630207-1423779');

CREATE OR REPLACE PROCEDURE PROC_ADD_ADMIN
( 
  P_NAME IN MIRACLE.TBL_ADMIN.NAME%TYPE
, P_SSN IN MIRACLE.TBL_ADMIN.SSN%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN

    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_ADMIN WHERE SSN = P_SSN;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 관리자 입니다.';
    ELSIF (LENGTH(P_NAME) > 16) THEN
        R_DATA := -2;
        R_MSG  := '이름은 한글 최대 8자(영문 16자) 입니다.';
    ELSIF FUNC_IS_SSN_VALID(P_SSN) = -1 THEN
        R_DATA := -3;
        R_MSG  := '주민번호 유효성 검사에 실패했습니다.';
    ELSE 
        INSERT INTO MIRACLE.TBL_ADMIN (ADMIN_ID, NAME, SSN) VALUES (MIRACLE.SEQ_ADMIN.NEXTVAL, P_NAME, P_SSN);
        R_DATA := 0;
        R_MSG  := '등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '등록이 실패 되었습니다.';
END;

------
SELECT name, SSN, FUNC_IS_SSN_VALID(SSN)
FROM MIRACLE.TBL_ADMIN
WHERE ADMIN_ID = 90000008;
-----
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADD_ADMIN('임평황5', '890418-2179085', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;


-------------------------[수강생 등록]----------------------------------------------------
--- [7] ---- [TBL_STUDENT][학생]
-- ▣ 데이터 입력
-- INSERT INTO MIRACLE.TBL_STUDENT (STUDENT_ID, NAME, SSN) VALUES (MIRACLE.SEQ_STUDENT.NEXTVAL, '장율후', '930616-1347348');
CREATE OR REPLACE PROCEDURE PROC_ADD_STUDENT
( 
  P_NAME IN MIRACLE.TBL_ADMIN.NAME%TYPE
, P_SSN IN MIRACLE.TBL_ADMIN.SSN%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN

    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_STUDENT WHERE SSN = P_SSN;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 수강생 입니다.';
    ELSIF (LENGTH(P_NAME) > 16) THEN
        R_DATA := -2;
        R_MSG  := '이름은 한글 최대 8자(영문 16자) 입니다.';
    ELSIF FUNC_IS_SSN_VALID(P_SSN) = -1 THEN
        R_DATA := -3;
        R_MSG  := '주민번호 유효성 검사에 실패했습니다.';
    ELSE 
        INSERT INTO MIRACLE.TBL_STUDENT (STUDENT_ID, NAME, SSN) VALUES (MIRACLE.SEQ_STUDENT.NEXTVAL, P_NAME, P_SSN);
        R_DATA := 0;
        R_MSG  := '등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '등록이 실패 되었습니다.';
END;

------------------------
SELECT STUDENT_ID, name, SSN, FUNC_IS_SSN_VALID(SSN)
FROM MIRACLE.TBL_STUDENT
-- WHERE STUDENT_ID = 20000084;
ORDER BY STUDENT_ID ASC;
-----
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADD_STUDENT('유담훔', '850925-241464', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

배재하	070228-1829244
변찬옥	070405-2850866

exec PROC_ADD_STUDENT('배재하', '070228-1829244', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADD_STUDENT('변찬옥', '070405-2850866', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
-------------------------[교수자 등록]----------------------------------------------------
--- [8] ---- [TBL_LECTURER][교수자]
-- ▣ 데이터 입력
-- INSERT INTO MIRACLE.TBL_LECTURER (LECTURER_ID, NAME, SSN) VALUES (MIRACLE.SEQ_LECTURER.NEXTVAL, '서탁중', '960510-1385356');

CREATE OR REPLACE PROCEDURE PROC_ADD_LECTURER
( 
  P_NAME IN MIRACLE.TBL_LECTURER.NAME%TYPE
, P_SSN IN MIRACLE.TBL_LECTURER.SSN%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_LECTURER WHERE SSN = P_SSN;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 교수자 입니다.';
    ELSIF (LENGTH(P_NAME) > 16) THEN
        R_DATA := -2;
        R_MSG  := '이름은 한글 최대 8자(영문 16자) 입니다.';
    ELSIF FUNC_IS_SSN_VALID(P_SSN) = -1 THEN
        R_DATA := -3;
        R_MSG  := '주민번호 유효성 검사에 실패했습니다.';
    ELSE 
        INSERT INTO MIRACLE.TBL_LECTURER (LECTURER_ID, NAME, SSN) VALUES (MIRACLE.SEQ_LECTURER.NEXTVAL, P_NAME, P_SSN);
        R_DATA := 0;
        R_MSG  := '등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '등록이 실패 되었습니다.';
END;

-----
SELECT LECTURER_ID, name, SSN, FUNC_IS_SSN_VALID(SSN)
FROM MIRACLE.TBL_LECTURER
-- WHERE LECTURER_ID = 10000082;
ORDER BY LECTURER_ID ASC;
-----
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADD_LECTURER('유담훔', '040713-1540653', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

백석희	930224-1876724
천잎효	990108-1535652

exec PROC_ADD_LECTURER('백석희', '930224-1876724', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADD_LECTURER('천잎효', '990108-1535652', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

-----------------------------------------------------------------------------

----------------[login]-------------
CREATE OR REPLACE procedure PROC_ADMIN_LOGIN
( P_ID IN VARCHAR2
, P_PW IN VARCHAR2
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
    R_DATA := NULL;
    R_MSG := TO_CHAR(STATUS);

    -- 기본 ID/PW : ADMIN_ID/SSN 끝 7자
    -- NEW ID/PW : LOGIN_ID/LOGIN_PW
    SELECT NVL((SELECT  ADMIN_ID FROM MIRACLE.TBL_ADMIN WHERE  NAME = P_ID OR LOGIN_ID = P_ID), -1)  INTO STATUS
      FROM DUAL;     
      
    IF STATUS != -1 THEN
        R_DATA := NULL;
        R_MSG := TO_CHAR(STATUS);
        SELECT NVL((SELECT ADMIN_ID FROM MIRACLE.TBL_ADMIN
                           WHERE (NAME = P_ID AND SUBSTR(SSN, 8) = P_PW )
                            OR (LOGIN_ID = P_ID AND LOGIN_PW = P_PW)), -2) INTO STATUS
        FROM DUAL;

        IF STATUS = -2 THEN
            R_DATA := NULL;
            R_MSG :=  TO_CHAR(STATUS);
        ELSE
            R_DATA := TO_CHAR(STATUS);
            R_MSG := '0';
        END IF;
    END IF;
END;

----------------------------------------------
SELECT *
FROM TBL_ADMIN
-- WHERE ADMIN_ID = 90000002;
ORDER BY ADMIN_ID ASC;
----------------------------------------------
-- UPDATE TBL_ADMIN
-- SET LOGIN_ID = 'QUANTUM7', LOGIN_PW = 'WORld123'
-- WHERE ADMIN_ID = 90000002;
----------------------------------------------
-- 커밋
COMMIT;

--------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADMIN_LOGIN('임창요','1423779', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADMIN_LOGIN('WORld','WORld', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADMIN_LOGIN('이분일','WORld', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADMIN_LOGIN('QUANTUM','WORld', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
----------------------------------------------



-----------------[SELECT ADMIN]---------------------------
CREATE OR REPLACE PROCEDURE PROC_ADMIN_SELECT (
    -- P_USER_CD           VARCHAR2,
    C_ADMIN   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_ADMIN FOR 
    SELECT * FROM MIRACLE.TBL_ADMIN ORDER BY ADMIN_ID ASC;
END;
-------------------------------------------------------------
variable rc refcursor;
EXECUTE PROC_ADMIN_SELECT(:rc);
print rc;


VAR rc REFCURSOR;
EXEC PROC_ADMIN_SELECT(:rc);
PRINT rc;

-----------------[SELECT LECTURER]---------------------------
CREATE OR REPLACE PROCEDURE PROC_LECTURER_SELECT (
    -- P_USER_CD           VARCHAR2,
    C_LECTURER   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_LECTURER FOR 
    SELECT * FROM MIRACLE.TBL_LECTURER ORDER BY LECTURER_ID ASC;
END;
-------------------------------------------------------------
variable rc refcursor;
EXECUTE PROC_LECTURER_SELECT(:rc);
print rc;


VAR rc REFCURSOR;
EXEC PROC_LECTURER_SELECT(:rc);
PRINT rc;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_STUDENT_SELECT (
    C_STUDENT   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_STUDENT FOR 
    SELECT * FROM MIRACLE.TBL_STUDENT ORDER BY STUDENT_ID ASC;
END;

-------------------------------------------------------------
VAR rc REFCURSOR;
EXEC PROC_STUDENT_SELECT(:rc);
PRINT rc;


------------------------------------------------------------------------------
-- 커밋
COMMIT;
------------------------------------------------------------------------------


-----------------[관리자 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_ADMIN_REG_LOGIN_ID_CHK
( 
  P_LOGIN_ID_NEW IN MIRACLE.TBL_ADMIN.LOGIN_ID%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_ADMIN WHERE LOGIN_ID = P_LOGIN_ID_NEW;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE
        R_DATA := 0;
        R_MSG  := '사용 가능한 ID 입니다.';
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN R_MSG  := '다른 ID를 입력해 입니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_ADMIN_REG_LOGIN_ID_CHK('BlueSee', :r_data, :r_msg);
exec PROC_ADMIN_REG_LOGIN_ID_CHK('QUANTUM77', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_ADMIN
WHERE ADMIN_ID = 90000007 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;
------------------------------------------------------------------------------
-----------------[관리자 로그인ID/PW 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_ADMIN_REG_LOGIN_ID_PW
( 
  P_ADMIN_ID IN MIRACLE.TBL_ADMIN.ADMIN_ID%TYPE
, P_LOGIN_ID_NEW IN MIRACLE.TBL_ADMIN.LOGIN_ID%TYPE
, P_LOGIN_PW_NEW IN MIRACLE.TBL_ADMIN.LOGIN_PW%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_ADMIN WHERE LOGIN_ID = P_LOGIN_ID_NEW AND ADMIN_ID != P_ADMIN_ID;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE 
        UPDATE MIRACLE.TBL_ADMIN
        SET LOGIN_ID = P_LOGIN_ID_NEW, LOGIN_PW = P_LOGIN_PW_NEW
        WHERE ADMIN_ID = P_ADMIN_ID;
        R_DATA := 0;
        R_MSG  := '로그인 ID/PW 등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '로그인 ID/PW 등록에 실패 되었습니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_ADMIN_REG_LOGIN_ID_CHK('BlueSee', :r_data, :r_msg);
-- exec PROC_ADMIN_REG_LOGIN_ID_PW(90000007, 'quantum777', '@world765', :r_data, :r_msg);
exec PROC_ADMIN_REG_LOGIN_ID_PW(90000006, 'quantum877', '@world768', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_ADMIN
WHERE ADMIN_ID = 90000007 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

-----------------[교수자 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_LECTURER_REG_LOGIN_ID_CHK
( 
  P_LOGIN_ID_NEW IN MIRACLE.TBL_LECTURER.LOGIN_ID%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_LECTURER WHERE LOGIN_ID = P_LOGIN_ID_NEW;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE 
        R_DATA := 0;
        R_MSG  := '사용 가능한 ID 입니다.';
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN R_MSG  := '이미 사용중인 ID 입니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_LECTURER_REG_LOGIN_ID_CHK('BlueSee777', :r_data, :r_msg);
-- exec PROC_LECTURER_REG_LOGIN_ID_CHK('BuleSKY', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;



SELECT *
FROM TBL_LECTURER
WHERE LOGIN_ID IS NOT NULL;
WHERE LECTURER_ID = 90000007 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

------------------------------------------------------------------------------
-----------------[교수자 로그인ID/PW 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_LECTURER_REG_LOGIN_ID_PW
( 
  P_LECTURER_ID IN MIRACLE.TBL_LECTURER.LECTURER_ID%TYPE
, P_LOGIN_ID_NEW IN MIRACLE.TBL_LECTURER.LOGIN_ID%TYPE
, P_LOGIN_PW_NEW IN MIRACLE.TBL_LECTURER.LOGIN_PW%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_LECTURER WHERE LOGIN_ID = P_LOGIN_ID_NEW AND LECTURER_ID != P_LECTURER_ID;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE 
        UPDATE MIRACLE.TBL_LECTURER
        SET LOGIN_ID = P_LOGIN_ID_NEW, LOGIN_PW = P_LOGIN_PW_NEW
        WHERE LECTURER_ID = P_LECTURER_ID;
        R_DATA := 0;
        R_MSG  := '로그인 ID/PW 등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '로그인 ID/PW 등록이 실패 되었습니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_LECTURER_REG_LOGIN_ID_PW(10000084, 'BlueSee', '#world76', :r_data, :r_msg);
exec PROC_LECTURER_REG_LOGIN_ID_PW(10000085, 'BlueSee99', '#world765', :r_data, :r_msg);
-- exec PROC_LECTURER_REG_LOGIN_ID_PW('BuleSKY', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;



SELECT *
FROM TBL_LECTURER
-- WHERE LOGIN_ID IS NOT NULL;
WHERE LECTURER_ID = 10000085  ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;
------------------------------------------------------------------------------
-----------------[학생 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_STUDENT_REG_LOGIN_ID_CHK
( 
  P_LOGIN_ID_NEW IN MIRACLE.TBL_STUDENT.LOGIN_ID%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_STUDENT WHERE LOGIN_ID = P_LOGIN_ID_NEW;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE 
        R_DATA := 0;
        R_MSG  := '사용 가능한 ID 입니다.';
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN R_MSG  := '이미 사용중인 ID 입니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_STUDENT_REG_LOGIN_ID_CHK('BlueSee', :r_data, :r_msg);
-- exec PROC_STUDENT_REG_LOGIN_ID_CHK('BuleSKY', :r_data, :r_msg);
exec PROC_STUDENT_REG_LOGIN_ID_CHK('Quantum765', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
----------------
UPDATE MIRACLE.TBL_STUDENT
SET LOGIN_ID = 'Quantum', LOGIN_PW = '@world76'
WHERE STUDENT_ID = 20000090 ;


SELECT *
FROM TBL_STUDENT
WHERE LOGIN_ID IS NOT NULL;
WHERE LECTURER_ID = 90000007 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

------------------------------------------------------------------------------
-----------------[학생 로그인ID 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_STUDENT_REG_LOGIN_ID_PW
( 
  P_STUDENT_ID IN MIRACLE.TBL_STUDENT.STUDENT_ID%TYPE
, P_LOGIN_ID_NEW IN MIRACLE.TBL_STUDENT.LOGIN_ID%TYPE
, P_LOGIN_PW_NEW IN MIRACLE.TBL_STUDENT.LOGIN_PW%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_STUDENT WHERE LOGIN_ID = P_LOGIN_ID_NEW AND  STUDENT_ID != P_STUDENT_ID;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 사용중인 ID 입니다.';
    ELSIF (LENGTH(P_LOGIN_ID_NEW) < 8) THEN
        R_DATA := -2;
        R_MSG  := 'ID는 최소 8자 이상입니다.';
    ELSE 
        UPDATE MIRACLE.TBL_STUDENT
        SET LOGIN_ID = P_LOGIN_ID_NEW, LOGIN_PW = P_LOGIN_PW_NEW
        WHERE STUDENT_ID = P_STUDENT_ID;
        R_DATA := 0;
        R_MSG  := '로그인 ID/PW 등록이 완료 되었습니다.';

        COMMIT;
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '로그인 ID/PW 등록이 실패 되었습니다.';
END;
-------------------------------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_STUDENT_REG_LOGIN_ID_PW(20000090, 'BlueSee', :r_data, :r_msg);
-- exec PROC_STUDENT_REG_LOGIN_ID_PW(20000090, 'BuleSKY', :r_data, :r_msg);
exec PROC_STUDENT_REG_LOGIN_ID_PW(20000079, 'Quantum7656', '@#world76', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
----------------

SELECT *
FROM TBL_STUDENT
-- WHERE LOGIN_ID IS NOT NULL;
WHERE STUDENT_ID = 20000079 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

----------------------[과정명 리스트 조회]-------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_GET_CURRICULUM_CODELIST (
    C_CURRICULUM_CODELIST   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_CURRICULUM_CODELIST FOR 
    SELECT * FROM MIRACLE.TBL_CURRICULUM ORDER BY CURRIC_NAME ASC;
END;

---------------
VAR rc REFCURSOR;
EXEC PROC_GET_CURRICULUM_CODELIST(:rc);
PRINT rc;

------------------[과정명 코드 추가]----------
CREATE OR REPLACE PROCEDURE PROC_ADD_CURRICULUM_CODE
( 
  P_CURRIC_NAME IN MIRACLE.TBL_CURRICULUM.CURRIC_NAME%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_CURRICULUM WHERE CURRIC_NAME = P_CURRIC_NAME;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 과정코드입니다.';
    ELSE 
        R_DATA := 0;
        R_MSG  := '과정코드를 등록 완료!';
        INSERT INTO MIRACLE.TBL_CURRICULUM (CURRIC_CODE, CURRIC_NAME) 
        VALUES (SEQ_CURRICULUM.NEXTVAL, P_CURRIC_NAME);
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN R_MSG  := '과정코드 등록에 실패 했습니다.';
END;

----------------------[강의실 리스트 조회]-------------------------------------------
CREATE OR REPLACE PROCEDURE PROC_GET_CLASSROOM_CODELIST (
    C_CLASSROOM_CODELIST   OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN C_CLASSROOM_CODELIST FOR 
    SELECT * FROM MIRACLE.TBL_CLASSROOM ORDER BY CR_INFO ASC;
END;

---------------
VAR rc REFCURSOR;
EXEC PROC_GET_CLASSROOM_CODELIST(:rc);
PRINT rc;

-----------------------[강의실 코드 추가-----
CREATE OR REPLACE PROCEDURE PROC_ADD_CLASSROOM_CODE
( 
  P_CLASSROOM_INFO IN MIRACLE.TBL_CLASSROOM.CR_INFO%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
   
    SELECT count(*) INTO STATUS FROM MIRACLE.TBL_CLASSROOM WHERE CR_INFO = P_CLASSROOM_INFO;
    
    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 강의실 코드입니다.';
    ELSE 
        R_DATA := 0;
        R_MSG  := '강의실 코드 등록 완료!';
        INSERT INTO MIRACLE.TBL_CLASSROOM (CR_CODE, CR_INFO) 
        VALUES (SEQ_CLASSROOM.NEXTVAL, P_CLASSROOM_INFO);
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN R_MSG  := '강의실 코드 등록에 실패!!';
END;

--------------
VAR rc REFCURSOR;
EXEC PROC_GET_CLASSROOM_CODELIST(:rc);
PRINT rc;


VARIABLE R_DATA VARCHAR2(300);
VARIABLE R_MSG VARCHAR2(300);
EXEC PROC_ADD_CLASSROOM_CODE('505 호 강의실', :r_data, :r_msg);
PRINT R_DATA;
PRINT R_MSG;
----------------

-----------------[개설과정 등록]-------------------------------------------------------------
--- [9] ---- [TBL_OFFERED_CURRICULUM][개설과정]
-- ▣ 데이터 입력
-- INSERT INTO MIRACLE.TBL_OFFERED_CURRICULUM (OCU_ID, OCU_SDATE, OCU_EDATE, OCU_SESSION, OCU_STUD_MAX, CURRIC_CODE, CR_CODE) 
-- VALUES (MIRACLE.SEQ_OCU.NEXTVAL, TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 1, 20, 80000002, 85000014);


CREATE OR REPLACE PROCEDURE PROC_ADD_OCU
( 
  P_OCU_SDATE IN VARCHAR2
, P_OCU_EDATE IN VARCHAR2
, P_OCU_SESSION IN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_SESSION%TYPE
, P_OCU_STUD_MAX IN MIRACLE.TBL_OFFERED_CURRICULUM.OCU_STUD_MAX%TYPE
, P_CURRIC_CODE IN MIRACLE.TBL_OFFERED_CURRICULUM.CURRIC_CODE%TYPE
, P_CR_CODE IN MIRACLE.TBL_OFFERED_CURRICULUM.CR_CODE%TYPE
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
    N_OCU_SDATE NUMBER(10):= 0;
    N_OCU_EDATE NUMBER(10):= 0;
BEGIN

    N_OCU_SDATE :=  LENGTH(TRIM(P_OCU_SDATE));
    N_OCU_EDATE :=  LENGTH(TRIM(P_OCU_EDATE));

    SELECT COUNT(*) INTO STATUS 
    FROM MIRACLE.TBL_OFFERED_CURRICULUM 
    WHERE OCU_SESSION = P_OCU_SESSION 
    AND CURRIC_CODE = P_CURRIC_CODE;

    IF STATUS > 0 THEN
        R_DATA := -1;
        R_MSG  := '이미 등록된 과정입니다.';
    ELSIF N_OCU_SDATE != 10 THEN
        R_DATA := -2;
        R_MSG  := '과정 시작일 오류!';
    ELSIF N_OCU_EDATE != 10 THEN
        R_DATA := -3;
        R_MSG  := '과정 종료일 오류!';
    ELSE 
        INSERT INTO MIRACLE.TBL_OFFERED_CURRICULUM (OCU_ID, OCU_SDATE, OCU_EDATE, OCU_SESSION, OCU_STUD_MAX, CURRIC_CODE, CR_CODE) 
        VALUES (MIRACLE.SEQ_OCU.NEXTVAL
            , TO_DATE(P_OCU_SDATE, 'YYYY-MM-DD')
            , TO_DATE(P_OCU_EDATE, 'YYYY-MM-DD')
            , P_OCU_SESSION
            , P_OCU_STUD_MAX
            , P_CURRIC_CODE
            , P_CR_CODE);
        
        COMMIT;
        R_DATA := 0;
        R_MSG  := '과정 등록 완료!!';
    END IF;

    EXCEPTION
        WHEN OTHERS 
            THEN
                R_DATA := -1;
                R_MSG  := '과정 등록에 실패했습니다.';
END;
-------------------------------------------------------------
-- INSERT INTO MIRACLE.TBL_OFFERED_CURRICULUM (OCU_ID, OCU_SDATE, OCU_EDATE, OCU_SESSION, OCU_STUD_MAX, CURRIC_CODE, CR_CODE) 
-- VALUES (MIRACLE.SEQ_OCU.NEXTVAL, TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2026-03-09', 'YYYY-MM-DD'), 1, 20, 80000002, 85000014);
-- 실행
VAR rc REFCURSOR;
EXEC PROC_GET_CURRICULUM_CODELIST(:rc);
PRINT rc;
----------------
VARIABLE R_DATA VARCHAR2(300);
VARIABLE R_MSG VARCHAR2(300);
EXEC PROC_ADD_CURRICULUM_CODE('생성형AI를 활용한 커머스웹(PHP, Laravel, Docker, AWS)개발자 과정', :r_data, :r_msg);
PRINT R_DATA;
PRINT R_MSG;
--------------------
VAR rc REFCURSOR;
EXEC PROC_GET_CURRICULUM_CODELIST(:rc);
PRINT rc;
--------------------
VAR rc REFCURSOR;
EXEC PROC_GET_CLASSROOM_CODELIST(:rc);
PRINT rc;
-------------
VARIABLE R_DATA VARCHAR2(300);
VARIABLE R_MSG VARCHAR2(300);
EXEC PROC_ADD_CLASSROOM_CODE('512 호 강의실', :r_data, :r_msg);
PRINT R_DATA;
PRINT R_MSG;
-------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADD_OCU('2025-08-24', '2025-08-24', 2, 15, 80000005,  85000014,:r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
------------------
SELECT *
FROM TBL_OFFERED_CURRICULUM;

----------------

SELECT *
FROM TBL_STUDENT
-- WHERE LOGIN_ID IS NOT NULL;
WHERE STUDENT_ID = 20000090 ;

------------------------------------------------------------------------------
-- 커밋
COMMIT;

----------------------------------------------------------
--- [10] ---- [TBL_OFFERED_COURSE][개설과목]
-- ▣ 데이터 입력
-- INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
-- VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('1900-01-01', 'YYYY-MM-DD'), TO_DATE('1900-01-01', 'YYYY-MM-DD'), 30000001, 73000001, 74000001, 10000001);

---[OCU_ID = 30000001][1회차]
INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-05-23', 'YYYY-MM-DD'), TO_DATE('2024-06-23', 'YYYY-MM-DD'), 40, 40, 20, 30000001, 73000087, 74000035, 10000002);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-06-24', 'YYYY-MM-DD'), TO_DATE('2024-07-23', 'YYYY-MM-DD'), 40, 30, 30, 30000001, 73000649, 74000085, 10000002);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-07-24', 'YYYY-MM-DD'), TO_DATE('2024-08-23', 'YYYY-MM-DD'), 30, 40, 30, 30000001, 73000650, 74000084, 10000003);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-08-24', 'YYYY-MM-DD'), TO_DATE('2024-10-09', 'YYYY-MM-DD'), 40, 30, 30, 30000001, 73000651, 74000087, 10000003);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_DATE('2024-11-09', 'YYYY-MM-DD'), 80,  0, 20, 30000001, 73000082, 74000088, 10000004);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2024-11-10', 'YYYY-MM-DD'), TO_DATE('2025-01-09', 'YYYY-MM-DD'),  0, 80, 20, 30000001, 73000653, 74000089, 10000004);

---[OCU_ID = 30000002][2회차]
INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-05-23', 'YYYY-MM-DD'), TO_DATE('2025-06-23', 'YYYY-MM-DD'), 40, 40, 20, 30000001, 73000087, 74000035, 10000002);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-06-24', 'YYYY-MM-DD'), TO_DATE('2025-07-23', 'YYYY-MM-DD'), 40, 30, 30, 30000001, 73000649, 74000085, 10000002);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-07-24', 'YYYY-MM-DD'), TO_DATE('2025-08-23', 'YYYY-MM-DD'), 30, 40, 30, 30000001, 73000650, 74000086, 10000003);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2025-10-09', 'YYYY-MM-DD'), 40, 30, 30, 30000001, 73000651, 74000087, 10000003);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-10-10', 'YYYY-MM-DD'), TO_DATE('2025-11-09', 'YYYY-MM-DD'), 80,  0, 20, 30000001, 73000082, 74000088, 10000004);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-11-10', 'YYYY-MM-DD'), TO_DATE('2026-01-09', 'YYYY-MM-DD'),  0, 80, 20, 30000001, 73000653, 74000089, 10000004);

---[OCU_ID = 30000003][1회차]
SET DEFINE OFF;
SET DEFINE %;

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-08-24', 'YYYY-MM-DD'), TO_DATE('2025-09-24', 'YYYY-MM-DD'), 40, 20, 40, 30000002,   73000654, 74000090, 10000005);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-09-25', 'YYYY-MM-DD'), TO_DATE('2025-10-24', 'YYYY-MM-DD'), 40, 20, 40, 30000002,   73000655, 74000091, 10000005);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-10-25', 'YYYY-MM-DD'), TO_DATE('2025-11-24', 'YYYY-MM-DD'), 30, 30, 40, 30000002,   73000656, 74000092, 10000006);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-11-25', 'YYYY-MM-DD'), TO_DATE('2025-12-24', 'YYYY-MM-DD'), 20, 40, 40, 30000002,   73000657, 74000095, 10000006);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2025-12-25', 'YYYY-MM-DD'), TO_DATE('2026-01-24', 'YYYY-MM-DD'), 10, 50, 40, 30000002,   73000658, 74000094, 10000007);

INSERT INTO MIRACLE.TBL_OFFERED_COURSE (OCO_ID, OCO_SDATE, OCO_EDATE, OCO_WGT_WT, OCO_WGT_PT, OCO_WGT_ATTEND, OCU_ID, SUBJ_CODE, TB_CODE, LECTURER_ID) 
VALUES (MIRACLE.SEQ_OC.NEXTVAL, TO_DATE('2026-01-2', 'YYYY-MM-DD'), TO_DATE('2025-03-09', 'YYYY-MM-DD'),   0, 60, 40, 30000002,   73000659, 74000095, 10000007);

----------------------------------------------------------
--- [11] ---- [TBL_REG_COURSE][수강등록]
-- ▣ 데이터 입력
---[OCU_ID = 30000002][1회차] 수강등록
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID, REG_DATE) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000040, 30000002, TO_DATE('2024-07-26', 'YYYY-MM-DD'));
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID, REG_DATE) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000041, 30000002, TO_DATE('2024-07-26', 'YYYY-MM-DD'));
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID, REG_DATE) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000042, 30000002, TO_DATE('2024-07-26', 'YYYY-MM-DD'));
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000043, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000044, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000045, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000046, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000047, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000048, 30000002);
INSERT INTO MIRACLE.TBL_REG_COURSE (RC_ID, STUDENT_ID, OCU_ID) VALUES (MIRACLE.SEQ_RC.NEXTVAL, 20000049, 30000002);

--------------------------------------------------------------------------------------------------------------------