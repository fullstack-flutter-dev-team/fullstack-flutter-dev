--/*================[ 7월 03일(목) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/



SELECT CASE  WHEN DEPTNO IS NULL THEN '인턴'
             ELSE TO_CHAR(DEPTNO)
       END "부서번호"
FROM TBL_EMP;

/*
부서번호                                    
----------------------------------------
20
30
30
20
30
30
10
20
10
30
20
30
20
10
인턴
인턴
인턴
인턴
인턴
*/



SELECT CASE  WHEN DEPTNO IS NULL THEN '인턴'
             ELSE TO_CHAR(DEPTNO)
       END "부서번호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
부서번호     급여합
---------- ---------
10           8750
20          10875
30           9400
인턴         8000
*/

SELECT CASE  WHEN DEPTNO IS NULL THEN '인턴'
             ELSE TO_CHAR(DEPTNO)
       END "부서번호"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO)
ORDER BY DEPTNO;
/*
부서번호                                            급여합
---------------------------------------- ----------
10                                             8750
20                                            10875
30                                             9400
인턴                                           8000
인턴                                          37025
*/


SELECT NVL(DEPTNO, '인턴') "부서번호"
      ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
-- ORDER BY DEPTNO;
-- ==>> 에러발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT NVL2(DEPTNO, TO_CHAR(DEPTNO), '인턴') "부서번호"
      ,SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);


--▣  GROUPING()
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
      , GROUPING(DEPTNO) "그루핑결과"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
      부서번호        급여합      그루핑결과
---------- ---------- ----------
        10       8750          0    -- 10번 부서 데이터들끼리의 묶음
        20      10875          0    -- 20번 부서 데이터들끼리의 묶음
        30       9400          0    -- 30번 부서 데이터들끼리의 묶음
       (NULL)    8000          0    -- NULL 번 부서 데이터들끼리의 묶음
       (NULL)   37025          1    -- GROUP BY 묶음
*/


--▣ 위에서 조회한 내용을 아래와 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
---------------------------------
부서번호    |  급여합
---------------------------------
10         |  8750
20         | 10875
30         |  9400
인턴       |  8000
모든부서    |  37025 
---------------------------------
*/
SELECT CASE GROUPING(DEPTNO) WHEN 0  THEN TO_CHAR(DEPTNO)
                             ELSE '모든부서'
                             END "부서번호"
    , SUM(SAL) "급여합"
    , GROUPING(DEPTNO) "그루핑결과"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*

부서번호                                            급여합      그루핑결과
---------------------------------------- ---------- ----------
10                                             8750          0
20                                            10875          0
30                                             9400          0
                                               8000          0
모든부서                                       37025          1
*/


SELECT CASE GROUPING(DEPTNO) WHEN 0  THEN NVL(TO_CHAR(DEPTNO), '인턴')
                             ELSE '모든부서'
                             END "부서번호"
    , SUM(SAL) "급여합"
    -- , GROUPING(DEPTNO) "그루핑결과"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
부서번호                                            급여합
---------------------------------------- ----------
10                                             8750
20                                            10875
30                                             9400
인턴                                           8000
모든부서                                       37025
*/

SELECT CASE 
          WHEN T."부서번호" IS NULL AND T."그루핑결과" = 0  THEN '인턴'
          WHEN T."그루핑결과" = 1  THEN '모든부서'
          ELSE TO_CHAR(T."부서번호")
        END
    ,  T."급여합"
FROM(
    SELECT DEPTNO "부서번호"
        , SUM(SAL) "급여합"
        , GROUPING(DEPTNO) "그루핑결과"
    FROM TBL_EMP
    GROUP BY ROLLUP(DEPTNO)
) T;
/*
부서번호     급여합
---------- -------
10            8750
20           10875
30            9400
인턴          8000
모든부서      37025
*/

 --▣ TBL_SAWON 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.ALTER
 /*
 ----------------------------
 성별    | 급여합
 ----------------------------
 남         XXXX
 여         XXX
 모든사원    XXX
 ----------------------------
 */
-----------------[ 강사님 풀이 - START ] ------------------------------
-- SELECT CASE WHEN THEN ELSE END "성별"
--     , SAL "급여"
-- FROM TBL_SAWON;

SELECT CASE 
          WHEN SUBSTR(JUBUN,7, 1) IN('1', '3') THEN '남'
          WHEN SUBSTR(JUBUN,7, 1) IN('2', '4') THEN '여'
          ELSE '성별확인 불가'
       END "성별"
    , SAL "급여"
FROM TBL_SAWON;



-----------------[ 강사님 풀이 - END ] --------------------------------




-----------------[ 실습 - START ] ------------------------------
SELECT *
FROM TBL_SAWON;

SELECT CASE 
          WHEN SUBSTR(JUBUN,7,1) IN ('1', '3') THEN '남성'
          WHEN SUBSTR(JUBUN,7,1) IN ('2', '4') THEN '여성'
          ELSE '모름'
        END AS "성별"
