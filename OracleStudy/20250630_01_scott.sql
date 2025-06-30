/*================[ 6월 30일(월) ]========================*/
SELECT USER
FROM DUAL;
--==>> SCOTT

--▣ NVL2()
--첫 번째 파라미터 값이 NULL 이 아닌 경우, 두 번째 파라미터 값을 반환하고,
--첫 번째 파라미터 값이 NULL 인 경우, 세 번째 파라미터 값을 반환한다.
SELECT NVL2(NULL, '청기올려', '백기올려') "결과확인"
FROM DUAL;
--==>> 백기올려

SELECT NVL2(20, '청기올려', '백기올려') "결과확인"
FROM DUAL;
--==>> 청기올려

SELECT ENAME, COMM, NVL2(COMM, '청기올려', '백기올려') "결과확인"
FROM TBL_EMP;
/*
SMITH		    백기올려
ALLEN	300	    청기올려
WARD	500	    청기올려
JONES		    백기올려
MARTIN	1400	청기올려
BLAKE		    백기올려
CLARK			백기올려
SCOTT			백기올려
KING			백기올려
TURNER	0		청기올려
ADAMS			백기올려
JAMES			백기올려
FORD			백기올려
MILLER			백기올려
김한국1			백기올려
김한국2			백기올려
*/

--▣ TBL_EMP 테이블에서 모든 사원들의
--   사원명, 사원번호, 급여, 커미션, 연봉 항목을 조회한다.
--   단, 급여(SAL)는 매월 지급한다.
--   또한, 수당(COMM)은 매년 지급한다.

--SELECT 사원명, 사원번호, 급여, 커미션, 연봉
--FROM TBL_EMP;

SELECT ENAME "사원명", EMPNO "사원번호", SAL "급여", COMM "커미션", NVL2(COMM, SAL * 12 + COMM, SAL*12) "연봉"
FROM TBL_EMP;

SELECT ENAME 사원명, empno 사원번호, SAL 급여, COMM 커미션 , NVL2(COMM, SAL*12+COMM, SAL*12) 연봉 
FROM TBL_EMP;
/*
사원명 사원번호 급여   커미션    연봉
------ ------ ------  ------- -------
SMITH	7369	800		         9600
ALLEN	7499	1600	300	    19500
WARD	7521	1250	500	    15500
JONES	7566	2975		    35700
MARTIN	7654	1250	1400	16400
BLAKE	7698	2850		    34200
CLARK	7782	2450		    29400
SCOTT	7788	3000		    36000
KING	7839	5000		    60000
TURNER	7844	1500	0	    18000
ADAMS	7876	1100		    13200
JAMES	7900	950		        11400
FORD	7902	3000		    36000
MILLER	7934	1300		    15600
*/


--▣ COALESCE()
--     맨 앞에 있는 매개변수부터 차례로 NULL 인지 아닌지 확인하여
--     NULL 이 아닐 경우 적용(반환, 처리)하고,
--     NULL 인 경우에는 그 다음 매개변수 값으로 적용(반환, 처리)한다.
--     NVL() 이나 NVL2() 와 비교하여...
--     모~~든 경우의 수를 고려할 수 있는 특징을 갖고 있다.
     
SELECT NULL "기본확인"
       , COALESCE(NULL, NULL, NULL, 10) "결과확인-1"
       , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150) "결과확인-2"
       , COALESCE(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 150) "결과확인-2"
FROM DUAL;
--==>> 	10	150	150


--▣  실습 환경 조성을 위한 데이터 추가 입력 
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '김한국1', 'SALESMAN', 7839, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8001, '김한국2', 'SALESMAN', 7839, SYSDATE, 10);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_EMP;

--▣ 커밋
COMMIT;
--==>> 커밋 완료.


--▣
SELECT ENAME "사원명", EMPNO "사원번호", SAL "급여", COMM "커미션"
       , NVL2(COMM, SAL * 12 + COMM, SAL*12) "연봉"
FROM TBL_EMP;


SELECT ENAME "사원명", EMPNO "사원번호", COALESCE(SAL, 0) "급여", 
       COMM "커미션" , COALESCE((SAL * 12 + COMM), (SAL * 12), COMM, 0) "연봉"
FROM TBL_EMP;


 --▣ 날짜와 시간에 대한 세션 설정 변경
 ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- ==>>Session이(가) 변경되었습니다.

 SELECT *
 FROM TBL_EMP;
 
 DESC TBL_EMP;
 
 SELECT SYSDATE
 FROM DUAL;
-- ==>> 25/06/30
--==>> 2025-06-30 09:50:06



--▣ 현재 날짜 및 시간을 반환하는 함수
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 2025-06-30 10:03:39	2025-06-30 10:03:39	25/06/30 10:03:39.000000000

--▣ 날짜와 시간에 대한 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--▣ 변경 이후 다시 조회
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>> 2025-06-30	2025-06-30	25/06/30 10:05:31.000000000


