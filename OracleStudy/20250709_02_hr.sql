--▣ 접속된 사용자 확인
SELECT USER
FROM DUAL;
--==>>  HR

--▣ HR 계정 소유의 테이블 또는 뷰 목록 조회
SELECT *
FROM TAB;
/*
TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
BIN$b5MwHDKdQdCK6LgNOM7rSA==$0 TABLE             
COUNTRIES                      TABLE             
DEPARTMENTS                    TABLE             
EMPLOYEES                      TABLE             
EMP_DETAILS_VIEW               VIEW              
JOBS                           TABLE             
JOB_HISTORY                    TABLE             
LOCATIONS                      TABLE             
REGIONS                        TABLE             
TBL_BOARD                      TABLE             
TBL_EMP1                       TABLE             
TBL_EMP2                       TABLE             
TBL_EMP3                       TABLE             
TBL_JOBS                       TABLE             
TBL_TEST1                      TABLE             
TBL_TEST10                     TABLE             
TBL_TEST11                     TABLE             
TBL_TEST12                     TABLE             
TBL_TEST13                     TABLE             
TBL_TEST14                     TABLE             
TBL_TEST2                      TABLE             
TBL_TEST3                      TABLE             
TBL_TEST4                      TABLE             
TBL_TEST5                      TABLE             
TBL_TEST6                      TABLE             
TBL_TEST7                      TABLE             
TBL_TEST8                      TABLE             
TBL_TEST9                      TABLE             
TBL_TESTMEMBER                 TABLE             
VIEW_CONSTCHECK                VIEW              

30개 행이 선택되었습니다. 
*/
-------------------------------------------------------------------------------

--▣▣▣  팀별 실습 과제 ▣▣▣---
-- HR 샘플스키마 DRD를 이용한 테이블 재구성~!!!


-- 팀별로... HR 스키마에 있는 기본 테이블(7개)
-- COUNTRIES / DEPARTMENTS / EMPLOYEES / JOBS / JOB_HISTORY / LOCATIONS / REGIONS


-- 단, 생성하는 테이블 이름은 [기존테이블명+팀번호]
-- COUNTRIES1 / DEPARTMENTS1 / EMPLOYEES1 / JOBS1 / JOB_HISTORY1 / LOCATIONS1 / REGIONS1
-- 과 같이 구성한다.

-- 1. 기존 테이블의 정보 수집
-- 2. 테이블 생성(컬럼 이름, 자료형, DEFAULT 표현식, NOT NULL 등....)
--    제약조건 설정
-- 3. 작성 후 데이터 입력
-- 4. 제출 항목
--    - 20250709_02_hr_팀별실습과제_1.sql
--    - 후기_1.txt
-- 5. 제출 기한
--     - 내일오전 결정....

-------------------------------------------------------------------------------
-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
