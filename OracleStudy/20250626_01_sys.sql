-- ▣ 현재 오라클 서버에 접속한 계정 조회
SHOW USER
-- ==>> USER이(가) "SYS"입니다.

-- SQLPLUS 상태일 때 사용하는 명령어

SHOW USER;

SELECT USER
FROM DUAL;
--==>> SYS



--============[주석문]==============
--1줄 주석문 처리(단일행 주서문 처리)

/*
여러줄
(다중행)
주석문
처리
*/


--============[주석문]==============
SELECT 1 + 3 
FROM DUAL;
--==>> 4

SELECT 1+3
FROM DUAL;
--==>> 4

seLect 1+3
from duAL;
--==>> 4

--SELECT "아직은 지루한 오라클 수업"
--FROM DUAL;
--==>> 오류발생
/*
ORA-00972: identifier is too long
00972. 00000 -  "identifier is too long"
*Cause:    An identifier with more than 128 bytes was specified,
           or a password identifier longer than 30 bytes was specified.
*Action:   Specify at most 128 bytes for identifiers,
           and at most 30 bytes for password identifiers.
39행, 8열에서 오류 발생
*/

SELECT '쌍용 강북교육센터 F강의장'
FROM DUAL;
-- ==>> 쌍용 강북교육센터 F강의장


SELECT 3.14 + 1.36
FROM DUAL;
--==>>4.5


SELECT 1.2345 - 1.2344
FROM DUAL;
--0.0001

SELECT 1.2345 - 1.4344
FROM DUAL;
--==>> -0.1999

SELECT 10*5
FROM DUAL;
--50

SELECT 10*5.2
FROM DUAL;
--52

SELECT 1000/53
FROM DUAL;
--18.86792452830188679245283018867924528302

SELECT '대한민국' + ' (KOREA, 코리아)'
FROM DUAL;
==>> 에러 발생
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/


-- ▣ 오라클 서버에 존재하는 사용자 계정 상태 조회

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
/*
SYS                 OPEN
SYSTEM              OPEN
ANONYMOUS           OPEN
HR                  OPEN
APEX_PUBLIC_USER  LOCKED
FLOWS_FILES       LOCKED
APEX_040000       LOCKED
OUTLN             EXPIRED & LOCKED
DIP               EXPIRED & LOCKED
ORACLE_OCM        EXPIRED & LOCKED
XS$NULL           EXPIRED & LOCKED
MDSYS             EXPIRED & LOCKED
CTXSYS            EXPIRED & LOCKED
DBSNMP            EXPIRED & LOCKED
XDB               EXPIRED & LOCKED
APPQOSSYS         EXPIRED & LOCKED
*/


SELECT USERNAME, USER_ID, ACCOUNT_STATUS, password, LOCK_DATE
FROM DBA_USERS;
/*
SYS                       OPEN
SYSTEM                    OPEN
ANONYMOUS                 OPEN
HR                        OPEN
APEX_PUBLIC_USER        LOCKED
FLOWS_FILES             LOCKED
APEX_040000             LOCKED
OUTLN         EXPIRED & LOCKED
DIP           EXPIRED & LOCKED
ORACLE_OCM    EXPIRED & LOCKED
XS$NULL       EXPIRED & LOCKED
MDSYS         EXPIRED & LOCKED
CTXSYS        EXPIRED & LOCKED
DBSNMP        EXPIRED & LOCKED
XDB           EXPIRED & LOCKED
APPQOSSYS     EXPIRED & LOCKED
*/
--==>> DBA_ 로 시작하는 Oracle Data Dictionary View 는 
--오로지 관리자 권한으로 접속했을 때만 조회가 가능하다.
--아직은 데이터 딕셔너리 개념을 잡지 못해도 상관없다.

--○『hr』 사용자 계정을 잠금 상태로 설정
alter user hr account lock;
--User HR이(가) 변경되었습니다

--○ 다시 사용자 계정 상태 조회
select username, account_status
from dba_users;

--○『hr』 사용자 계정을 잠금 해제 상태로 설정
alter user hr account unlock;
--User HR이(가) 변경되었습니다.

--○  다시 사용자 계정 상태 조회
select * 
from dba_users;
/*
SYS                  0          OPEN              25/12/22                SYSTEM    TEMP    14/05/29    DEFAULT    SYS_GROUP                     10G 11G     N    PASSWORD
SYSTEM               5          OPEN              25/12/22                SYSTEM    TEMP    14/05/29    DEFAULT    SYS_GROUP                     10G 11G     N    PASSWORD
ANONYMOUS           35          OPEN              14/11/25                SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP                    N    PASSWORD
APEX_PUBLIC_USER    45        LOCKED              14/05/29    14/11/25    SYSTEM    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
FLOWS_FILES         44        LOCKED              14/05/29    14/11/25    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
APEX_040000         47        LOCKED              14/05/29    14/11/25    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
HR                  43        LOCKED              25/06/26    25/12/23    USERS     TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
OUTLN                9        EXPIRED & LOCKED    25/06/25    25/06/25    SYSTEM    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
DIP                 14        EXPIRED & LOCKED    14/05/29    14/05/29    SYSTEM    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
ORACLE_OCM          21        EXPIRED & LOCKED    14/05/29    14/05/29    SYSTEM    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
XS$NULL     2147483638        EXPIRED & LOCKED    14/05/29    14/05/29    SYSTEM    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
MDSYS               42        EXPIRED & LOCKED    14/05/29    25/06/25    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
CTXSYS              32        EXPIRED & LOCKED    25/06/25    25/06/25    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
DBSNMP              29        EXPIRED & LOCKED    14/05/29    14/05/29    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
XDB                 34        EXPIRED & LOCKED    14/05/29    14/05/29    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
APPQOSSYS           30        EXPIRED & LOCKED    14/05/29    14/05/29    SYSAUX    TEMP    14/05/29    DEFAULT    DEFAULT_CONSUMER_GROUP        10G 11G     N    PASSWORD
*/

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
/*
SYS                       OPEN
SYSTEM                    OPEN
ANONYMOUS                 OPEN
HR                        OPEN
APEX_PUBLIC_USER        LOCKED
FLOWS_FILES             LOCKED
APEX_040000             LOCKED
OUTLN         EXPIRED & LOCKED
DIP           EXPIRED & LOCKED
ORACLE_OCM    EXPIRED & LOCKED
XS$NULL       EXPIRED & LOCKED
MDSYS         EXPIRED & LOCKED
CTXSYS        EXPIRED & LOCKED
DBSNMP        EXPIRED & LOCKED
XDB           EXPIRED & LOCKED
APPQOSSYS     EXPIRED & LOCKED
*/

