--/*================[ 7월 04일(금) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

--▣ SELF JOIN(자기 조인)
--    EMP 테이블의 데이터를 다음과 같이 조회할 수 있도록 쿼리문을 구성한다.
------------------------------------------------------------------------
-- 사원번호  사원명  직종명  관리자번호 관리자명 관리자직종명
------------------------------------------------------------------------
--  7369    SMITH   CLERK     7902     FORD    ANALYST
--                            ...

-----------------[ 강사님 풀이 - START ] ------------------------------

-- EMPNO    ENAME    JOB     MGR →  ①                      → E1
--                           EMPNO    ENAME     JOB  →  ②  → E2
------------------------------------------------------------------------
-- 사원번호  사원명  직종명  관리자번호 관리자명 관리자직종명
------------------------------------------------------------------------

-- ①
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;


-- ②
SELECT EMPNO, ENAME, JOB, MGR
FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.JOB
     , E2.EMPNO, E2.ENAME, E2.JOB
FROM EMP E1 JOIN EMP E2
  ON E1.MGR = E2.EMPNO
ORDER BY E1.EMPNO;
--==>> 13개 행이 선택되었습니다. --(x)
/*
     EMPNO ENAME      JOB            EMPNO ENAME      JOB      
---------- ---------- --------- ---------- ---------- ---------
      7369 SMITH      CLERK           7902 FORD       ANALYST  
      7499 ALLEN      SALESMAN        7698 BLAKE      MANAGER  
      7521 WARD       SALESMAN        7698 BLAKE      MANAGER  
      7566 JONES      MANAGER         7839 KING       PRESIDENT
      7654 MARTIN     SALESMAN        7698 BLAKE      MANAGER  
      7698 BLAKE      MANAGER         7839 KING       PRESIDENT
      7782 CLARK      MANAGER         7839 KING       PRESIDENT
      7788 SCOTT      ANALYST         7566 JONES      MANAGER  
      7844 TURNER     SALESMAN        7698 BLAKE      MANAGER  
      7876 ADAMS      CLERK           7788 SCOTT      ANALYST  
      7900 JAMES      CLERK           7698 BLAKE      MANAGER  
      7902 FORD       ANALYST         7566 JONES      MANAGER  
      7934 MILLER     CLERK           7782 CLARK      MANAGER  

13개 행이 선택되었습니다. 
*/


SELECT E1.EMPNO, E1.ENAME, E1.JOB
     , E2.EMPNO, E2.ENAME, E2.JOB
FROM EMP E1 LEFT JOIN EMP E2
  ON E1.MGR = E2.EMPNO
ORDER BY E1.EMPNO;
--==>> 13개 행이 선택되었습니다. --(O)
/*
     EMPNO ENAME      JOB            EMPNO ENAME      JOB      
---------- ---------- --------- ---------- ---------- ---------
      7369 SMITH      CLERK           7902 FORD       ANALYST  
      7499 ALLEN      SALESMAN        7698 BLAKE      MANAGER  
      7521 WARD       SALESMAN        7698 BLAKE      MANAGER  
      7566 JONES      MANAGER         7839 KING       PRESIDENT
      7654 MARTIN     SALESMAN        7698 BLAKE      MANAGER  
      7698 BLAKE      MANAGER         7839 KING       PRESIDENT
      7782 CLARK      MANAGER         7839 KING       PRESIDENT
      7788 SCOTT      ANALYST         7566 JONES      MANAGER  
      7839 KING       PRESIDENT                                
      7844 TURNER     SALESMAN        7698 BLAKE      MANAGER  
      7876 ADAMS      CLERK           7788 SCOTT      ANALYST  
      7900 JAMES      CLERK           7698 BLAKE      MANAGER  
      7902 FORD       ANALYST         7566 JONES      MANAGER  
      7934 MILLER     CLERK           7782 CLARK      MANAGER  

14개 행이 선택되었습니다. 
*/
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
DESC EMP;
/*
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER(4)    
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER(4)    
HIREDATE          DATE         
SAL               NUMBER(7,2)  
COMM              NUMBER(7,2)  
DEPTNO            NUMBER(2)    
*/