FROM TBL_SAWON;


SELECT NVL(T."성별", '모든사원') "성별"
     , SUM(T."급여") "급여합"
FROM
(
    SELECT CASE 
            WHEN SUBSTR(JUBUN,7,1) IN ('1', '3') THEN '남성'
            WHEN SUBSTR(JUBUN,7,1) IN ('2', '4') THEN '여성'
            ELSE '모름'
            END AS "성별"
        , SAL "급여"
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T."성별");

-----------------[ 실습 - END ] ------------------------------



 --▣ TBL_SAWON 테이블을 대상으로 다음과 같이 연령대별 인원수 형태로 
 --   조회할 수 있도록 쿼리문을 구성한다.
/*
-----------------------------------
  연령대        인원수
-----------------------------------
    20                X
    30                X
    40                X
    50                X
    전체              X 
-----------------------------------
*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-- 방법 1. (INLINE VIEW 를 두 번 중첩)
-- SELECT CASE 
--             WHEN SUBSTR(JUJUBUN, 7, 1) IN ('1', '2') THEN  (현재 년도 - (주민번호 앞 두자리 + 1899))  -- 1900년대 생
--             WHEN SUBSTR(JUJUBUN, 7, 1) IN ('3', '4') THEN  (현재 년도 - (주민번호 앞 두자리 + 1999))   -- 2000년대 생
--             ELSE -1
--         END "나이"  
-- FROM TBL_SAWON;

SELECT CASE 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))  -- 1900년대 생
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))   -- 2000년대 생
            ELSE -1
        END "나이"  
FROM TBL_SAWON;


SELECT CASE 
          WHEN T.나이 >= 50 AND T.나이 < 60 THEN 50 
          WHEN T.나이 >= 40 THEN 40 
          WHEN T.나이 >= 30 THEN 30 
          WHEN T.나이 >= 20 THEN 20 
          WHEN T.나이 >= 10 THEN 10 
          
          ELSE 0 
          END "연령대"
(
    SELECT CASE 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))  -- 1900년대 생
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))   -- 2000년대 생
            ELSE -1
        END "나이"  
    FROM TBL_SAWON
) T;

SELECT Q."연령대" "연령대"
      , COUNT(Q."연령대")
FROM 
    (
    SELECT CASE 
            WHEN T.나이 >= 50 AND T.나이 < 60 THEN 50 
            WHEN T.나이 >= 40 THEN 40 
            WHEN T.나이 >= 30 THEN 30 
            WHEN T.나이 >= 20 THEN 20 
            WHEN T.나이 >= 10 THEN 10 
            ELSE 0 
            END "연령대"
    FROM
    (
        SELECT CASE 
                WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))  -- 1900년대 생
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))   -- 2000년대 생
                ELSE -1
            END "나이"  
        FROM TBL_SAWON
    ) T
) Q
GROUP BY ROLLUP(Q.연령대);



-- 방법 2. (INLINE VIEW 를 한 번 사용)
SELECT 28 '나이1', 31 '나이2', 48 '나이3'
         , TRUNC(28, -1), TRUNC(31, -1), TRUNC(48, -1) 
FROM DUAL;


SELECT TRUNC(
    CASE 
        WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))  -- 1900년대 생
        WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))   -- 2000년대 생
        ELSE -1
    END , -1) "연령대" 
FROM TBL_SAWON


SELECT CASE GROUPING(T.연령대) 
            WHEN 0 THEN TO_CHAR(T.연령대)
            ELSE '전체'
       END "연령대"
    ,  COUNT(T.연령대)  "인원수"
FROM 
(
    SELECT TRUNC(
                 CASE 
                     WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1899))  -- 1900년대 생
                     WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN  (EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN,1,2)) + 1999))   -- 2000년대 생
                     ELSE -1
                 END , -1) "연령대" 
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T.연령대);
/*
연령대       인원수
----------- ------
20               5
30               1
40               2
50               4
70               1
80               2
90               1
전체            16
*/

-----------------[ 강사님 풀이 - END ] --------------------------------


-----------------[ 실습 - START ] ------------------------------
SELECT *
FROM TBL_SAWON;



SELECT 
       JUBUN
    ,  CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                THEN  TO_CHAR(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (1900 + TO_NUMBER(SUBSTR(JUBUN,1,2))))
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                THEN TO_CHAR(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (1900 + TO_NUMBER(SUBSTR(JUBUN,1,2))))
           ELSE '모름'
       END "연령" 
FROM TBL_SAWON;


SELECT T.*
, DECODE(TRUNC(T."나이" / 10), 2, '20', 3, '30', 4, '40', 5, '50', 6, '60', 7, '70', 8, '80', 9, '90') "연령대"
FROM 
(
    SELECT 
        JUBUN
        ,  CASE 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN  TO_CHAR(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (1900 + TO_NUMBER(SUBSTR(JUBUN,1,2))))
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN TO_CHAR(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (2000 + TO_NUMBER(SUBSTR(JUBUN,1,2))))
            ELSE '모름'
        END "나이" 
    FROM TBL_SAWON
) T;