--▣  컬럼과 컬럼의 연결(결합)
--    문자 타입과 문자 타입의 연결
--    『+』 연산자를 통한 결합 수행은 불가능~!!!! →  『||』 파이프 (PIPE)
SELECT 1 + 1
FROM DUAL;
--==>> 2

SELECT '김한국-1', '김한국-2'
FROM DUAL;

SELECT '김한국-1' + '김한국-2'
FROM DUAL;
--==>> 에러 발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/


SELECT '김한국-1' || '김한국-2'
FROM DUAL;
--==>>  김한국-1김한국-2

SELECT ENAME, JOB
FROM TBL_EMP;
/*
SMITH	CLERK
ALLEN	SALESMAN
WARD	SALESMAN
JONES	MANAGER
MARTIN	SALESMAN
BLAKE	MANAGER
CLARK	MANAGER
SCOTT	ANALYST
KING	PRESIDENT
TURNER	SALESMAN
ADAMS	CLERK
JAMES	CLERK
FORD	ANALYST
MILLER	CLERK
김한국1	SALESMAN
김한국2	SALESMAN
*/

SELECT ENAME || JOB "결과 확인"
FROM TBL_EMP;
/*
SMITHCLERK
ALLENSALESMAN
WARDSALESMAN
JONESMANAGER
MARTINSALESMAN
BLAKEMANAGER
CLARKMANAGER
SCOTTANALYST
KINGPRESIDENT
TURNERSALESMAN
ADAMSCLERK
JAMESCLERK
FORDANALYST
MILLERCLERK
김한국1SALESMAN
김한국2SALESMAN
*/

DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)       ---- 숫자 타입
ENAME       VARCHAR2(10)    ---- 문자 타입
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2)    
*/


SELECT EMPNO || ENAME "결과 확인"
FROM TBL_EMP;
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000김한국1
8001김한국2
*/

--     문자타입     날짜    문자       숫자    문자타입
--     ---------   ------- ----------  ----  ------------
SELECT '김한국은', SYSDATE, '에 연봉', 500, '억을 원한다.'
FROM DUAL;

--     문자타입     날짜    문자       숫자    문자타입
--     ---------   ------- ----------  ----  ------------
SELECT '김한국은' || SYSDATE || '에 연봉' || 500 || '억을 원한다.' "결과_확인"
FROM DUAL;
/*
결과_확인
--------------------------------------
김한국은2025-06-30에 연봉500억을 원한다.
*/

--▣ 오라클에서는 문자 타입의 형태로 타입을 변환하는 별도의 과정 없이
--   위에서 처리한 내용처럼 『||』만 삽입해주면 간단히 컬럼과 컬럼을
--   (서로 다른 종류의 데이터) 결합하는 것이 가능하다.
--   이와 비교하여 MS-SQL에서는 모든 데이터를 문자 타입으로 CONVERT해야 한다.


SELECT *
FROM TBL_EMP;

--▣ 실습 진행 전에 김한국1 사원과 김한국2 사원 제거

SELECT *
FROM TBL_EMP
WHERE EMPNO = 8000 OR EMPNO = 8001;

DELETE
FROM TBL_EMP
WHERE EMPNO = 8000 OR EMPNO = 8001;
--==>> 2개 행 이(가) 삭제되었습니다.

SELECT *
FROM TBL_EMP
WHERE EMPNO = 8000 OR EMPNO = 8001;

--▣ 커밋
COMMIT;
--==>> 커밋 완료.

--▣ TBL_EMP 테이블의 데이터를 활용하여
--     모든 직원들의 데이터에 대해
--     다음과 같은 결과를 얻을 수 있도록 커리문을 구성한다.
--     
--     SMITH 의 현재 연봉은 9600인데, 희망 연봉은 19200이다.
--     ALLEN 의 현재 연봉은 19500인데, 희망 연봉은 39000이다.
SELECT *
FROM TBL_EMP;

SELECT ENAME || ' 의 현재 연봉은 ' || COALESCE((SAL*12+COMM), (SAL*12), COMM, 0) || 
       '인데, 희망 연봉은 ' ||  COALESCE((SAL*12+COMM)*2, (SAL*12)*2, COMM*2, 0) ||' 이다.'
FROM TBL_EMP;
/*
SMITH 의 현재 연봉은 9600인데, 희망 연봉은 19200 이다.
ALLEN 의 현재 연봉은 19500인데, 희망 연봉은 39000 이다.
WARD 의 현재 연봉은 15500인데, 희망 연봉은 31000 이다.
JONES 의 현재 연봉은 35700인데, 희망 연봉은 71400 이다.
MARTIN 의 현재 연봉은 16400인데, 희망 연봉은 32800 이다.
BLAKE 의 현재 연봉은 34200인데, 희망 연봉은 68400 이다.
CLARK 의 현재 연봉은 29400인데, 희망 연봉은 58800 이다.
SCOTT 의 현재 연봉은 36000인데, 희망 연봉은 72000 이다.
KING 의 현재 연봉은 60000인데, 희망 연봉은 120000 이다.
TURNER 의 현재 연봉은 18000인데, 희망 연봉은 36000 이다.
ADAMS 의 현재 연봉은 13200인데, 희망 연봉은 26400 이다.
JAMES 의 현재 연봉은 11400인데, 희망 연봉은 22800 이다.
FORD 의 현재 연봉은 36000인데, 희망 연봉은 72000 이다.
MILLER 의 현재 연봉은 15600인데, 희망 연봉은 31200 이다.
*/


