--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  SYS


--▣ 오라클 사용자 계정 생성(SCOTT)
CREATE USER SCOTT
IDENTIFIED BY tiger;
--==>> User SCOTT이(가) 생성되었습니다.

--▣ 생성된 오라클 사용자 계정(SCOTT)에 권한 부여
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT;
--==>> Grant을(를) 성공했습니다.

--▣ 생성된 오라클 사용자 계정(SCOTT)에 기본 테이블스페이스 설정
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
--User SCOTT이(가) 변경되었습니다.


--▣ 생성된 오라클 사용자 계정(SCOTT)에 임시 테이블스페이스 설정
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
--User SCOTT이(가) 변경되었습니다.

--### ※ ○ ★ 『』 ? ▣ ▶ ▼ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →  ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--==========[ 6월 XX일(금) ]=========================