SELECT NVL(T."연령", '전체') "연령대" 
     , COUNT(T."연령") "인원수"
FROM 
(
    SELECT 
         CASE 
            WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') 
                    THEN  TO_CHAR(TRUNC(TO_NUMBER(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (1900 + TO_NUMBER(SUBSTR(JUBUN,1,2))))/10)*10)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') 
                    THEN TO_CHAR(TRUNC(TO_NUMBER(TO_NUMBER(EXTRACT(YEAR FROM SYSDATE)) - (2000 + TO_NUMBER(SUBSTR(JUBUN,1,2))))/10)*10)
            ELSE '모름'
        END "연령" 
    FROM TBL_SAWON
) T
GROUP BY ROLLUP(T."연령");

-----------------[ 실습 - END ] ------------------------------

--▣ ROLLUP 활용 및 CUBE
SELECT DEPTNO
    , JOB
    , SUM(SAL)
FROM EMP
GROUP BY DEPTNO;
-- ==>> 에러 발생

SELECT DEPTNO
    , JOB
    , SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 1, 2;
/*
   DEPTNO JOB         SUM(SAL)
---------- --------- ----------
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        20 ANALYST         6000
        20 CLERK           1900
        20 MANAGER         2975
        30 CLERK            950
        30 MANAGER         2850
        30 SALESMAN        5600
*/

SELECT DEPTNO
    , JOB
    , SUM(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB)
ORDER BY 1, 2;
/*
 DEPTNO     JOB         SUM(SAL)
---------- --------- ----------
    10      CLERK           1300
    10      MANAGER         2450
    10      PRESIDENT       5000
    10       (NULL)         8750    -- 10 부서 모든 직종의 급여 합
    20      ANALYST         6000
    20      CLERK           1900
    20      MANAGER         2975
    20       (NULL)        10875   -- 20 부서 모든 직종의 급여 합
    30      CLERK            950
    30      MANAGER         2850
    30      SALESMAN        5600
    30       (NULL)         9400   -- 30 부서 모든 직종의 급여 합
             (NULL)        29025   -- 모든 부서 모든 직종의 급여 합
*/


--▣ CUBE() → ROLLUP() 보다 더 자세한 결과를 반환받을 수 있다.  
SELECT DEPTNO
    , JOB
    , SUM(SAL)
FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY 1, 2;
/*
 DEPTNO JOB         SUM(SAL)
---------- --------- ----------
        10 CLERK           1300
        10 MANAGER         2450
        10 PRESIDENT       5000
        10                 8750    -- 10 부서 모든 직종의 급여 합
        20 ANALYST         6000
        20 CLERK           1900
        20 MANAGER         2975
        20                10875    -- 20 부서 모든 직종의 급여 합
        30 CLERK            950
        30 MANAGER         2850
        30 SALESMAN        5600
        30                 9400    -- 30 부서 모든 직종의 급여 합
           ANALYST         6000  -- 모든 부서 ANALYST 직종의 급여 합
           CLERK           4150  -- 모든 부서 CLERK 직종의 급여 합
           MANAGER         8275  -- 모든 부서 MANAGER 직종의 급여 합
           PRESIDENT       5000  -- 모든 부서 PRESIDENT 직종의 급여 합
           SALESMAN        5600  -- 모든 부서 SALESMAN 직종의 급여 합
                          29025    -- 모든 부서 모든 직종의 급여 합
*/

--▣ ROLLUP() 과 CUBE() 는 
--   그룹을 묶어주는 방식이 다르다. (차이)


--> 이와 같은 상황으로..
-- 원하는 결과 셋을 얻지 못하거나... (→  ROLLUP())
-- 불필요한 너무 많은 결과 셋을 얻게 되기 때문에...(→  CUBE())
-- 조회하고자 하는 그룹만 『GROUPING SETS()』를 이용하여
-- 묶어주는 방식으로 처리할 수 있다.

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
                             ELSE '전체부서'
       END "부서번호"
    , CASE GROUPING(JOB) WHEN 0 THEN JOB
                         ELSE '전체직종'
      END "직종"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO, JOB)   -- ROLLUP() 을 사용한 결과