-- 방식-1
SELECT ENAME || ' 의 현재 연봉은 ' || NVL(SAL*12+COMM, SAL*12)
        || '인데, 희망 연봉은 ' || NVL(SAL*12+COMM, SAL*12)*2 || '이다.'
FROM TBL_EMP;


-- 방식-2
SELECT ENAME || ' 의 현재 연봉은 ' || NVL2(COMM, SAL*12+COMM, SAL*12)
       || '인데, 희망 연봉은 ' || NVL2(COMM, SAL*12+COMM, SAL*12)*2 || '이다.'
FROM TBL_EMP;

-- 방식-3
SELECT ENAME || ' 의 현재 연봉은 ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)
    || '인데, 희망 연봉은 ' || COALESCE(SAL*12+COMM, SAL*12, COMM, 0)*2 || '이다.'
FROM TBL_EMP;


SELECT *
FROM TBL_EMP;



-- SMITH's 입사일은 1980-12-17 이다. 그리고 급여는 800 이다.
-- ALLEN's 입사일은 1981-02-20 이다. 그리고 급여는 1600 이다.
--                          ：
SELECT ENAME || '''s 입사일은 ' || HIREDATE || ' 이다. 그리고 급여는 ' || SAL || ' 이다.'
FROM TBL_EMP;
/*
SMITH's 입사일은 1980-12-17 이다. 그리고 급여는 800 이다.
ALLEN's 입사일은 1981-02-20 이다. 그리고 급여는 1600 이다.
WARD's 입사일은 1981-02-22 이다. 그리고 급여는 1250 이다.
JONES's 입사일은 1981-04-02 이다. 그리고 급여는 2975 이다.
MARTIN's 입사일은 1981-09-28 이다. 그리고 급여는 1250 이다.
BLAKE's 입사일은 1981-05-01 이다. 그리고 급여는 2850 이다.
CLARK's 입사일은 1981-06-09 이다. 그리고 급여는 2450 이다.
SCOTT's 입사일은 1987-07-13 이다. 그리고 급여는 3000 이다.
KING's 입사일은 1981-11-17 이다. 그리고 급여는 5000 이다.
TURNER's 입사일은 1981-09-08 이다. 그리고 급여는 1500 이다.
ADAMS's 입사일은 1987-07-13 이다. 그리고 급여는 1100 이다.
JAMES's 입사일은 1981-12-03 이다. 그리고 급여는 950 이다.
FORD's 입사일은 1981-12-03 이다. 그리고 급여는 3000 이다.
MILLER's 입사일은 1982-01-23 이다. 그리고 급여는 1300 이다.
*/

-- ※ 문자열을 나타내는 홑따옴표 사이에서(시작과 끝)
--    홑따옴표 두 개가 홑따옴표 하나(어퍼스트로피)를 의미한다.
--    홑따옴표 『'』  하나는 문자열의 시작을 내타내고
--    홑따옴표 『''』  두개는 문자열 영역 안에서 어퍼스트로피를 나타내며
--    다시 등장하는 홑따옴표『'』 하나가 문자열 영역의 종료를 의미하게 되는 것이다.

SELECT ENAME || '의 입사일은 ' || HIREDATE || ' 이다. 그리고 급여는 ' || SAL || ' 이다.'
FROM TBL_EMP;

SELECT ENAME || '''s 입사일은 ' || HIREDATE || ' 이다. 그리고 급여는 ' || SAL || ' 이다.'
FROM TBL_EMP;
/*
SMITH's 입사일은 1980-12-17 이다. 그리고 급여는 800 이다.
ALLEN's 입사일은 1981-02-20 이다. 그리고 급여는 1600 이다.
WARD's 입사일은 1981-02-22 이다. 그리고 급여는 1250 이다.
JONES's 입사일은 1981-04-02 이다. 그리고 급여는 2975 이다.
MARTIN's 입사일은 1981-09-28 이다. 그리고 급여는 1250 이다.
BLAKE's 입사일은 1981-05-01 이다. 그리고 급여는 2850 이다.
CLARK's 입사일은 1981-06-09 이다. 그리고 급여는 2450 이다.
SCOTT's 입사일은 1987-07-13 이다. 그리고 급여는 3000 이다.
KING's 입사일은 1981-11-17 이다. 그리고 급여는 5000 이다.
TURNER's 입사일은 1981-09-08 이다. 그리고 급여는 1500 이다.
ADAMS's 입사일은 1987-07-13 이다. 그리고 급여는 1100 이다.
JAMES's 입사일은 1981-12-03 이다. 그리고 급여는 950 이다.
FORD's 입사일은 1981-12-03 이다. 그리고 급여는 3000 이다.
MILLER's 입사일은 1982-01-23 이다. 그리고 급여는 1300 이다.
*/

