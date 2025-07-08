--/*================[ 7월 08일(화) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

--▣ INTERSECT /MINUS ( 교집합 / 차집합)

-- TBL_JUMUNBACKUP 테이블과 TBL_JUMUN 테이블에서
-- 제품코드와 주문량의 값이 똑같은 행만 추출하고자 한다.
SELECT JUNO, JECODE, JUSU
FROM TBL_JUMUNBACKUP;
/*
      JUNO JECODE                               JUSU
---------- ------------------------------ ----------
         1 포카칩                                 20
         2 쿠크다스                                10
         3 홈런볼                                 30
         4 썬칩                                   20
         5 새우깡                                 50
         6 쿠쿠다스                                20
         7 새우깡                                 10
         8 홈런볼                                 20
         9 포카칩                                 30
        10 허니버터칩                              10
        11 포카칩                                 30
        12 빼빼로                                 20
        13 초코파이                                30
        14 초코파이                                20
        15 포카칩                                 20
        16 홈런볼                                 10
        17 홈런볼                                 30

17개 행이 선택되었습니다. 
*/
SELECT JUNO, JECODE, JUSU
FROM TBL_JUMUN;
/*

      JUNO JECODE                               JUSU
---------- ------------------------------ ----------
    938765 홈런볼                                 10
    938766 꼬북칩                                 20
    938767 포카칩                                 20
    938768 허니버터                                10
    938769 빼빼로                                 20
    938770 홈런볼                                 10
    938771 새우깡                                 10
    938772 맛동산                                 20
    938773 감자깡                                 20
    938774 오감자                                 10
    938775 썬칩                                   40
    938776 쿠크다스                                10
    938777 눈을감자                                20

13개 행이 선택되었습니다. 

*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
JECODE                               JUSU
------------------------------ ----------
빼빼로                                 20
새우깡                                 10
쿠크다스                                10
포카칩                                 20
홈런볼                                 10
*/

SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
MINUS
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*
JECODE                               JUSU
------------------------------ ----------
새우깡                                 50
썬칩                                   20
초코파이                                20
초코파이                                30
쿠쿠다스                                20
포카칩                                 30
허니버터칩                              10
홈런볼                                 20
홈런볼                                 30

9개 행이 선택되었습니다. 
*/


--▣ TBL_JUMUNBACKUP 테이블과 TBL_JUMUN테이블에서
--  제품코드와 주문량의 값이 똑같은 행의 데이터를
--  주문번호, 제품코드, 주문수량, 주문일자 항목으로 조회한다.


-----------------[ 강사님 풀이 - START ] ------------------------------
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN;
/*

JECODE                               JUSU
------------------------------ ----------
빼빼로                                 20
새우깡                                 10
쿠크다스                                10
포카칩                                 20
홈런볼                                 10
*/

SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JUNO, JECODE, JUSU, JUDAY
FROM TBL_JUMUN;
-- ==>> 선택된 행 없음

-- 방법 -1 
SELECT T2.JUNO 주문번호, T1.JECODE 제품코드, T1.JUSU 주문수량, T2.JUDAY 주문일자
FROM 
(
      SELECT JECODE, JUSU
      FROM TBL_JUMUNBACKUP
      INTERSECT
      SELECT JECODE, JUSU
      FROM TBL_JUMUN
) T1 
JOIN 
(
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUNBACKUP
      UNION ALL
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUN
) T2
ON T1.JECODE = T2.JECODE
AND T1.JUSU = T2.JUSU;
/*
      주문번호 제품코드                                 주문수량 주문일자      
---------- ------------------------------ ---------- ----------
         1 포카칩                                 20 2001-12-22
         2 쿠크다스                               10 2001-12-25
         7 새우깡                                 10 2002-01-15
        12 빼빼로                                 20 2002-02-10
        15 포카칩                                 20 2002-02-17
        16 홈런볼                                 10 2002-02-19
    938765 홈런볼                                 10 2025-07-04
    938767 포카칩                                 20 2025-07-04
    938769 빼빼로                                 20 2025-07-04
    938770 홈런볼                                 10 2025-07-04
    938771 새우깡                                 10 2025-07-04
    938776 쿠크다스                               10 2025-07-04

12개 행이 선택되었습니다. 
*/


-- 방법-2
SELECT  *
FROM 
(
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUNBACKUP
      UNION ALL
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUN
) T
WHERE JECODE IN ('포카칩', '쿠크다스', '새우깡', '허니버터칩', '빼빼로', '홈런볼')
AND JUSU IN (20, 10);
--==>> 잘못된 결과
-- 
/*
         1 포카칩                                 20 2001-12-22
         2 쿠크다스                                10 2001-12-25
         7 새우깡                                 10 2002-01-15
         8 홈런볼                                 20 2002-01-15
        10 허니버터칩                              10 2002-02-07
        12 빼빼로                                 20 2002-02-10
        15 포카칩                                 20 2002-02-17
        16 홈런볼                                 10 2002-02-19
    938765 홈런볼                                 10 2025-07-04
    938767 포카칩                                 20 2025-07-04
    938769 빼빼로                                 20 2025-07-04
    938770 홈런볼                                 10 2025-07-04
    938771 새우깡                                 10 2025-07-04
    938776 쿠크다스                                10 2025-07-04

14개 행이 선택되었습니다. 
*/