ORDER BY 1, 2;
/*

부서번호                                     직종               급여합
---------------------------------------- --------- ----------
10                                       CLERK           1300
10                                       MANAGER         2450
10                                       PRESIDENT       5000
10                                       전체직종         8750
20                                       ANALYST         6000
20                                       CLERK           1900
20                                       MANAGER         2975
20                                       전체직종        10875
30                                       CLERK            950
30                                       MANAGER         2850
30                                       SALESMAN        5600
30                                       전체직종         9400
인턴                                     CLERK           2500
인턴                                     SALESMAN        5500
인턴                                     전체직종         8000
전체부서                                  전체직종        37025
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
                             ELSE '전체부서'
       END "부서번호"
    , CASE GROUPING(JOB) WHEN 0 THEN JOB
                         ELSE '전체직종'
      END "직종"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY CUBE(DEPTNO, JOB)   -- CUBE() 을 사용한 결과
ORDER BY 1, 2;
/*

부서번호            직종        급여합
--------------- --------- ----------
10              CLERK           1300
10              MANAGER         2450
10              PRESIDENT       5000
10              전체직종         8750
20              ANALYST         6000
20              CLERK           1900
20              MANAGER         2975
20              전체직종        10875
30              CLERK            950
30              MANAGER         2850
30              SALESMAN        5600
30              전체직종         9400
인턴            CLERK           2500
인턴            SALESMAN        5500
인턴            전체직종         8000
전체부서         ANALYST         6000
전체부서         CLERK           6650
전체부서         MANAGER         8275
전체부서         PRESIDENT       5000
전체부서         SALESMAN       11100
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
                             ELSE '전체부서'
       END "부서번호"
    , CASE GROUPING(JOB) WHEN 0 THEN JOB
                         ELSE '전체직종'
      END "직종"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), ())   -- GROUPING SETS() 사용한 결과 → ROLLUP() 과 같은 결과
ORDER BY 1, 2;
/*
부서번호                                     직종               급여합
---------------------------------------- --------- ----------
10                                       CLERK           1300
10                                       MANAGER         2450
10                                       PRESIDENT       5000
10                                       전체직종         8750
20                                       ANALYST         6000
20                                       CLERK           1900
20                                       MANAGER         2975
20                                       전체직종        10875
30                                       CLERK            950
30                                       MANAGER         2850
30                                       SALESMAN        5600
30                                       전체직종         9400
인턴                                     CLERK           2500
인턴                                     SALESMAN        5500
인턴                                     전체직종         8000
*/

SELECT CASE GROUPING(DEPTNO) WHEN 0 THEN NVL(TO_CHAR(DEPTNO), '인턴')
                             ELSE '전체부서'
       END "부서번호"
    , CASE GROUPING(JOB) WHEN 0 THEN JOB
                         ELSE '전체직종'
      END "직종"
    , SUM(SAL) "급여합"
FROM TBL_EMP
GROUP BY GROUPING SETS((DEPTNO, JOB), (DEPTNO), (JOB), ())   -- GROUPING SETS() 사용한 결과 → CUBE() 과 같은 결과
ORDER BY 1, 2;
/*
부서번호                                     직종               급여합
---------------------------------------- --------- ----------
10                                       CLERK           1300
10                                       MANAGER         2450
10                                       PRESIDENT       5000
10                                       전체직종         8750
20                                       ANALYST         6000
20                                       CLERK           1900
20                                       MANAGER         2975
20                                       전체직종        10875
30                                       CLERK            950
30                                       MANAGER         2850
30                                       SALESMAN        5600
30                                       전체직종         9400
인턴                                     CLERK           2500
인턴                                     SALESMAN        5500
인턴                                     전체직종         8000
전체부서                                  ANALYST         6000
전체부서                                  CLERK           6650
전체부서                                  MANAGER         8275
전체부서                                  PRESIDENT       5000
전체부서                                  SALESMAN       11100
전체부서                                  전체직종        37025
*/

SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

--▣ TBL_EMP 테이블을 대상으로 입사년도별 인원수를 조회한다.
/*
--------------------------------
입사년도                 인원수
--------------------------------
1980                     1
1981                     10
1982                     1
1987                     2
2025                     5
전체                     19
--------------------------------
*/

SELECT *
FROM TBL_EMP;

SELECT NVL2(T."입사년도", TO_CHAR(T."입사년도"), '전체') "입사년도", COUNT(T."입사년도") "인원수"
FROM 
(
    SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
    FROM TBL_EMP
) T
GROUP BY ROLLUP(T.입사년도);
/*
입사년도                                            인원수
---------------------------------------- ----------
1980                                              1
1981                                             10
1982                                              1
1987                                              2
2025                                              5
전체                                             19
*/


SELECT EXTRACT(YEAR FROM HIREDATE) "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;
/*
      입사년도        인원수
---------- ----------
      1980          1
      1981         10
      1982          1
      1987          2
      2025          5
*/

SELECT TO_CHAR(HIHIREDATE, 'YYYY') "입사년도"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY 1;

----------▣▣▣▣ HAVING  ▣▣▣---------


--▣ EMP 테이블에서 부서번호 20, 30 인 부서를 대상으로
--   부서의 총 급여가 10000 보다 적을 경우만 부서별 총 급여를 조회한다.


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30)
GROUP BY DEPTNO
/*

    DEPTNO   SUM(SAL)
---------- ----------
        30       9400
        20      10875
*/


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30) 
   AND
      SUM(SAL) < 10000