--▣ UPPER(), LOWER(), INITCAP()
SELECT 'oRaCLe' "1"
        , UPPER('oRaCLe') "2"
        , LOWER('oRaCLe') "3"
        , INITCAP('oRaCLe') "4"
FROM DUAL;
--==>> oRaCLe	ORACLE	oracle	Oracle

--▣ 
--UPPER() 는 모두 대문자로 변환하여 반환
--LOWER() 는 모두 소문자로 변환하여 반환
--INITCAP() 은 첫 글자만 대문자로 하고 나머지는 모두 소문자로 변환하여 반환


SELECT *
FROM TBL_EMP
WHERE JOB ='salesman';
--==>> 조회 결과 없음


--▣ 실습 환경 구성을 위한 추가 데이터 입력
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8000, '김한국1', 'saLesMAN', 7698, SYSDATE, 2000, 200, 30);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8001, '김한국2', 'SaLesMan', 7698, SYSDATE, 2000, 200, 30);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8002, '김한국3', 'salesman', 7698, SYSDATE, 2000, 200, 30);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(8003, '김한국4', 'SALESMan', 7698, SYSDATE, 2000, 200, 30);
--==>> 1 행 이(가) 삽입되었습니다.

--▣ 커밋 
COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_EMP
WHERE JOB ='salesman';


--▣ TBL_EMP 테이블에서 대소문자 구분없이 세일즈맨 직종인 사원의
--   사원번호, 사원명, 직종, 입사일, 부서번호 항목을 조회한다.
--   (※ 세일즈맨: SALESMAN, saLesMAN, SaLesMan, salesman, SALESMan)
SELECT *
FROM TBL_EMP
WHERE LOWER(JOB) ='salesman';

SELECT EMPNO 사원번호, ENAME 사원명, JOB 직종, HIREDATE 입사일, DEPTNO 부서번호
FROM TBL_EMP
WHERE LOWER(JOB) ='salesman';
/*
사원번호 사원명  직종        입사일    부서번호
------- ------ ---------   ----------- ---------
7499	ALLEN	SALESMAN	1981-02-20	30
7521	WARD	SALESMAN	1981-02-22	30
7654	MARTIN	SALESMAN	1981-09-28	30
7844	TURNER	SALESMAN	1981-09-08	30
8000	김한국1	saLesMAN  	2025-06-30	30
8001	김한국2	SaLesMan	    2025-06-30	30
8002	김한국3	salesman	    2025-06-30	30
8003	김한국4	SALESMan	2025-06-30	30
*/


--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
--FROM TBL_EMP
--WHERE JOB = 세일즈맨;
-- SALESMAN, saLesMAN, SaLesMan, salesman, SALESMan


SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
FROM TBL_EMP
WHERE 
      JOB = 'SALESMAN' OR 
      JOB = 'saLesMAN' OR 
      JOB = 'SaLesMan' OR 
      JOB = 'salesman' OR 
      JOB = 'SALESMan';
      
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
FROM TBL_EMP
WHERE JOB IN( 'SALESMAN' ,'saLesMAN','SaLesMan','salesman','SALESMan');
      
-- 관찰
SELECT JOB "직종", UPPER(JOB) "직종확인-1", LOWER(JOB) "직종확인-2", INITCAP(JOB) "직종확인-3"
FROM TBL_EMP;

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
FROM TBL_EMP
WHERE UPPER(JOB) = 'SALESMAN';
/*
7499	ALLEN	SALESMAN	1981-02-20	30
7521	WARD	SALESMAN	1981-02-22	30
7654	MARTIN	SALESMAN	1981-09-28	30
7844	TURNER	SALESMAN	1981-09-08	30
8000	김한국1	saLesMAN	    2025-06-30	30
8001	김한국2	SaLesMan   	2025-06-30	30
8002	김한국3	salesman  	2025-06-30	30
8003	김한국4	SALESMan	2025-06-30	30
*/

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
FROM TBL_EMP
WHERE LOWER(JOB) = 'salesman';
/*
7499	ALLEN	SALESMAN	1981-02-20	30
7521	WARD	SALESMAN	1981-02-22	30
7654	MARTIN	SALESMAN	1981-09-28	30
7844	TURNER	SALESMAN	1981-09-08	30
8000	김한국1	saLesMAN	    2025-06-30	30
8001	김한국2	SaLesMan   	2025-06-30	30
8002	김한국3	salesman  	2025-06-30	30
8003	김한국4	SALESMan	2025-06-30	30
*/

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종", HIREDATE "입사일", DEPTNO "부서번호"
FROM TBL_EMP
WHERE INITCAP(JOB) = 'Salesman';
/*
7499	ALLEN	SALESMAN	1981-02-20	30
7521	WARD	SALESMAN	1981-02-22	30
7654	MARTIN	SALESMAN	1981-09-28	30
7844	TURNER	SALESMAN	1981-09-08	30
8000	김한국1	saLesMAN	    2025-06-30	30
8001	김한국2	SaLesMan   	2025-06-30	30
8002	김한국3	salesman  	2025-06-30	30
8003	김한국4	SALESMan	2025-06-30	30
*/