SELECT *
FROM EMP
ORDER BY EMPNO;
/*
     EMPNO ENAME      JOB              MGR HIREDATE          SAL      COMM     DEPTNO
---------- ---------- --------- ---------- ---------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 1980-12-17        800                    20
      7499 ALLEN      SALESMAN        7698 1981-02-20       1600        300         30
      7521 WARD       SALESMAN        7698 1981-02-22       1250        500         30
      7566 JONES      MANAGER         7839 1981-04-02       2975                    20
      7654 MARTIN     SALESMAN        7698 1981-09-28       1250       1400         30
      7698 BLAKE      MANAGER         7839 1981-05-01       2850                    30
      7782 CLARK      MANAGER         7839 1981-06-09       2450                    10
      7788 SCOTT      ANALYST         7566 1987-07-13       3000                    20
      7839 KING       PRESIDENT    (NULL)  1981-11-17       5000                    10
      7844 TURNER     SALESMAN        7698 1981-09-08       1500          0         30
      7876 ADAMS      CLERK           7788 1987-07-13       1100                    20
      7900 JAMES      CLERK           7698 1981-12-03        950                    30
      7902 FORD       ANALYST         7566 1981-12-03       3000                    20
      7934 MILLER     CLERK           7782 1982-01-23       1300                    10
14개 행이 선택되었습니다. 
*/

SELECT E2.EMPNO 사원번호, E2.ENAME  사원명, E2.JOB  직종명
, E.EMPNO 관리자번호
, E.ENAME 관리자명
, E.JOB 관리자직종명
FROM EMP E, EMP E2
WHERE E.EMPNO(+) = E2.MGR
ORDER BY E2.EMPNO;
-- ==>>
/*

   사원번호 사원명      직종명    관리자번호 관리자명    관리자직종명   
---------- ---------- --------- ---------- ---------- ---------
      7369 SMITH      CLERK           7902 FORD       ANALYST  
      7499 ALLEN      SALESMAN        7698 BLAKE      MANAGER  
      7521 WARD       SALESMAN        7698 BLAKE      MANAGER  
      7566 JONES      MANAGER         7839 KING       PRESIDENT
      7654 MARTIN     SALESMAN        7698 BLAKE      MANAGER  
      7698 BLAKE      MANAGER         7839 KING       PRESIDENT
      7782 CLARK      MANAGER         7839 KING       PRESIDENT
      7788 SCOTT      ANALYST         7566 JONES      MANAGER  
      7839 KING       PRESIDENT                                
      7844 TURNER     SALESMAN        7698 BLAKE      MANAGER  
      7876 ADAMS      CLERK           7788 SCOTT      ANALYST  
      7900 JAMES      CLERK           7698 BLAKE      MANAGER  
      7902 FORD       ANALYST         7566 JONES      MANAGER  
      7934 MILLER     CLERK           7782 CLARK      MANAGER  

14개 행이 선택되었습니다. 
*/

-----------------[ 실습 - END ] ------------------------------

-- [▣▣▣▣  UNION  / UNION ALL  ▣▣▣▣] --

--▣ 실습 테이블 생성
--- 테이블명 : TBL_JUMUN

CREATE TABLE TBL_JUMUN            -- 주문 테이블 생성
( JUNO      NUMBER                -- 주문 번호
, JECODE    VARCHAR2(30)          -- 주문된 제품 코드
, JUSU      NUMBER                -- 주문 수량
, JUDAY     DATE DEFAULT SYSDATE  -- 주문 일자
);
-- ==>> Table TBL_JUMUN이(가) 생성되었습니다.