GROUP BY DEPTNO;
-- ==>> 에러 발생
/*
SQL 오류: ORA-00934: group function is not allowed here

https://docs.oracle.com/error-help/db/ora-00934/00934. 00000 -  "group function is not allowed here"
*Cause:    One of the group functions, such as AVG, COUNT, MAX,
           MIN, SUM, STDDEV, or VARIANCE, was used in a WHERE or GROUP BY
           clause.
*Action:   Remove the group function from the WHERE or GROUP BY
           clause. The desired result may be achieved by including the
           function in a subquery or HAVING clause.
*/


SELECT DEPTNO, SUM(SAL)
FROM EMP
WHERE DEPTNO IN (20, 30) 
GROUP BY DEPTNO
HAVING SUM(SAL) < 10000;
/*
    DEPTNO   SUM(SAL)
---------- ----------
        30       9400
*/

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING  SUM(SAL) < 10000
    AND
        DEPTNO IN (20, 30); -- WHERE 절에서 허용되는 조건은 가급적 WHERE 절에서 사용을 권장
/*
    DEPTNO   SUM(SAL)
---------- ----------
        30       9400
*/


--※ 그룹 함수는 2-LEVEL 까지 중첩해서 사용할 수 있다.
--- 이마저도 MS-SQL 은 불가능하다.
SELECT MAX(SUM(SAL)) "결과확인"
FROM EMP
GROUP BY DEPTNO;
/*
    결과확인
----------
     10875
*/

--※ RANK()
---- DENSE_RANK()
---- → ORACLE 9i 부터 적용....MS-SQL 2005 부터 적용...


--※  위와 같이 하위 버전에서 RANK() 나 DENSE_RANK() 를 사용할 수 없기 때문에
---- 이를 대체하여 연산을 수행할 수 있는 방법을 강구해야 한다.

-- 예를 들어, 급여의 순위를 구해야 하는 상황이라면...
--- 해당 사원의 급여보다 더 큰 급여 값이 몇 개인지 확인한 후
--- 그 확인한 숫자에 +1 을 추가 연산해주면 그것이 곧 등수가 된다.
---

SELECT ENAME, SAL, EMPNO
FROM EMP;

-- SMITH 사원의 급여 등수
SELECT COUNT(*) + 1 "SMITH의 급여 등수"
FROM EMP
WHERE SAL > 800; --- SMITH의 급여
/*
SMITH의 급여 등수
------------
          14
*/

SELECT ENAME "사원명", SAL "급여", (1) "급여등수"
FROM EMP;

--※ 상관 서브 쿼리(서브 상관 쿼리)
----  메인 쿼리에 있는 테이블의 컬럼이
----  서브 커리의 조건절(WHERE절, HAVING절)에 사용되는 경우
----  이 쿼리문을 상관 서브 쿼리(서브 상관 쿼리)라고 부른다.

SELECT ENAME "사원명", SAL "급여", (SELECT COUNT(*) + 1
                                    FROM EMP E2
                                    WHERE E2.SAL > E1.SAL) "급여등수"
FROM EMP E1
ORDER BY 3;
/*
사원명                급여       급여등수
---------- ---------- ----------
SMITH             800         14
ALLEN            1600          7
WARD             1250         10
JONES            2975          4
MARTIN           1250         10
BLAKE            2850          5
CLARK            2450          6
SCOTT            3000          2
KING             5000          1
TURNER           1500          8
ADAMS            1100         12
JAMES             950         13
FORD             3000          2
MILLER           1300          9
*/

--▣ EMP 테이블을 대상으로
--- 사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수 항목을 조회한다.
--- 단, RANK() 함수를 사용하지 않고, 서브 상관 쿼리를 활용할 수 있도록 한다.

-----------------[ 강사님 풀이 - START ] ------------------------------
-- SELECT 사원명, 급여, 부서번호, 부서내급여등수, 전체급여등수
-- FROM EMP;

-- SELECT ENAME 사원명, SAL 급여, DEPTNO 부서번호
-- , (100) 부서내급여등수
-- , (1) 전체급여등수
-- FROM EMP;

-- SELECT ENAME 사원명, SAL 급여, DEPTNO 부서번호
-- , (100) 부서내급여등수
-- , (SELECT COUNT(*) + 1
--     FROM EMP E2
--     WHERE E2.SAL > E1.SAL) 전체급여등수
-- FROM EMP E1
-- ORDER BY E1.DEPTNO, E1.SAL DESC;

-- 부서내 급여등수
SELECT ENAME "사원명"
   , DDEPTNO
   , SAL "급여", (SELECT COUNT(*) + 1
                FROM EMP E2
                WHERE E2.SAL > E1.SAL
                  AND E2.DEPTNO = E1.DEPTNO) "부서내 급여등수"
FROM EMP E1
GROUP BY DEPTNO
ORDER BY 3;

SELECT ENAME 사원명, SAL 급여, DEPTNO 부서번호
, (100) 부서내급여등수
, (SELECT COUNT(*) + 1
    FROM EMP E2
    WHERE E2.SAL > E1.SAL) 전체급여등수
