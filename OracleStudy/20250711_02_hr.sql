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

--▣▣▣ DELETE ▣▣▣---
-- 1. 테이블에서 지정된 행(레코드)을 삭제하는데 사용하는 구문.

-- 2. 형식 및 구조
----  DELETE [FROM] 테이블명
----  [WHERE 조건절]

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
/* 
EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DAT JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- -------- ---------- ---------- -------------- ---------- -------------
        198 Donald               OConnell                  DOCONNEL                  650.507.9833         21/06/07 SH_CLERK         2600                       124            50

 */

DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
-- 1 행 이(가) 삭제되었습니다.

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
-- 선택된 행 없음

ROLLBACK;
-- 롤백 완료.


--▣ EMPLOYEES 테이블에서 직원들의 데이터를 삭제한다.
--   단, 부서명이 'IT'인 경우로 한정한다.

--※ 실제로 EMPLOYEES 테이블의 데이터가(삭제하고자 하는 대상)
--   다른 테이블(혹은 자기 자신 테이블)에 의해 참조당하고 있는 경우
--   삭제되지 않을 수 있다는 상황을 인지해야 하며......
--   그에 대한 이유도 알아야 한다.

-----------------[ 강사님 풀이 - START ] ------------------------------
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID 
                              FROM DEPARTMENTS D 
                              WHERE D.DEPARTMENT_NAME = 'IT');

DELETE
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID 
                              FROM DEPARTMENTS D 
                              WHERE D.DEPARTMENT_NAME = 'IT');
-- ==>> 오류 보고 - ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found

-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------

DESC EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID 
                              FROM DEPARTMENTS D 
                              WHERE D.DEPARTMENT_NAME = 'IT');

DELETE
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID 
                              FROM DEPARTMENTS D 
                              WHERE D.DEPARTMENT_NAME = 'IT');
-- ==>> 오류 보고 - ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEES.DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID 
                              FROM DEPARTMENTS D 
                              WHERE D.DEPARTMENT_NAME = 'IT');
-----------------[  실습 - END  ] ----------------------------

--▣▣▣ 뷰(VIEW) ▣▣▣---
-- 1. 뷰(VIEW)란 이미 특정한 데이터베이스 내에서 존재하는
--    하나 이상의 테이블에서 사용자가 얻기 원하는 데이터만을
--    정확하고 편하게 가져오기 위하여 사전에 원하는 컬럼들만을 모아서
--    만들어놓은 가상의 테이블로 편의성 및 보안에 목적이 있다.

--    가상의 테이블이란... 뷰가 실제로 존재하는 테이블(객체)이 아니라
--    하나 이상의 테이블에서 파생된 또 다른 정보를 볼 수 있는 방법이라는 의미이며,
--    그 정보를 추출해내는 SQL 문장이라고 볼 수 있다.

/*
- 가상의 테이블?
  실제 물리적인 공간(하드디스크) 안에는 테이블도 들어있고, 뷰도 들어있는 형태가 아니며 하드디스크에는 테이블만 들어있다.
  실제 데이터는 테이블에만 적재되는 것이고, 뷰(VIEW)는 그 테이블의 데이터들을 투영하여 보여주는 것이며,
  뷰(VIEW)를 생성할 때 작성된 쿼리가 뷰를 조회하는 때마다 실행이 되는 것이다!
  따라서, 테이블의 데이터가 변경되면 뷰가 데이터 변경 전에 생성되었다고 해도 뷰를 조회해보면
  변경된 데이터가 변영된 형태로 조회된다.

- 보안의 목적?
  한 테이블에 민감한 컬럼, 민감하지 않은 컬럼이 섞여 있을텐데,
  민감하지 않은 컬럼으로만 뷰를 생성하면 사용자에게 민감한 컬럼을 노출시키지 않고 감춰둘 수 있다.
  사용자가 뷰만 사용하게 하면 테이블 내부의 민감정보에 대해 알 수가 없고, 임의로 데이터를 변경시킬 수도 없다.
*/
 
 
-- 2. 형식 및 구조
/*
  CREATE [OR REPLACE] VIEW 뷰이름
  [(ALIAS[, ALIAS, ...])]
  AS
  서브쿼리(SUBQUERY)
  [WITH CHECK OPTION]      
  [WITH READ ONLY]      --> 뷰를 열람의 목적으로 사용할지.. 등의 옵션 (어드민 부분이라 지금은 설명 생략하고 패스함)
*/ 

--▣ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME
      , D.DEPARTMENT_NAME, L.CITY
      , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
  AND D.LOCATION_ID = L.LOCATION_ID(+)
  AND L.COUNTRY_ID = C.COUNTRY_ID(+)
  AND C.REGION_ID = R.REGION_ID(+)
-- ===> View VIEW_EMPLOYEES이(가) 생성되었습니다.

--▣ 뷰(VIEW) 조회
SELECT *
FROM VIEW_EMPLOYEES;

--▣ 뷰(VIEW) 구조 확인
DESC VIEW_EMPLOYEES;
/* 
이름              널?       유형           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
 */
--> 실제 원본테이블들의 해당 컬럼의 데이터타입이 구성된 방식에 의존함

--▣ 뷰(VIEW) 소스 확인 (TIP! 이므로 당분간 의미있게 기억해둘 것)
SELECT VIEW_NAME, TEXT
FROM USER_VIEWS
WHERE VIEW_NAME ='VIEW_EMPLOYEES';
/* 

VIEW_NAME                      TEXT                                                                            
------------------------------ --------------------------------------------------------------------------------
VIEW_EMPLOYEES                 SELECT E.FIRST_NAME, E.LAST_NAME                                                
                                     , D.DEPARTMENT_NAME, L.CITY                                               
                                     , C.COU                                                                   

 */


-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
