--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;

-------------------------------------------------------------------------------
-- ▣ 사용자 계정 생성 및 계정 정보 저장
CREATE USER micracle IDENTIFIED BY quantum;
-- ==>> User MICRACLE이(가) 생성되었습니다.

-- ▣ CONNECT는 DB 접속 권한을, RESOURCE는 공간 사용 권한을 부여
GRANT CONNECT, RESOURCE TO micracle;
-- Grant을(를) 성공했습니다.

-- ▣ 사용자 계정 상태 조회
select * 
from dba_users;