SELECT USER
FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SET SERVEROUTPUT ON;


-------------------------[관리자 등록]----------------------------------------------------
--- [6] ---- [TBL_ADMIN][관리자]
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

-- 배재하	070228-1829244
-- 변찬옥	070405-2850866

exec PROC_ADD_STUDENT('배재하', '070228-1829244', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADD_STUDENT('변찬옥', '070405-2850866', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
-------------------------[교수자 등록]----------------------------------------------------
--- [8] ---- [TBL_LECTURER][교수자]
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

-- 백석희	930224-1876724
-- 천잎효	990108-1535652

exec PROC_ADD_LECTURER('백석희', '930224-1876724', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec PROC_ADD_LECTURER('천잎효', '990108-1535652', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

-----------------------------------------------------------------------------
----------------[login]-------------
SELECT *
FROM TBL_ADMIN
-- WHERE ADMIN_ID = 90000002;
ORDER BY ADMIN_ID ASC;
--------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADMIN_LOGIN('한흥천','2439972', :r_data, :r_msg);
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

-----------------[관리자 조회]---------------------------
variable rc refcursor;
EXECUTE PROC_ADMIN_SELECT(:rc);
print rc;

-----------------[교수자 조회]---------------------------
variable rc refcursor;
EXECUTE PROC_LECTURER_SELECT(:rc);
print rc;

-----------------[수강생 조회]---------------------------
VAR rc REFCURSOR;
EXEC PROC_STUDENT_SELECT(:rc);
PRINT rc;

-----------------[관리자 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
-- exec PROC_ADMIN_REG_LOGIN_ID_CHK('BlueSee', :r_data, :r_msg);
exec PROC_ADMIN_REG_LOGIN_ID_CHK('QUANTUM77', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_ADMIN
WHERE ADMIN_ID = 90000007 ;

-----------------[관리자 로그인ID/PW 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_ADMIN_REG_LOGIN_ID_PW(90000006, 'quantum877', '@world768', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_ADMIN
WHERE ADMIN_ID = 90000006 ;

-----------------[교수자 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_LECTURER_REG_LOGIN_ID_CHK('BlueSee777', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_LECTURER
WHERE LOGIN_ID IS NOT NULL;
WHERE LECTURER_ID = 90000007 ;


-----------------[교수자 로그인ID/PW 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_LECTURER_REG_LOGIN_ID_PW(10000085, 'BlueSee99', '#world765', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

SELECT *
FROM TBL_LECTURER
-- WHERE LOGIN_ID IS NOT NULL;
WHERE LECTURER_ID = 10000085  ;

-----------------[학생 로그인ID 등록 : 로그인ID 중복체크]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_STUDENT_REG_LOGIN_ID_CHK('Quantum765', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
----------------
SELECT *
FROM TBL_STUDENT
-- WHERE LOGIN_ID IS NOT NULL;
WHERE STUDENT_ID = 20000062  ;

-----------------[학생 로그인ID 등록 : 로그인ID/PW 등록]-------------------------------------------------------------
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec PROC_STUDENT_REG_LOGIN_ID_PW(20000080, 'Quantum7656', '@#world76', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;
----------------
SELECT *
FROM TBL_STUDENT
-- WHERE LOGIN_ID IS NOT NULL;
WHERE STUDENT_ID = 20000080 ;

----------------------[과정명 리스트 조회]-------------------------------------------
VAR rc REFCURSOR;
EXEC PROC_GET_CURRICULUM_CODELIST(:rc);
PRINT rc;

------------------[강의실 리스트 조회]----------
VAR rc REFCURSOR;
EXEC PROC_GET_CLASSROOM_CODELIST(:rc);
PRINT rc;

-----------------------[강의실 코드 추가-----
VARIABLE R_DATA VARCHAR2(300);
VARIABLE R_MSG VARCHAR2(300);
EXEC PROC_ADD_CLASSROOM_CODE('505 호 강의실', :r_data, :r_msg);
PRINT R_DATA;
PRINT R_MSG;
----------------

-----------------[개설과정 등록]-------------------------------------------------------------
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
-------------------
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

----------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------