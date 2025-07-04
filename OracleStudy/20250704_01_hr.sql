--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  HR

--※  세 개 이상의 테이블 조인 (JOIN, 결합)

-- 형식-1 (SQL 1992 CODE)
/*
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1, 테이블명2, 테이블명3
WHERE 테이블명1.컬럼명1 = 테이블2.컬럼명1
  AND 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
*/

-- 형식-2 (SQL 1999 CODE)
/*
SELECT 테이블명1.컬럼명, 테이블명2.컬럼명, 테이블명3.컬럼명
FROM 테이블명1 JOIN 테이블명2
ON 테이블명1.컬럼명1 = 테이블명2.컬럼명1
      JOIN 테이블명3
      ON 테이블명2.컬럼명2 = 테이블명3.컬럼명2;
*/

--▣ HR 계정 소유의 테이블 또는 뷰 목록 조회
SELECT *
FROM TAB;
/*

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COUNTRIES                      TABLE             
DEPARTMENTS                    TABLE             
EMPLOYEES                      TABLE             
EMP_DETAILS_VIEW               VIEW              
JOBS                           TABLE             
JOB_HISTORY                    TABLE             
LOCATIONS                      TABLE             
REGIONS                        TABLE   
*/


-- 테이블 데이터 확인
SELECT *
FROM EMPLOYEES;
SELECT *
FROM DEPARTMENTS;
SELECT *
FROM JOBS;

DESC EMPLOYEES;
DESC DEPARTMENTS;
DESC JOBS;

--▣ HR.JOBS, HR.EMPLOYEES, HR.DEPARTMENTS 테이블을 대상으로
--  직원들의 FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME
--  항목을 조회한다.

-----------------[ 강사님 풀이 - START ] ------------------------------
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
  AND E.JOB_ID = J.JOB_ID;
-- ==>> 106개 행이 선택되었습니다. 
-- ==>> Kimberely 사원의 부서DEPARTMENT_ID 가 NULL 

SELECT COUNT(*)
FROM EMPLOYEES;
-- ==>> 107개 행이 선택되었습니다. 

-- 형식-1 (SQL 1992 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND E.JOB_ID = J.JOB_ID;

-- 형식-2 (SQL 1999 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
     JOIN JOBS J
     ON E.JOB_ID = J.JOB_ID;
-- ==>> 107개 행이 선택되었습니다. 

-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
DESC JOBS;
/*
이름         널?       유형           
---------- -------- ------------ 
JOB_ID     NOT NULL VARCHAR2(10) 
JOB_TITLE  NOT NULL VARCHAR2(35) 
MIN_SALARY          NUMBER(6)    
MAX_SALARY          NUMBER(6)  
*/
SELECT *
FROM JOBS;

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
SELECT *
FROM EMPLOYEES
ORDER BY FIRST_NAME;

DESC DEPARTMENTS;
/*
이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)    
*/
SELECT *
FROM DEPARTMENTS;


SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY E.FIRST_NAME;
-- ==> 106개 행이 선택되었습니다. 

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, E.DEPARTMENT_ID
FROM EMPLOYEES E,  JOBS J
WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.FIRST_NAME;
-- ==>> 107개 행이 선택되었습니다. 

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, NVL(D.DEPARTMENT_NAME,'*모르는 부서*') "부서명"
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
 AND E.JOB_ID = J.JOB_ID
ORDER BY E.FIRST_NAME;
-- ==>> 107개 행이 선택되었습니다. 
-----------------[ 실습 - END ] ------------------------------


--▣ EMPLOYEES, DEPARTMENTS, JOBS, LOCATIONS, COUNTRIES, REGIONS 테이블을 대상으로
--  직원들의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.
--  FIRST_NAME, LAST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGINON_NAME

-----------------[ 강사님 풀이 - START ] ------------------------------

-- 형식-1 (SQL 1992 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME,R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) -- EMPLOYEES 테이블이 주인공 테이블
  AND E.JOB_ID = J.JOB_ID
  AND D.LOCATION_ID = L.LOCATION_ID
  AND L.COUNTRY_ID = C.COUNTRY_ID
  AND C.REGION_ID = R.REGION_ID;
--   ==>> 106개 행이 선택되었습니다. --- (X)

SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME,R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) -- EMPLOYEES 테이블이 주인공 테이블
  AND E.JOB_ID = J.JOB_ID
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
-- ==>> 107개 행이 선택되었습니다. -----(O)

-- 형식-2 (SQL 1999 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME,R.REGION_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
      JOIN JOBS J
        ON E.JOB_ID = J.JOB_ID
            LEFT JOIN LOCATIONS L
                   ON D.LOCATION_ID = L.LOCATION_ID
                        LEFT JOIN COUNTRIES C
                               ON L.COUNTRY_ID = C.COUNTRY_ID
                                        LEFT JOIN REGIONS R
                                               ON C.REGION_ID = R.REGION_ID;
-- ==>> 107개 행이 선택되었습니다. -----(O)

-----------------[ 강사님 풀이 - END ] --------------------------------


-----------------[ 실습 - START ] ----------------------------
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
DESC DEPARTMENTS;
/*
이름              널?       유형           
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)   
*/

DESC JOBS;
/*
이름         널?       유형           
---------- -------- ------------ 
JOB_ID     NOT NULL VARCHAR2(10) 
JOB_TITLE  NOT NULL VARCHAR2(35) 
MIN_SALARY          NUMBER(6)    
MAX_SALARY          NUMBER(6)   
*/

DESC LOCATIONS;
/*
이름             널?       유형           
-------------- -------- ------------ 
LOCATION_ID    NOT NULL NUMBER(4)    
STREET_ADDRESS          VARCHAR2(40) 
POSTAL_CODE             VARCHAR2(12) 
CITY           NOT NULL VARCHAR2(30) 
STATE_PROVINCE          VARCHAR2(25) 
COUNTRY_ID              CHAR(2)     
*/

DESC COUNTRIES;
/*
이름           널?       유형           
------------ -------- ------------ 
COUNTRY_ID   NOT NULL CHAR(2)      
COUNTRY_NAME          VARCHAR2(40) 
REGION_ID             NUMBER    
*/

DESC REGIONS;
/*
이름          널?       유형           
----------- -------- ------------ 
REGION_ID   NOT NULL NUMBER       
REGION_NAME          VARCHAR2(25) 
*/

-- 형식-1 (SQL 1992 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME,R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND E.JOB_ID = J.JOB_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+);
-- ==>> 107개 행이 선택되었습니다. 

-- 형식-2 (SQL 1999 CODE)
SELECT E.FIRST_NAME, E.LAST_NAME, J.JOB_TITLE, D.DEPARTMENT_NAME, L.CITY, C.COUNTRY_NAME,R.REGION_NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
     LEFT JOIN LOCATIONS L
            ON D.LOCATION_ID = L.LOCATION_ID
                  LEFT JOIN COUNTRIES C
                         ON L.COUNTRY_ID = C.COUNTRY_ID
                                  LEFT JOIN REGIONS R
                                         ON C.REGION_ID = R.REGION_ID
                                                     LEFT JOIN JOBS J
                                                            ON E.JOB_ID = J.JOB_ID;
-- ==>> 107개 행이 선택되었습니다. 

-----------------[ 실습 - END ] ------------------------------



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------