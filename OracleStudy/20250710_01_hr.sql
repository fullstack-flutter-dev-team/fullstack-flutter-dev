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

--▣ EMPLOYEES 테이블의 직원들 SALARY 를 10% 인상한다.
--  단, 부서명이 'IT' 인 경우로 한정한다.
--  (UPDATE 쿼리문 실행 이후 결과를 확인한 후 ROLLBACK할 것)

-----------------[ 강사님 풀이 - START ] ------------------------------

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = 60;

-- 부서명 IT 부서의 부서ID
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';
/* 
DEPARTMENT_ID
-------------
           60
 */

--▣  업데이트
UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');


--▣ 롤백
ROLLBACK;
-- ==>> 롤백 완료.
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
--▣ 데이터 조회
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID
                        FROM DEPARTMENTS D
                        WHERE D.DEPARTMENT_NAME = 'IT');
/* 

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DAT JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- -------- ---------- ---------- -------------- ---------- -------------
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567         03/01/06 IT_PROG          9000                       102            60
        104 Bruce                Ernst                     BERNST                    590.423.4568         21/05/07 IT_PROG          6000                       103            60
        105 David                Austin                    DAUSTIN                   590.423.4569         25/06/05 IT_PROG          4800                       103            60
        106 Valli                Pataballa                 VPATABAL                  590.423.4560         05/02/06 IT_PROG          4800                       103            60
        107 Diana                Lorentz                   DLORENTZ                  590.423.5567         07/02/07 IT_PROG          4200                       103            60
 */

--▣ 업데이트
UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID
                        FROM DEPARTMENTS D
                        WHERE D.DEPARTMENT_NAME = 'IT');
-- ==>> 5개 행 이(가) 업데이트되었습니다.

--▣ 업데이트 후 데이터 확인
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT D.DEPARTMENT_ID
                        FROM DEPARTMENTS D
                        WHERE D.DEPARTMENT_NAME = 'IT');

/* 

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DAT JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- -------- ---------- ---------- -------------- ---------- -------------
        103 Alexander            Hunold                    AHUNOLD                   590.423.4567         03/01/06 IT_PROG          9900                       102            60
        104 Bruce                Ernst                     BERNST                    590.423.4568         21/05/07 IT_PROG          6600                       103            60
        105 David                Austin                    DAUSTIN                   590.423.4569         25/06/05 IT_PROG          5280                       103            60
        106 Valli                Pataballa                 VPATABAL                  590.423.4560         05/02/06 IT_PROG          5280                       103            60
        107 Diana                Lorentz                   DLORENTZ                  590.423.5567         07/02/07 IT_PROG          4620                       103            60
 */


--▣ 롤백
ROLLBACK;
-- ==>> 롤백 완료.
-----------------[  실습 - END  ] ----------------------------


SELECT *
FROM JOBS;

--▣ EMPLOYEES 테이블에서 JOB_TITLE 이 『Sales Manager』 인 사원의
---- SALARY 를 해당 직무(직종)의 최고 급여(MAX_SALARY)로 변경하는 쿼리문을 구성한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한하여
--    적용할 수 있도록 한다.
--    (UPDATE 쿼리문 실행 이후 결과를 확인한 후 ROLLBACK 할 것)

-----------------[ 강사님 풀이 - START ] ------------------------------
SELECT *
FROM EMPLOYEES;

SELECT *
FROM JOBS;

-- UPDATE EMPLOYEES
-- SET SALARY = ('Sales Manager'의 MAX_SALARY)
-- WHERE JOB_ID = ('Sales Manager' 의 JOB_ID)

-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
SELECT *
FROM EMPLOYEES;

--▣ 데이터 조회
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = (SELECT J.JOB_ID
                        FROM JOBS J
                        WHERE J.JOB_TITLE = 'Sales Manager');
/* 
EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DAT JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- -------- ---------- ---------- -------------- ---------- -------------
        145 John                 Russell                   JRUSSEL                   011.44.1344.429268   01/10/04 SA_MAN          14000             .4        100            80
        146 Karen                Partners                  KPARTNER                  011.44.1344.467268   05/01/05 SA_MAN          13500             .3        100            80
        147 Alberto              Errazuriz                 AERRAZUR                  011.44.1344.429278   10/03/05 SA_MAN          12000             .3        100            80
        148 Gerald               Cambrault                 GCAMBRAU                  011.44.1344.619268   15/10/07 SA_MAN          11000             .3        100            80
        149 Eleni                Zlotkey                   EZLOTKEY                  011.44.1344.429018   29/01/08 SA_MAN          10500             .2        100            80
 */

