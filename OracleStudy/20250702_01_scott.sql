--/*================[ 7월 02일(수) ]========================*/
SELECT USER
FROM DUAL;
--==>>SCOTT


--▣ CASE WHEN THEN ELSE END 구문 활용
SELECT CASE WHEN 5<2 THEN '5<2' 
            WHEN 5>2 THEN '5>2' 
            ELSE '5=2' 
       END AS "결과확인"
FROM DUAL;
--==>> 5>2

SELECT CASE WHEN 5<2 OR 3>1 THEN '김한국 만세!!' 
            WHEN 5>2 OR 2=3 THEN '대한민국 만세!!!' 
            ELSE '최고!!!' 
       END AS "결과확인"
FROM DUAL;
--==>> 김한국 만세!!


--SELECT CASE WHEN (F OR T) THEN '김한국 만세!!' 
--            WHEN T OR 2=3 THEN '대한민국 만세!!!'  -- F OR T는 항상 T
--            ELSE '최고!!!' 
--       END AS "결과확인"
--FROM DUAL;


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '김한국 만세!!' 
            WHEN 5<2 AND 2=2 THEN '대한민국 만세!!!' 
            ELSE '최고!!!' 
       END AS "결과확인"
FROM DUAL;
--==>> 김한국 만세!!


SELECT SYSDATE
FROM DUAL;
--==>>> 25/07/02

--▣ 날짜 형식 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

SELECT *
FROM TBL_SAWON;
/*
1001    김한국-1    0004161234543    2011-01-03    3000
1002    김한국-2    0406201234543    2017-11-05    3000
1003    김한국-3    0004191234543    2011-01-03    3000
1004    이상이      8512161234567    1988-08-16    3000
1005    아이유      9302022234567    2010-07-13    3000
1006    이이경      7506171234567    1997-03-10    4000
1007    미노이      9704252234567    2007-12-10    2000
1008    선우선      7905082234567    1998-08-16    2000
1009    선동열      7012181234567    1990-10-10    3000
1010    남희석      7502201234567    1998-08-14    1000
1011    선우용녀    7005132234567    1998-08-16    1000
1012    남궁선      0202204234567    1998-08-14    1000
1013    김훈        8502071234567    1999-10-10    2000
1013    김미국      4302204234567    1968-08-14    1000
1014    김미국-2    3302204234567    1958-08-14    1000
1015    김미국-2    5302204234567    1978-08-14    1000
*/

UPDATE TBL_SAWON
SET SANAME = '김미국-3'
WHERE SANO = 1015;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SAWON;
/*
1001    김한국-1    0004161234543    2011-01-03    3000
1002    김한국-2    0406201234543    2017-11-05    3000
1003    김한국-3    0004191234543    2011-01-03    3000
1004    이상이      8512161234567    1988-08-16    3000
1005    아이유      9302022234567    2010-07-13    3000
1006    이이경      7506171234567    1997-03-10    4000
1007    미노이      9704252234567    2007-12-10    2000
1008    선우선      7905082234567    1998-08-16    2000
1009    선동열      7012181234567    1990-10-10    3000
1010    남희석      7502201234567    1998-08-14    1000
1011    선우용녀    7005132234567    1998-08-16    1000
1012    남궁선      0202204234567    1998-08-14    1000
1013    김훈        8502071234567    1999-10-10    2000
1013    김미국      4302204234567    1968-08-14    1000
1014    김미국-2    3302204234567    1958-08-14    1000
1015    김미국-3    5302204234567    1978-08-14    1000
*/

--▣ TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회한다.
--   사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일,
--   정년퇴직일, 근무일수, 남은일수, 급여, 보너스
-- 단, 현재나이는 만나이 계산법이 아닌 기존의 한국 나이 계산법에 따라 연산을 수행한다.
-- 또한, 정년퇴직일은 해당 직원의나이가 한국 나이로 65세가 되는 해(연도)의
-- 그 직원의 입사 월, 일로 연산을 수행한다.
-- 그리고 보너스는 근무일수에 따라 책정하며
-- 근무일수가 5000일 이상 6000일 미만 근무한 사원은 그 사원의 급여 기준 30% 지급
-- 근무일수가 6000일 이상인 사원은 해당 사원의 급여 기준 50% 지급을 할 수 있도록 처리한다.

-- TBL_SAWON 테이블에 존재하는 사원의
-- 입사일(HIREDATE) 컬럼에서 월, 일만 조회하기
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM') ||'-'|| TO_CHAR(HIREDATE,'DD') "월일"
FROM TBL_SAWON;


SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM-DD') "월일"
FROM TBL_SAWON;
/*
김한국-1    2011-01-03    01-03
김한국-2    2017-11-05    11-05
김한국-3    2011-01-03    01-03
이상이      1988-08-16    08-16
아이유      2010-07-13    07-13
이이경      1997-03-10    03-10
미노이      2007-12-10    12-10
선우선      1998-08-16    08-16
선동열      1990-10-10    10-10
남희석      1998-08-14    08-14
선우용녀    1998-08-16    08-16
남궁선      1998-08-14    08-14
김훈        1999-10-10    10-10
*/

--▣ 실습 환경 구성을 위한 추가 데이터 입력
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013,'김미국','4302204234567', TO_DATE('1968-08-14', 'YYYY-MM-DD'), 1000);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014,'김미국-2','3302204234567', TO_DATE('1958-08-14', 'YYYY-MM-DD'), 1000);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015,'김미국-2','5302204234567', TO_DATE('1978-08-14', 'YYYY-MM-DD'), 1000);
--==>> 1 행 이(가) 삽입되었습니다.


SELECT *
FROM TBL_SAWON;

UPDATE TBL_SAWON
SET JUBUN = '0004194234543'
WHERE SANO = 1003;

COMMIT;

