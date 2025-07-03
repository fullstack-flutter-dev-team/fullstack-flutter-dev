--/*================[ 7월 01일(화) ]========================*/
SELECT USER
FROM DUAL;
--==>> SCOTT

--▣ TBL_SAWON 테이블에서 여직원들만
--     사원번호, 사원명, 주민번호, 급여 항목을 조회한다.
--     단, SUBSTR() 함수를 활용하여 처리할 수  있도록 하며,
--     급여 기준 내림차순 정렬을 수행할 수 있도록 한다.

SELECT SANO 사원번호, SANAME 사원명,JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE 
     SUBSTR(JUBUN,7,1) = '2'
  OR SUBSTR(JUBUN,7,1) = '4'
ORDER BY SAL DESC;
/*
1005    아이유    9302022234567    3000
1007    미노이    9704252234567    2000
1008    선우선    7905082234567    2000
1011    선우용녀  7005132234567    1000
1012    남궁선    0202204234567    1000
*/


SELECT SANO 사원번호, SANAME 사원명,JUBUN 주민번호, SAL 급여
FROM TBL_SAWON
WHERE 
     SUBSTR(JUBUN,7,1) IN ('2', '4')
ORDER BY SAL DESC;
/*
1005    아이유    9302022234567   3000
1007    미노이    9704252234567   2000
1008    선우선    7905082234567   2000
1011    선우용녀  7005132234567   1000
1012    남궁선    0202204234567   1000
*/


--▣ LENGTH() / LENGTHB()
--▶ LENGTH() 는 글자 수를 반환, LENGTHB()는 바이트 수를 반환 
SELECT ENAME "COL1"
     , LENGTH(ENAME) "COL2"
     , LENGTHB(ENAME) "COL3"
FROM TBL_EMP;
/*
SMITH     5     5
ALLEN     5     5
WARD      4     4
JONES     5     5
MARTIN    6     6
BLAKE     5     5
CLARK     5     5
SCOTT     5     5
KING      4     4
TURNER    6     6
ADAMS     5     5
JAMES     5     5
FORD      4     4
MILLER    6     6
*/

--SELECT '김한국' "COL1"
   , LENGTH('김한국') "COL2"
   , LENGTHB('김한국') "COL3"
FROM DUAL;
==>> 김한국    3    9

--▣ 확인
SELECT *
FROM NLS_DATABASE_PARAMETERS;
/*
PARAMETER                   VALUE
-------------              ---------
NLS_LANGUAGE               AMERICAN
NLS_TERRITORY              AMERICA
NLS_CURRENCY               $
NLS_ISO_CURRENCY           AMERICA
NLS_NUMERIC_CHARACTERS     ,
NLS_CHARACTERSET           AL32UTF8
NLS_CALENDAR               GREGORIAN
NLS_DATE_FORMAT            DD-MON-RR
NLS_DATE_LANGUAGE          AMERICAN
NLS_SORT                   BINARY
NLS_TIME_FORMAT            HH.MI.SSXFF AM
NLS_TIMESTAMP_FORMAT       DD-MON-RR HH.MI.SSXFF AM
NLS_TIME_TZ_FORMAT         HH.MI.SSXFF AM TZR
NLS_TIMESTAMP_TZ_FORMAT    DD-MON-RR HH.MI.SSXFF AM TZR
NLS_DUAL_CURRENCY          $
NLS_COMP                   BINARY
NLS_LENGTH_SEMANTICS       BYTE
NLS_NCHAR_CONV_EXCP        FALSE
NLS_NCHAR_CHARACTERSET     AL16UTF16
NLS_RDBMS_VERSION          11.2.0.2.0
*/

-- ※ 한글 데이터를 처리할 경우
--    바이트 기반으로 처리해야만 하는 상황이라면
--    항상 인코딩 방식을 잘 체크하고 사용해야 한다.

--▣ INSTR()
SELECT 'ORACLE ORAHOME BIORA' "COL1"
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "COL2"    --  1
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "COL3"    --  8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "COL4"    --  8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2)    "COL5"    --  8
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 2) "COL6"    -- 18
     , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "COL7"    --  0
     -- 스캔을 2부터 시작했기 때문에, 두 번째 'ORA'만 발견하고 세 번째 'ORA'를 발견하지 못했으므로
     -- 인덱스를 찾지 못해서 0을 출력한 것이다.
FROM DUAL;
--===>> ORACLE ORAHOME BIORA    1    8    8    8    18    0

/*
  -- 첫 번째 파라미터 값에 해당하는 문자열에서  (대상 문자열, TARGET)
  -- 두 번째 파라미터 값을 통해 넘겨준 문자열이 등장하는 위치를 찾아라~!!!
  -- 세 번째 파라미터 값은 찾기 시작하는(즉, 스캔을 시작하는) 위치
  -- 네 번째 파라미터 값은 몇 번째 등장하는 값을 찾을 것인지에 대한 설정 → (1일 경우 생략 가능)
*/

SELECT '나의오라클 집으로오라 합니다' "COL1"
     , INSTR('나의오라클 집으로오라 합니다', '오라', 1) "COL2"   --  3
     , INSTR('나의오라클 집으로오라 합니다', '오라', 2) "COL3"   --  3
     , INSTR('나의오라클 집으로오라 합니다', '오라', 10) "COL4"  -- 10
     , INSTR('나의오라클 집으로오라 합니다', '오라', 11) "COL5"  --  0
FROM DUAL;
-- 네 번째 파라미터(마지막 파라미터)를 생략한 형태로 사용~!!!  → 1
--> 마지막 파라미터 값을 생략한 형태로 사용 → 마지막 파라미터 → 1
--==>> 나의오라클 집으로오라 합니다    3    3    10    0
     