FROM EMP E1
ORDER BY E1.DEPTNO, E1.SAL DESC;
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
SELECT E1.ENAME "사원명"
    , E1.SAL "급여"
    , E1.DEPTNO "부서번호"
    , (SELECT COUNT(E3.DEPTNO) + 1
        FROM EMP E3
        WHERE E3.SAL > E1.SAL AND E1.DEPTNO = E3.DEPTNO) "부서내급여등수"
    , (SELECT COUNT(*) + 1
        FROM EMP E2
        WHERE E2.SAL > E1.SAL) "전체급여등수"
FROM EMP E1
ORDER BY 3, 4;
/*
사원명       급여    부서번호     부서내급여등수  전체급여등수
-------  -------- ----------    -----------      --------
KING         5000         10           1               1
CLARK        2450         10           2               6
MILLER       1300         10           3               9
SCOTT        3000         20           1               2
FORD         3000         20           1               2
JONES        2975         20           3               4
ADAMS        1100         20           4              12
SMITH         800         20           5              14
BLAKE        2850         30           1               5
ALLEN        1600         30           2               7
TURNER       1500         30           3               8
MARTIN       1250         30           4              10
WARD         1250         30           4              10
JAMES         950         30           6              13
*/
-----------------[ 실습 - END ] ------------------------------


--▣ EMP 테이블을 대상으로 다음과 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------------------------------------
사원명  부서번호  입사일  급여   부서내입사별 급여누적(→ 부서 내에서 입사일자별로 급여가 누적된 상황 확인)
--------------------------------------------------------------------
CLARK     10   09/06/81  2450    2450
KING      10   17/11/81  5000    7450
MILLER    10   23/01/82  1300    8750
SMITH     20   17/12/80   800     800
JONES     20   02/04/81  2975    3775
FORD      20   03/12/81  3000    6775
SCOTT     20   13/07/87  3000   10875
--------------------------------------------------------------------
*/

-----------------[ 강사님 풀이 - START ] ------------------------------

-- SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여", (100) "부서내입사별급여누적"
-- FROM EMP;


-- SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
--          , (SELECT SUM(E2.SAL)
--             FROM EMP E2
--             WHERE E2.DEPTNO = E1.DEPTNO) "부서내입사별급여누적"
-- FROM EMP E1
-- ORDER BY 2,3;


SELECT ENAME "사원명", DEPTNO "부서번호", HIREDATE "입사일", SAL "급여"
         , (SELECT SUM(E2.SAL)
            FROM EMP E2
            WHERE E2.DEPTNO = E1.DEPTNO
              AND E2.HIREDATE <= E1.HIREDATE) "부서내입사별급여누적"
FROM EMP E1
ORDER BY 2,3;
/*

사원명       부서번호    입사일      급여 부서내입사별급여누적
---------- ---------- -------- ---------- ----------
CLARK              10 09/06/81       2450       2450
KING               10 17/11/81       5000       7450
MILLER             10 23/01/82       1300       8750
SMITH              20 17/12/80        800        800
JONES              20 02/04/81       2975       3775
FORD               20 03/12/81       3000       6775
SCOTT              20 13/07/87       3000      10875
ADAMS              20 13/07/87       1100      10875
ALLEN              30 20/02/81       1600       1600
WARD               30 22/02/81       1250       2850
BLAKE              30 01/05/81       2850       5700
TURNER             30 08/09/81       1500       7200
MARTIN             30 28/09/81       1250       8450
JAMES              30 03/12/81        950       9400
*/
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-- SELECT ENAME "사원명"
--      , DEPTNO "부서번호"
--      , HIREDATE "입사일"
--      , SAL "급여" 
--      , (11) "부서내입사별급여누적"
-- FROM EMP
-- ORDER BY DEPTNO, HIREDATE;

SELECT ENAME "사원명"
     , DEPTNO "부서번호"
     , HIREDATE "입사일"
     , SAL "급여" 
     , (SELECT SUM(E2.SAL)
        FROM EMP E2
        WHERE E2.HIREDATE <= E1.HIREDATE 
          AND E1.DEPTNO = E2.DEPTNO ) "부서내입사별급여누적"
FROM EMP E1
ORDER BY DEPTNO, HIREDATE;
/*
사원명        부서번호 입사일         급여 부서내입사별급여누적
---------- ---------- -------- ---------- ----------
CLARK              10 09/06/81       2450       2450
KING               10 17/11/81       5000       7450
MILLER             10 23/01/82       1300       8750
SMITH              20 17/12/80        800        800
JONES              20 02/04/81       2975       3775
FORD               20 03/12/81       3000       6775
SCOTT              20 13/07/87       3000      10875
ADAMS              20 13/07/87       1100      10875
ALLEN              30 20/02/81       1600       1600
WARD               30 22/02/81       1250       2850
BLAKE              30 01/05/81       2850       5700
TURNER             30 08/09/81       1500       7200
MARTIN             30 28/09/81       1250       8450
JAMES              30 03/12/81        950       9400
*/
-----------------[ 실습 - END ] ------------------------------


