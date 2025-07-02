--/*================[ 7월 01일(화) ]========================*/
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


--▣  최종 쿼리
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
ORA-01031: insufficient privileges (▶▶▶ 권한 불충분)
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges

*/





--### ※ ○ ★ 『』 ? --▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--==========[ 6월 XX일(금) ]=========================