--▣ REVERSE()
-- 대상 문자열(매개변수)을 거꾸로 반환한다. (→ 단, 한글은 제외 - 사용 불가)
-- 한글은 적용되지 않는다!!!!!
SELECT 'ORACLE' "COL1"
    , REVERSE('ORACLE') "COL2"
    , REVERSE('오라클') "COL3"
FROM DUAL;
--==>> ORACLE    ELCARO    ���


--▣ 실습 테이블 생성
--   테이블 명 : TBL_FIELS
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR2(100)
);
--==>>  Table TBL_FILES이(가) 생성되었습니다.



--▣ 데이터 입력
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XLSX');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SIST\TEST.PNG');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\EXAMPLE.JPG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\CLASSF\PROJECT\20250701\ORACLE.PDF');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20250701_01_SCOTT.SQL');
--==>> 1 행 이(가) 삽입되었습니다. * 8회

--▣ 확인
SELECT *
FROM TBL_FILES;
/*       
1       C:\AAA\BBB\CCC\SALES.DOC
2       C:\AAA\PANMAE.XLSX
3       D:\RESEARCH.PPT
4       C:\DOCUMENTS\STUDY.HWP
5       C:\DOCUMENTS\TEMP\SIST\TEST.PNG
6       D:\SHARE\F\EXAMPLE.JPG
7       C:\USER\CLASSF\PROJECT\20250701\ORACLE.PDF
8       C:\ORACLESTUDY\20250701_01_SCOTT.SQL
*/


--▣ 커밋
COMMIT;
--==>> 커밋 완료.


SELECT FILENO 파일번호, FILENAME 파일명
FROM TBL_FILES;
/*
파일번호          파일명
-------   --------------------
  1         C:\AAA\BBB\CCC\SALES.DOC
  2         C:\AAA\PANMAE.XLSX
  3         D:\RESEARCH.PPT
  4         C:\DOCUMENTS\STUDY.HWP
  5         C:\DOCUMENTS\TEMP\SIST\TEST.PNG
  6         D:\SHARE\F\EXAMPLE.JPG
  7         C:\USER\CLASSF\PROJECT\20250701\ORACLE.PDF
  8         C:\ORACLESTUDY\20250701_01_SCOTT.SQL
*/



/*
파일번호          파일명
-------   --------------------
  1            SALES.DOC
  2            PANMAE.XLSX
  3            RESEARCH.PPT
  4            STUDY.HWP
  5            TEST.PNG
  6            EXAMPLE.JPG
  7            ORACLE.PDF
  8            20250701_01_SCOTT.SQL
*/
--▣ TBL_FILES 테입블을 대상으로
--   위와 같이 조회될 수 있도록 쿼리문을 구성한다.
--   (→ 파일명.확장자)
SELECT 
     FILENO   "파일번호"
   , FILENAME "파일 경로포함 파일명"
   , REVERSE(FILENAME) "거꾸로경로포 함파일명"
FROM TBL_FILES;
/*
ORA-00972: identifier is too long
00972. 00000 -  "identifier is too long"
*Cause:    An identifier with more than 128 bytes was specified,
           or a password identifier longer than 30 bytes was specified.
*Action:   Specify at most 128 bytes for identifiers,
           and at most 30 bytes for password identifiers.
218행, 13열에서 오류 발생*/
-->> 부여한 별칭()이 너무 길어서 발생하는 에러


SELECT 
     FILENO   "파일번호"
   , FILENAME "파일 경로포함 파일명"
   , REVERSE(FILENAME) "거꾸로경로포함파일명"
FROM TBL_FILES;
/*
1     C:\AAA\BBB\CCC\SALES.DOC                      COD.SELAS\CCC\BBB\AAA\:C
2     C:\AAA\PANMAE.XLSX                           XSLX.EAMNAP\AAA\:C
3     D:\RESEARCH.PPT                               TPP.HCRAESER\:D
4     C:\DOCUMENTS\STUDY.HWP                        PWH.YDUTS\STNEMUCOD\:C
5     C:\DOCUMENTS\TEMP\SIST\TEST.PNG               GNP.TSET\TSIS\PMET\STNEMUCOD\:C
6     D:\SHARE\F\EXAMPLE.JPG                        GPJ.ELPMAXE\F\ERAHS\:D
7     C:\USER\CLASSF\PROJECT\20250701\ORACLE.PDF    FDP.ELCARO\10705202\TCEJORP\FSSALC\RESU\:C
8     C:\ORACLESTUDY\20250701_01_SCOTT.SQL          LQS.TTOCS_10_10705202\YDUTSELCARO\:C
*/     
-->> 최초 등장한 '\' 의 위치 직전까지 추출한 예상 결과

SELECT 
    INSTR(REVERSE(FILENAME), '\', 1) "확인"
FROM TBL_FILES;
/*
10
12
13
10
9
12
11
22
*/

--SELECT FILENO "파일번호", FILENAME "경로포함파일명"
--     , SUBSTR(REVERSE(FINLENAME), 1, 최초 '\'가 등장한 위치 -1) "거꾸로파일명"
--FROM TBL_FILES;

SELECT FILENO "파일번호", FILENAME "경로포함파일명"
     , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1) "거꾸로파일명"
FROM TBL_FILES;
/*
파일번호    경로포함파일명                                      거꾸로파일명
-------    -----------------------                        -------------------
  1         C:\AAA\BBB\CCC\SALES.DOC                               COD.SELAS
  2         C:\AAA\PANMAE.XLSX                                   XSLX.EAMNAP
  3         D:\RESEARCH.PPT                                     TPP.HCRAESER
  4         C:\DOCUMENTS\STUDY.HWP                                  PWH.YDUTS
  5         C:\DOCUMENTS\TEMP\SIST\TEST.PNG                          GNP.TSET
  6         D:\SHARE\F\EXAMPLE.JPG                                GPJ.ELPMAXE
  7         C:\USER\CLASSF\PROJECT\20250701\ORACLE.PDF             FDP.ELCARO
  8         C:\ORACLESTUDY\20250701_01_SCOTT.SQL        LQS.TTOCS_10_10705202
*/


SELECT FILENO "파일번호"
     , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1) -1)) "거꾸로파일명"