--▣ TBL_EMP 테이블에서 입사한 사원의 수가 제일 많았을 때의
---  입사년월과 인원수를 조회할 수 있도록 쿼리문을 구성한다.
/*
----------------------------
입사년월                인원수
----------------------------
2025-07                  5
----------------------------
*/

-----------------[ 실습 - START ] ----------------------------
SELECT *
FROM TBL_EMP
ORDER BY HIREDATE;

SELECT  
T."인원수" "인원수"
FROM
(
    SELECT --TO_CHAR(HIREDATE,'YYYY-MM') "입사일", 
    MAX(COUNT(*)) "인원수"
    FROM TBL_EMP
    GROUP BY HIREDATE
) T
/*

       인원수
----------
         5
*/

SELECT (E1.HIREDATE) "입사일"
, COUNT(*) "카운트"
-- ,  "인원수"
FROM TBL_EMP E1
GROUP BY E1.HIREDATE
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM TBL_EMP E2
    GROUP BY E2.HIREDATE
)
/*
입사일        카운트
-------- ----------
02/07/25         5
*/

-----------------[ 실습 - END ] ------------------------------


-----------------[ 강사님 풀이 - START ] ------------------------------

SELECT ENAME, HIREDATE
FROM TBL_EMP
ORDER BY 2;
/*
ENAME      HIREDATE
---------- --------
SMITH      17/12/80
ALLEN      20/02/81
WARD       22/02/81
JONES      02/04/81
BLAKE      01/05/81
CLARK      09/06/81
TURNER     08/09/81
MARTIN     28/09/81
KING       17/11/81
FORD       03/12/81
JAMES      03/12/81
MILLER     23/01/82
SCOTT      13/07/87
ADAMS      13/07/87
퀸가비     02/07/25
아이유     02/07/25
김선호     02/07/25
아만다     02/07/25
권지용     02/07/25
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
ORDER BY 2;
/*
입사년월     인원수
------- ----------
1980-12          1
1981-11          1
1982-01          1
1981-05          1
1981-04          1
1981-06          1
1981-09          2
1981-12          2
1981-02          2
1987-07          2
2025-07          5
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5
ORDER BY 2;
/*
입사년월     인원수
------- ----------
2025-07          5
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = 5
ORDER BY 2;
/*
입사년월      인원수
------- ----------
2025-07          5
*/

SELECT MAX(COUNT(*)) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM');
/*
   인원수
----------
         5
*/

SELECT TO_CHAR(HIREDATE, 'YYYY-MM') "입사년월"
     , COUNT(*) "인원수"
FROM TBL_EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*)) "인원수"
    FROM TBL_EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY-MM')
)
ORDER BY 2;

/*
입사년월      인원수
-------  ----------
2025-07          5
*/
-----------------[ 강사님 풀이 - END ] --------------------------------


--▣▣▣  ROW_NUMBER() ▣▣▣--
SELECT ROW_NUMBER() OVER (ORDER BY SAL desc) "관찰(ROW_NUMBER)"
       , ENAME "사원명", SAL 급여, HIREDATE "입사일"
FROM EMP;
/*
관찰(ROW_NUMBER) 사원명        급여     입사일     
-------------- ---------- ----------  --------
      1          KING         5000     17/11/81
      2          FORD         3000     03/12/81
      3          SCOTT        3000     13/07/87
      4          JONES        2975     02/04/81
      5          BLAKE        2850     01/05/81
      6          CLARK        2450     09/06/81
      7          ALLEN        1600     20/02/81
      8          TURNER       1500     08/09/81
      9          MILLER       1300     23/01/82
     10          WARD         1250     22/02/81
     11          MARTIN       1250     28/09/81
     12          ADAMS        1100     13/07/87
     13          JAMES         950     03/12/81
     14          SMITH         800     17/12/80
*/

 --※ 게시판의 게시물 번호를
 --- SEQUENCE 나 IDENTITY 를 사용하게 되면
 --- 특정 게시물을 삭제했을 경우, 삭제한 게시물의 자리에
 --- 다음 번호를 가진 게시물이 등록되는 상황이 발생하게 된다.
 --- 이는, 보안 측면에서나.....미관상... 바람직하지 않는 상황일 수 있기 때문에
 --- ROW_NUMBER() 의 사용을 고려해볼 수 있다.
 --- 관리의 목적으로 사용할 때는 SEQUENCE나 IDENTITY 를 사용하지만
 --- 단순히 게시물을 목록화하여 사용자에게 리스트 형식으로 보여줄 때는
 --- 사용하지 않는 것이 좋다.


DROP TABLE TBL_AAA;
-- ==>> Table TBL_AAA이(가) 삭제되었습니다.

