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


-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