FROM TBL_FILES;
/*
파일번호         파일명
-------     -----------------------
1              SALES.DOC
2              PANMAE.XLSX
3              RESEARCH.PPT
4              STUDY.HWP
5              TEST.PNG
6              EXAMPLE.JPG
7              ORACLE.PDF
8              20250701_01_SCOTT.SQL
*/


SELECT 
     FILENO "파일번호"
   , SUBSTR(FILENAME, INSTR(FILENAME, '\',-1)+1) "파일명"
FROM TBL_FILES;
/*
파일번호         파일명
-------     -----------------------
   1         SALES.DOC
   2         PANMAE.XLSX
   3         RESEARCH.PPT
   4         STUDY.HWP
   5         TEST.PNG
   6         EXAMPLE.JPG
   7         ORACLE.PDF
   8         20250701_01_SCOTT.SQL
*/

--▣ LPAD()
---▶ Byte 공간으르 확보하여 왼쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "COL1"
     , LPAD('ORACLE', 10, '*') "COL2"
FROM DUAL;
--==>> ORACLE   .****ORACLE

-- ① 10 Byte 공간을 확보한다.               → 두 번째 파라미터 값에 의해   
-- ② 확보한 공간에 'ORACLE' 문자열을 담는다.→ 첫 번째 파라미터 값에 의해   
-- ③ 남아있는 Byte 공간(4Byte)을 왼쪽부터 세 번째 파라미터 값으로 채운다.
-- ④ 이렇게 구성된 최종 결과값을 반환한다.

--▣ RPAD()
---▶ Byte 공간으르 확보하여 오른쪽부터 문자로 채우는 기능을 가진 함수
SELECT 'ORACLE' "COL1"
     , RPAD('ORACLE', 10, '*') "COL2"
FROM DUAL;
--==>> ORACLE    ORACLE****

-- ① 10 Byte 공간을 확보한다.               → 두 번째 파라미터 값에 의해   
-- ② 확보한 공간에 'ORACLE' 문자열을 담는다.→ 첫 번째 파라미터 값에 의해   
-- ③ 남아있는 Byte 공간(4Byte)을 오른쪽부터 세 번째 파라미터 값으로 채운다.
-- ④ 이렇게 구성된 최종 결과값을 반환한다.

--▣ LTRIM()  - 손톱깍기를 연상    
---- 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
---- 왼쪽부터 연속적으로 등장하는 두 번째 파라미터 값에서 지정한 글자와
---- 같은 글자가 등장할 경우 이를 제거한 결과를 반환한다 
---- 단, 완성형으로 처리되지 않는다.
SELECT 'ORAORAORACLEORACLE' "COL1"   -- 오라 오라 오라클 오라클
      , LTRIM('ORAORAORACLEORACLE', 'ORA') "COL2"
      , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "COL3"
      , LTRIM('ORAoRAORACLEORACLE', 'ORA') "COL4"
      , LTRIM('ORA RACLEORACLE', 'ORA') "COL5"
      , LTRIM('             ORARACLEORACLE', ' ') "COL6"
      , LTRIM('             ORARACLEORACLE') "COL7"
      -- 왼쪽 공백 제거 함수로 활용(두 번째 파라미터 값을 생략할 수 있다.)
FROM DUAL;
--==>> ORAORAORACLEORACLE    CLEORACLE    CLEORACLE    oRAORACLEORACLE     RACLEORACLE    ORARACLEORACLE    ORARACLEORACLE


--▣ RTRIM()
---- 첫 번째 파라미터 값에 해당하는 문자열을 대상으로
---- 오른쪽부터 연속적으로 등장하는 두 번째 파라미터 값에서 지정한 글자와
---- 같은 글자가 등장할 경우 이를 제거한 결과를 반환한다.
---- 단, 완성형으로 처리되지 않는다.
SELECT 'ORAORAORACLEORACLE' "COL1"   -- 오라 오라 오라클 오라클
      , RTRIM('ORAORAORACLEORACLE', 'ORA') "COL2"
      , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "COL3"
      , RTRIM('ORAoRAORACLEORACLE', 'ORA') "COL4"
      , RTRIM('ORA RACLEORACLE', 'ORA') "COL5"
      , RTRIM('ORARACLEORACLE       ', ' ') "COL6"
      , RTRIM('ORARACLEORACLE       ') "COL7"
      -- 오른쪽 공백 제거 함수로 활용(두 번째 파라미터 값을 생략할 수 있다.)
FROM DUAL;
--==>> ORAORAORACLEORACLE    ORAORAORACLEORACLE    AAAORAORAORACLEORACLE    ORAoRAORACLEORACLE    ORA RACLEORACLE    ORARACLEORACLE    ORARACLEORACLE

-- 박을 마주쳤을 때, 두 번째 매개변수에 속하는 글자가 아니므로 그 때 trim을 멈춘다.
SELECT LTRIM('김이신이김김이이신김김김이김이김박이김신', '김신이') "COL1"
FROM DUAL;
--==>> 박이김신

--▣ TRANSLATE()
----  1 : 1 로 바꾸는 과정을 수행한다.
-- 두 번째 매개변수에서 첫 번재 매개변수에 해당하는 알파벳을 찾은 후에
-- 세 번째 매개변수에서 두 번째 매개변수(첫 번째 매개변수와 일치했던 인덱스)와 동일한 인덱스를 찾아
-- 그 값으로 변환해 준다.
--> 1 : 1 로 바꿔준다.

SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                , 'abcdefghijklmnopqrstuvwxyz') "결과확인"
FROM DUAL;
--==>> my oracle server


SELECT TRANSLATE('010-1234-5678'
               , '0123456789'
               , '공일이삼사오육칠팔구') "결과확인"
FROM DUAL;
--==>> 공일공-일이삼사-오육칠팔

--▣ REPLACE()
-- 첫 번쨰 매개변수를 대상으로 두 번째 매개변수를 찾았을 경우에 세 번째 매개변수로 교체하는 것.
-- 두 번째 묶음을 발견했을 때 그것을 통째로 세 번째 값으로 변경함.
SELECT REPLACE('MY ORACLE ORAHOME ARO', 'ORA', '오라') "결과 확인"
FROM DUAL;
--==>> MY 오라CLE 오라HOME ARO

----------------------------------------------------------------------

 --▣ ROUND()  반올림을 처리해 주는 함수
 SELECT 48.768 "COL1"   -- 48.768
      , ROUND(48.678, 2) "COL2" -- 48.68 두 번째 자리까지 표현, 세 번째 자리에서 반올림
      , ROUND(48.674, 2) "COL3" -- 48.67
      , ROUND(48.674, 1) "COL4" -- 48.7
      , ROUND(48.674, 0) "COL5" -- 49
      , ROUND(48.674) "COL6"    -- 49  -- 두 번째 파라미터 값이 0일 경우 생략 가능
      , ROUND(48.674, -1) "COL7" -- 50
      , ROUND(48.674, -2) "COL8" -- 0
      , ROUND(48.674, -3) "COL9" -- 0
FROM DUAL;
--==>> 48.768    48.68    48.67    48.7    49    49    50    0    0


 --▣ TRUNC()  절삭을 처리해 주는 함수
 SELECT 48.768 "COL1"   -- 48.768
      , TRUNC(48.678, 2) "COL2" -- 48.67 두 번째 자리까지 표현, 세 번째 자리에서 반올림
      , TRUNC(48.674, 2) "COL3" -- 48.67
      , TRUNC(48.674, 1) "COL4" -- 48.6
      , TRUNC(48.674, 0) "COL5" -- 48
      , TRUNC(48.674) "COL6"    -- 48  -- 두 번째 파라미터 값이 0일 경우 생략 가능
      , TRUNC(48.674, -1) "COL7" -- 40
      , TRUNC(48.674, -2) "COL8" -- 0
      , TRUNC(48.674, -3) "COL9" -- 0
FROM DUAL;
--==>> 48.768    48.67    48.67    48.6    48    48    40    0    0


--▣ MOD() 나머지를 반환하는 함수 → 『%』 
SELECT MOD(5, 2) "COL1"
FROM DUAL;
--> 5를 2로 나눈 나머지 결과값 반환
--==>> 1

--▣ POWER() 거듭제곱을 반환하는 함수
SELECT POWER(5, 3) "COL1"
FROM DUAL;
--> 5의 3승을 결과값으로 반환 
--==>> 125


--▣ SQRT() 루트 결과값을 반환하는 함수
SELECT SQRT(2) "COL1"
FROM DUAL;
--> 루트 2에 대한 결과값 반환
--==>> 1.41421356237309504880168872420969807857


--▣ LOG() 로그 함수
--  (오라클은 상용로그만 지원하는 반면, MSSQL 은 상용로그, 자연로그 모두 지원한다.)
SELECT LOG(10, 100) "COL1"
     , LOG(10, 20)  "COL2"
FROM DUAL;
--==>> 2            1.30102999566398119521373889472449302677


--▣ 삼각함수
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>> SIN, COS, TAN 결과값을 반환한다.
/*
0.8414709848078965066525023216302989996233    
0.5403023058681397174009366074429766037354    
1.55740772465490223050697480745836017308
*/

--▣ 삼각함수의 역함수(범위 : -1 ~ 1)
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405    
1.04719755119659774615421446109316762805    
0.4636476090008061162142562314612144020295
*/

--▣ SIGN() 서명, 부호, 특징
--> 연산 결과값이 양수이면 1, 0이면 0, 음수이면 -1 을 반환한다.
-- 매출이나 수지와 관련하여 적자 및 흑자의 개념을 표현할 때 주로 사용한다.
SELECT SIGN(5-2) "COL1"
     , SIGN(5-5) "COL2"
     , SIGN(5-7) "COL3"
FROM DUAL;
--==>> 1    0    -1

--▣ ASCII(), CHR() → 서로 대응(상응)하는 개념의 함수
-- ASCII() - 문자를 건네주면 그 문자의 아스키 코드 값을 전달해 주는 함수
-- CHR() - 숫자를 건네주면 그 문자를 아스키 코드값으로 갖는 문자로 전환해 주는 함수이다.
-- 『ASCII()』 : 매개변수로 넘겨받은 문자의 아스키코드 값을 반환한다.
-- 『CHR()』   : 매개변수로 넘겨받은 아스키코드 값으로 해당 문자를 반환한다.
SELECT ASCII('A') "COL1"
     , CHR(65) "COL2"
FROM DUAL;
--==>> 65    A


--------------------------------------------------------------------------------------------------
--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

-- 현재 날짜를 출력하는 함수 : SYSDATE
SELECT SYSDATE
FROM DUAL;
--==>> 2025-07-01 12:10:14

-- 여기에 1을 더하면 어떤 것이 더해질까? 1년, 1개월, 1일, 1시간, 1분, 1초? 
-- ※ 날짜 연산의 기본 단위는 DAY(일수) 이다~!!!! CHECK~!!!

-- [전부 일수가 변화하고 있다는 것을 알 수 있다.]
--※ 날짜 연산의 기본 단위는 일수(DAY) 이다~!!! CHECK~!!!
SELECT SYSDATE "COL1"           -- 2025-07-01 12:12:09
     , SYSDATE + 1 "COL2"       -- 2025-07-02 12:12:09
     , SYSDATE - 2 "COL3"       -- 2025-06-29 12:12:09
     , SYSDATE + 30 "COL4"      -- 2025-07-31 12:12:09
     , SYSDATE + 3 "COL5"       -- 2025-07-04 12:13:02
FROM DUAL;

-- 특정한 날짜에서 한 시간이나 두 시간을 빼거나 추가하려면 어떻게 해야할까?

--▣ 시간 단위 연산
SELECT SYSDATE "COL1"          -- 2025-07-01 12:14:30 → 현재
     , SYSDATE + 1/24 "COL2"   -- 2025-07-01 13:14:30 → 1시간 후
     , SYSDATE - 2/24 "COL3"   -- 2025-07-01 10:14:30 → 2시간 전
FROM DUAL;


--▣ 현재 시간과    현재 시간 기준 1일 2시간 3분 4초 후를 조회하는 쿼리문을 구성한다.

/*
--------------------     -----------------------------
현재시간                  연산 후 시간
--------------------     -----------------------------
2025-07-01 12:18:25       2025-07-02 14:21:29
--------------------     -----------------------------
*/

-- [방법 - 1]
SELECT SYSDATE "현재 시간"
      , SYSDATE + 1 + 2/24 + 3/(24*60) + 4/(24*60*60) "연산 후 시간"
FROM DUAL;
/*
      현재시간                      연산 후 시간
--------------------     -----------------------------
2025-07-01 12:18:25               2025-07-02 14:21:29
*/

-- [방법 - 2] ▶  모두 초로 환산해서 처리
SELECT SYSDATE "현재 시간"
      , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4) "연산 후 시간"