--▣ 데이터 입력 -> 고객의 주문 발생 / 접수
INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(1, '포카칩', 20, TO_DATE('2001-12-22 09:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(2, '쿠쿠다스', 10, TO_DATE('2001-12-25 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(3, '홈런볼', 30, TO_DATE('2001-12-27 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(4, '썬칩', 20, TO_DATE('2001-12-28 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(5, '새우깡', 50, TO_DATE('2002-01-11 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(6, '쿠쿠다스', 20, TO_DATE('2002-01-12 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(7, '새우깡', 10, TO_DATE('2002-01-15 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(8, '홈런볼', 20, TO_DATE('2002-01-15 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(9, '포카칩', 30, TO_DATE('2002-01-22 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(10, '허니버터칩', 10, TO_DATE('2002-02-07 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));
-- ==>> 1 행 이(가) 삽입되었습니다. X 10회

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- ==>> Session이(가) 변경되었습니다.

--▣ TBL_JUMUN  데이터 확인
SELECT *
FROM TBL_JUMUN;
/*
      JUNO JECODE         JUSU   JUDAY              
---------- -----------  ------   -------------------
         1 포카칩           20   2001-12-22 09:10:20
         2 쿠쿠다스         10   2001-12-25 10:10:20
         3 홈런볼           30   2001-12-27 10:10:20
         4 썬칩             20   2001-12-28 10:10:20
         5 새우깡           50   2002-01-11 10:10:20
         6 쿠쿠다스         20   2002-01-12 10:10:20
         7 새우깡           10   2002-01-15 10:10:20
         8 홈런볼           20   2002-01-15 10:10:20
         9 포카칩           30   2002-01-22 10:10:20
        10 허니버터칩       10   2002-02-07 10:10:20

10개 행이 선택되었습니다. 
*/

UPDATE TBL_JUMUN
SET 
JECODE = '쿠크다스'
WHERE JUNO = 2;
-- ==>> 1 행 이(가) 업데이트되었습니다.

--▣ TBL_JUMUN  데이터 업데이트 후 재확인
SELECT *
FROM TBL_JUMUN;
/*
JUNO    JECODE         JUSU    JUDAY              
------ ------------   -----   -------------------
   1   포카칩            20    2001-12-22 09:10:20
   2   쿠크다스          10    2001-12-25 10:10:20
   3   홈런볼            30    2001-12-27 10:10:20
   4   썬칩              20    2001-12-28 10:10:20
   5   새우깡            50    2002-01-11 10:10:20
   6   쿠쿠다스          20    2002-01-12 10:10:20
   7   새우깡            10    2002-01-15 10:10:20
   8   홈런볼            20    2002-01-15 10:10:20
   9   포카칩            30    2002-01-22 10:10:20
  10   허니버터칩        10    2002-02-07 10:10:20

10개 행이 선택되었습니다. 
*/

--▣ 커밋
COMMIT;
-- ==>> 커밋 완료.


--▣ 데이터 추가 입력
INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(11, '포카칩', 30, TO_DATE('2002-02-09 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(12, '빼빼로', 20, TO_DATE('2002-02-10 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(13, '초코파이', 30, TO_DATE('2002-02-13 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(14, '초코파이', 20, TO_DATE('2002-02-15 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(15, '포카칩', 20, TO_DATE('2002-02-17 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(16, '홈런볼', 10, TO_DATE('2002-02-19 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(17, '홈런볼', 30, TO_DATE('2002-02-20 10:10:20', 'YYYY-MM-DD HH24:MI:SS'));
-- ==>> 1 행 이(가) 삽입되었습니다. X 7회


COMMIT;
-- ==>> 커밋 완료.

--▣ 데이터 추가 입력
INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938765, '홈런볼', 10, SYSDATE);
INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938766, '꼬북칩', 20, SYSDATE);
INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938767, '포카칩', 20, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938768, '허니버터', 10, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938769, '뻬뻬러', 20, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938770, '홈런볼', 10, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938771, '새우깡', 10, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938772, '맛동산', 20, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938773, '감자깡', 20, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938774, '오감자', 10, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938775, '썬칩', 40, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938776, '쿠크다스', 10, SYSDATE);

INSERT INTO TBL_JUMUN(JUNO, JECODE, JUSU, JUDAY)
VALUES(938777, '눈을감자', 20, SYSDATE);
-- ==>>  1 행 이(가) 삽입되었습니다.

--▣ 데이터 확인
SELECT *
FROM TBL_JUMUN;
/*
      JUNO   JECODE                 JUSU JUDAY              
----------   ----------- -------  -------------------
         1   포카칩           20    2001-12-22 09:10:20
         2   쿠크다스         10    2001-12-25 10:10:20
         3   홈런볼           30    2001-12-27 10:10:20
         4   썬칩             20    2001-12-28 10:10:20
         5   새우깡           50    2002-01-11 10:10:20
         6   쿠쿠다스         20    2002-01-12 10:10:20
         7   새우깡           10    2002-01-15 10:10:20
         8   홈런볼           20    2002-01-15 10:10:20
         9   포카칩           30    2002-01-22 10:10:20
        10   허니버터칩       10    2002-02-07 10:10:20
        11   포카칩           30    2002-02-09 10:10:20
        12   빼빼로           20    2002-02-10 10:10:20
        13   초코파이         30    2002-02-13 10:10:20
        14   초코파이         20    2002-02-15 10:10:20
        15   포카칩           20    2002-02-17 10:10:20
        16   홈런볼           10    2002-02-19 10:10:20
        17   홈런볼           30    2002-02-20 10:10:20
    938765   홈런볼           10    2025-07-04 16:11:10
    938766   꼬북칩           20    2025-07-04 16:12:00
    938767   포카칩           20    2025-07-04 16:12:23
    938768   허니버터         10    2025-07-04 16:12:42
    938769   뻬뻬러           20    2025-07-04 16:13:01
    938770   홈런볼           10    2025-07-04 16:13:29
    938771   새우깡           10    2025-07-04 16:14:05
    938772   맛동산           20    2025-07-04 16:14:36
    938773   감자깡           20    2025-07-04 16:15:04
    938774   오감자           10    2025-07-04 16:15:21
    938775   썬칩             40    2025-07-04 16:15:54
    938776   쿠크다스         10    2025-07-04 16:16:31
    938777   눈을감자         20    2025-07-04 16:16:47

30개 행이 선택되었습니다. 
*/

UPDATE TBL_JUMUN
SET 
JECODE = '빼빼로'
WHERE JUNO = 938769;
-- ==>> 1 행 이(가) 업데이트되었습니다.

--▣ 커밋
COMMIT;
-- ==>> 커밋 완료.

--※ 철수가... 2001년도 부터 과자 쇼핑몰 운영 중...
-----   TBL_JUMUN 테이블이 매우 무거워진 상황
-----   어플리케이션과 연동으로 인해 주문 내역을
-----   다른 테이블에 저장될 수 있도록 다시 구성하는 것은 힘든 상황
-----   기존의 모든 데이터를 덮어놓고 지우는 것도 불가능한 상황
-----   → 결과적으로.... 현재까지 누적된 주문 데이터 중
-----      금일 발생한 주문 내역을 제외하고
-----      나머지를 다른 테이블로 데이터 이관을 수행할 계획 


--▣ TBL_JUMUN 테이블에서 금일 발생한 주문 내역을 제외하고
----- 나머지 데이터 조회
-----------------[ 강사님 풀이 - START ] ------------------------------
-- SELECT *
-- FROM TBL_JUMUN
-- WHERE 금일 주문이 아닌 것;

SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');

--▣ 위의 조회 결과로 TBL_JUMUNBACKUP 테이블 생성
CREATE TABLE TBL_JUMUNBACKUP
AS
SELECT *
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- ==>> Table TBL_JUMUNBACKUP이(가) 생성되었습니다.


--▣ 확인
SELECT *
FROM TBL_JUMUNBACKUP;
/*
JUNO         JECODE         JUSU          JUDAY                
---------- ------------- ----------   -------------------
         1 포카칩            20        2001-12-22 09:10:20
         2 쿠크다스          10        2001-12-25 10:10:20
         3 홈런볼            30        2001-12-27 10:10:20
         4 썬칩              20        2001-12-28 10:10:20
         5 새우깡            50        2002-01-11 10:10:20
         6 쿠쿠다스          20        2002-01-12 10:10:20
         7 새우깡            10        2002-01-15 10:10:20
         8 홈런볼            20        2002-01-15 10:10:20
         9 포카칩            30        2002-01-22 10:10:20
        10 허니버터칩        10        2002-02-07 10:10:20
        11 포카칩            30        2002-02-09 10:10:20
        12 빼빼로            20        2002-02-10 10:10:20
        13 초코파이          30        2002-02-13 10:10:20
        14 초코파이          20        2002-02-15 10:10:20
        15 포카칩            20        2002-02-17 10:10:20
        16 홈런볼            10        2002-02-19 10:10:20
        17 홈런볼            30        2002-02-20 10:10:20

17개 행이 선택되었습니다. 
*/
-->
-- 

--▣ TBL_JUMUN 테이블의 데이터들 중
--   백업을 마친 금일 주문내역 이외의 데이터는 모두 삭제
DELETE
FROM TBL_JUMUN
WHERE TO_CHAR(JUDAY, 'YYYY-MM-DD') != TO_CHAR(SYSDATE, 'YYYY-MM-DD');
-- ==>> 17개 행 이(가) 삭제되었습니다.
--- 
--- 여기까지 수행하면
--- 아직 제품 발송이 완료되지 않은 금일 주문 데이터를 제외하고
--- 이전의 모든 주문
--- 

--▣ 데이터 확인
SELECT *
FROM TBL_JUMUN;
/*
       JUNO  JECODE         JUSU     JUDAY              
---------- -------------- -------   -------------------
    938765 홈런볼              10   2025-07-04 16:11:10
    938766 꼬북칩              20   2025-07-04 16:12:00
    938767 포카칩              20   2025-07-04 16:12:23
    938768 허니버터            10   2025-07-04 16:12:42
    938769 빼빼로              20   2025-07-04 16:13:01
    938770 홈런볼              10   2025-07-04 16:13:29
    938771 새우깡              10   2025-07-04 16:14:05
    938772 맛동산              20   2025-07-04 16:14:36
    938773 감자깡              20   2025-07-04 16:15:04
    938774 오감자              10   2025-07-04 16:15:21
    938775 썬칩                40   2025-07-04 16:15:54
    938776 쿠크다스            10   2025-07-04 16:16:31
    938777 눈을감자            20   2025-07-04 16:16:47

13개 행이 선택되었습니다. 
*/

--▣ 커밋
COMMIT;
-- ==>> 커밋 완료. 

-- 그런데, 지금까지 주문받은 내역에 대한 정보를
-- 제품별 총 주문량으로 나타내야 할 상황이 발생하게 되었다.
-- 이 경우, TBL_JUMUMBACKUP 테이블의 레코드(행)와
-- TBL_JUMUN 테이블의 레코드(행)를 합쳐서
-- 하나의 테이블을 조회하는 것과 같은 결과를 확인할 수 있도록
-- 쿼리문을 구성해야 한다.

-- 컬럼과 컬럼의 관계를 고려하여 테이블을 결합하고자 하는 경우 JOIN을 사용하지만
-- 레코드(행)와 레코드(행)를 결합하고자 하는 경우 UNION / UNION ALL을 사용할 수 있다.

SELECT *
FROM TBL_JUMUNBACKUP;
SELECT *
FROM TBL_JUMUN;

-- UNION
SELECT *
FROM TBL_JUMUNBACKUP
UNION
SELECT *
FROM TBL_JUMUN;
/*
      JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 포카칩                                 20 2001-12-22 09:10:20
         2 쿠크다스                               10 2001-12-25 10:10:20
         3 홈런볼                                 30 2001-12-27 10:10:20
         4 썬칩                                   20 2001-12-28 10:10:20
         5 새우깡                                 50 2002-01-11 10:10:20
         6 쿠쿠다스                               20 2002-01-12 10:10:20
         7 새우깡                                 10 2002-01-15 10:10:20
         8 홈런볼                                 20 2002-01-15 10:10:20
         9 포카칩                                 30 2002-01-22 10:10:20
        10 허니버터칩                             10 2002-02-07 10:10:20
        11 포카칩                                 30 2002-02-09 10:10:20
        12 빼빼로                                 20 2002-02-10 10:10:20
        13 초코파이                               30 2002-02-13 10:10:20
        14 초코파이                               20 2002-02-15 10:10:20
        15 포카칩                                 20 2002-02-17 10:10:20
        16 홈런볼                                 10 2002-02-19 10:10:20
        17 홈런볼                                 30 2002-02-20 10:10:20
    938765 홈런볼                                 10 2025-07-04 16:11:10
    938766 꼬북칩                                 20 2025-07-04 16:12:00
    938767 포카칩                                 20 2025-07-04 16:12:23
    938768 허니버터                               10 2025-07-04 16:12:42
    938769 빼빼로                                 20 2025-07-04 16:13:01
    938770 홈런볼                                 10 2025-07-04 16:13:29
    938771 새우깡                                 10 2025-07-04 16:14:05
    938772 맛동산                                 20 2025-07-04 16:14:36
    938773 감자깡                                 20 2025-07-04 16:15:04
    938774 오감자                                 10 2025-07-04 16:15:21
    938775 썬칩                                   40 2025-07-04 16:15:54
    938776 쿠크다스                               10 2025-07-04 16:16:31
    938777 눈을감자                               20 2025-07-04 16:16:47

30개 행이 선택되었습니다. 
*/

-- UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP
UNION ALL
SELECT *
FROM TBL_JUMUN;
/*
JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 포카칩                                 20 2001-12-22 09:10:20
         2 쿠크다스                               10 2001-12-25 10:10:20
         3 홈런볼                                 30 2001-12-27 10:10:20
         4 썬칩                                   20 2001-12-28 10:10:20
         5 새우깡                                 50 2002-01-11 10:10:20
         6 쿠쿠다스                               20 2002-01-12 10:10:20
         7 새우깡                                 10 2002-01-15 10:10:20
         8 홈런볼                                 20 2002-01-15 10:10:20
         9 포카칩                                 30 2002-01-22 10:10:20
        10 허니버터칩                             10 2002-02-07 10:10:20
        11 포카칩                                 30 2002-02-09 10:10:20
        12 빼빼로                                 20 2002-02-10 10:10:20
        13 초코파이                               30 2002-02-13 10:10:20
        14 초코파이                               20 2002-02-15 10:10:20
        15 포카칩                                 20 2002-02-17 10:10:20
        16 홈런볼                                 10 2002-02-19 10:10:20
        17 홈런볼                                 30 2002-02-20 10:10:20
    938765 홈런볼                                 10 2025-07-04 16:11:10
    938766 꼬북칩                                 20 2025-07-04 16:12:00
    938767 포카칩                                 20 2025-07-04 16:12:23
    938768 허니버터                               10 2025-07-04 16:12:42
    938769 빼빼로                                 20 2025-07-04 16:13:01
    938770 홈런볼                                 10 2025-07-04 16:13:29
    938771 새우깡                                 10 2025-07-04 16:14:05
    938772 맛동산                                 20 2025-07-04 16:14:36
    938773 감자깡                                 20 2025-07-04 16:15:04
    938774 오감자                                 10 2025-07-04 16:15:21
    938775 썬칩                                   40 2025-07-04 16:15:54
    938776 쿠크다스                               10 2025-07-04 16:16:31
    938777 눈을감자                               20 2025-07-04 16:16:47

30개 행이 선택되었습니다. 
*/


-- UNION   
SELECT *
FROM TBL_JUMUN
UNION
SELECT *
FROM TBL_JUMUNBACKUP;

-- UNION ALL 
SELECT *
FROM TBL_JUMUN
UNION ALL
SELECT *
FROM TBL_JUMUNBACKUP;

--※ UNION 은 항상 결과물의 첫 번째 컬럼을 기준으로
--   오름차순 정렬을 수행한다.
--   반면, UNINON ALL은 결합된 순서대로(쿼리문 구성대로) 조회한 결과를 반환한다.
--   이로 인해 UNION 의 부하가 더 크다.
--   또한, UNION 은 결과물에서 중복된 행이 존재할 경우
--   중복을 제거하고 1개 행만 조회된 결과를 반환하게 된다.

-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
DESC TBL_JUMUN;
/*
이름     널? 유형           
------ -- ------------ 
JUNO      NUMBER       
JECODE    VARCHAR2(30) 
JUSU      NUMBER       
JUDAY     DATE    
*/

SELECT *
FROM TBL_JUMUN;
/*
JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 포카칩                                 20 2001-12-22 09:10:20
         2 쿠크다스                                10 2001-12-25 10:10:20
         3 홈런볼                                 30 2001-12-27 10:10:20
         4 썬칩                                   20 2001-12-28 10:10:20
         5 새우깡                                 50 2002-01-11 10:10:20
         6 쿠쿠다스                                20 2002-01-12 10:10:20
         7 새우깡                                 10 2002-01-15 10:10:20
         8 홈런볼                                 20 2002-01-15 10:10:20
         9 포카칩                                 30 2002-01-22 10:10:20
        10 허니버터칩                              10 2002-02-07 10:10:20
        11 포카칩                                 30 2002-02-09 10:10:20
        12 빼빼로                                 20 2002-02-10 10:10:20
        13 초코파이                                30 2002-02-13 10:10:20
        14 초코파이                                20 2002-02-15 10:10:20
        15 포카칩                                 20 2002-02-17 10:10:20
        16 홈런볼                                 10 2002-02-19 10:10:20
        17 홈런볼                                 30 2002-02-20 10:10:20
    938765 홈런볼                                 10 2025-07-04 16:11:10
    938766 꼬북칩                                 20 2025-07-04 16:12:00
    938767 포카칩                                 20 2025-07-04 16:12:23
    938768 허니버터                                10 2025-07-04 16:12:42
    938769 빼빼로                                 20 2025-07-04 16:13:01
    938770 홈런볼                                 10 2025-07-04 16:13:29
    938771 새우깡                                 10 2025-07-04 16:14:05
    938772 맛동산                                 20 2025-07-04 16:14:36
    938773 감자깡                                 20 2025-07-04 16:15:04
    938774 오감자                                 10 2025-07-04 16:15:21
    938775 썬칩                                   40 2025-07-04 16:15:54
    938776 쿠크다스                                10 2025-07-04 16:16:31
    938777 눈을감자                                20 2025-07-04 16:16:47

30개 행이 선택되었습니다. 
*/

SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'YYYY-MM-DD')
FROM DUAL;

SELECT *
FROM TBL_JUMUN
WHERE TO_DATE(TO_CHAR(JUDAY, 'YYYY-MM-DD'), 'YYYY-MM-DD') < TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 'YYYY-MM-DD');
/*
JUNO JECODE                               JUSU JUDAY              
---------- ------------------------------ ---------- -------------------
         1 포카칩                                 20 2001-12-22 09:10:20
         2 쿠크다스                                10 2001-12-25 10:10:20
         3 홈런볼                                 30 2001-12-27 10:10:20
         4 썬칩                                   20 2001-12-28 10:10:20
         5 새우깡                                 50 2002-01-11 10:10:20
         6 쿠쿠다스                                20 2002-01-12 10:10:20
         7 새우깡                                 10 2002-01-15 10:10:20
         8 홈런볼                                 20 2002-01-15 10:10:20
         9 포카칩                                 30 2002-01-22 10:10:20
        10 허니버터칩                              10 2002-02-07 10:10:20
        11 포카칩                                 30 2002-02-09 10:10:20
        12 빼빼로                                 20 2002-02-10 10:10:20
        13 초코파이                                30 2002-02-13 10:10:20
        14 초코파이                                20 2002-02-15 10:10:20
        15 포카칩                                 20 2002-02-17 10:10:20
        16 홈런볼                                 10 2002-02-19 10:10:20
        17 홈런볼                                 30 2002-02-20 10:10:20

17개 행이 선택되었습니다. 
*/
-----------------[ 실습 - END ] ------------------------------



--▣  지금까지 주문받은 모든 데이터를 활용하여
---   제품별 총  주문량을 조회하는 쿼리문을 구성한다.
/*
--------------------------------
제품코드    총주문량
--------------------------------
홈런볼         XXX
꼬북칩         XX
--------------------------------
*/

-----------------[ 강사님 풀이 - START ] ------------------------------
SELECT T.JECODE 제품코드
,SUM(T.JUSU) 총주문량
FROM 
(
      SELECT *
      FROM TBL_JUMUN
      UNION ALL
      SELECT *
      FROM TBL_JUMUNBACKUP      
) T
GROUP BY T.JECODE;
/*
제품코드                                 총주문량
------------------------------ ----------
꼬북칩                                 20
썬칩                                   60
초코파이                                50
허니버터                                10
새우깡                                 70
맛동산                                 20
쿠크다스                                20
포카칩                                120
오감자                                 10
눈을감자                                20
쿠쿠다스                                20
홈런볼                                110
빼빼로                                 40
감자깡                                 20
허니버터칩                              10

15개 행이 선택되었습니다. 
*/
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------

SELECT T.JECODE 제품코드
    , SUM(T.JUSU) 총주문량
FROM 
(
      SELECT *
      FROM TBL_JUMUN
      UNION ALL
      SELECT *
      FROM TBL_JUMUNBACKUP
) T
GROUP BY T.JECODE
ORDER BY SUM(T.JUSU) DESC;
/*

제품코드                                 총주문량
------------------------------ ----------
포카칩                                120
홈런볼                                110
새우깡                                 70
썬칩                                   60
초코파이                                50
빼빼로                                 40
쿠크다스                                20
맛동산                                 20
눈을감자                                20
감자깡                                 20
꼬북칩                                 20
쿠쿠다스                                20
허니버터칩                              10
허니버터                                10
오감자                                 10

15개 행이 선택되었습니다. 
*/


SELECT T.JECODE 제품코드
    , SUM(T.JUSU) 총주문량
FROM 
(
      SELECT *
      FROM TBL_JUMUN
      UNION ALL
      SELECT *
      FROM TBL_JUMUNBACKUP
) T
GROUP BY T.JECODE
ORDER BY T.JECODE;
/*

제품코드                                 총주문량
------------------------------ ----------
감자깡                                 20
꼬북칩                                 20
눈을감자                                20
맛동산                                 20
빼빼로                                 40
새우깡                                 70
썬칩                                   60
오감자                                 10
초코파이                                50
쿠쿠다스                                20
쿠크다스                                20
포카칩                                120
허니버터                                10
허니버터칩                              10
홈런볼                                110

15개 행이 선택되었습니다. 
*/
-----------------[ 실습 - END ] ------------------------------



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------