--※ 관찰
--- 테이블 생성
CREATE TABLE TBL_AAA
(
     NO    NUMBER
   , NAME  VARCHAR2(40)
   , GRADE CHAR 
)
-- ==>> Table TBL_AAA이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (1, '김한국', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (2, '김한일', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (3, '김한이', 'A');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (4, '김한삼', 'C');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (5, '김한사', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (6, '김한오', 'B');
INSERT INTO TBL_AAA(NO, NAME, GRADE) VALUES (7, '김한칠', 'B');
-- ==>> 1 행 이(가) 삽입되었습니다. * 7


-- 확인
SELECT *
FROM TBL_AAA;
/*
      NO NAME                                     G
---------- ---------------------------------------- -
         1 김한국                                   A
         2 김한일                                   B
         3 김한이                                   A
         4 김한삼                                   C
         5 김한사                                   B
         6 김한오                                   B
         7 김한칠                                   B
*/

-- 커밋
COMMIT;
-- ==>> 커밋 완료.

UPDATE TBL_AAA
SET GRADE = 'A'
WHERE NO = 6;
-- ==>> 1 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM TBL_AAA;
/*
   NO NAME       G
----- ---------- -
    1 김한국     A
    2 김한일     B
    3 김한이     A
    4 김한삼     C
    5 김한사     B
    6 김한오     A
    7 김한칠     B
*/

--▣ SEQUENCE 생성 (시퀀스, 주문번호)
--- →  사전적인 의미 : 1.(일련의) 연속적인 사건들 2.(사건, 행동 등의) 순서
CREATE SEQUENCE SEQ_BOARD   -- 시퀀스 기본 생성 구문(MSSQL 의 IDENTITY와 동일한 개념)
START WITH 1                -- 시작값
INCREMENT BY 1              -- 증가값
NOMAXVALUE                  -- 최대값 제한 없음
NOCACHE;                     -- 캐시 사용 안함(없음)
-- ==>> Sequence SEQ_BOARD이(가) 생성되었습니다.


--▣ 테이블 생성
--- 테이블명 : TBL_BOARD
CREATE TABLE TBL_BOARD            -- TBL_BOARD 이름의 테이블 생성 →  게시판
( NO        NUMBER                --  게시물 번호      X
, TITLE     VARCHAR2(50)          --  게시물 제목      ○
, CONTENTS  VARCHAR2(2000)        --  게시물 내용      ○
, NAME      VARCHAR2(20)          --  게시물 작성자    ▲
, PW        VARCHAR2(20)          --  게시물 패스워드  ▲
, CREATED   DATE DEFAULT SYSDATE  --  게시물 작성일    X
);
-- ==>> Table TBL_BOARD이(가) 생성되었습니다.


--▣ 데이터 입력 →  게시판에 게시물 작성
INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '피곤하다', '근데 곧 끝나네..아쉽다.', '김한국-1', 'java006$', DEFAULT);
-- VALUES(SEQ_BOARD.NEXTVAL, '피곤하다', '근데 곧 끝나네..아쉽다.', '김한국-1', 'java006$', SYSDATE);
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '건강관리', '다들 건강 잘 챙기도록 합시다.', '김한국-2', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '오늘은', '점심은 먹었고, 저녁은 뭐먹지?', '김한국-3', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '날씨가', '날씨가 점점 더워지네', '김한국-1', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '수업 끝나고', '집에 가서 존윅이나 볼까', '김한국-4', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.


INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '외롭다', '짝꿍 없이 혼자 있어 외롭다.', '김한국-5', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_BOARD(NO, TITLE, CONTENTS, NAME, PW, CREATED)
VALUES(SEQ_BOARD.NEXTVAL, '장래희망', '저는 무럭무럭 자라서 킬러가 되꺼예요.', '김한국-4', 'java006$', DEFAULT);
-- ==>> 1 행 이(가) 삽입되었습니다.

--▣ 확인
SELECT *
FROM TBL_BOARD;
/*
       NO TITLE            CONTENTS                               NAME             PW              CREATED   
---------- ------------   ------------------------------------ ---------------- --------------- ----------
         1 피곤하다         근데 곧 끝나네..아쉽다.                 김한국-1         java006$        2025-07-03
         2 건강관리         다들 건강 잘 챙기도록 합시다.            김한국-2         java006$        2025-07-03
         3 오늘은           점심은 먹었고, 저녁은 뭐먹지?            김한국-3         java006$        2025-07-03
         4 날씨가           날씨가 점점 더워지네                    김한국-1         java006$        2025-07-03
         5 수업 끝나고      집에 가서 존윅이나 볼까                  김한국-4         java006$        2025-07-03
         6 외롭다           짝꿍 없이 혼자 있어 외롭다.              김한국-5         java006$        2025-07-03
         7 장래희망         저는 무럭무럭 자라서 킬러가 되꺼예요.      김한국-4         java006$        2025-07-03
*/


--▣ 커밋
COMMIT;
-- ==>> 커밋 완료.

-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------