--▣ 업데이트
UPDATE EMPLOYEES
SET SALARY = (SELECT JJ.MAX_SALARY
                        FROM JOBS JJ
                        WHERE JJ.JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT J.JOB_ID
                        FROM JOBS J
                        WHERE J.JOB_TITLE = 'Sales Manager');
-- ==>> 5개 행 이(가) 업데이트되었습니다.

--▣ 데이터 조회
SELECT *
FROM EMPLOYEES
WHERE JOB_ID = (SELECT J.JOB_ID
                        FROM JOBS J
                        WHERE J.JOB_TITLE = 'Sales Manager');

/* 

EMPLOYEE_ID FIRST_NAME           LAST_NAME                 EMAIL                     PHONE_NUMBER         HIRE_DAT JOB_ID         SALARY COMMISSION_PCT MANAGER_ID DEPARTMENT_ID
----------- -------------------- ------------------------- ------------------------- -------------------- -------- ---------- ---------- -------------- ---------- -------------
        145 John                 Russell                   JRUSSEL                   011.44.1344.429268   01/10/04 SA_MAN          20080             .4        100            80
        146 Karen                Partners                  KPARTNER                  011.44.1344.467268   05/01/05 SA_MAN          20080             .3        100            80
        147 Alberto              Errazuriz                 AERRAZUR                  011.44.1344.429278   10/03/05 SA_MAN          20080             .3        100            80
        148 Gerald               Cambrault                 GCAMBRAU                  011.44.1344.619268   15/10/07 SA_MAN          20080             .3        100            80
        149 Eleni                Zlotkey                   EZLOTKEY                  011.44.1344.429018   29/01/08 SA_MAN          20080             .2        100            80
 */


 --▣ 롤백
ROLLBACK;
-- ==>> 롤백 완료.
-----------------[  실습 - END  ] ----------------------------

--▣ EMPLOYEES 테이블에서 SALARY를
---   각 부서의 이름별로 다른 인상률을 적용하여 수정할 수 있도록 한다.
---   Finance → 10%
---   Exectutive  → 15%
---   Accounting  → 20%
---   나머지 →  0%
--    (UPDATE 쿼리문 실행 이후 결과를 확인한 후 ROLLBACK 할 것)


-----------------[ 강사님 풀이 - START ] ------------------------------

-- Finance
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';
/* 
DEPARTMENT_ID
-------------
          100
 */

-- Exectutive
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';
/* 
DEPARTMENT_ID
-------------
           90
 */


-- Accounting
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';
/* 
DEPARTMENT_ID
-------------
          110
 */

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting');
/* 
DEPARTMENT_ID
-------------
           90
          100
          110
 */


-- UPDATE EMPLOYEES
-- SET SALARY = CASE DEPARTMENT_ID WHEN ('Finance'의 부서ID) THEN  SALARY * 1.1 
--                                 WHEN ('Exectutive'의 부서ID) THEN  SALARY * 1.15 
--                                 WHEN ('Accounting'의 부서ID) THEN  SALARY * 1.2
--                                 ELSE SALARY
--               END

-- UPDATE EMPLOYEES
-- SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
--                                       FROM DEPARTMENTS
--                                       WHERE DEPARTMENT_NAME = 'Finance') THEN  SALARY * 1.1 
--                                 WHEN (SELECT DEPARTMENT_ID
--                                       FROM DEPARTMENTS
--                                       WHERE DEPARTMENT_NAME = 'Exectutive') THEN  SALARY * 1.15 
--                                 WHEN (SELECT DEPARTMENT_ID
--                                       FROM DEPARTMENTS
--                                       WHERE DEPARTMENT_NAME = 'Accounting') THEN  SALARY * 1.2
--                                 ELSE SALARY
--               END
-- WHERE DEPARTMENT_ID IN (100, 90, 110);


UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Finance') THEN  SALARY * 1.1 
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Exectutive') THEN  SALARY * 1.15 
                                WHEN (SELECT DEPARTMENT_ID
                                      FROM DEPARTMENTS
                                      WHERE DEPARTMENT_NAME = 'Accounting') THEN  SALARY * 1.2
                                ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
-- ==>> 11개 행 이(가) 업데이트되었습니다.

-- 롤백
ROLLBACK;
-- ==>> 롤백 완료.

-----------------[  강사님 풀이 - END  ] ------------------------------


-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