FROM DUAL;
/*
2025-07-01 12:29:28
2282-04-09 12:29:28
*/

--▣ 날짜 - 날짜 → 일수
--  Ex) (2025-11-04) - (2025-07-01)
--         수료일          현재일
-- 날짜끼리의 연산도 가능하다. -- 결과 값은 일수!!

--▣ 데이터 타입의 변환
SELECT TO_DATE('2025-07-01', 'YYYY-MM-DD') "COL1"
FROM DUAL;

SELECT TO_DATE('2025-07-32', 'YYYY-MM-DD') "COL1"
FROM DUAL;
/*
ORA-01847: day of month must be between 1 and last day of month
01847. 00000 -  "day of month must be between 1 and last day of month"
*Cause:    
*Action:
*/

--※ TO_DATE() 함수를 통해 문자 타입을 날짜 타입으로 변환을 수행하는 과정에서
--   내부적으로 해당 날짜에 대한 유효성 검사가 이루어진다.


--▣ ADD_MONTHS() 개월 수를 더하거나 빼주는 함수
SELECT SYSDATE "COL1"
     , ADD_MONTHS(SYSDATE, 2) "COL2"
     , ADD_MONTHS(SYSDATE, 3) "COL3"
     , ADD_MONTHS(SYSDATE, -2) "COL4"
     , ADD_MONTHS(SYSDATE, -3) "COL5"