--▣ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 입사한 직원의
--   사원명, 직종명, 입사일 항목을 조회한다.
--SELECT 사원명, 직종명, 입사일
--FROM TBL_EMP
--WHERE 입사일이 1981년 9월 28일;


--SELECT ENAME 사원명, JOB 직종명, HIREDATE 입사일
--FROM TBL_EMP
--WHERE 입사일이 1981년 9월 28일;


SELECT ENAME 사원명, JOB 직종명, HIREDATE 입사일
FROM TBL_EMP
WHERE HIREDATE ='1981-09-28';
--==>> MARTIN	SALESMAN	1981-09-28


DESC TBL_EMP;
/*
이름       널? 유형           
-------- -- ------------ 
EMPNO       NUMBER(4)    
ENAME       VARCHAR2(10) 
JOB         VARCHAR2(9)  
MGR         NUMBER(4)    
HIREDATE    DATE         ◀◀◀◀◀◀
SAL         NUMBER(7,2)  
COMM        NUMBER(7,2)  
DEPTNO      NUMBER(2) 
*/

SELECT ENAME 사원명, JOB 직종명, HIREDATE 입사일
FROM TBL_EMP
WHERE HIREDATE ='1981-09-28';

--▣ TO_DATE() 함수
SELECT 
      2025-06-30   "COL-1",
      '2025-06-30' "COL-2",
      TO_DATE('2025-06-30', 'YYYY-MM-DD') "COL-3"
FROM DUAL;
/*
COL-1    COL-2           COL-3
-----   ---------   ----------
1989	2025-06-30	2025-06-30
*/


SELECT TO_DATE('2025-06-31', 'YY-MM-DD') "RESULT"
FROM DUAL;
--==>>> 에러 발생
/*
ORA-01861: literal does not match format string
01861. 00000 -  "literal does not match format string"
*Cause:    Literals in the input must be the same length as literals in
           the format string (with the exception of leading whitespace).  If the
           "FX" modifier has been toggled on, the literal must match exactly,
           with no extra whitespace.
*Action:   Correct the format string to match the literal.
*/

-- 월 체크
SELECT TO_DATE('2025-13-05', 'YY-MM-DD') "RESULT"
FROM DUAL;
--==>>> 에러 발생
/*
ORA-01861: literal does not match format string
01861. 00000 -  "literal does not match format string"
*Cause:    Literals in the input must be the same length as literals in
           the format string (with the exception of leading whitespace).  If the
           "FX" modifier has been toggled on, the literal must match exactly,
           with no extra whitespace.
*Action:   Correct the format string to match the literal.
*/


-- 윤년 처리
SELECT TO_DATE('2025-02-29', 'YY-MM-DD') "RESULT"
FROM DUAL;
--==>>> 에러 발생
/*
ORA-01861: literal does not match format string
01861. 00000 -  "literal does not match format string"
*Cause:    Literals in the input must be the same length as literals in
           the format string (with the exception of leading whitespace).  If the
           "FX" modifier has been toggled on, the literal must match exactly,
           with no extra whitespace.
*Action:   Correct the format string to match the literal.
*/

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
/*
사원명   직종명      입사일
-------  ------     ----------
MARTIN	SALESMAN	1981-09-28
*/

SELECT SYSDATE
FROM DUAL;
--==>> 2025-06-30


SELECT TO_DATE('20250630','YYYY-MM-DD')
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--▣ TBL_EMP 테이블에서 입사일이 1981년 9월 28일 이후(해당일 포함)
--   입사한 직원의 사원명, 직종명, 입사일 항목을 조회한다.
--SELECT 사원명, 직종명, 입사일
--FROM TBL_EMP
--WHERE 1981년 9월 28일 이후;


SELECT ENAME 사원명, JOB 직종명, HIREDATE 입사일
FROM TBL_EMP
WHERE HIREDATE 가 1981년 9월 28일 이후(해당일 포함);

-- ※ 오라클에서는 날짜 데이터의 크기 비교가 가능하다.
--    오라클에서 날짜 데이터에 대한 크기 비교 시
--    과거보다 미래를 더 큰 값으로 간주하여 처리한다.

SELECT ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28','YYYY-MM-DD');
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	    1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	    1987-07-13
JAMES	CLERK	    1981-12-03
FORD	ANALYST	    1981-12-03
MILLER	CLERK	    1982-01-23
김한국1	saLesMAN  	2025-06-30
김한국2	SaLesMan	    2025-06-30
김한국3	salesman	    2025-06-30
김한국4	SALESMan	2025-06-30
*/


