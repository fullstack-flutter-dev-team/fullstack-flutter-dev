--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  SCOTT

--▣ 테이블 생성
-- 테이블명 : DEPT
CREATE TABLE DEPT
( DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY
, DNAME VARCHAR2(14)
, LOC VARCHAR2(13) 
) ;
--==>> Table DEPT이(가) 생성되었습니다.


--▣ 테이블 생성
-- 테이블명 : EMP
CREATE TABLE EMP
( EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);
--==>> Table EMP이(가) 생성되었습니다.

--▣ 데이터 입력(DEPT)
INSERT INTO DEPT VALUES    (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES    (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES    (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES    (40,'OPERATIONS','BOSTON');
/*
1 행 이(가) 삽입되었습니다.
1 행 이(가) 삽입되었습니다.
1 행 이(가) 삽입되었습니다.
1 행 이(가) 삽입되었습니다.
*/


--▣ 데이터 입력(EMP)
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-7-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
/*
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
*/

--▣ 테이블 생성
-- 테이블명 : BONUS
DROP TABLE BONUS;
CREATE TABLE BONUS
( ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, SAL NUMBER
, COMM NUMBER
) ;
--==>> Table BONUS이(가) 생성되었습니다.


--▣ 테이블 생성
-- 테이블명 : SALGRADE
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
( GRADE NUMBER
, LOSAL NUMBER
, HISAL NUMBER 
);
--==>> Table SALGRADE이(가) 생성되었습니다.

--▣ 데이터 입력(SALGRADE)
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
/*
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
   1 행 이(가) 삽입되었습니다.
*/

--▣ 커밋
COMMIT;
--==>> 커밋 완료.

--------------------------------------------------------------
-- ▣ 현재 SCOTT 오라클 계정 사용자가 소유하고 있는 테이블 조회
SELECT *
FROM TAB;
/*
BONUS       TABLE    
DEPT        TABLE    
EMP         TABLE    
SALGRADE    TABLE    
*/

-- ▣ 어떤 테이블스페이스에 저장되어 있는지 조회
SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
/*
    DEPT        USERS
    EMP         USERS
    BONUS       USERS
    SALGRADE    USERS
*/

-- ▣ 테이블 생성
-- 테이블명 : TBL_EXAMPLE1
DROP TABLE TBL_EXAMPLE1;
CREATE TABLE TBL_EXAMPLE1
(
  NO       NUMBER
, NAME     VARCHAR2(10)
, ADDR     VARCHAR2(20)
);
--==>> Table TBL_EXAMPLE1이(가) 생성되었습니다.

-- ▣ 테이블 생성
-- 테이블명 : TBL_EXAMPLE2
CREATE TABLE TBL_EXAMPLE2
(
  NO       NUMBER
, NAME     VARCHAR2(10)
, ADDR     VARCHAR2(20)
) TABLESPACE TBS_EDUA;
--==>> Table TBL_EXAMPLE2이(가) 생성되었습니다.


-- ▣ TBL_EXAMPLE1 과 TBL_EXAMPLE2 테이블이 어떤 테이블스페이스에 저장되어 있는지 조회
SELECT *
FROM USER_TABLES;

SELECT TABLE_NAME, TABLESPACE_NAME
FROM USER_TABLES;
/*
    DEPT            USERS
    EMP             USERS
    BONUS           USERS
    SALGRADE        USERS
    TBL_EXAMPLE1    USERS
    TBL_EXAMPLE2    TBS_EDUA
*/

--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--■■■ 관계형 데이터베이스 ■■■
/*
   ▣  데이터를 테이블 형태로 저장시켜 놓은 것.
       그리고 이들 각 테이블들 간의 관계를 설정하는 것.
*/

/*
==================================================================
 ★ SELECT 문의 처리() 순서  ★
 
    SELECT 컬럼명  -- ⑤----------▶ 메모리와 상관없음
    FROM 테이블명  -- ①  --         ↓
    WHERE 조건절   -- ②  --▶ 1차적으로 메모리에 로딩  
    GROUP BY 절    -- ③  -----   그룹화 ↓
    HAVING 절      -- ④  -----▶ 2차적
    ORDER BY 절    -- ⑥  -----------▶ 정렬(오름/내림), ★리소스(메모리) 소모량이 큼
==================================================================
*/



--▣ 현재 접속된 오라클 사용자() 소유의 테이블(), 뷰() 목록을 조회
SELECT *
FROM TAB;
/*
    BIN$tByMv2ClTPetxAjHHhJPLg==$0    TABLE    
    BONUS           TABLE    → 보너스 데이터 테이블
    DEPT            TABLE    → DEPARTMENT(부서) 데이터 테이블
    EMP             TABLE    → EMPLOYEES(사원) 데이터 테이블
    SALGRADE        TABLE    → SAL(급여) GRADE(등급) 데이터 테이블
    TBL_EXAMPLE1    TABLE    →
    TBL_EXAMPLE2    TABLE    →
*/

--▣ 각 테이블의 데이터 조회
SELECT *
FROM BONUS;
--==>> 데이터 존재하지 않음(테이블의 구조만 확인 가능)

SELECT *
FROM DEPT;
/*
DEPTNO      DNAME       LOC
----------------------------
10        ACCOUNTING    NEW YORK
20        RESEARCH      DALLAS
30        SALES          CHICAGO
40        OPERATIONS    BOSTON
*/

SELECT *
FROM EMP;
/*
EMPNO   ENAME      JOB       MGR     HIREDATE    SAL    COMM    DEPTNO
------------------------------------------------------------------------
7369    SMITH     CLERK      7902    80/12/17     800            20
7499    ALLEN     SALESMAN   7698    81/02/20    1600     300    30
7521    WARD      SALESMAN   7698    81/02/22    1250     500    30
7566    JONES     MANAGER    7839    81/04/02    2975            20
7654    MARTIN    SALESMAN   7698    81/09/28    1250    1400    30
7698    BLAKE     MANAGER    7839    81/05/01    2850            30
7782    CLARK     MANAGER    7839    81/06/09    2450            10
7788    SCOTT     ANALYST    7566    87/07/13    3000            20
7839    KING      PRESIDENT          81/11/17    5000            10
7844    TURNER    SALESMAN   7698    81/09/08    1500       0    30
7876    ADAMS     CLERK      7788    87/07/13    1100            20
7900    JAMES     CLERK      7698    81/12/03    950             30
7902    FORD      ANALYST    7566    81/12/03    3000            20
7934    MILLER    CLERK      7782    82/01/23    1300            10
*/



SELECT *
FROM SALGRADE;
/*
GRADE   LOSAL   HISAL
-----------------------
1        700     1200
2        1201    1400
3        1401    2000
4        2001    3000
5        3001    9999
*/

--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ DEPT 테이블에 존재하는 컬럼의 정보(구조) 조회
DESCRIBE DEPT;
DESC DEPT;
/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/
-- 널? : null입력 허용 여부

/*
     DEPTNO     DNAME       LOC
    부서번호      부서명     부서위치 
    NOT NULL    NULL허용    NULL허용
*/


--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ DEPT 테이블에 존재하는 컬럼의 정보(구조) 조회
DESCRIBE EMP;
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

/*
   EMPNO        ENAME      JOB       MGR     HIREDATE    SAL     COMM      DEPTNO
   상원번호      사원명     직종명     관리자     입사일      급여     수당      부서번호
   NOT NULL     NULL허용  NULL허용   NULL허용  NULL허용   NULL허용  NULL허용  NULL허용
*/

/*
    80    인사부            → 데이터 입력 허용
    80           인천       → 데이터 입력 허용
          인사부  인천       → 데이터 입력 불가
*/

--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ 유형  → 입력 가능한 데이터의 범위   → 데이터 타입  → 자료형
/*
1.  숫자형
    NUMBER       → -10^38 - 1 ~ 10^38
    NUMBER(2)    → -99 ~ 99
    NUMBER(3)    → -999 ~ 999
    NUMBER(4)    → -9999 ~ 9999
    NUMBER(4, 1) → -999.9 ~ 999.9
    
    ▶비교) MS-SQL 서버의 정수 표현
        TINYINT     → 0 ~ 255           1BYTE
        SMALLINT    → -32768 ~ 32768    2BYTE
        INT         → -21억 ~ 21억      4BYTE
        BIGING      → -920경 ~ 920경    8BYTE
      
    ▶비교) MS-SQL 서버의 실수 표현
        FLOAT, REAL
    
    ▶비교) MS-SQL 서버의 숫자 표현
        DECIMAL, NUMERIC
        
    ▶비교) MS-SQL 서버의 문자 표현
        CHAR, VARCHAR, NVARCHAR
        
2.  문자형
    CHAR, NCHAR, VARCHAR2 NVARCHAR2
    CHAR        → 고정형 크기
    VARCHAR2    → 가변형 크기
    
   ▶ CHAR        → 고정형 크기
      CHAR(10) ← '포도'          4Byte 이지만 10Byte 소모
      CHAR(10) ← '바나나'        6Byte 이지만 10Byte 소모
      CHAR(10) ← '몽키바나나'    10Byte 소모
      CHAR(10) ← '드래곤후루츠'  10Byte 를 초과하므로 입력 불가★

    
    ▶VARCHAR2    → 가변형 크기
      VARCHAR2(10) ← '포도'         4Byte 소모
      VARCHAR2(10) ← '바나나'       6Byte 소모
      VARCHAR2(10) ← '몽키바나나'   10Byte 소모
      VARCHAR2(10) ← '드래곤후루츠' 10Byte 를 초과하므로 입력 불가★
      
      
    ▶NCHAR          → 유니코드 기반(글자수) 고정형 크기
    ▶NCHAR(10)      → 10 글자
    
    ▶NVARCHAR2      → 유니코드 기반(글자수) 가변형 크기
    ▶NVARCHAR2(10)  → 10 글자
    
2.  날짜형    
    DATE
*/

SELECT SYSDATE
FROM DUAL;
--==>> 25/06/27  → 날짜 타입

SELECT LOCALTIMESTAMP
FROM DUAL;
--==>> 25/06/27 12:18:57.311000000 → 날짜 타입

SELECT HIREDATE
FROM EMP;
/*
80/12/17  → 날짜 타입
81/02/20
81/02/22
81/04/02
81/09/28
81/05/01
81/06/09
87/07/13
81/11/17
81/09/08
87/07/13
81/12/03
81/12/03
82/01/23
*/

SELECT '안녕하세요'
FROM DUAL;
--==>> 안녕하세요 → 문자 타입

SELECT 10 + 20.4
FROM DUAL;
--==>> 30.4 → 숫자 타입

--▣ EMP 테이블에서 사원번호, 사원명, 급여, 커미션 항목만 조회

/*
SELECT *
FROM EMP;
*/

/*
SELECT 사원번호, 사원명, 급여, 커미션
FROM EMP;
*/

SELECT EMPNO, ename,sal,comm
FROM EMP;
DESC EMP;
/*
7369    SMITH     800    
7499    ALLEN    1600    300
7521    WARD     1250    500
7566    JONES    2975    
7654    MARTIN   1250   1400
7698    BLAKE    2850    
7782    CLARK    2450    
7788    SCOTT    3000    
7839    KING     5000    
7844    TURNER   1500      0
7876    ADAMS    1100    
7900    JAMES     950    
7902    FORD     3000    
7934    MILLER   1300    
*/

--▣  EMP 테이블에서 부서번호가 20번인 직원들의 정보 중
--    사원번호, 사원명, 직종명, 급여, 부서번호 조회
/*
SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
FROM EMP
WHERE 부서번호 20;
           ↓
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE 부서번호 20;
           ↓
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO가 20;
           ↓
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO == 20;
/*
ORA-00936: missing expression
00936. 00000 -  "missing expression"
*Cause:    
*Action:
464행, 15열에서 오류 발생
*/

*/
FROM EMP
WHERE DEPTNO == 20;
/*
ORA-00936: missing expression
00936. 00000 -  "missing expression"
*Cause:    
*Action:
464행, 15열에서 오류 발생
*/

SELECT *
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
/*
EMPNO   ENAME    JOB     SAL   EMPNO
-----   -----   -----    ---    ------
7369    SMITH   CLERK     800    20
7566    JONES   MANAGER  2975    20
7788    SCOTT   ANALYST  3000    20
7876    ADAMS   CLERK    1100    20
7902    FORD    ANALYST  3000    20
*/


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
DEPTNO            NUMBER(2)   ◀◀◀ 숫자형
*/

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = '20';  --◀◀ 문자형
--▣ ★오라클의 형변환을 신뢰하지 말아라.★
/*
7369    SMITH   CLERK     800    20
7566    JONES   MANAGER  2975    20
7788    SCOTT   ANALYST  3000    20
7876    ADAMS   CLERK    1100    20
7902    FORD    ANALYST  3000    20
*/
--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ 테이블을 조회하는 과정에서 각 컬럼(항목)에 별칭(ALIAS)을 부여할 수 있다.
SELECT EMPNO AS "사원번호", ENAME "사원명", JOB 직종, SAL 급여, DEPTNO "부서 번호" 
FROM EMP
WHERE DEPTNO = 20;
/*
사원번호 사원명     직종    급여  부서번호
------  ------- ------  ------  ------
7369    SMITH   CLERK     800    20
7566    JONES   MANAGER  2975    20
7788    SCOTT   ANALYST  3000    20
7876    ADAMS   CLERK    1100    20
7902    FORD    ANALYST  3000    20
*/


/*
     ※ 테이블을 조회하는 과정에서 별칭(ALIAS) 의 기본 구문은
        『AS "별칭이름"』의 형태로 작성되며,
        이 때, 『AS』는 생략이 가능하다.
        또한, 『""』도 생략이 가능하다.
        하지만, 『""』를 생략하게 되면 별칭 이름에 공백은 사용할 수 없다.
        공백은 해당 컬럼에 대한 기술의 종결을 의미하므로
        이름 내부에 공백을 사용할 경우 『""』를 사용하여
        별칭을 부여할 수 있도록 처리해야 한다.
*/

--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
/* ***********************************************************
--▣ EMP 테이블에서 부서번호가 20번과 30번 직원들의 데이터를
     사원번호, 사원명, 직종명, 급여, 부서번호 황목으로 조회한다.
     단, 별칭(ALIAS)을 사용한다.
*********************************************************** */
--SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
--FROM EMP
--WHERE 부서번호가 20번과 30번;

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
--FROM EMP
--WHERE DEPTNO가 20번과 30번;

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
--FROM EMP
--WHERE DEPTNO = 20 || DEPTNO = 30;
/*
ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:
563행, 110열에서 오류 발생
*/
--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
SELECT EMPNO "사원번호", ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 20 OR DEPTNO =30; -- ★★ 권장 방식
/*
7369    SMITH    CLERK        800    20
7499    ALLEN    SALESMAN    1600    30
7521    WARD     SALESMAN    1250    30
7566    JONES    MANAGER     2975    20
7654    MARTIN   SALESMAN    1250    30
7698    BLAKE    MANAGER     2850    30
7788    SCOTT    ANALYST     3000    20
7844    TURNER   SALESMAN    1500    30
7876    ADAMS    CLERK       1100    20
7900    JAMES    CLERK        950    30
7902    FORD     ANALYST     3000    20
*/
--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
SELECT EMPNO "사원번호", ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO IN (20, 30);  -- ★ 내부적으로 WHERE DEPTNO = 20 OR DEPTNO =30;★
/*
  ※ IN 연산자를 활용하여 이와 같이 처리할 수 있으며
     앞서 OR로 처리한 구문과 같은 결과를 반환하게 된다.
*/
/*
7369    SMITH   CLERK        800    20
7499    ALLEN   SALESMAN    1600    30
7521    WARD    SALESMAN    1250    30
7566    JONES   MANAGER     2975    20
7654    MARTIN  SALESMAN    1250    30
7698    BLAKE   MANAGER     2850    30
7788    SCOTT   ANALYST     3000    20
7844    TURNER  SALESMAN    1500    30
7876    ADAMS   CLERK       1100    20
7900    JAMES   CLERK        950    30
7902    FORD    ANALYST     3000    20
*/



--▣ EMP 테이블에서 직종이 CLERK 인 사원들의 데이터를 모두 조회한다.
--SELECT *
--FROM EMP
--WHERE JOB이 CLERK;

--SELECT *
--FROM EMP
--WHERE JOB = CLERK;
/*
ORA-00904: "CLERK": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
621행, 13열에서 오류 발생
*/

SELECT *
FROM EMP
WHERE JOB = 'CLERK';
/*
7369    SMITH    CLERK    7902    80/12/17     800     20
7876    ADAMS    CLERK    7788    87/07/13    1100     20
7900    JAMES    CLERK    7698    81/12/03     950     30
7934    MILLER   CLERK    7782    82/01/23    1300     10
*/


SELECT *
FROM EMP
WHERE JOB = 'clerk';
--==>> 검색된 데이터가 없음
-- ※ 오라클은 입력된 데이터(값) 만큼은 반드시 대소문자 구분을 한다.

SELECT *
FROM EMP
WHERE JOB LIKE 'CLERK';
/*
7369    SMITH    CLERK    7902    80/12/17     800        20
7876    ADAMS    CLERK    7788    87/07/13    1100        20
7900    JAMES    CLERK    7698    81/12/03     950        30
7934    MILLER   CLERK    7782    82/01/23    1300        10
*/

DESC EMP;

--▣ EMP 테이블에서 직족이 CLERK 인 사원들 중
--   20번 부서에 근무하는 사원들의 
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.

--SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
--FROM EMP
--WHERE 직종이 CLERK    부서번호가 20

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여", DEPTNO "부서번호"
--FROM EMP
--WHERE JOB = 'CLERK'   DEPTNO = 20;

DESC EMP;
SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE JOB LIKE 'CLERK' AND DEPTNO = 20;
/*

7369    SMITH    CLERK     800    20
7876    ADAMS    CLERK    1100    20
7900    JAMES    CLERK     950    30
7934    MILLER   CLERK    1300    10
         ↓↓↓↓↓↓↓
7369    SMITH    CLERK     800    20
7876    ADAMS    CLERK    1100    20
*/


--▣ EMP 테이블에서 10번 부서에 근무하는 직원들 둥
--   급여가 2500 이상인 사원들의
--   사원번호, 사원명, 직종명, 급여, 부서번호 항목을 조회한다.
DESC EMP;

--SELECT 사원번호, 사원명, 직종명, 급여, 부서번호
--FROM EMP
--WHERE 부서번호가 10  급여가 2500 이상;

--SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
--FROM EMP
--WHERE DEPTNO가 10  SAL가 2500 이상;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO=10 AND SAL>=2500;


SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, DEPTNO 부서번호
FROM EMP
WHERE DEPTNO = 10 AND SAL >= 2500;
/*
사원번호    사원명       직종명    급여      부서번호
-------   -------     -----   ------   -----------
7782        CLARK     MANAGER   2450    10
7839        KING      PRESIDENT 5000    10
7934        MILLER    CLERK     1300    10
       ↓↓↓↓↓↓↓
7839        KING      PRESIDENT 5000    10
*/

-- ※ 테이블 복사
--    내부적으로 대상 테이블 내부에 있는 데이터의 내용만 복사하는 과정이다.
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

CREATE TABLE EMPCOPY
(EMPNO             NUMBER(4)    
,ENAME             VARCHAR2(10) 
,JOB               VARCHAR2(9)  
,MGR               NUMBER(4)    
,HIREDATE          DATE         
,SAL               NUMBER(7,2)  
,COMM              NUMBER(7,2)  
,DEPTNO            NUMBER(2)  
);
--==>> Table EMPCOPY이(가) 생성되었습니다.

SELECT *
FROM EMPCOPY;
--==>> 조회된 데이터 없음.

SELECT *
FROM EMP;
/*
7369    SMITH   CLERK     7902    80/12/17     800            20
7499    ALLEN   SALESMAN  7698    81/02/20    1600     300    30
7521    WARD    SALESMAN  7698    81/02/22    1250     500    30
7566    JONES   MANAGER   7839    81/04/02    2975            20
7654    MARTIN  SALESMAN  7698    81/09/28    1250    1400    30
7698    BLAKE   MANAGER   7839    81/05/01    2850            30
7782    CLARK   MANAGER   7839    81/06/09    2450            10
7788    SCOTT   ANALYST   7566    87/07/13    3000            20
7839    KING    PRESIDENT         81/11/17    5000            10
7844    TURNER  SALESMAN  7698    81/09/08    1500       0    30
7876    ADAMS   CLERK     7788    87/07/13    1100            20
7900    JAMES   CLERK     7698    81/12/03     950            30
7902    FORD    ANALYST   7566    81/12/03    3000            20
7934    MILLER  CLERK     7782    82/01/23    1300            10
*/

-- 데이터 입력
INSERT INTO EMPCOPY VALUES(7369,'SMITH','CLERK',7902,TO_DATE('1980-12-17', 'YYYY-MM-DD'),800, NULL,    20);
--==>> 1 행 이(가) 삽입되었습니다.

CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
---==>> Table EBL_EMP이(가) 생성되었습니다.

SELECT *
FROM EMP;
/*
7369    SMITH    CLERK    7902    80/12/17    800        20
7499    ALLEN    SALESMAN    7698    81/02/20    1600    300    30
7521    WARD    SALESMAN    7698    81/02/22    1250    500    30
7566    JONES    MANAGER    7839    81/04/02    2975        20
7654    MARTIN    SALESMAN    7698    81/09/28    1250    1400    30
7698    BLAKE    MANAGER    7839    81/05/01    2850        30
7782    CLARK    MANAGER    7839    81/06/09    2450        10
7788    SCOTT    ANALYST    7566    87/07/13    3000        20
7839    KING    PRESIDENT        81/11/17    5000        10
7844    TURNER    SALESMAN    7698    81/09/08    1500    0    30
7876    ADAMS    CLERK    7788    87/07/13    1100        20
7900    JAMES    CLERK    7698    81/12/03    950        30
7902    FORD    ANALYST    7566    81/12/03    3000        20
7934    MILLER    CLERK    7782    82/01/23    1300        10
*/


SELECT *
FROM tbl_emp;
/*
7369    SMITH   CLERK      7902    80/12/17     800        20
7499    ALLEN   SALESMAN   7698    81/02/20    1600   300  30
7521    WARD    SALESMAN   7698    81/02/22    1250   500  30
7566    JONES   MANAGER    7839    81/04/02    2975        20
7654    MARTIN  SALESMAN   7698    81/09/28    1250  1400  30
7698    BLAKE   MANAGER    7839    81/05/01    2850        30
7782    CLARK   MANAGER    7839    81/06/09    2450        10
7788    SCOTT   ANALYST    7566    87/07/13    3000        20
7839    KING    PRESIDENT          81/11/17    5000        10
7844    TURNER  SALESMAN   7698    81/09/08    1500    0   30
7876    ADAMS   CLERK      7788    87/07/13    1100        20
7900    JAMES   CLERK      7698    81/12/03     950        30
7902    FORD    ANALYST    7566    81/12/03    3000        20
7934    MILLER  CLERK      7782    82/01/23    1300        10
*/


-- ▣ 현재 SCOTT 오라클 계정 사용자가 소유하고 있는 테이블 조회
SELECT *
FROM TAB;

DROP TABLE TBL_EMP;

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

DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
*/

--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ 테이블 복사(데이터 위주)
--   DEPT → TBL_DEPT


CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT이(가) 생성되었습니다.

--▣  복사한 테이블 확인
SELECT *
FROM TBL_DEPT;
SELECT *
FROM TBL_EMP;

DESC DEPT;
/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER(2)    
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 
*/

DESC TBL_DEPT;
/*
이름     널? 유형           
------ -- ------------ 
DEPTNO    NUMBER(2)    
DNAME     VARCHAR2(14) 
LOC       VARCHAR2(13) 
*/


--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
--▣ 커멘트(COMMENT) - 주석
-- 기획 : 테이블 명세서 작성...
SELECT *
FROM USER_TAB_COMMENTS;  -- USER_~~ 테이블 딕셔너리 
/*
DEPT            TABLE    
EMP             TABLE    
BONUS           TABLE    
SALGRADE        TABLE    
TBL_EXAMPLE2    TABLE    
TBL_EXAMPLE1    TABLE    
EMPCOPY         TABLE    
TBL_EMP         TABLE    
TBL_DEPT        TABLE    
*/

--▣ 테이블의 커멘트 데이터 입력
COMMENT ON TABLE TBL_EMP IS '사원데이터';
--==>> Comment이(가) 생성되었습니다.


--▣ 커멘트 데이터 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;  -- USER_~~ 테이블 딕셔너리 
/*
TBL_DEPT        TABLE    
TBL_EMP         TABLE    사원데이터
EMPCOPY         TABLE    
TBL_EXAMPLE1    TABLE    
TBL_EXAMPLE2    TABLE    
SALGRADE        TABLE    
BONUS           TABLE    
EMP             TABLE    
DEPT            TABLE    
*/


SELECT *
FROM TAB;

--▣ 테이블 레벨의 커멘트 데이터 입력(TBL_DEPT → 부서데이터)
COMMENT ON TABLE TBL_DEPT IS '부서데이터';
--==>> Comment이(가) 생성되었습니다.

--▣ 커멘트 데이터 입력 이후 다시 확인
SELECT *
FROM USER_TAB_COMMENTS;  -- USER_~~ 테이블 딕셔너리
/*
TBL_DEPT        TABLE    부서데이터
TBL_EMP         TABLE    사원데이터
EMPCOPY         TABLE    
TBL_EXAMPLE1    TABLE    
TBL_EXAMPLE2    TABLE    
SALGRADE        TABLE    
BONUS           TABLE    
EMP             TABLE    
DEPT            TABLE    
*/


--▣ 컬럼레벨 커멘트 입력
SELECT *
FROM USER_COL_COMMENTS;


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT    DEPTNO    부서번호
TBL_DEPT    DNAME    
TBL_DEPT    LOC    
*/


--▣ 테이블에 소속된(포함된) 컬럼 레벨의 커멘트 데이터 입력(설정)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '부서번호';
--==>> Comment이(가) 생성되었습니다.


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT    DEPTNO    부서번호
TBL_DEPT    DNAME    
TBL_DEPT    LOC    
*/


COMMENT ON COLUMN TBL_DEPT.DNAME IS '부서명';
--==>> Comment이(가) 생성되었습니다.


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT    DEPTNO   부서번호
TBL_DEPT    DNAME    부서명
TBL_DEPT    LOC    
*/


COMMENT ON COLUMN TBL_DEPT.LOC IS '부서위치';
--==>> Comment이(가) 생성되었습니다.


SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
/*
TBL_DEPT    DEPTNO    부서번호
TBL_DEPT    DNAME     부서명
TBL_DEPT    LOC       부서위치
*/


DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    -- 사원번호
ENAME       VARCHAR2(10) -- 사원명
JOB         VARCHAR2(9)  -- 직종명
MGR         NUMBER(4)    -- 관리자사원번호
HIREDATE    DATE         -- 입사일
SAL         NUMBER(7,2)  -- 급여
COMM        NUMBER(7,2)  -- 수당
DEPTNO      NUMBER(2)    -- 부서번호
*/

--▣ TBL_EMP 테이블에 소속된(포함된)
--   컬럼에 대한 커멘트 데이터 입력(설정)
COMMENT ON COLUMN TBL_EMP.EMPNO IS '사원번호';
COMMENT ON COLUMN TBL_EMP.ENAME IS '사원명';
COMMENT ON COLUMN TBL_EMP.JOB IS '직종명';
COMMENT ON COLUMN TBL_EMP.MGR IS '관리자사원번호';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '입사일';
COMMENT ON COLUMN TBL_EMP.SAL IS '급여';
COMMENT ON COLUMN TBL_EMP.COMM IS '수당';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '부서번호';
/*
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
Comment이(가) 생성되었습니다.
*/

--▣ 커멘트 데이터가 입력된 테이블의 컬럼 레벨의 정보 확인
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
/*
TABLE_NAME  COLUMN_NAME COMMENTS
--------    ----------- --------
TBL_EMP        EMPNO       사원번호
TBL_EMP        ENAME       사원명
TBL_EMP        JOB         직종명
TBL_EMP        MGR         관리자사원번호
TBL_EMP        HIREDATE    입사일
TBL_EMP        SAL         급여
TBL_EMP        COMM        수당
TBL_EMP        DEPTNO      부서번호
*/


-- ▣▣▣  기존 테이블에 컬럼 구조 추가 및 제거 ▣▣▣

SELECT *
FROM TBL_EMP;

--▣ TBL_EMP 테이블에 주민등록번호 데이터를 담을  수 있는 컬럼 추가
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP이(가) 변경되었습니다.

-- ※. 맨 앞에 0이 들어올 가능성이 있는 숫자가 조홥된 데이터일 경우
--     숫자로만 구성된 데이터라 할지라도 숫자형이 아닌 문자형으로
--     데이터 타입을 처리해야 한다.~!!!

SELECT 00012345
FROM DUAL;
--==>> 12345

SELECT '00012345'
FROM DUAL;
--===>> 00012345


DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
SSN         CHAR(13)    ◀◀◀◀◀
*/


SELECT *
FROM TBL_EMP;
--==>> SSN 컬럼이 정상적으로 추가된 상황임을 확인


SELECT EMPNO, ENAME SSN, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM TBL_EMP;
 -- ※테이블 내에서 컬럼의 순서는 구조적으로 의미 없음~!!



--▣ TBL_EMP 테이블에서 추가한 SSN(주민등록번호) 컬럼 제거
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP이(가) 변경되었습니다.

--▣  확인
DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
*/


SELECT *
FROM TBL_EMP;
/*
7369    SMITH   CLERK      7902    80/12/17     800           20
7499    ALLEN   SALESMAN   7698    81/02/20    1600    300    30
7521    WARD    SALESMAN   7698    81/02/22    1250    500    30
7566    JONES   MANAGER    7839    81/04/02    2975           20
7654    MARTIN  SALESMAN   7698    81/09/28    1250   1400    30
7698    BLAKE   MANAGER    7839    81/05/01    2850           30
7782    CLARK   MANAGER    7839    81/06/09    2450           10
7788    SCOTT   ANALYST    7566    87/07/13    3000           20
7839    KING    PRESIDENT          81/11/17    5000           10
7844    TURNER  SALESMAN   7698    81/09/08    1500      0    30
7876    ADAMS   CLERK      7788    87/07/13    1100           20
7900    JAMES   CLERK      7698    81/12/03     950           30
7902    FORD    ANALYST    7566    81/12/03    3000           20
7934    MILLER  CLERK      7782    82/01/23    1300           10
*/

--▶ SSN(주민등록번호) 컬럼이 정상적으로 제거되었음을 확인~!!!!
--DROP    - 구조적 제거
--DELETE  - 데이터 제거
---- 



SELECT *
FROM TBL_EMP
WHERE EMPNO=7369;

--▣ 데이터 삭제(권장 방식)
DELETE
FROM TBL_EMP
WHERE EMPNO=7369;
--==>> 1 행 이(가) 삭제되었습니다.


--▣ 데이터 삭제 정식 문법
DELETE TBL_EMP    -- 당분간 권장하지 않음
WHRERE EMPNO=7369;


--▣ 테이블의 모든 데이터 삭제(권장 방식)
SELECT *
FROM TBL_EMP;

DELETE
FROM TBL_EMP;
--==>> 13개 행 이(가) 삭제되었습니다.

--▣ 확인 
SELECT *
FROM TBL_EMP;
--==>> 조회 결과 없음
-- 테이블 구조는 그대로 남아있는 상태에서
-- 데이터 모두 소실(삭제)된 상황임을 확인


--▣ 테이블을 구조적으로 제거
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP;
/*
    ORA-00942: table or view does not exist
    00942. 00000 -  "table or view does not exist"
    *Cause:    
    *Action:
    1,195행, 6열에서 오류 발생
*/

--▣ 테이블 다시 생성(EMP 테이블 복사)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP이(가) 생성되었습니다.

-- ▣▣▣  NULL 의 처리 ▣▣▣
SELECT 5, 10+5, 10*5, 10/5
FROM DUAL;
--==>> 5    15    50    2


SELECT 5 RESULT1, 10+5 "RESULT2", 10*5 RESULT3, 10/5 RESULT5
FROM DUAL;
--==>> 5    15    50    2

SELECT NULL, NULL+5, NULL-5, NULL*5, NULL/5, 10+NULL, 10-NULL, 10*NULL, 10/NULL
FROM DUAL;
--==>> (null)  (null)  (null) (null) (null) (null) (null) (null) (null)

-- ※ 관찰 결과
--    NULL 은 상태의 값을 의미하며, 실제 존재하지 않는 값이기 때문에
--    이러한 NULL이 연산에 포함될 경우 그 결과는 무조건 NULL이다.


--▣ TBL_EMP 테이블에서 커미션(COMM, 수당)이 NULL 인 직원의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션
FROM TBL_EMP
WHERE COMM IS NULL;

/*
★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
- ※ NULL은 실제 존재하지 않는 값이기 때문에 일반적인 연산자를 활용하여 비교할 수 없다.
         즉, 산술적인 비교 연산을 수행할 수 없다는 의미이다.
         NULL 을 대상으로 사용할 수 없는 연산자들.....
         =, >=, <=, >, <, != , ^=, <>
*/

--▣ TBL_EMP 테이블에서 20번 부서에 근무하지 않는 직원들의
--   사원번호, 사원명, 직종명, 급여, 커미션 항목을 조회한다.
SELECT *
FROM TBL_EMP;

--SELECT 사원번호, 사원명, 직종명, 급여, 커미션
--FORM TBL_EMP
--WHERE 부서번호가 20이아니다.

--SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션
--FORM TBL_EMP
--WHERE 부서번호가 20이아니다.


SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션, DEPTNO
FROM TBL_EMP
WHERE DEPTNO NOT IN 20;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션, DEPTNO
FROM TBL_EMP
WHERE DEPTNO != 20;


SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션, DEPTNO
FROM TBL_EMP
WHERE DEPTNO <> 20;
/*
7499    ALLEN   SALESMAN    1600     300    30
7521    WARD    SALESMAN    1250     500    30
7654    MARTIN  SALESMAN    1250    1400    30
7698    BLAKE   MANAGER     2850            30
7782    CLARK   MANAGER     2450            10
7839    KING    PRESIDENT   5000            10
7844    TURNER  SALESMAN    1500       0    30
7900    JAMES   CLERK        950            30
7934    MILLER  CLERK       1300            10
*/

--▣ TBL_EMP 테이블에서 커미션(COMM, 수당) 이 NULL이 아닌 직원들의
--   사원명, 직종명, 급여, 커미션 항목을 조회한다.

SELECT *
FROM TBL_EMP;

--SELECT 사원명, 직종명, 급여, 커미션 
--FROM TBL_EMP
--WHERE 커미션이 NULL 이 아니다.


--SELECT 사원명, 직종명, 급여, 커미션 
--FROM TBL_EMP
--WHERE 커미션이 NULL 이 아니다.

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션" 
FROM TBL_EMP
WHERE COMM IS NOT NULL;
/*
사원명    직종명      급여     커미션
------  --------    ----    ------
ALLEN   SALESMAN    1600     300
WARD    SALESMAN    1250     500
MARTIN  SALESMAN    1250    1400
TURNER  SALESMAN    1500       0
*/


SELECT ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션
FROM TBL_EMP
WHERE NOT COMM IS NULL;
/*
사원명     직종명     급여     커미션
------  --------    ----    ------
ALLEN   SALESMAN    1600     300
WARD    SALESMAN    1250     500
MARTIN  SALESMAN    1250    1400
TURNER  SALESMAN    1500       0
*/

--▣ TBL_EMP 테이블에서 모든 사원들의
--   사원명, 직종명, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 매년 지급한다.

--SELECT 사원명, 직종명, 급여, 커미션, 연봉
--FROM TBL_EMP;


SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션"--, (SAL*12 ) 연봉
FROM TBL_EMP;

SELECT ENAME "사원명", JOB "직종명", SAL "급여", COMM "커미션", (SAL*12 ) 연봉
FROM TBL_EMP;

SELECT ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션, (SAL*12 + NVL(COMM, 0)) 연봉
FROM TBL_EMP;

--▣ NVL() 함수
SELECT NULL "COL1", NVL(NULL, 0) "COL2", NVL(5, 10) "COL3"
FROM DUAL;
--==>> (null)     0    5
--▶ 첫 번째 파라미터 값이 NULL 이면, 두 번째 파라미터 값을 반환한다.
--▶  첫 번째 파라미터 값이 NULL 이 아니면, 그 값(첫 번째 파라미터)을 그대로 반환한다.

SELECT COMM "COL1", NVL(COMM, 0) "COL2"
FROM TBL_EMP
WHERE EMPNO = 7566;
--==>> (null)  0

SELECT COMM "COL1", NVL(COMM, 0) "COL2"
FROM TBL_EMP
WHERE EMPNO = 7499;
==>> 300    300


SELECT ENAME 사원명, JOB 직종명, SAL 급여, COMM 커미션, (SAL*12 + NVL(COMM, 0)) 연봉
FROM TBL_EMP;
/*
사원명   직종명        급여    커미션   연봉
-----  -------     ------   ------ ------
SMITH   CLERK        800            9600
ALLEN   SALESMAN    1600     300   19500
WARD    SALESMAN    1250     500   15500
JONES   MANAGER     2975           35700
MARTIN  SALESMAN    1250    1400   16400
BLAKE   MANAGER     2850           34200
CLARK   MANAGER     2450           29400
SCOTT   ANALYST     3000           36000
KING    PRESIDENT   5000           60000
TURNER  SALESMAN    1500       0   18000
ADAMS   CLERK       1100           13200
JAMES   CLERK        950           11400
FORD    ANALYST     3000           36000
MILLER  CLERK       1300           15600
*/

--### --▣ ※ ○ ★ 『』 ? ▣ ◀▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
/*================[ 6월 XX일(금) ]========================*/
/*

*/