SELECT  *
FROM 
(
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUNBACKUP
      UNION ALL
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUN
) T
WHERE JECODE||JUSU IN ('포카칩20', '쿠크다스10', '새우깡10', '허니버터칩10', '빼빼로20', '홈런볼10');
-- WHERE CONCAT(JECODE, JUSU) IN ('포카칩20', '쿠크다스10', '새우깡10', '허니버터칩10', '빼빼로20', '홈런볼10');
-- WHERE CONCAT(JECODE, JUSU) ANY ('포카칩20', '쿠크다스10', '새우깡10', '허니버터칩10', '빼빼로20', '홈런볼10');

SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT CONCAT(JECODE, JUSU)
FROM TBL_JUMUN;
/*

CONCAT(JECODE,JUSU)
----------------------------------------------------------------------
빼빼로20
새우깡10
쿠크다스10
포카칩20
홈런볼10
*/

-- ★★★★★★★★
-- 방법-3 ★★★★★
-- ★★★★★★★★
SELECT  *
FROM 
(
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUNBACKUP
      UNION ALL
      SELECT JUNO, JECODE, JUSU, JUDAY
      FROM TBL_JUMUN
) T
WHERE CONCAT(JECODE, JUSU) IN (
                              SELECT CONCAT(JECODE, JUSU)
                              FROM TBL_JUMUNBACKUP
                              INTERSECT
                              SELECT CONCAT(JECODE, JUSU)
                              FROM TBL_JUMUN
                              );

/*
      JUNO JECODE                               JUSU JUDAY     
---------- ------------------------------ ---------- ----------
         1 포카칩                                 20 2001-12-22
         2 쿠크다스                                10 2001-12-25
         7 새우깡                                 10 2002-01-15
        12 빼빼로                                 20 2002-02-10
        15 포카칩                                 20 2002-02-17
        16 홈런볼                                 10 2002-02-19
    938765 홈런볼                                 10 2025-07-04
    938767 포카칩                                 20 2025-07-04
    938769 빼빼로                                 20 2025-07-04
    938770 홈런볼                                 10 2025-07-04
    938771 새우깡                                 10 2025-07-04
    938776 쿠크다스                                10 2025-07-04

12개 행이 선택되었습니다. 
*/

-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------

SELECT  JJ.JUNO 주문번호, JJ.JECODE 제품코드, JJ.JUSU 주문수량, JJ.JUDAY 주문일자
FROM
(
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN
) T, TBL_JUMUNBACKUP JJ
WHERE T.JECODE = JJ.JECODE
   AND T.JUSU = JJ.JUSU
UNION ALL
SELECT  J.JUNO 주문번호, J.JECODE 제품코드, J.JUSU 주문수량, J.JUDAY 주문일자
FROM
(
SELECT JECODE, JUSU
FROM TBL_JUMUNBACKUP
INTERSECT
SELECT JECODE, JUSU
FROM TBL_JUMUN
) T, TBL_JUMUN J
WHERE T.JECODE = J.JECODE
   AND T.JUSU = J.JUSU;
/*

      주문번호 제품코드                                 주문수량 주문일자      
---------- ------------------------------ ---------- ----------
         1 포카칩                                 20 2001-12-22
         2 쿠크다스                                10 2001-12-25
         7 새우깡                                 10 2002-01-15
        12 빼빼로                                 20 2002-02-10
        15 포카칩                                 20 2002-02-17
        16 홈런볼                                 10 2002-02-19
    938765 홈런볼                                 10 2025-07-04
    938767 포카칩                                 20 2025-07-04
    938769 빼빼로                                 20 2025-07-04
    938770 홈런볼                                 10 2025-07-04
    938771 새우깡                                 10 2025-07-04
    938776 쿠크다스                                10 2025-07-04

12개 행이 선택되었습니다. 
*/
-----------------[ 실습 - END ] ------------------------------

SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
--==>> 에러발생


SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO;
/*
       JONES            2975
        20 RESEARCH       FORD             3000
        20 RESEARCH       ADAMS            1100
        20 RESEARCH       SMITH             800
        20 RESEARCH       SCOTT            3000
        30 SALES          WARD             1250
        30 SALES          TURNER           1500
        30 SALES          ALLEN            1600
        30 SALES          JAMES             950
        30 SALES          BLAKE            2850
        30 SALES          MARTIN           1250
*/

-- CHECK~!!!
--▣▣▣ NATURAL JOIN ▣▣▣----
-- 사용 빈도가 적은 JOIN...
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP NATURAL JOIN DEPT;


-- CHECK~!!
-- JOIN.... USING 문
SELECT DEPTNO, DNAME, ENAME, SAL
FROM EMP JOIN DEPT
USING (DEPTNO);


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------