FROM DUAL;
/*
2025-07-01 12:36:09
2025-09-01 12:36:09
2025-10-01 12:36:09
2025-05-01 12:36:09
2025-04-01 12:36:09
*/

SELECT TO_DATE('2025-07-01', 'YYYY-MM-DD') - TO_DATE('2023-08-22', 'YYYY-MM-DD') "COL1"
FROM DUAL;


--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.

--▣ MONTHS_BETWEEN()
--> 첫 번째 인자값에서 두 번째 인자값을 뺀 개월 수를 반환한다.
-- 2002년 한일 월드컵 개막일 : 2002년 5월 31일
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "COL1"
FROM DUAL;
--==>> 277.049245818399044205495818399044205496
----▶ 개월 수의 차이를 반환하는 함수
--  ※ 결과값으로 반환되는 값의 부호가 『-』(음수)로 반환되었을 경우에는
--     첫 번째 인자값에 해당하는 날짜보다
--     두 번째 인자값이 더 크다는 의미이다.
--     즉, 두 번째 인자값이 더 『미래』의 날짜라는 의미이다.

--▣ NEXT_DAY()
--- 첫 번째 인자값을 기준 날짜로 돌아오는 가장 빠른 요일 반환
--- SYSDATE를 기반으로 가장 가깝게 돌아오는 토요일이 언제인지를 반환해 주는 함수이다.
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '수') "COL2"
     , NEXT_DAY(SYSDATE, '월') "COL3"
FROM DUAL;
/*
2025-07-05    2025-07-02    2025-07-07
*/

--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session이(가) 변경되었습니다.


--▣ 설정 변경 후 다시 확인 
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '수') "COL2"
     , NEXT_DAY(SYSDATE, '월') "COL3"
FROM DUAL;
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT') "COL1"
     , NEXT_DAY(SYSDATE, 'WED') "COL2"
     , NEXT_DAY(SYSDATE, 'MON') "COL3"
FROM DUAL;
--==>> 2025-07-05    2025-07-02    2025-07-07


--※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.


--▣ 설정 변경 후 다시 확인 
SELECT NEXT_DAY(SYSDATE, '토') "COL1"
     , NEXT_DAY(SYSDATE, '수') "COL2"
     , NEXT_DAY(SYSDATE, '월') "COL3"
FROM DUAL;
--==>> 2025-07-05    2025-07-02    2025-07-07

--▣ LAST_DAY()
--> 해당 날짜가 포함되어 있는 그 달의 마지막 날을 반환한다.
SELECT SYSDATE "COL1"                                      -- 2025-07-01    
     , LAST_DAY(SYSDATE) "결과확인"                         -- 2025-07-31
FROM DUAL;

SELECT SYSDATE "COL1"                                       -- 2025-07-01    
     , LAST_DAY(SYSDATE) "COL2"                             -- 2025-07-31
     , LAST_DAY(TO_DATE('2023-02-12', 'YYYY-MM-DD')) "COL3" -- 2023-02-28
     , LAST_DAY(TO_DATE('2020-02-12', 'YYYY-MM-DD')) "COL4" -- 2020-02-29
FROM DUAL;

SELECT *
FROM DUAL;

--▣ 오늘부로    김한국이가     군대에 또 끌려(?) 간다.
--   복무기간은 22개월로 한다.
--   1. 전역 일자를 구한다.
SELECT SYSDATE "COL1"
     , ADD_MONTHS(SYSDATE, 1) "COL2"
     , ADD_MONTHS(SYSDATE, 22) "전역 일자"
FROM DUAL;
/*
2025-07-01    2025-08-01    2027-05-01
*/

--   2. 하루 꼬박꼬박 3끼 식사를 해야 한다고 가정하면,
--      김한국이 몇 끼를 먹어야 집에 보내줄까??    
--      복무기간 * 3
--      --------
--       (전역일자 - 현재일자)
--       (전역일자 - 현재일자) * 3
--SELECT (전역일자 - 현재일자) * 3
--FROM DUAL;

SELECT (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3
FROM DUAL;
--==>> 2007

SELECT SYSDATE "COL1"
     , ADD_MONTHS(SYSDATE, 1) "COL2"
     , ADD_MONTHS(SYSDATE, 22) "전역 일자"
     , TO_NUMBER(TO_DATE(ADD_MONTHS(SYSDATE, 1)) - TO_DATE(SYSDATE, 'YYYY-MM-DD')) "식사 수"
     , TO_DATE(ADD_MONTHS(SYSDATE, 22)) - TO_DATE(SYSDATE, 'YYYY-MM-DD') "일수"
     , ADD_MONTHS(SYSDATE, 22)  - SYSDATE "일수"
     , TO_NUMBER(TO_DATE(ADD_MONTHS(SYSDATE, 22)) - TO_DATE(SYSDATE, 'YYYY-MM-DD'))*3 "식사 수"
FROM DUAL;
/*
                                                            총 식사 수
                                                             ------
2025-07-01    2025-08-01    2027-05-01    31    669    669    2007
*/


--▣ 현재 날짜 및 시간을 기준으로   
--   수료일(2025-11-05 18:00:00) 까지 남은 기간을  
--   다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
-----------------------------------------------------------------------------
현재시각            |  수료일              | 일   | 시간 | 분 | 초
-----------------------------------------------------------------------------
2025-07-01 14:31:27 | 2025-11-05 18:00:00 | 126 | 3    | 28 | 33
-----------------------------------------------------------------------------
*/

-- 날짜 및 시간 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--▣ 『1일 2시간 3분 4초』 를     『초』 로 환산하면   
SELECT  (1*24*60*60 + 60*60*2 + 60*3 + 4) "초"
FROM DUAL;
--==>> 93784


-- 『93784초』를     다시 『일, 시간, 분, 초』로 환산하면   
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC(93784/60)/60),24)"시간"
     , TRUNC(93784/60) - TRUNC(TRUNC(93784/60)/60)*60 "분"
     , 93784 - TRUNC(93784/60)*60 "초"
FROM DUAL;
--==>> 1    2    3    4

-- 『93784초』를     다시 『일, 시간, 분, 초』로 환산하면   
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"시간"
     , MOD(TRUNC(93784/60), 60) "분"
     , MOD(93784, 60) "초"
FROM DUAL;

-- 『초』로 환산한 결과값은 93784초 이다.

-- -- 수료일까지 남은 기간 확인(날짜 기준) --> 단위 : 일수
-- SELECT 수료일자 - 현재일자
-- FROM DUAL;

-- 수료일자
SELECT TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"   
FORM DUAL;

-- 일수
SELECT TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - STSDATE  
FORM DUAL;


-- 수료일까지 남은 기간 확인(날짜 기준) --> 단위 초
--SELECT (수료일까지 남은 일수) * (24*60*60)
--FROM DUAL;

-- 수료일까지 남은 전체 초
SELECT (TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)
FROM DUAL;
--==>> 10980823.99999999999999999999999999999997


-- 『수료일까지 남은 전체 초』를     다시 『일, 시간, 분, 초』로 환산하면   
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)"시간"
     , MOD(TRUNC(93784/60), 60) "분"
     , MOD(93784, 60) "초"
FROM DUAL;

SELECT TRUNC(TRUNC(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     , TRUNC(MOD((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "초"
FROM DUAL;

SELECT SYSDATE "현재시각"                                                                                                 -- 2025-07-01 15:10:32
     , TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"     
     , TRUNC(TRUNC(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60)/24) "일"
     , MOD(TRUNC(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60)/60), 24)"시간"
     , MOD(TRUNC((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60)/60), 60) "분"
     , TRUNC(MOD((TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) * (24*60*60), 60)) "초"
FROM DUAL;
/*
2025-07-01 15:59:56    2025-11-05 18:00:00    127    2    0    4
*/

-- 테스트용 쿼리문
SELECT SYSDATE "현재시각"                                                                                                 -- 2025-07-01 15:10:32
    , TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"                                                    -- 2025-11-05 18:00:00
    , TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE "일_소수포함"                                     -- 127.117685185185185185185185185185185185
    , TRUNC(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"                                      -- 127
    , (MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24) "시간_소수포함"                      -- 2.82444444444444444444444444444444444
    , TRUNC(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24) "시간"                         -- 2
    , TRUNC(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24) "시간"                         -- 2
    , (MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60) "분_소수포함"             -- 49.4666666666666666666666666666666664
    , TRUNC(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60) "분"                -- 49
    , (MOD(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60, 1)*60) "초_소수포함"  -- 27.999999999999999999999999999999984
    , TRUNC(MOD(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60, 1)*60) "초"      -- 27
FROM DUAL;

-- 테스트용 쿼리문
SELECT SYSDATE "현재시각"
    , TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
    , TRUNC(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
    , TRUNC(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24) "시간"
    , TRUNC(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60) "분"
    , TRUNC(MOD(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1)*24, 1)*60, 1)*60) "초"
FROM DUAL;


-- COPILOT 자동완성    
SELECT SYSDATE "현재시각"
     , TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') "수료일"
     , TRUNC(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE) "일"
     , TRUNC(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1) * 24) "시간"
     , TRUNC(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1) * 24, 1) * 60) "분"
     , TRUNC(MOD(MOD(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 1) * 24, 1) * 60, 1) * 60) "초"