--▣ TBL_EMP 테이블에서 입사일이 1981년 4월 2일 부터
--   1981년 9월 28일 사이에 입사한 직원들의
--   사원번호, 사원명, 직종명, 입사일 항목을 조회한다. (해당일 포함)
--SELECT 사원번호, 사원명, 직종명, 입사일
--FROM TBL_EMP
--WHERE 1981년 4월 2일 부터 1981년 9월 28일 사이;

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", HIREDATE "입사일"
--FROM TBL_EMP
--WHERE 1981년 4월 2일 <= 입사일 <= 1981년 9월 28일;


--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", HIREDATE "입사일"
--FROM TBL_EMP
--WHERE 입사일 >= 1981년 4월 2일
--      입사일 <= 1981년 9월 28일;


--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", HIREDATE "입사일"
--FROM TBL_EMP
--WHERE HIREDATE >= TO_DATE('1981-04-02','YYYY-MM-DD')
--      HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');


SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE   HIREDATE >= TO_DATE('1981-04-02','YYYY-MM-DD')
  AND   HIREDATE <= TO_DATE('1981-09-28','YYYY-MM-DD');
/*
사원번호  사원명     직종명      입사일
-----    ------      -------     --------
7566	  JONES	    MANAGER	    1981-04-02
7654	  MARTIN	SALESMAN	1981-09-28
7698	  BLAKE	    MANAGER	    1981-05-01
7782	  CLARK	    MANAGER	    1981-06-09
7844	  TURNER	SALESMAN	1981-09-08
*/

--▣ BETWEEN ⓐ AND ⓑ
SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", HIREDATE "입사일"
FROM TBL_EMP
WHERE   HIREDATE BETWEEN TO_DATE('1981-04-02','YYYY-MM-DD')
                     AND TO_DATE('1981-09-28','YYYY-MM-DD');
/*
사원번호  사원명     직종명      입사일
-----    ------      -------     --------
7566	  JONES	    MANAGER	    1981-04-02
7654	  MARTIN	SALESMAN	1981-09-28
7698	  BLAKE	    MANAGER	    1981-05-01
7782	  CLARK	    MANAGER	    1981-06-09
7844	  TURNER	SALESMAN	1981-09-08
*/

--▣ BETWEEN ⓐ AND ⓑ → 숫자를 대상으로 적용
SELECT EMPNO, ENAME, SAL
FROM TBL_EMP
WHERE SAL BETWEEN 1600 AND 2850;
/*
EMPNO   ENAME    SAL
-----   -----   -----
7499	ALLEN	1600
7698	BLAKE	2850
7782	CLARK	2450
8000	김한국1	2000
8001	김한국2	2000
8002	김한국3	2000
8003	김한국4	2000
*/

SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP;
/*
7369	SMITH	CLERK	800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7566	JONES	MANAGER	2975
7654	MARTIN	SALESMAN	1250
7698	BLAKE	MANAGER	2850
7782	CLARK	MANAGER	2450
7788	SCOTT	ANALYST	3000
7839	KING	PRESIDENT	5000
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	1100
7900	JAMES	CLERK	950
7902	FORD	ANALYST	3000
7934	MILLER	CLERK	1300
8000	김한국1	saLesMAN	2000
8001	김한국2	SaLesMan	2000
8002	김한국3	salesman	2000
8003	김한국4	SALESMan	2000
*/

--▣ BETWEEN ⓐ AND ⓑ → 문자를 대상으로 적용 
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
/*
7566	JONES	MANAGER	2975
7654	MARTIN	SALESMAN	1250
7782	CLARK	MANAGER	2450
7839	KING	PRESIDENT	5000
7900	JAMES	CLERK	950
7902	FORD	ANALYST	3000
7934	MILLER	CLERK	1300
*/


-- ※ BETWEEN ⓐ AND ⓑ  는 날짜형, 숫자형, 문자형 데이터 모두를 대상으로 사용할 수 있다.
--    단, 문자형일 경우 아스키코드 순서를 따르기 때문에(사전식 배열)
--    대문자가 앞쪽에 위치하고, 소문자가 뒤쪽에 위치하며
--    BETWEEN ⓐ AND ⓑ 는 쿼리문이 수행되는 시점에서
SELECT EMPNO, ENAME, JOB, SAL
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 's';
/*
7369	SMITH	CLERK	800
7521	WARD	SALESMAN	1250
7566	JONES	MANAGER	2975
7654	MARTIN	SALESMAN	1250
7782	CLARK	MANAGER	2450
7788	SCOTT	ANALYST	3000
7839	KING	PRESIDENT	5000
7844	TURNER	SALESMAN	1500
7900	JAMES	CLERK	950
7902	FORD	ANALYST	3000
7934	MILLER	CLERK	1300
*/


--▣ ASCII()

SELECT 
      ASCII('A') "RESULT-1", ASCII('B') "RESULT-2",
      ASCII('a') "RESULT-3", ASCII('b') "RESULT-4"),
FROM DUAL;


SELECT *
FROM TBL_EMP
WHERE EMPNO BETWEEN 8000 AND 8003;
/*
8000	김한국1	saLesMAN	7698	2025-06-30	2000	200	30
8001	김한국2	SaLesMan	7698	2025-06-30	2000	200	30
8002	김한국3	salesman	7698	2025-06-30	2000	200	30
8003	김한국4	SALESMan	7698	2025-06-30	2000	200	30
*/

