SELECT USER
FROM DUAL;
--==>> SCOTT

--------------------------------------------------------------
-- ▣▣▣ 오라클암호화복호화02_scott ▣▣▣

-- ※ 『DBMS_OBFUSCATION_TOOLKIT』을 활용하여
--     암호화, 복호화 패키지 및 함수 구성(정의)

--▣ 패키지 선언 (→ 명세부 작성)(CRYPTPACK)
CREATE OR REPLACE PACKAGE CRYPTPACK
AS
    -- 암호화 함수 선언(패키지 구성)
    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2;
    
    -- 복호화 함수 선언(패키지 구성)
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2;

END CRYPTPACK;
--==>> Package CRYPTPACK이(가) 컴파일되었습니다.

--▣ 패키지 선언 (→ 몸체부 작성)(CRYPTPACK)
CREATE OR REPLACE PACKAGE BODY CRYPTPACK
IS
    -- 전역 변수
    CRYPTED_STRING VARCHAR2(2000);

    -- 암호화 함수 정의
    FUNCTION ENCRYPT(STR VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS
        PIECES_OF_EIGHT NUMBER := ((FLOOR(LENGTH(STR)/8 + .9))*8);
    BEGIN
        DBMS_OBFUSCATION_TOOLKIT.DESENCRYPT
        ( INPUT_STRING     => RPAD(STR, PIECES_OF_EIGHT)
        , KEY_STRING       => RPAD(HASH, 8, '#')
        , ENCRYPTED_STRING => CRYPTED_STRING
        );
        RETURN CRYPTED_STRING;
    END;
    
    -- 복호화 함수 정의
    FUNCTION DECRYPT(XCRYPT VARCHAR2, HASH VARCHAR2)
    RETURN VARCHAR2
    IS
    BEGIN
        DBMS_OBFUSCATION_TOOLKIT.DESDECRYPT
        ( INPUT_STRING        => XCRYPT
        , KEY_STRING          => RPAD(HASH, 8, '#')
        , DECRYPTED_STRING    => CRYPTED_STRING
        );
        RETURN TRIM(CRYPTED_STRING);
    END;

END CRYPTPACK;
--==>> Package Body CRYPTPACK이(가) 컴파일되었습니다.

--※ DESENCRYPT, DESDECRYPT 함수는
--   인수가 VARCH2, RAW 인 프로시저가 있다.
--    - RAW : 2진 데이터
--    - UTL_RAW.CAST_TO_RAW: 문자열을 2진 데이터로 변환
--    - INPUT_STRING VARCHAR2(32) := 'abcd';
--    - RAW_INPUT RAW(128) : UTL_RAW.CAST_TO_RAW(INPUT_STRING);
--    - STR     VARCHAR2(30) := UTL_RAW.CAST_TO_RAW(RAW_INPUT);
--
--※ 프로시저를 구성하는 매개변수가 많을 경우
--   이 프로시저를 실행할 때 매개변수 값의 갯수나 순서를
--   혼동하게 될 가능성이 매우 크다.
--   이와 같은 경우에는 다음과 같은 형태로
--   매개변수와 입력 값을 매핑하여 실행하면
--   실수를 줄일 수 있으며, 비교적 편리하게 사용할 수 있다.
--   
--   (프로시저 실행)
--   EXEC 혹은 EXCUTE 프로시저명( 매개변수1  => 매개변수1에 전달하는 값
--                              ,매개변수2  => 매개변수2에 전달하는 값
--                              ,매개변수5  => 매개변수5에 전달하는 값
--                             );
--    
--    
--     → 즉, 『=>』 기호를 활용하여
--        해당 매개변수명과 값을 연결하는 형태로 데이터를 전달할 수 있다.
-----
-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦

