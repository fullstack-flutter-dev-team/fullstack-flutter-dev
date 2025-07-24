--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
/* 
USER
------------------------------
SYS 
*/

----------------[테이블 스페이스 생성]-------------------

--○ TABLESPACE 생성

--※. TABLESPACEF 란?
--    세그먼트(테이블, 인덱스, ...)를 담아두는(저장해두는) 오라클의 논리적인 저장 구조를 의미한다.
--CREATE : 구조를 생성
--INSERT : 데이터 입력

-- CREATE TABLESPACE TBS_EDUA                  -- CREATE 유형 개체명 → 생성
-- DATAFILE 'C:\TESTORADATA\TBS_EUDA01.DBF'    -- 물리적으로 연결되는 데이터 파일
-- SIZE 4M                                     -- 물리적 데이터 파일 용량
-- EXTENT MANAGEMENT LOCAL                     -- 오라클 서버가 세그먼트를 알아서 관리
-- SEGMENT SPACE MANAGEMENT AUTO;              -- 세그먼트 공간 관리도 자동으로 오라클 서버가...
--==>> TABLESPACE TBS_EDUA이(가) 생성되었습니다.

--※. 테이블 스페이스 생성 구문을 실행하기 전에
--    물리적인 경로에 디레터리('C:\TESTORADATA') 생성할 것

--○ 생성된 테이블 스페이스 조회
--   테이블 스페이스명 : TBS_EDUA
-- SELECT *
-- FROM DBA_TABLESPACES;

--○ 물리적인 파일 이름 조회
-- SELECT *
-- FROM DBA_DATA_FILES;
/*
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF     4    USERS       104857600    12800    AVAILABLE    4    YES    11811160064    1441792    1280    103809024    12672    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSAUX.DBF    2    SYSAUX      692060160    84480    AVAILABLE    2    YES    34359721984    4194302    1280    691011584    84352    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\UNDOTBS1.DBF  3    UNDOTBS1    398458880    48640    AVAILABLE    3    YES      524288000      64000     640    397410304    48512    ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF    1    SYSTEM      377487360    46080    AVAILABLE    1    YES      629145600      76800    1280    376438784    45952    SYSTEM
C:\TESTORADATA\TBS_EUDA01.DBF                   5    TBS_EDUA      4194304      512    AVAILABLE    5    NO                0          0      0      3145728      384    ONLINE
*/

-- 계정삭제
DROP USER  MIRACLE CASCADE ;

-- ▣ 오라클 사용자 계정 생성
-- CREATE USER miracle IDENTIFIED BY quantum
-- DEFAULT TABLESPACE TBS_EDUA;
-- ★ 패스워드는 대.소문자를 구분한다.★
--==>> User MIRACLE이(가) 생성되었습니다.

-- miracle 라는 사용자를 만들겠다.(생성하겠다.)
-- 이 계정을 통해 생성하는 오라클 객체는(세그먼트들은)
-- 기본적으로(default) TBS_EDUA 라는 테이블스페이스에 생성할 수 있도록 설정하겠다.

-- ※. 생성된 오라클 사용자 계정(micracle)을 통해 오라클 서버에 접속 시도
-- ==>> 접속 불가(실패)
--상태: 실패 -테스트 실패: ORA-01045: user KNI lacks CREATE SESSION privilege; logon denied
--  ▶ 『CREATE SESSION』권한이 없기 때문에....


-- ▣ 생성된 오라클 사용자 계정()에 서버 접속이 가능할 수 있도록
--    『CREATE SESSION』권한 부여 → SYS 가...
GRANT CREATE SESSION TO miracle;
--==>> Grant을(를) 성공했습니다.

-- ▣  생성된 오라클 사용자 계정(KNI)을 통해 테이블을 생성하는 과정에서 에러 발생

-- ▣  생성된 오라클 사용자 계정(KNI)의 시스템 관련 권한 조회
-- SELECT *
-- FROM DBA_SYS_PRIVS;
-- 많은 결과가 나옴

-- SELECT *
-- FROM DBA_SYS_PRIVS -- 데이터 딕셔너리 뷰
-- WHERE GRANTEE = 'miracle';  -- 대.소문자 구분
--==>> miracle    CREATE SESSION    NO

-- ▣  생성된 오라클 사용자 계정()에 테이블 생성이 가능할 수 있도록 CREATE TABLE 권한 부여
GRANT CREATE TABLE TO miracle;
--==>> Grant을(를) 성공했습니다.

-- SELECT *
-- FROM DBA_SYS_PRIVS -- 데이터 딕셔너리 뷰
-- WHERE GRANTEE = 'miracle';  -- 대.소문자 구분
/*
KNI    CREATE SESSION     NO
KNI    CREATE TABLE       NO
*/

-------------------------------------------------------------------------------
-- ▣ 사용자 계정 생성 및 계정 정보 저장
-- CREATE USER miracle IDENTIFIED BY quantum;
CREATE USER miracle IDENTIFIED BY quantum
DEFAULT TABLESPACE TBS_EDUA;
-- ==>> User miracle(가) 생성되었습니다.

-- ▣ CONNECT는 DB 접속 권한을, RESOURCE는 공간 사용 권한을 부여
GRANT CONNECT, RESOURCE TO miracle;
-- Grant을(를) 성공했습니다.

-- ▣ 사용자 계정 상태 조회
-- select * 
-- from dba_users;

/*
  ▣ 생성된 오라클 사용자 계정(MIRACLE)에 테이블스페이스(TBS_EDUA)에서
     사용할 수 있는 공간(할당량) 크기 지정 → 무제한(UNLIMITED)
*/
-- ALTER USER miracle
-- QUOTA UNLIMITED ON TBS_EDUA;
-- ==>> User MIRACLE이(가) 변경되었습니다.