DELETE
FROM TBL_EMP
WHERE EMPNO BETWEEN 8000 AND 8003;
--==>> 4개 행 이(가) 삭제되었습니다.

-- 삭제 후 확인
SELECT *
FROM TBL_EMP
WHERE EMPNO BETWEEN 8000 AND 8003;

--▣ 커밋
COMMIT;
--==>> 커밋 완료.


--▣ TBL_EMP 테이블에서 직종이 SALESMAN 과 CLERK인 사원의
--   사원번호, 사원명, 직종명, 급여 항목을 조회한다.

--SELECT 사원번호, 사원명, 직종명, 급여
--FROM TBL_EMP
--WHERE 직종이 SALESMAN 과 CLERK;

--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
--FROM TBL_EMP
--WHERE 직종이 SALESMAN 과 CLERK;


--SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
--FROM TBL_EMP
--WHERE JOB = 'SALESMAN' 
--     JOB = 'CLERK';


SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE JOB = 'SALESMAN' OR
     JOB = 'CLERK';
/*
7369	SMITH	CLERK	     800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7654	MARTIN	SALESMAN	1250
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	     950
7934	MILLER	CLERK	    1300
*/

SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');
/*
7369	SMITH	CLERK	     800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7654	MARTIN	SALESMAN	1250
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	     950
7934	MILLER	CLERK	    1300
*/


SELECT EMPNO "사원번호", ENAME "사원명", JOB "직종명", SAL "급여"
FROM TBL_EMP
WHERE JOB = ANY('SALESMAN', 'CLERK');   -- cf.『=ALL』
/*
7369	SMITH	CLERK	     800
7499	ALLEN	SALESMAN	1600
7521	WARD	SALESMAN	1250
7654	MARTIN	SALESMAN	1250
7844	TURNER	SALESMAN	1500
7876	ADAMS	CLERK	    1100
7900	JAMES	CLERK	     950
7934	MILLER	CLERK	    1300
*/


-- ※ 위의 3가지 유형의 쿼리문은 모두 같은 결과를 반환한다.
--     하지만, 맨 위의 커리문이 가장 빠르게 처리된다.
--     물론, 메모리에 대한 내용이 아니라 CPU 에 대한 내용이므로
--     이 부분까지 감안하여 쿼리문의 내용을 구분하여 구성하는 일은 많지 않다.
--      → 『』 『』

-------------------------------------------------------------------------------------------------
-- ※ 추가 실습 환경 구성을 위한 테이블 생성
--     테이블 명 : TBL_SAWON
CREATE TABLE TBL_SAWON
( SANO       NUMBER(4)
, SANAME     VARCHAR2(30)
, JUBUN      CHAR(13)
, HIREDATE   DATE   DEFAULT SYSDATE
, SAL        NUMBER(10)
);
--==>> Table TBL_SAWON이(가) 생성되었습니다.


DESC TBL_SAWON;
/*
이름       널? 유형           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10) 
*/


--▣ 데이터 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001,'김한국-1','0004161234543', TO_DATE('2011-01-03', 'YYYY-MM-DD'), 3000);
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002,'김한국-2','0406201234543', TO_DATE('2017-11-05', 'YYYY-MM-DD'), 3000);
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003,'김한국-3','0004191234543', TO_DATE('2011-01-03', 'YYYY-MM-DD'), 3000);
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004,'이상이','8512161234567', TO_DATE('1988-08-16', 'YYYY-MM-DD'), 3000);
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005,'아이유','9302022234567', TO_DATE('2010-07-13', 'YYYY-MM-DD'), 3000);
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006,'이이경','7506171234567', TO_DATE('1997-03-10', 'YYYY-MM-DD'), 4000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007,'미노이','9704252234567', TO_DATE('2007-12-10', 'YYYY-MM-DD'), 2000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008,'선우선','7905082234567', TO_DATE('1998-08-16', 'YYYY-MM-DD'), 2000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009,'선동열','7012181234567', TO_DATE('1990-10-10', 'YYYY-MM-DD'), 3000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010,'남희석','7502201234567', TO_DATE('1998-08-14', 'YYYY-MM-DD'), 1000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011,'선우용녀','7005132234567', TO_DATE('1998-08-16', 'YYYY-MM-DD'), 1000);
--==> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012,'남궁선','0202204234567', TO_DATE('1998-08-14', 'YYYY-MM-DD'), 1000);
--==> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_SAWON;
/*
1001	김한국-1	0004161234543	2011-01-03	3000
1002	김한국-2	0406201234543	2017-11-05	3000
1003	김한국-3	0004191234543	2011-01-03	3000
1004	이상이	    8512161234567	1988-08-16	3000
1005	아이유	    9302022234567	2010-07-13	3000
1006	이이경	    7506171234567	1997-03-10	4000
1007	미노이	    9704252234567	2007-12-10	2000
1008	선우선	    7905082234567	1998-08-16	2000
1009	선동열	    7012181234567	1990-10-10	3000
1010	남희석	    7502201234567	1998-08-14	1000
1011	선우용녀  	7005132234567	1998-08-16	1000
1012	남궁선	    0202204234567	1998-08-14	1000
*/