----------------[테이블 스페이스 생성]-------------------

--○ TABLESPACE 생성

--※. TABLESPACEF 란?
--    세그먼트(테이블, 인덱스, ...)를 담아두는(저장해두는) 오라클의 논리적인 저장 구조를 의미한다.
--CREATE : 구조를 생성
--INSERT : 데이터 입력

CREATE TABLESPACE TBS_EDUA                  -- CREATE 유형 개체명 → 생성
DATAFILE 'C:\TESTORADATA\TBS_EUDA01.DBF'    -- 물리적으로 연결되는 데이터 파일
SIZE 4M                                     -- 물리적 데이터 파일 용량
EXTENT MANAGEMENT LOCAL                     -- 오라클 서버가 세그먼트를 알아서 관리
SEGMENT SPACE MANAGEMENT AUTO;              -- 세그먼트 공간 관리도 자동으로 오라클 서버가...
--==>> TABLESPACE TBS_EDUA이(가) 생성되었습니다.

--※. 테이블 스페이스 생성 구문을 실행하기 전에
--    물리적인 경로에 디레터리('C:\TESTORADATA') 생성할 것

--○ 생성된 테이블 스페이스 조회
--   테이블 스페이스명 : TBS_EDUA
SELECT *
FROM DBA_TABLESPACES;

--○ 물리적인 파일 이름 조회
SELECT *
FROM DBA_DATA_FILES;
/*
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF     4    USERS       104857600    12800    AVAILABLE    4    YES    11811160064    1441792    1280    103809024    12672    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSAUX.DBF    2    SYSAUX      692060160    84480    AVAILABLE    2    YES    34359721984    4194302    1280    691011584    84352    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\UNDOTBS1.DBF  3    UNDOTBS1    398458880    48640    AVAILABLE    3    YES      524288000      64000     640    397410304    48512    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF    1    SYSTEM      377487360    46080    AVAILABLE    1    YES      629145600      76800    1280    376438784    45952    SYSTEM
C:\TESTORADATA\TBS_EUDA01.DBF                   5    TBS_EDUA      4194304      512    AVAILABLE    5    NO                0          0      0      3145728      384    ONLINE
*/

-- ▣ 오라클 사용자 계정 생성
CREATE USER kni IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
-- ★ 패스워드는 대.소문자를 구분한다.★
--==>> User KNI이(가) 생성되었습니다.
-- kni 라는 사용자를 만들겠다.(생성하겠다.)
-- 이 계정을 통해 생성하는 오라클 객체는(세그먼트들은)
-- 기본적으로(default) TBS_EDUA 라는 테이블스페이스에 생성할 수 있도록 설정하겠다.

-- ※. 생성된 오라클 사용자 계정(kni)을 통해 오라클 서버에 접속 시도
-- ==>> 접속 불가(실패)
--상태: 실패 -테스트 실패: ORA-01045: user KNI lacks CREATE SESSION privilege; logon denied
--  ▶ 『CREATE SESSION』권한이 없기 때문에....


-- ▣ 생성된 오라클 사용자 계정()에 서버 접속이 가능할 수 있도록
--    『CREATE SESSION』권한 부여 → SYS 가...
GRANT CREATE SESSION TO KNI;
--==>> Grant을(를) 성공했습니다.

-- ▣  생성된 오라클 사용자 계정(KNI)을 통해 테이블을 생성하는 과정에서 에러 발생

-- ▣  생성된 오라클 사용자 계정(KNI)의 시스템 관련 권한 조회
SELECT *
FROM DBA_SYS_PRIVS;
-- 많은 결과가 나옴

SELECT *
FROM DBA_SYS_PRIVS -- 데이터 딕셔너리 뷰
WHERE GRANTEE = 'KNI';  -- 대.소문자 구분
--==>> KNI    CREATE SESSION    NO

-- ▣  생성된 오라클 사용자 계정()에 테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO KNI;
--==>> Grant을(를) 성공했습니다.

SELECT *
FROM DBA_SYS_PRIVS -- 데이터 딕셔너리 뷰
WHERE GRANTEE = 'KNI';  -- 대.소문자 구분
/*
KNI    CREATE SESSION     NO
KNI    CREATE TABLE       NO
*/

/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--==========[ 6월 27일(금) ]=========================
SELECT USER
FROM DUAL;
--==>>SYS

/*
  ▣ 생성된 오라클 사용자 계정(KNI)에 테이블스페이스(TBS_EDUA)에서
     사용할 수 있는 공간(할당량) 크기 지정 → 무제한(UNLIMITED)
*/
ALTER USER KNI
QUOTA UNLIMITED ON TBS_EDUA;
--==>> User KNI이(가) 변경되었습니다.




--### ※ ○ ★ 『』 ? ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦







