--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>> KNI

--▣ 테이블 생성
-- 테이블명 : TBL_ORAUSERTEST
--CREATE TABLE 테이블명;
--CREATE USER 유저명;
/*
CREATE TABLE TBL_ORAUSERTEST
(
  NO     숫자형
, NAME   문자형
);
*/
CREATE TABLE TBL_ORAUSERTEST
(
  NO     NUMBER(2)      -- 숫자 타입으로 -99 ~ 99
, NAME   VARCHAR2(30)   -- 문자 타입으로 30 BYTE 까지 수용
);
--==>> 에러 발생
/*
오류 보고 -
ORA-01031: insufficient privileges (→ 권한 불충분)
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/
--> 현재 KNI 계정은 CREATE SESSION 권한만 갖고 있으며
--    테이블을 생성할 수 있는 권한은 갖고있지 않은 상태이다.

--▣ 관리자(SYS)로 부터 테이블 생성 권한을 부여받은 후 다시 테이블 생성  
CREATE TABLE TBL_ORAUSERTEST
(
  NO     NUMBER(2)      -- 숫자 타입으로 -99 ~ 99
, NAME   VARCHAR2(30)   -- 문자 타입으로 30 BYTE 까지 수용
);
--==>> 에러 발생
/*
    오류 보고 -
    ORA-01950: no privileges on tablespace 'TBS_EDUA'
    01950. 00000 -  "no privileges on tablespace '%s'"
    *Cause:    User does not have privileges to allocate an extent in the
               specified tablespace.
    *Action:   Grant the user the appropriate system privileges or grant the user
               space resource on the tablespace.
*/

-- 서버용 운영체제 : 할당량


--### ※ ○ ★ 『』 ? ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