--▣ 커밋
COMMIT;
--==>> 커밋 완료.
--▣ TBL_SAWON 테이블에서 김한국-1 사원의 정보를 모두 조회한다.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '김한국-1';
/*
1001	김한국-1	0004161234543	2011-01-03	3000
*/

SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '김한국-1';
/*
1001	김한국-1	0004161234543	2011-01-03	3000
*/

-- ※ LIKE : 동사  → 좋아하다.
--           부사  → ~와 같이, ~ 처럼   CHECK~!!!

-- ※ WILD CARD(CHARACTER) → 『%』
--   『LIKE』와 함께 사용되는 『%』는 모든 글자를 의미한다.
--   『LIKE』와 함께 사용되는 『_』는 아무 글자 한 개를 의미한다.


--▣ TBL_SAWON 테이블에서 성씨가 『김』씨인 사원의
--    사원명, 주민번호, 급여 항목을 조회한다.
--SELECT 사원명, 주민번호, 급여
--FROM TBL_SAWON
--WHERE 성씨가 『김』;

SELECT 사원명, 주민번호, 급여
FROM TBL_SAWON
WHERE 성씨가 『김』;

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '김____';
/*
김한국-1	0004161234543	3000
김한국-2	0406201234543	3000
김한국-3	0004191234543	3000
*/

--▣ 데이터 추가 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013,'김훈','8502071234567', TO_DATE('1999-10-10', 'YYYY-MM-DD'), 2000);
--==>> 1 행 이(가) 삽입되었습니다.

--▣ 데이터 입력 후 확인
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON;
/*
김한국-1	0004161234543	2011-01-03	3000
김한국-2	0406201234543	2017-11-05	3000
김한국-3	0004191234543	2011-01-03	3000
이상이	    8512161234567	1988-08-16	3000
아이유	    9302022234567	2010-07-13	3000
이이경	    7506171234567	1997-03-10	4000
미노이	    9704252234567	2007-12-10	2000
선우선	    7905082234567	1998-08-16	2000
선동열	    7012181234567	1990-10-10	3000
남희석	    7502201234567	1998-08-14	1000
선우용녀	    7005132234567	1998-08-16	1000
남궁선	    0202204234567	1998-08-14	1000
김훈	    8502071234567	1999-10-10	2000
*/


--▣ 커밋
COMMIT;
--==>> 커밋 완료.

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '김_';
/*
김훈	8502071234567	2000
*/


SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '김%';
/*
김한국-1	0004161234543	3000
김한국-2	0406201234543	3000
김한국-3	0004191234543	3000
김훈	    8502071234567	2000
*/

--▣ TBL_SAWON 테이블에서 이름의 마지막 글자가 『이』로
--   끝나는 사원의 사원명, 주민번호, 입사일, 급여 항목을 조회한다.
--SELECT 사원명, 주민번호, 입사일, 급여
--FROM TBL_SAWON
--WHERE 이름의 마지막 글자가 『이』;

--SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
--FROM TBL_SAWON
--WHERE 이름의 마지막 글자가 『이』;


--SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
--FROM TBL_SAWON
--WHERE 이름의 마지막 글자가 『이』;


SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '__이';
/*
이상이	8512161234567	1988-08-16	3000
미노이	9704252234567	2007-12-10	2000
*/

SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '%이';
/*
이상이	8512161234567	1988-08-16	3000
미노이	9704252234567	2007-12-10	2000
*/

--▣ TBL_SAWON 테이블에서 이름의 두 번째 글자가 『이』인 사원의
--   사원명, 주민번호, 입사일, 급여 항목을 조회한다.

--SELECT 사원명, 주민번호, 입사일, 급여
--FROM TBL_SAWON
--WHERE 이름의 두 번째 글자가 『이』';


SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '_이';
--==>> 조회 결과 없음  → '○이'


SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '_이%';
/*
아이유	9302022234567	2010-07-13	3000
이이경	7506171234567	1997-03-10	4000
*/

--▣ TBL_SAWON 테이블에서 이름에 『이』라는 글자가 하나라도 포함되어 있으면 그 사원의
--   사원명, 주민번호, 입사일, 급여 항목을 조회한다.
SELECT SANAME 사원명, JUBUN 주민번호, HIREDATE 입사일, SAL 급여
FROM TBL_SAWON
WHERE SANAME LIKE '%이%';
/*
이상이	8512161234567	1988-08-16	3000
아이유	9302022234567	2010-07-13	3000
이이경	7506171234567	1997-03-10	4000
미노이	9704252234567	2007-12-10	2000
*/


-- ### --▣ ※ ○ ★ 『』 ? ▣ ◀▶ ▼ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 6월 XX일(금) ]========================*/