SELECT SANO "사원번호"
     , SANAME "사원명"
     , JUBUN "주민번호"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남'
           WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여'
           ELSE '알수없음' 
       END AS "성별"
     -- 현재나이 = 현재년도 - 태어난년도 + 1 (1900년대 생 / 2000년대 생 구분)
     -- 주민번호 앞 2자리로 현재나이 계산
     -- 주민번호 앞 2자리의 첫번째 숫자가 0,1,2이면 20세기, 3,4,5이면 21세기
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN -- 1900년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN -- 2000년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
           ELSE -1
       END AS "현재나이"
     , HIREDATE "입사일"
     , CASE 
          WHEN SUBSTR(JUBUN, 1, 1) IN ('0', '1', '2') THEN 
               (TO_NUMBER('20' || SUBSTR(JUBUN, 1, 2)) + 1) + 65 
               || '-' || TO_CHAR(HIREDATE, 'MM-DD') 
          ELSE
               (TO_NUMBER('19' || SUBSTR(JUBUN, 1, 2)) + 1) + 65
               || '-' || TO_CHAR(HIREDATE, 'MM-DD') 
       END AS "정년퇴직일"
     , TRUNC(SYSDATE - HIREDATE) "근무일수"
     , CASE 
          WHEN SUBSTR(JUBUN, 1, 1) IN ('0', '1', '2') THEN 
               TRUNC(TO_DATE((TO_NUMBER('20' || SUBSTR(JUBUN, 1, 2)) + 1) + 65 
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
          ELSE
               TRUNC(TO_DATE((TO_NUMBER('19' || SUBSTR(JUBUN, 1, 2)) + 1) + 65
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
       END AS "남은일수"
     , SAL "급여"
     , CASE 
          WHEN TRUNC(SYSDATE - HIREDATE) >= 6000 THEN SAL * 0.5
          WHEN TRUNC(SYSDATE - HIREDATE) >= 5000 THEN SAL * 0.3
          ELSE 0 
       END AS "보너스"
FROM TBL_SAWON;


SELECT SANO "사원번호", SANAME "사원명", SAL "급여"
-- , 급여 * 12 "연봉"  --- (X)
FROM TBL_SAWON;


--▣ 서브커리
SELECT SANO "사원번호", SANAME "사원명", SAL "급여"
     , SAL * 12 "연봉"
FROM TBL_SAWON;


--▣ 서브쿼리 활용
SELECT SANO "사원번호", SANAME "사원명", SAL "급여"
     , (SELECT SAL * 12 FROM TBL_SAWON WHERE SANO = 1001) "연봉"
FROM TBL_SAWON
WHERE SANO = 1001;

SELECT E.NAME
FROM EMP E;

--▣ 서브쿼리 활용
SELECT T.사원번호, T.사원명, T.급여
FROM
(
     SELECT SANO "사원번호", SANAME "사원명", SAL "급여" , SAL * 12 "연봉"
     FROM TBL_SAWON
) T;

/*
1001    김한국-1    3000
1002    김한국-2    3000
1003    김한국-3    3000
1004    이상이      3000
1005    아이유      3000
1006    이이경      4000
1007    미노이      2000
1008    선우선      2000
1009    선동열      3000
1010    남희석      1000
1011    선우용녀    1000
1012    남궁선      1000
1013    김훈        2000
1013    김미국      1000
1014    김미국-2    1000
1015    김미국-3    1000
*/

SELECT T.사원번호, T."사원명", T."주민번호", T."성별", T."현재나이", T."입사일"
     -- 정년퇴직일
     -- 정년퇴직연도 해당 직원의 나이가 한국나이로 65세가 되는 해(연도)
     -- 현재일자 + 남은연ㅅ --> 정년퇴직연도
     -- ADD_MONTHS(SYSDATE, 남은연수 * 12) --> 정년퇴직일
     --                      -------
     --                    (65 - 현재나이)
     --  , TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') "정년퇴직연도"
     --  , TO_CHAR(T."입사일", 'MM-DD')
     --  , '정년퇴직연도' || '-' || '입사월일'  "정년퇴직일"
       , TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD')  "정년퇴직일"
     --   , 근무일수
     --   , 근무일수 = 현재일 - 입사일
       , TRUNC(SYSDATE - T."입사일") "근무일수"
       -- 남은일수
       -- 남은일수 = 정년퇴직일 - 현재일
       -- 정년퇴직일 - 현재일 "남은일수"
       -- TO_DATE(정년퇴직연도 || '-' || 입사월일, 'YYYY-MM-DD') - SYSDATE "남은일수"
       , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
       , T."급여" "급여"
       -- 보너스
       -- 근무일수가 5000일 이상 6000일 미만 →  해당 사원의 급여 기준 30% 지급
       -- 근무일수가 6000일 이상인           →  해당 사원의 급여 기준 50% 지급
       -- 나머지                            → 0 지급

       -- CASE WHEN 근무일수가 5000일 이상 THEN 급여 기준 30% 지급
       --      WHEN 근무일수가 6000일 이상 THEN 급여 기준 50% 지급
       -- ELSE 0
       -- END AS "보너스" 
      , CASE WHEN TRUNC(SYSDATE - T."입사일") >= 6000 THEN T."급여" * 0.5
             WHEN TRUNC(SYSDATE - T."입사일") >= 5000 THEN T."급여" * 0.3
             ELSE 0
        END AS "보너스" 
FROM 
(
     SELECT SANO "사원번호"
     , SANAME "사원명"
     , JUBUN "주민번호"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남'
           WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여'
           ELSE '알수없음' 
       END AS "성별"
     -- 주민번호 앞 2자리로 현재나이 계산
     -- 주민번호 앞 2자리의 첫번째 숫자가 0,1,2이면 20세기, 3,4,5이면 21세기
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN -- 1900년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN -- 2000년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
           ELSE -1
       END AS "현재나이"
     , HIREDATE "입사일"
     , CASE 
          WHEN SUBSTR(JUBUN, 1, 1) IN ('0', '1', '2') THEN 
               TRUNC(TO_DATE((TO_NUMBER('20' || SUBSTR(JUBUN, 1, 2)) + 1) + 65 
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
          ELSE
               TRUNC(TO_DATE((TO_NUMBER('19' || SUBSTR(JUBUN, 1, 2)) + 1) + 65
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
       END AS "남은일수"
    , SAL "급여"
FROM TBL_SAWON
) T;

--------------------------------------------
--▣  최종 쿼리
--------------------------------------------
SELECT T.사원번호, T."사원명", T."주민번호", T."성별", T."현재나이", T."입사일"
       , TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD')  "정년퇴직일"
       , TRUNC(SYSDATE - T."입사일") "근무일수"
       , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
       , T."급여" "급여"
      , CASE WHEN TRUNC(SYSDATE - T."입사일") >= 6000 THEN T."급여" * 0.5
             WHEN TRUNC(SYSDATE - T."입사일") >= 5000 THEN T."급여" * 0.3
             ELSE 0
        END AS "보너스" 
FROM 
(
     SELECT SANO "사원번호"
     , SANAME "사원명"
     , JUBUN "주민번호"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남자'
           WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여자'
           ELSE '알수없음' 
       END AS "성별"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN -- 1900년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN -- 2000년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
           ELSE -1
       END AS "현재나이"
     , HIREDATE "입사일"
     , CASE 
          WHEN SUBSTR(JUBUN, 1, 1) IN ('0', '1', '2') THEN 
               TRUNC(TO_DATE((TO_NUMBER('20' || SUBSTR(JUBUN, 1, 2)) + 1) + 65 
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
          ELSE
               TRUNC(TO_DATE((TO_NUMBER('19' || SUBSTR(JUBUN, 1, 2)) + 1) + 65
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
       END AS "남은일수"
    , SAL "급여"
FROM TBL_SAWON
) T;


 --▣  상기 내용에서
 --    특정 근무일수의 사원을 확인해야 한다거나...
 --    특정 보너스 금액을 받는 사원을 확인해야 할 경우가 생겼다거나... 할 수 있다.
 --    이와 같은 경우...
 --    해당 쿼리문을 다시 구성해야 하는 번거로움을 줄일 수 있도록
 --    뷰(VIEW)를 활용할 수 있다.

SELECT *
FROM TBL_EMP;

--▣ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_TEST 
AS
SELECT EMPNO, ENAME, JOB, MGR, SAL*12*NVL(COMM,0) "YEARPAY"
FROM TBL_EMP;
==>> 에러 발생
/*
오류 보고 -
ORA-01031: insufficient privileges (▶▶▶ 권한 불충분) ◀◀◀◀
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/


---▶▶▶ SCOTT 계정이 뷰(VIEW)를 생성할 수 있는 권한( →  CREATE VIEW)이 없기 때문에 발생하는 에러



--▣ 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_TEST 
AS
SELECT EMPNO, ENAME, JOB, MGR, SAL*12*NVL(COMM,0) "YEARPAY"
FROM TBL_EMP;
--==>> View VIEW_TEST이(가) 생성되었습니다.


--▣ 뷰(VIEW) 생성 후 확인
SELECT *
FROM VIEW_TEST;  
/*
7369    SMITH    CLERK      7902    0
7499    ALLEN    SALESMAN   7698    5760000
7521    WARD     SALESMAN   7698    7500000
7566    JONES    MANAGER    7839    0
7654    MARTIN   SALESMAN   7698    21000000
7698    BLAKE    MANAGER    7839    0
7782    CLARK    MANAGER    7839    0
7788    SCOTT    ANALYST    7566    0
7839    KING     PRESIDENT          0
7844    TURNER   SALESMAN   7698    0
7876    ADAMS    CLERK      7788    0
7900    JAMES    CLERK      7698    0
7902    FORD     ANALYST    7566    0
7934    MILLER   CLERK      7782    0
*/

--▣ 뷰(VIEW) 생성 이후 대상 테이블에 데이터 추가
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)
VALUES(9000, 'TEST', 'SALESMAN', SYSDATE, 5000, 500, 20);
--==>> 1 행 이(가) 삽입되었습니다.

--▣ 뷰(VIEW) 생성 후 확인
SELECT *
FROM VIEW_TEST; 

/*
7369    SMITH    CLERK       7902    0
7499    ALLEN    SALESMAN    7698    5760000
7521    WARD     SALESMAN    7698    7500000
7566    JONES    MANAGER     7839    0
7654    MARTIN   SALESMAN    7698    21000000
7698    BLAKE    MANAGER     7839    0
7782    CLARK    MANAGER     7839    0
7788    SCOTT    ANALYST     7566    0
7839    KING     PRESIDENT           0
7844    TURNER   SALESMAN    7698    0
7876    ADAMS    CLERK       7788    0
7900    JAMES    CLERK       7698    0
7902    FORD     ANALYST     7566    0
7934    MILLER   CLERK       7782    0
9000    TEST     SALESMAN           30000000
*/

CREATE VIEW VIEW_TEST
AS
SELECT EMPNO, ENAME, JOB, SAL*12*NVL(COMM,0) "YEARPAY", DEPTNO
FROM TBL_EMP;
/*
오류 보고 -
ORA-00955: name is already used by an existing object
00955. 00000 -  "name is already used by an existing object"
*Cause:    
*Action:
*/

--▣ 뷰(VIEW) 재생성
-- 뷰(VIEW) 재생성 시에는 CREATE OR REPLACE 구문을
CREATE OR REPLACE VIEW VIEW_TEST
AS
SELECT EMPNO, ENAME, JOB, SAL*12*NVL(COMM,0) "YEARPAY", DEPTNO
FROM TBL_EMP;
--==>>  View VIEW_TEST이(가) 생성되었습니다.



CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T."사원명", T."주민번호", T."성별", T."현재나이", T."입사일"
       , TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD')  "정년퇴직일"
       , TRUNC(SYSDATE - T."입사일") "근무일수"
       , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (65 - T."현재나이") * 12), 'YYYY') || '-' || TO_CHAR(T."입사일", 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
       , T."급여" "급여"
      , CASE WHEN TRUNC(SYSDATE - T."입사일") >= 6000 THEN T."급여" * 0.5
             WHEN TRUNC(SYSDATE - T."입사일") >= 5000 THEN T."급여" * 0.3
             ELSE 0
        END AS "보너스" 
FROM 
(
     SELECT SANO "사원번호"
     , SANAME "사원명"
     , JUBUN "주민번호"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남자'
           WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여자'
           ELSE '알수없음' 
       END AS "성별"
     , CASE 
           WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN -- 1900년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
           WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN -- 2000년대
                EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
           ELSE -1
       END AS "현재나이"
     , HIREDATE "입사일"
     , CASE 
          WHEN SUBSTR(JUBUN, 1, 1) IN ('0', '1', '2') THEN 
               TRUNC(TO_DATE((TO_NUMBER('20' || SUBSTR(JUBUN, 1, 2)) + 1) + 65 
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
          ELSE
               TRUNC(TO_DATE((TO_NUMBER('19' || SUBSTR(JUBUN, 1, 2)) + 1) + 65
               || '-' || TO_CHAR(HIREDATE, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE)
       END AS "남은일수"
    , SAL "급여"
FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON이(가) 생성되었습니다.

--▣ 뷰(VIEW) 확인
SELECT *
FROM VIEW_SAWON;
/*
1001    김한국-1    0004163234543    2011-01-03    3000
1002    김한국-2    0406204234543    2017-11-05    3000
1003    김한국-3    0004194234543    2025-07-02    5000
1004    이상이    8512161234567    1988-08-16    3000
1005    아이유    9302012234567    2010-07-13    3000
1006    이이경    7506171234567    1997-03-10    4000
1007    미노이    9704251234567    2007-12-10    2000
1008    선우선    7905082234567    1998-08-16    2000
1009    선동열    7012181234567    1990-10-10    3000
1010    남희석    7502201234567    1998-08-14    1000
1011    선우용녀    7005131234567    1998-08-16    1000
1012    남궁선    0202204234567    1998-08-14    1000
1013    김훈    4302201234567    1999-10-10    2000
1013    김미국    4302201234567    1968-08-14    1000
1014    김미국-2    3302201234567    1958-08-14    1000
1015    김미국-3    5302202234567    1978-08-14    1000
*/

--▣ 뷰(VIEW) 생성 이후 데이터 변경
-- 뷰(VIEW) 생성 이후에도 대상 테이블에 데이터 변경이 가능하다.
---- ★★★★★★
-- UPDATE 다음에 WHERE 절을 우선 고려한다. ★★★★
UPDATE TBL_SAWON    ----- ①
SET HIREDATE = SYSDATE, SAL = 5000        ---  ③
WHERE SANO = 1003;  ----- ②
--==>> 1 행 이(가) 업데이트되었습니다.

--▣  확인
SELECT *
FROM TBL_SAWON;


--▣  커밋
COMMIT;
--==>> 커밋 완료.

--▣  확인
SELECT *
FROM TBL_SAWON;
--1003    김한국-3    0004194234543    여자    26    2011-01-03    2064-01-03    5294    14063    3000    900
--1003    김한국-3    0004194234543    여자    26    2011-01-03    2064-01-03    5294    14063    3000    900

--▣ 뷰(VIEW) 확인
SELECT *
FROM VIEW_SAWON;
/*
1001    김한국-1    0004163234543    남자    26    2011-01-03    2064-01-03    5294    14063    3000    900
1002    김한국-2    0406204234543    여자    22    2017-11-05    2068-11-05    2796    15831    3000    0
1003    김한국-3    0004194234543    여자    26    2025-07-02    2064-07-02    0    14244    5000    0
1004    이상이    8512161234567    남자    41    1988-08-16    2049-08-16    13469    8810    3000    1500
1005    아이유    9302012234567    여자    33    2010-07-13    2057-07-13    5468    11698    3000    900
1006    이이경    7506171234567    남자    51    1997-03-10    2039-03-10    10341    4998    4000    2000
1007    미노이    9704251234567    남자    29    2007-12-10    2061-12-10    6414    13309    2000    1000
1008    선우선    7905082234567    여자    47    1998-08-16    2043-08-16    9817    6618    2000    1000
1009    선동열    7012181234567    남자    56    1990-10-10    2034-10-10    12684    3386    3000    1500
1010    남희석    7502201234567    남자    51    1998-08-14    2039-08-14    9819    5155    1000    500
1011    선우용녀    7005131234567    남자    56    1998-08-16    2034-08-16    9817    3331    1000    500
1012    남궁선    0202204234567    여자    24    1998-08-14    2066-08-14    9819    15017    1000    500
1013    김훈    4302201234567    남자    83    1999-10-10    2007-10-10    9397    -6475    2000    1000
1013    김미국    4302201234567    남자    83    1968-08-14    2007-08-14    20776    -6532    1000    500
1014    김미국-2    3302201234567    남자    93    1958-08-14    1997-08-14    24429    -10184    1000    500
1015    김미국-3    5302202234567    여자    73    1978-08-14    2017-08-14    17124    -2879    1000    500
*/

--▣ 서브쿼리를 활용하여 TBL_SAWON 테이블을 다음과 같이 조회할 수 있도록
--   쿼리문을 구성한다.
/*
----------------------------------------------------------------------
사원명 | 성별 | 현재나이 |  급여 | 나이보너스
----------------------------------------------------------------------
*/

-- 단, 나이보너스는 현재 나이가 40세 이상이면 급여의 70%
-- 30세 이상 40세 미만이면 급여의 50%
-- 20세 이상 30세 미만이면 급여의 30%로 한다.
-- 
-- 또한, 완성된 조회 구문을 기반으로 
-- VIEW_SAWON2 라는 이름의 뷰(VIEW)를 생성한다.

SELECT *
FROM TBL_SAWON;

-- ①
--SELECT SNAME "사원명"
--, CASE WHEN THEN ELSE END "성별"
--, CASE WHEN THEN ELSE END "현재나이"
--, SAL "급여"
--FROM TBL_SAWON;


SELECT SANAME "사원명"
       , CASE 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남성'
             WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여성'
             ELSE '성별확인 불가' 
         END AS "성별"
       , CASE 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN
                  EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
             WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN
                  EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
             ELSE -1
          END AS "현재나이"
      , SAL "급여"
FROM TBL_SAWON;
/*
김한국-1    남성    26    3000
김한국-2    여성    22    3000
김한국-3    여성    26    5000
이상이      남성    41    3000
아이유      여성    33    3000
이이경      남성    51    4000
미노이      남성    29    2000
선우선      여성    47    2000
선동열      남성    56    3000
남희석      남성    51    1000
선우용녀    남성    56    1000
남궁선      여성    24    1000
김훈        남성    83    2000
김미국      남성    83    1000
김미국-2    남성    93    1000
김미국-3    여성    73    1000
*/

SELECT T.*
      , CASE 
          WHEN T.현재나이 >= 40 THEN T.급여 * 0.7
          WHEN T.현재나이 >= 30 THEN T.급여 * 0.5
          WHEN T.현재나이 >= 20 THEN T.급여 * 0.3
          ELSE 0
         END AS "나이보너스"
FROM 
(
  SELECT SANAME "사원명"
       , CASE 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남성'
             WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여성'
             ELSE '성별확인 불가' 
         END AS "성별"
       , CASE 
             WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN
                  EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
             WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN
                  EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
             ELSE -1
          END AS "현재나이"
      , SAL "급여"
  FROM TBL_SAWON
) T;
/*
김한국-1    남성    26    3000    900
김한국-2    여성    22    3000    900
김한국-3    여성    26    5000    1500
이상이    남성    41    3000    2100
아이유    여성    33    3000    1500
이이경    남성    51    4000    2800
미노이    남성    29    2000    600
선우선    여성    47    2000    1400
선동열    남성    56    3000    2100
남희석    남성    51    1000    700
선우용녀    남성    56    1000    700
남궁선    여성    24    1000    300
김훈    남성    83    2000    1400
김미국    남성    83    1000    700
김미국-2    남성    93    1000    700
김미국-3    여성    73    1000    700
*/


SELECT T2.사원명, T2.성별, T2.현재나이, T2.급여, 
           CASE 
               WHEN T2.현재나이 >= 40 THEN T2.급여 * 0.7
               WHEN T2.현재나이 >= 30 THEN T2.급여 * 0.5
               WHEN T2.현재나이 >= 20 THEN T2.급여 * 0.3
               ELSE 0
           END AS "나이보너스"
FROM
(
     SELECT SANAME "사원명"
          , CASE 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남성'
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여성'
               ELSE '알수없음' 
            END AS "성별"
          , CASE 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
               ELSE -1
            END AS "현재나이"
          , SAL "급여"
     FROM TBL_SAWON
) T2;


CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T2.사원명, T2.성별, T2.현재나이, T2.급여, 
           CASE 
               WHEN T2.현재나이 >= 40 THEN T2.급여 * 0.7
               WHEN T2.현재나이 >= 30 THEN T2.급여 * 0.5
               WHEN T2.현재나이 >= 20 THEN T2.급여 * 0.3
               ELSE 0
           END AS "나이보너스"
FROM
(
     SELECT SANAME "사원명"
          , CASE 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3', '9') THEN '남성'
               WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4', '0') THEN '여성'
               ELSE '알수없음' 
            END AS "성별"
          , CASE 
               WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2') THEN
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 1900) + 1
               WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4') THEN
                    EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2)) + 2000) + 1
               ELSE -1
            END AS "현재나이"
          , SAL "급여"
     FROM TBL_SAWON
) T2;
--==>> View VIEW_SAWON2이(가) 생성되었습니다.

--▣  커밋
COMMIT;
--==>> 커밋 완료.


SELECT *
FROM VIEW_SAWON2;
/*
김한국-1    남성    26    3000    900
김한국-2    여성    22    3000    900
김한국-3    여성    26    5000    1500
이상이    남성    41    3000    2100
아이유    여성    33    3000    1500
이이경    남성    51    4000    2800
미노이    남성    29    2000    600
선우선    여성    47    2000    1400
선동열    남성    56    3000    2100
남희석    남성    51    1000    700
선우용녀   남성    56    1000    700
남궁선    여성    24    1000    300
김훈    남성    83    2000    1400
김미국    남성    83    1000    700
김미국-2    남성    93    1000    700
김미국-3    여성    73    1000    700
*/

---------------[ 집계 함수]------------------------------------------

--▣ RANK() →   등수(순위)를 반환하는 함수
SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL 급여
     , RANK() OVER(ORDER BY SAL DESC) "전체급여등수" 
FROM EMP;
/*
7839    KING      10    5000    1
7902    FORD      20    3000    2
7788    SCOTT     20    3000    2
7566    JONES     20    2975    4
7698    BLAKE     30    2850    5
7782    CLARK     10    2450    6
7499    ALLEN     30    1600    7
7844    TURNER    30    1500    8
7934    MILLER    10    1300    9
7521    WARD      30    1250    10
7654    MARTIN    30    1250    10
7876    ADAMS     20    1100    12
7900    JAMES     30    950    13
7369    SMITH     20    800    14
*/


SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL 급여
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내급여등수"
FROM EMP;
/*
7839    KING     10    5000    1
7782    CLARK    10    2450    2
7934    MILLER   10    1300    3
7788    SCOTT    20    3000    1
7902    FORD     20    3000    1
7566    JONES    20    2975    3
7876    ADAMS    20    1100    4
7369    SMITH    20    800    5
7698    BLAKE    30    2850    1
7499    ALLEN    30    1600    2
7844    TURNER   30    1500    3
7654    MARTIN   30    1250    4
7521    WARD     30    1250    4
7900    JAMES    30    950    6
*/

SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL 급여
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내급여등수"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여등수" 
FROM EMP;
/*
7839    KING     10    5000    1    1
7902    FORD     20    3000    1    2
7788    SCOTT    20    3000    1    2
7566    JONES    20    2975    3    4
7698    BLAKE    30    2850    1    5
7782    CLARK    10    2450    2    6
7499    ALLEN    30    1600    2    7
7844    TURNER   30    1500    3    8
7934    MILLER   10    1300    3    9
7521    WARD     30    1250    4    10
7654    MARTIN   30    1250    4    10
7876    ADAMS    20    1100    4    12
7900    JAMES    30    950    6    13
7369    SMITH    20    800    5    14
*/

SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL 급여
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내급여등수"
     , RANK() OVER(ORDER BY SAL DESC) "전체급여등수" 
FROM EMP
ORDER BY 3, 4 DESC; -- 부서번호 오름차순, 급여기준 내림차순 정렬
/*
7839    KING     10    5000    1    1
7782    CLARK    10    2450    2    6
7934    MILLER   10    1300    3    9
7902    FORD     20    3000    1    2
7788    SCOTT    20    3000    1    2
7566    JONES    20    2975    3    4
7876    ADAMS    20    1100    4    12
7369    SMITH    20    800    5    14
7698    BLAKE    30    2850    1    5
7499    ALLEN    30    1600    2    7
7844    TURNER   30    1500    3    8
7654    MARTIN   30    1250    4    10
7521    WARD     30    1250    4    10
7900    JAMES    30    950    6    13
*/

--▣ DENSE_RANK()  → 서열을 반환하는 함수 (공동 순위)
SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL 급여
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내급여등수"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체급여등수" 
FROM EMP
ORDER BY 3, 4 DESC; -- 부서번호 오름차순, 급여기준 내림차순 정렬
/*
7839    KING    10    5000    1    1
7782    CLARK    10    2450    2    5
7934    MILLER    10    1300    3    8
7902    FORD    20    3000    1    2
7788    SCOTT    20    3000    1    2
7566    JONES    20    2975    2    3
7876    ADAMS    20    1100    3    10
7369    SMITH    20    800    4    12
7698    BLAKE    30    2850    1    4
7499    ALLEN    30    1600    2    6
7844    TURNER    30    1500    3    7
7654    MARTIN    30    1250    4    9
7521    WARD    30    1250    4    9
7900    JAMES    30    950    5    11
*/



--▣ EMP 테이블의 사원 데이터를 대상으로
--   사원명, 부서번호, 연봉, 부서내연봉순위, 전체연봉순위
--   항목을 조회하는 커리문을 구성한다.

SELECT ENAME 사원명, DEPTNO 부서번호, (SAL*12 + NVL(COMM,0)) 연봉
   , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 부서내연봉순위
   , RANK() OVER(ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 전체연봉순위
FROM EMP;
/*
KING     10    60000    1    1
FORD     20    36000    1    2
SCOTT    20    36000    1    2
JONES    20    35700    3    4
BLAKE    30    34200    1    5
CLARK    10    29400    2    6
ALLEN    30    19500    2    7
TURNER   30    18000    3    8
MARTIN   30    16400    4    9
MILLER   10    15600    3    10
WARD     30    15500    5    11
ADAMS    20    13200    4    12
JAMES    30    11400    6    13
SMITH    20     9600    5    14
*/


SELECT ENAME 사원명, DEPTNO 부서번호, (SAL*12 + NVL(COMM,0)) 연봉
   , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 부서내연봉순위
   , RANK() OVER(ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 전체연봉순위
FROM EMP
ORDER BY 2, 3 DESC;
/*
KING     10    60000    1    1
CLARK    10    29400    2    6
MILLER   10    15600    3    10
FORD     20    36000    1    2
SCOTT    20    36000    1    2
JONES    20    35700    3    4
ADAMS    20    13200    4    12
SMITH    20     9600    5    14
BLAKE    30    34200    1    5
ALLEN    30    19500    2    7
TURNER   30    18000    3    8
MARTIN   30    16400    4    9
WARD     30    15500    5    11
JAMES    30    11400    6    13
*/

SELECT ENAME 사원명, DEPTNO 부서번호
     , SAL*12 + NVL(COMM, 0) 연봉
FROM EMP;


SELECT T.*
FROM 
(
   SELECT ENAME 사원명, DEPTNO 부서번호, (SAL*12 + NVL(COMM,0)) 연봉
    , RANK() OVER(PARTITION BY DEPTNO ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 부서내연봉순위
    , RANK() OVER(ORDER BY (SAL*12 + NVL(COMM,0)) DESC) 전체연봉순위
   FROM EMP
) T
WHERE T.전체연봉순위 < 6
ORDER BY 2, 3 DESC;

/*
KING     10    60000    1    1
CLARK    10    29400    2    6
MILLER   10    15600    3    10
FORD     20    36000    1    2
SCOTT    20    36000    1    2
JONES    20    35700    3    4
ADAMS    20    13200    4    12
SMITH    20     9600    5    14
BLAKE    30    34200    1    5
ALLEN    30    19500    2    7
TURNER   30    18000    3    8
MARTIN   30    16400    4    9
WARD     30    15500    5    11
JAMES    30    11400    6    13
*/

--▣ EMP 테이블에서 전체연봉순위가 1등 부터 5등 까지만...
---  사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.

-- SELECT 사원명, 부서번호, 연봉, 전체연봉순위
-- FROM EMP
-- WHERE 전체연봉순위가 1등 부터 5등;

-- SELECT ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
-- , RANK() OVER(ORDER BY T.연봉 DESC) 전체연봉순위
-- FROM EMP
-- WHERE 전체연봉순위가 1등 부터 5등;


-- SELECT ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
-- , RANK() OVER(ORDER BY T.연봉 DESC) 전체연봉순위
-- FROM EMP
-- WHERE RANK() OVER(ORDER BY T.연봉 DESC)가 1등 부터 5등;

SELECT ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
, RANK() OVER(ORDER BY T.연봉 DESC) 전체연봉순위
FROM EMP
WHERE RANK() OVER(ORDER BY T.연봉 DESC) <= 5;
--==>> 에러 발생
/*
ORA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*Action:
969행, 41열에서 오류 발생
*/

/*
  ※ 위의 내용은 RANK() OVER() 함수를 WHERE 조건절에서 사용한 경우이며
     이 함수는 WHERE 조건절에서 사용할 수 없기 때문에 발생하는 에러이다.
     이 경우, 우리는 INLINE VIEW를 활용하여 문제를 해결해야 한다. 

  ※ OVER() 가 포함되면  WINDOW 함수로 간주...
*/

SELECT T.*
FROM
(
     SELECT ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
        , RANK() OVER(ORDER BY SAL*12 + NVL(COMM, 0) DESC) 전체연봉순위
     FROM EMP
) T
WHERE T.전체연봉순위 <= 5;
/*
KING     10    60000    1
SCOTT    20    36000    2
FORD     20    36000    2
JONES    20    35700    4
BLAKE    30    34200    5
*/

--▣ EMP 테이블에서 각 부서별로 연봉 서열이 1위 부터 2위 까지만 조회한다.
---  사원번호, 사원명, 부서번호, 연봉, 부서내연봉서열, 전체연봉순위 항목으로 조회한다.
SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
        , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12 + NVL(COMM, 0) DESC) 부서내연봉서열
        , DENSE_RANK() OVER(ORDER BY SAL*12 + NVL(COMM, 0) DESC) 전체연봉서열
FROM EMP;

SELECT T.*
FROM
(
     SELECT EMPNO 사원번호, ENAME 사원명, DEPTNO 부서번호, SAL*12 + NVL(COMM, 0) 연봉
        , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12 + NVL(COMM, 0) DESC) 부서내연봉서열
        , DENSE_RANK() OVER(ORDER BY SAL*12 + NVL(COMM, 0) DESC) 전체연봉순위
     FROM EMP
) T
WHERE T.부서내연봉서열 <= 2  -- 조건절
ORDER BY 2;
/*
7499    ALLEN    30    19500    2    6
7698    BLAKE    30    34200    1    4
7782    CLARK    10    29400    2    5
7902    FORD     20    36000    1    2
7566    JONES    20    35700    2    3
7839    KING     10    60000    1    1
7788    SCOTT    20    36000    1    2
*/

-- ※ 분석 함수
--    ▶ 집계 함수  -  여러 데이터에서 하나의 데이터로 집계...
--    ▶ 그룹 함수  -  GROUP BY 절과 함께 사용하는 함수..
--    ▶ 윈도우 함수 
      
-- ★★★★★
--▣ SUM() - 합
--▣ AVG() - 평균
--▣ COUNT() - 카운트
--▣ MAX() - 최대값
--▣ MIN() - 최소값
--▣ VARIANCE() - 분산
--▣ STDDEV() - 표준편차
--  →  다중 행을 대상으로 처리한 단일 결과 반환
--  →  처리해야 할 (다중 행의) 데이터들 중 NULL 이 포함되어 있으면
--     이 NULL은 제외하고 연산이 수행된다. ★★
--  → 
--  SUM()
-- EMP 테이블을 대상으로 전체 사원들의 급여 총 합을 조회한다.
SELECT SAL "결과확인"
FROM EMP;
/*
800
1600
1250
2975
1250
2850
2450
3000
5000
1500
1100
950
3000
1300
*/

SELECT SUM(SAL) "결과확인"
FROM EMP;
--==>> 29025
-->>> 800  + 1600 + 1250 + 2975 + 1250 + 2850 + 2450 + 3000 + 5000 + 1500 + 1100 + 950 + 3000 + 1300

SELECT SUM(COMM) "결과확인"
FROM EMP;
--==>> 2200
-->> 30

--▣ COUNT() - 행의 갯수를 조회하여 결과값 반환
SELECT COUNT(ENAME) "결과확인"
FROM EMP;
--==>> 14

SELECT COUNT(COMM) "결과확인"
FROM EMP;
--==>> 4

SELECT COUNT(*) "결과확인"
FROM EMP;
--==>> 14


--▣ AVG()  - 평균 반환
SELECT AVG(SAL) "결과확인"
FROM EMP;
--==>> 2073.214285714285714285714285714285714286


SELECT SUM(SAL) / COUNT(SAL) "결과확인"
FROM EMP;
--==>> 2073.214285714285714285714285714285714286

SELECT AVG(COMM) "결과확인"
FROM EMP;
--==>> 550


SELECT SUM(COMM) / COUNT(*) "결과확인"
FROM EMP;
--==>> 157.142857142857142857142857142857142857

-- ※ 표준편차의 제곱이 분산
--    분산의 제곱근이 표준편차
SELECT AVG(SAL), VARIANCE(SAL), STDDEV(SAL)
FROM EMP;
/*
2073.214285714285714285714285714285714286   →  
1398313.87362637362637362637362637362637    → 
1182.503223516271699458653359613061928508   → 
*/

SELECT POWER(STDDEV(SAL), 2)
     , VARIANCE(SAL)
FROM EMP;


 --▣ MAX() / MIN() - 최대값 / 최소값 반환
SELECT 
        MAX(SAL) "COL1"
      , MIN(SAL) "COL2"
FROM EMP;
--==>> 5000    800

--※ 주의
SELECT ENAME, SAL
FROM EMP;
/*
SMITH    800
ALLEN    1600
WARD    1250
JONES    2975
MARTIN    1250
BLAKE    2850
CLARK    2450
SCOTT    3000
KING    5000
TURNER    1500
ADAMS    1100
JAMES    950
FORD    3000
MILLER    1300
*/

SELECT ENAME , SUM(SAL) "결과확인"
FROM EMP;
--==>> 에러 발생
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
1,155행, 8열에서 오류 발생
*/

SELECT DEPTNO , SUM(SAL) "결과확인"
FROM EMP;
--==>> 에러 발생
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
1,166행, 8열에서 오류 발생
*/


-- SUM() → 그룹함수 역활
SELECT DEPTNO , SUM(SAL) "결과확인"
FROM EMP
GROUP BY DEPTNO;
/*
30    9400
20    10875
10    8750
*/

SELECT DEPTNO , SUM(SAL) "결과확인"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
/*
10    8750
20    10875
30    9400
*/

SELECT DEPTNO 부서번호, SUM(SAL) 급여합
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;
-- 스크립트 실행
/*
부서번호     급여합
---------- ----------
     10       8750
     20      10875
     30       9400
*/


SELECT DEPTNO 부서번호, SUM(SAL) 급여합
FROM EMP
GROUP BY ROLLUP(DEPTNO);
/*
부서번호        급여합
---------- ----------
        10       8750
        20      10875
        30       9400
                29025
*/


SELECT *
FROM TBL_EMP;


SELECT *
FROM TBL_EMP
WHERE EMPNO = 9000;

DELETE
FROM TBL_EMP
WHERE EMPNO = 9000;
--==>> 1 행 이(가) 삭제되었습니다.

COMMIT;
--==>> 커밋 완료.

--▣  실습 환경 구성을 위한 추가 데이터 입력
INSERT INTO TBL_EMP VALUES
(8001, '아이유', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8002, '김선호', 'CLERK', 7566, SYSDATE, 1000, 0, NULL);


INSERT INTO TBL_EMP VALUES
(8003, '아만다', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL);


INSERT INTO TBL_EMP VALUES
(8004, '퀸가비', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);

INSERT INTO TBL_EMP VALUES
(8005, '권지용', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);


--▣ 확인 
SELECT *
FROM TBL_EMP;

/*
 EMPNO ENAME     JOB           MGR HIREDATE       SAL    COMM   DEPTNO
------ --------- --------- ------- ---------- ------- ------- --------
  7369 SMITH     CLERK        7902 1980-12-17     800               20
  7499 ALLEN     SALESMAN     7698 1981-02-20    1600     300       30
  7521 WARD      SALESMAN     7698 1981-02-22    1250     500       30
  7566 JONES     MANAGER      7839 1981-04-02    2975               20
  7654 MARTIN    SALESMAN     7698 1981-09-28    1250    1400       30
  7698 BLAKE     MANAGER      7839 1981-05-01    2850               30
  7782 CLARK     MANAGER      7839 1981-06-09    2450               10
  7788 SCOTT     ANALYST      7566 1987-07-13    3000               20
  7839 KING      PRESIDENT         1981-11-17    5000               10
  7844 TURNER    SALESMAN     7698 1981-09-08    1500       0       30
  7876 ADAMS     CLERK        7788 1987-07-13    1100               20
  7900 JAMES     CLERK        7698 1981-12-03     950               30
  7902 FORD      ANALYST      7566 1981-12-03    3000               20
  7934 MILLER    CLERK        7782 1982-01-23    1300               10
  8001 아이유    CLERK        7566 2025-07-02    1500      10         
  8002 김선호    CLERK        7566 2025-07-02    1000       0         
  8003 아만다    SALESMAN     7698 2025-07-02    2000                 
  8004 퀸가비    SALESMAN     7698 2025-07-02    2500                 
  8005 권지용    SALESMAN     7698 2025-07-02    1000                
*/

--▣ 커밋
COMMIT;
--==>> 커밋 완료.


SELECT DEPTNO 부서번호, SUM(SAL) 급여합
FROM TBL_EMP
GROUP BY ROLLUP(DEPTNO);
/*
부서번호    급여합
------- ----------
     10       8750
     20      10875
     30       9400
 (NULL)       8000 -- 부서번호가 NULL 인 데이터들끼의 급여 합
 (NULL)      37025 -- 모든 부서의 급여 합
*/


--▣ 위에서 조회한 내용을 아래와 같이 조회될 수 있도록 쿼리문을 구성한다.
/*
--------------------------------------
  부서번호        |     급여합
--------------------------------------
         10       |   8750
         20       |  10875
         30       |   9400
       (인턴)     |    8000
     (모든부서)    |   37025
--------------------------------------
*/

SELECT CASE DEPTNO 
               WHEN NULL THEN '인턴'
               ELSE DEPTNO
       END "부서번호"
FROM TBL_EMP;
/*
ORA-00932: inconsistent datatypes: expected CHAR got NUMBER
00932. 00000 -  "inconsistent datatypes: expected %s got %s"
*Cause:    
*Action:
1,323행, 25열에서 오류 발생
*/

SELECT CASE DEPTNO 
               WHEN NULL THEN '인턴'
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
(NULL)  -- CHECK~!!!
(NULL)  -- CHECK~!!!
(NULL)  -- CHECK~!!!
(NULL)  -- CHECK~!!!
(NULL)  -- CHECK~!!!
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

SELECT *
FROM TBL_EMP;



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/