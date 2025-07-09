--▣ 접속된 사용자 확인
-- SELECT USER
-- FROM DUAL;
--==>>  HR

--▣ HR 계정 소유의 테이블 또는 뷰 목록 조회
-- SELECT *
-- FROM TAB;
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


-------------------------------[REGIONS2 - START]---------------------------------------
-- SELECT *
-- FROM REGIONS;
/*

 REGION_ID REGION_NAME              
---------- -------------------------
         1 Europe                   
         2 Americas                 
         3 Asia                     
         4 Middle East and Africa   
*/

-- DESC REGIONS;
/*
이름          널?       유형           
----------- -------- ------------ 
REGION_ID   NOT NULL NUMBER       
REGION_NAME          VARCHAR2(25) 
*/

--○ 제약조건 변경 후 제약조건 확인
-- SELECT *
-- FROM VIEW_CONSTCHECK
-- WHERE TABLE_NAME='REGIONS';
/*

OWNER     CONSTRAINT_NAME     TABLE_NAME   C COLUMN_NAME      SEARCH_CONDITION             DELETE_RU
--------- ------------------- ------------ - ---------------- ---------------------------- ---------
HR        REGION_ID_NN        REGIONS      C REGION_ID        "REGION_ID" IS NOT NULL               
HR        REG_ID_PK           REGIONS      P REGION_ID                                              
*/

--▣ 테이블 생성
--- 테이블명 : REGIONS2
--- 제약조건 : 
--        REG_ID_PK     -   NOT NULL ( REGION_ID)
--        REGION_ID_NN  -   PRIMAR KEY ( REGION_ID)
--            ▼            ▼            ▼
--        REGIONS2_REG_ID_PK     -   NOT NULL ( REGION_ID)
--        REGION_ID_NREGIONS2_REGION_ID_NNN2  -   PRIMAR KEY ( REGION_ID)
CREATE TABLE REGIONS2
( REGION_ID      NUMBER
, REGION_NAME    VARCHAR2(25)
, CONSTRAINT REGIONS2_REG_ID_PK PRIMARY KEY(REGION_ID)
, CONSTRAINT REGIONS2_REGION_ID_NN CHECK(REGION_ID IS NOT NULL)
)
-- Table REGIONS2이(가) 생성되었습니다.

--▣ 테이블 구조 확인
-- DESC REGIONS2;
/*
이름          널?       유형           
----------- -------- ------------ 
REGION_ID   NOT NULL NUMBER       
REGION_NAME          VARCHAR2(25) 
*/

--○ 제약조건 변경 후 제약조건 확인
-- SELECT *
-- FROM VIEW_CONSTCHECK
-- WHERE TABLE_NAME='REGIONS';
/*

OWNER    CONSTRAINT_NAME    TABLE_NAME    C COLUMN_NAME    SEARCH_CONDITION             DELETE_RU
-------- ------------------ ------------- - -------------- ---------------------------- ---------
HR       REGION_ID_NN       REGIONS       C REGION_ID      "REGION_ID" IS NOT NULL               
HR       REG_ID_PK          REGIONS       P REGION_ID                                            

*/

--▣ 데이터 입력
INSERT INTO REGIONS2(REGION_ID, REGION_NAME) VALUES(1, 'Europe');
INSERT INTO REGIONS2(REGION_ID, REGION_NAME) VALUES(2, 'Americas');
INSERT INTO REGIONS2(REGION_ID, REGION_NAME) VALUES(3, 'Asia');
INSERT INTO REGIONS2(REGION_ID, REGION_NAME) VALUES(4, 'Middle East and Africa');
-- 1 행 이(가) 삽입되었습니다. x 4회



--▣ 데이터 확인
-- SELECT *
-- FROM REGIONS2;
/*
REGION_ID REGION_NAME              
---------- -------------------------
         1 Europe                   
         2 Americas                 
         3 Asia                     
         4 Middle East and Africa 
*/


--▣ 커밋
COMMIT;
-------------------------------[REGIONS2 - END]---------------------------------------

-------------------------------[JOBS - START]---------------------------------------

CREATE TABLE JOBS2
( JOB_ID VARCHAR2(10)
, JOB_TITLE VARCHAR2(35)
, MIN_SALARY NUMBER(6)
, MAX_SALARY NUMBER(6)
, CONSTRAINT JOBS2_JOB_ID_PK PRIMARY KEY(JOB_ID)
, CONSTRAINT JOBS2_JOB_TITLE_NN CHECK(JOB_TITLE IS NOT NULL)
);

INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('AD_PRES', 'President', 20080, 40000); --
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('AD_VP', 'Administration Vice President', 15000, 30000); --
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('AD_ASST', 'Administration Assistant', 3000, 6000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('FI_MGR', 'Finance Manager', 8200, 16000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('FI_ACCOUNT', 'Accountant', 4200, 9000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('AC_MGR', 'Accounting Manager', 8200,16000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('AC_ACCOUNT', 'Public Accountant', 4200,9000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('SA_MAN', 'Sales Manager', 10000, 20080);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('SA_REP', 'Sales Representative', 6000, 12008);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('PU_MAN', 'Purchasing Manager', 8000, 15000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('ST_MAN', 'Stock Manager', 5500, 8500);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('ST_CLERK', 'Stock Clerk', 2008, 5000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('SH_CLERK', 'Shipping Clerk', 2500, 5500);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('IT_PROG', 'Programmer', 4000, 10000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('MK_MAN', 'Marketing Manager', 9000, 15000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('MK_REP', 'Marketing Representative', 4000, 9000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('HR_REP', 'Human Resources Representative', 4000, 9000);
INSERT INTO JOBS2(JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES ('PR_REP', 'Public Relations Representative', 4500, 10500);

--▣ 커밋
COMMIT;



-------------------------------[JOBS - END]---------------------------------------


-------------------------------------------------------------------------------
-- ### --▣ --※ --○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[  강사님 풀이 - END  ] ------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[  실습 - END  ] ----------------------------
