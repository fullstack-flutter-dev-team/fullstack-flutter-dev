SELECT USER
FROM DUAL;
--==>> SYS

--------------------------------------------------------------
-- ▣▣▣ 오라클암호화복호화01_sys ▣▣▣
-- ABCD → 1234 → ABCD

--■■■ 암호화 복호화 ■■■--
-- '가나다' → '!@#' → '가나다' --// 규칙을 가지고 암호화/복호화 하는 경우
-- (은행)인증서 + 암호           --// 별도의 정해진 키 값을 가지고 암호화/복호화 하는 경우
--// 키가 2개 이상일 수도 있고, 에스크로가 들어가서 정보를 확인하는 절차를 거치는 방법들도 있다.

-- 1. 오라클 암호화 기능을 사용하기 위해서는
--    『DBMS_OBFUSCATION_TOOLKIT』 패키지를 이용할 수 있다.
--     암호화, 복호화 알고리즘을 직접 구현하는 것도 가틍하다.SYS_IXMLAGG
--     하지만, 편의상 오라클에서 제공해주는 패키지를 통해 구현할 수 있는 것이다.
--    (관련 패키지를 활용하지 않고, 암호화 복호화 알고리즘을 직접만들어 구현할 수도 있다.)

-- 2. 『DBMS_OBFUSCATION_TOOLKIT』패키지는
--    기본적(default)으로는 사용할 수 없는 상태로 설정되어 있다(DEFAULT 설정 상)
--    이 패키지를 사용하기 위해서는 패키지를 별도로 설치하는 과정이 필요하다.
--    이를 위해... 『dbmsobtk.sql』 과 『prvtobtk.plb』 파일을 찾아 실행해야 한다.

-- 3. 이 패키지는 4개의 프로시저로 이루어져 있다.
--    VARCHAR2 타입을 Encrypt/Decrypt 할 수 있는 2개의 프로시저와
--    RAW 타입을 Enccrypt/Decrypt 할 수 있는 2개의 프로시저
--    (다른 타입은 지원하지 않기 때문에 NUMBER 와 같은 타입을 처리해야할 경우 TO_CHAR() 사용)

-- ※ RAW, LONG RAW ROWID 타입
--    그래픽 이미지나 디지털 사운드 등을 저장
--    HEXA-DECIMAL(16진수) 형태로 RETURN
--    이 중 RAW 는 VARCHAR2 와 유사하다
--    LONG RAW 는 LONG 과 유사하지만 다음과 같은 제한사항이 있다. 
--    ▶ 저장과 추출만 가능하고, DATA 를 가공할 수 없다,
--    ▶ LONG RAW 는 LONG 과 같은 제한 사항을 갖는다.

-- ○ 암호화 패키지 설치(@ 붙이고 CTRL+엔터키 )
--   "C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql"
--   "C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb"
@"C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql"
@"C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb"



-- ○ SCOTT 계정에서 해당 패키지를 사용할 수 있도록 권한 부여(SYS 가...)
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO SCOTT;
--==>> Grant을(를) 성공했습니다.
--> SCOTT 계정으로 DBMS_OBFUSCATION_TOOLKIT 패키지의 프로시저를 사용할 수 있도록 권한부여

-- GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO PUBLIC;
--==>> Grant을(를) 성공했습니다.
--> PUBLIC 으로 DBMS_OBFUSCATION_TOOLKIT 패키지의 프로시저를 사용할 수 있도록 권한 부여

 
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