FROM DUAL;


SELECT  TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
     , TRUNC(MOD(TO_DATE('2025-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE, 24))
FROM DUAL;



--▣ 현재 날짜 및 시간을 기준으로   
--   본인이 태어나서 현재까지   
--   얼마만큼의 일, 시간, 분, 초를 살고있는지
--   다음과 같은 형태로 조회할 수 있도록 쿼리문을 구성한다.
/*
-----------------------------------------------------------------------------
현재시각             |  태어난시각          | 일   | 시간    | 분   | 초
-----------------------------------------------------------------------------
2025-07-01 14:31:27 | 1999-11-05 12:00:00 | XXXX | XX      | XX  | XX
-----------------------------------------------------------------------------
*/
-- 과제 제출 공유폴더 > 20250701~~오라클 쿼리문> 홍길동.SQL 

SELECT SYSDATE "현재시각"
     , TO_DATE('1976-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS') "태어난시각"
     , TRUNC(SYSDATE - TO_DATE('1976-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS')) "일"
     , TRUNC(MOD(SYSDATE - TO_DATE('1976-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1) * 24) "시간"
     , TRUNC(MOD(MOD(SYSDATE - TO_DATE('1976-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1) * 24, 1) * 60) "분"
     , TRUNC(MOD(MOD(MOD(SYSDATE - TO_DATE('1976-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1) * 24, 1) * 60, 1) * 60) "초"
FROM DUAL;
/*
현재시각                      태어난시각                 일          시간     분   초
-----------------------     ---------------------    ----------   -------  ----- -------
2025-07-01 16:14:10         1976-06-01 12:00:00         17927         4     14      9
*/


--▣ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==> Session이(가) 변경되었습니다.


-- ※ 날짜 데이터를 대상으로 반올림, 절삭을 수행할 수 있다.

--▣ 날짜 반올림
SELECT SYSDATE "현재시각"                       -- 2025-07-01   → 기본 현재 날짜
     , ROUND(SYSDATE, 'YEAR') "년 단위 반올림"  -- 2026-01-01   →  년도까지 유효한 데이터(상반기, 하반기 기준)
     , ROUND(SYSDATE, 'MONTH') "월 단위 반올림"  -- 2025-07-01  →  월까지 유효한 데이터(15일 기준)
     , ROUND(SYSDATE, 'DD') "일 단위 반올림"     -- 2025-07-02  →  날짜까지 유효한 데이터(정오 기준)
     , ROUND(SYSDATE, 'DAY') "일 단위 반올림"     -- 2025-06-29 →  날짜까지 유효한 데이터(수요일 기준)
--     , ROUND(SYSDATE, 'HH') "시간 단위 반올림"
--     , ROUND(SYSDATE, 'MI') "분 단위 반올림"
--     , ROUND(SYSDATE, 'SS') "초 단위 반올림"
FROM DUAL;
/*
2025-07-01    2026-01-01    2025-07-01    2025-07-02    2025-06-29
*/



--▣ 날짜 절삭
SELECT SYSDATE "현재시각"                         -- 2025-07-01   → 기본 현재 날짜
     , TRUNC(SYSDATE, 'YEAR') "년 단위 반올림"    -- 2025-01-01   →  년도까지 유효한 데이터
     , TRUNC(SYSDATE, 'MONTH') "월 단위 반올림"   -- 2025-07-01   →  월까지 유효한 데이터
     , TRUNC(SYSDATE, 'DD') "일 단위 반올림"      -- 2025-07-01   →  날짜까지 유효한 데이터
     , TRUNC(SYSDATE, 'DAY') "일 단위 반올림"     -- 2025-06-29   →  날짜까지 유효한 데이터 → 지난주 일요일
--     , ROUND(SYSDATE, 'HH') "시간 단위 반올림"
--     , ROUND(SYSDATE, 'MI') "분 단위 반올림"
--     , ROUND(SYSDATE, 'SS') "초 단위 반올림"
FROM DUAL;

----------------------------------------------------------------------------
--▣▣▣  변환 함수   ▣▣▣--
-- TO_CHAR()  : 날짜 → 문자(숫자나 날짜 데이터를 문자 타입으로 변환시켜주는 함수)
-- TO_DATE()  : 문자 → 날짜(문자 데이터(날짜 형식)를 날짜 타입으로 변환시켜주는 함수)
-- TO_NUMBER(): 문자 → 숫자(문자 데이터(숫자 형식)를 숫자 타입으로 변환시켜주는 함수)

SELECT 10 "COL1"
     , TO_CHAR(10) "COL2"          -- 문자로 변환
     , TO_DATE('2025-07-01', 'YYYY-MM-DD') "COL3" -- 문자 → 날짜
     , TO_NUMBER('1234') "COL4"    -- 문자 → 숫자
     , TO_NUMBER('1234.56') "COL5" -- 문자 → 숫자
FROM DUAL;
--==>> 10    10    2025-07-01    1234    1234.56


-- ※ 날짜나 통화 형식이 맞지 않을 경우
--    세션 설정값을 통해 설정할 수 있도록 한다.
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.
ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session이(가) 변경되었습니다.
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
ALTER SESSION SET NLS_CURRENCY = '\'; -- 화폐단위 : 원(￦)
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

SELECT TO_CHAR(SYSDATE) "현재시각"
FROM DUAL;
--==>> 2025-07-01

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') "현재시각"
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD') "날짜"
     , TO_CHAR(SYSDATE, 'HH24:MI:SS') "시간"
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS', 'NLS_DATE_LANGUAGE = KOREAN') "한글 날짜"
     , TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS', 'NLS_DATE_LANGUAGE = ENGLISH') "영어 날짜"
FROM DUAL;
/*
2025-07-01 16:51:55    2025-07-01    16:51:55    2025-07-01 16:51:55    2025-07-01 16:51:55
*/

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') -- 2025-07-01
     , TO_CHAR(SYSDATE, 'YYYY')       -- 2025
     , TO_CHAR(SYSDATE, 'YEAR')       -- TWENTY TWENTY-FIVE
     , TO_CHAR(SYSDATE, 'MM')         -- 07
     , TO_CHAR(SYSDATE, 'MONTH')      -- 7월 
     , TO_CHAR(SYSDATE, 'MON')        -- 7월 
     , TO_CHAR(SYSDATE, 'DD')         -- 01
     , TO_CHAR(SYSDATE, 'DAY')        -- 화요일
     , TO_CHAR(SYSDATE, 'DY')         -- 화
     , TO_CHAR(SYSDATE, 'HH24')       -- 17
     , TO_CHAR(SYSDATE, 'HH')         -- 05
     , TO_CHAR(SYSDATE, 'HH AM')      -- 05 오후
     , TO_CHAR(SYSDATE, 'HH PM')      -- 05 오후
     , TO_CHAR(SYSDATE, 'MI')         -- 54
     , TO_CHAR(SYSDATE, 'SS')         -- 15
     , TO_CHAR(SYSDATE, 'SSSSS')      -- 64455 , 금일 흘러온 초
     , TO_CHAR(SYSDATE, 'Q')          -- 3, 분기
FROM DUAL;

--▣ EXTRACT() 함수
-- EXTRACT() 함수는 날짜나 숫자에서 특정한 부분을 추출하는 함수이다.
SELECT TO_CHAR(SYSDATE, 'YYYY') 
     , TO_CHAR(SYSDATE, 'MM')
     , TO_CHAR(SYSDATE, 'DD')
     , EXTRACT(YEAR FROM SYSDATE) "연도"
     , EXTRACT(MONTH FROM SYSDATE) "월"
     , EXTRACT(DAY FROM SYSDATE) "일"
     , EXTRACT(HOUR FROM SYSDATE) "시"
     , EXTRACT(MINUTE FROM SYSDATE) "분"
     , EXTRACT(SECOND FROM SYSDATE) "초"
FROM DUAL;

--▣ TO_CHAR() 함수 활용 추가 →  형식 맟춤 표기 결과값 반환
SELECT 80000 "COL1"                           -- 80000
     , TO_CHAR(80000)                  "COL2" -- 80000
     , TO_CHAR(80000, '99,999')        "COL3" -- 80,000
     , TO_CHAR(80000, '$99,999')       "COL4" -- $80,000
     , TO_CHAR(80000, 'L99,999')       "COL5" -- ￦80,000
     , TO_CHAR(80000, '9,999,999')     "COL6" -- 80,000
     , TO_CHAR(80000, '9,999,999.99')  "COL7" -- 80,000.00
     , TO_CHAR(80000, 'L9,999,999')    "COL8" -- ￦80,000
     , TO_CHAR(80000, 'L9,999,999.99') "COL9" -- ￦80,000.00
     , LTRIM(TO_CHAR(80000, 'L9,999,999.99'))  "COL10" -- ￦80,000.00
FROM DUAL;
--==>> 80000    80000     80,000     $80,000            ￦80,000        80,000        80,000.00               ￦80,000               ￦80,000.00    ￦80,000.00


-- ※ 날짜 관련 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session이(가) 변경되었습니다.

--▣ 현재 시간을 기준으로 1일 2시간 3분 4초 후를 조회한다.
SELECT SYSDATE "현재 시간"
     , SYSDATE + 1 + 2/24 + 3/(24*60) + 4/(24*60*60) "연산 후 시간"
FROM DUAL;
/*
2025-07-01 17:30:13
2025-07-02 19:33:17
*/

--▣  현재 시간을 기준으로 1년 2개월 3일 4시간 5분 6초 후를 조회한다.
SELECT SYSDATE "현재 시간"
      , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "연산 후 시간"
FROM DUAL;
/*
2025-07-01 17:37:13    
2026-09-04 21:42:19
*/


--▣▣▣ CASE 구문(조건문, 분기문)  ▣▣▣---
/*
CASE
WHEN
THEN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2는 몰라요'END "결과확인"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+3 WHEN 4 THEN '5+3=4' ELSE '5+3은 몰라요'END "결과확인"
FROM DUAL;
--==>> 5+3은 몰라요


SELECT CASE 1+1 WHEN 2 THEN '1+1=2' 
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
                ELSE '몰라요'
       END "결과확인"
FROM DUAL;
--==>> 1+1=2

--▣ DECODE() 함수
-- DECODE() 함수는 특정한 값을 기준으로 조건을 검사하고, 그에 따라
-- 대응하는 값을 반환하는 함수이다.
SELECT DECODE(5+2, 7, '5+2=7', '5+2는 몰라요') "결과확인"
FROM DUAL;
--==>> 5+2=7

SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3,  '5-2=3', '5-2는 몰라요') "결과확인"
FROM DUAL;
--==>> 5-2=3

SELECT CASE WHEN 1+1=2 THEN '1+1=2' 
            WHEN 1+2=5 THEN '1+2=5'
            WHEN 1+3=7 THEN '1+3=7'
            ELSE '몰라요'
       END "결과확인"
FROM DUAL;
--==>> 1+1=2


-- ### --▣ ※ ○ ★ 『』 ? ▣ ◀▶ ▼ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/