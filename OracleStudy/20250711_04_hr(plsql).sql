--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  HR

--▣ HR 계정 소유의 테이블 또는 뷰 목록 조회
SELECT *
FROM TAB;
/*

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BIN$b5MwHDKdQdCK6LgNOM7rSA==$0 TABLE             
COUNTRIES                      TABLE             
DEPARTMENTS                    TABLE             
EMPLOYEES                      TABLE             
EMP_DETAILS_VIEW               VIEW              
JOBS                           TABLE             
JOBS2                          TABLE             
JOB_HISTORY                    TABLE 
*/
-----------------------------------------------------------

-- 
SET SERVEROUTPUT ON;

-------------------------------------------------------------------------------
--▣ %TYPE
-- 1. 특정 테이블에 포함되어 있는 컬럼의 자료형을 참조하는 데이터 타입
-- 2. 형식 및 구조
--    변수명 테이블명.컬럼명%TYPE [:= 초기값];

--  예를 들어 NAME EMPLOYEES.ENAME%TYPE(NAME 이라는 변수명의 타입을 EMPLOYEES
--  테이블의 ENAME컬럼의 타입을 가져와서 쓰겠다는 의미)

DESC EMPLOYEES;
/* 
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)    
 */

--▣ HR.EMPLOYEES 테이블의 특정 데이터(사원번호 103의 FIRST_NAME)를 변수에 저장하여 출력

DECLARE
  -- VNAME VARCHAR2(20)
  VNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  SELECT FIRST_NAME INTO VNAME
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 103;
  
  DBMS_OUTPUT.PUT_LINE(VNAME);
END;

--▣ %ROWTYPE 
-- 1. 테이블의 레코드와 같은 구조의 구조체 변수를 선언(여러 개의 컬럼)
-- 2. 형식 및 구조
--    변수명 테이블명%ROWTYPE

DESC EMPLOYEES;
/*
이름             널?       유형           
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)   
*/

--▣ HR.EMPLOYEES 테이블의 데이터 여러개를 변수에 저장하여 출력

DECLARE
    --VNAME   EMPLOYEES.FIRST_NAME%TYPE;
    --VPHONE  EMPLOYEES.PHONE_NUMBER%TYPE;
    --VEMAIL  EMPLOYEES.EMAIL%TYPE; (위에 %TYPE 했던 것처럼 하는 것이 아니라)
    
    VEMP    EMPLOYEES%ROWTYPE;
    
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
            INTO VEMP.FIRST_NAME, VEMP.PHONE_NUMBER, VEMP.EMAIL
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.FIRST_NAME || '-'||VEMP.PHONE_NUMBER ||'-'|| VEMP.EMAIL);
END;

--▣ HR.EMPLOYEES 테이블의 여러명 데이터 여러 개를 변수에 저장

DECLARE
    VEMP    EMPLOYEES%ROWTYPE;
BEGIN
    SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
          INTO VEMP.FIRST_NAME, VEMP.PHONE_NUMBER, VEMP.EMAIL
    FROM EMPLOYEES; 
    --WHERE EMPLOYEE_ID=103;
    
    DBMS_OUTPUT.PUT_LINE(VEMP.FIRST_NAME || '-'||VEMP.PHONE_NUMBER ||'-'|| VEMP.EMAIL);
END;
--==>> 에러 발생
--===>>  WHERE 조건절만 없애고 실행해보면 안된다, 
-- 여러 개의 행(ROWS) 정보를 얻어와서 담으려고 하면
-- 변수에 저장하는 것 자체가 불가능한 상황,,,,
-- 불가!
/*
오류 보고 - ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 6
01422. 00000 -  "exact fetch returns more than requested number of rows"
*Cause:    The number specified in exact fetch is less than the rows returned.
*Action:   Rewrite the query or change number of rows requested
*/

-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
