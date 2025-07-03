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



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------