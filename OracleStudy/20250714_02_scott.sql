--/*================[ 7월 14일(월) ]========================*/
SELECT USER
FROM DUAL;
/*
USER                          
------------------------------
SCOTT
*/

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

-- 
-- SET SERVEROUTPUT ON;

--▣ INSERT 프로시저 실습을 위한 테이블 생성
-- 테이블명 : TBL_STUDENTS
CREATE TABLE TBL_STUDENTS
( ID     VARCHAR2(10)
, NAME   VARCHAR2(40)
, TEL    VARCHAR2(20)
, ADDR   VARCHAR2(100)
, CONSTRAINT STUDENTS_ID_PK PRIMARY KEY (ID)
);
-- ==>>  Table TBL_STUDENTS이(가) 생성되었습니다.

-- 테이블명 : TBL_IDPW
CREATE TABLE TBL_IDPW
( ID     VARCHAR2(10)
, PW     VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
-- ==>> Table TBL_IDPW이(가) 생성되었습니다.

-- 한 명의 학생 정보 등록 → 두 테이블 모두에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman','김한국','010-1111-5678','제주도 서귀포시');
-- 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman','java');
-- 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_STUDENTS;
/* 
ID         NAME                                     TEL                  ADDR                                                                                                
---------- ---------------------------------------- -------------------- ----------------------------------------------------------------------------------------------------
superman   김한국                                   010-1111-5678        제주도 서귀포시                                                                                       
 */

SELECT *
FROM TBL_IDPW;
/* 

ID         PW                  
---------- --------------------
superman   java           
 */


--※ 위의 업무를 프로시저(INSERT프로시저, 입력 프로시저)를 생성하여 처리하게 되면
EXEC PRC_STUDENTS_INSERT('happyday','java','김한국','010-2222-3456','서울시 마포구');
--▶ 위와 같은 구문 한 줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다.


--▣ 생성한 프로시저(PRC_STUDENTS_INSERT)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_INSERT('happyday','java007','김서울','010-3333-2222','서울 관악구');
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
/*
 ID         NAME                                     TEL                  ADDR                                                                                                
---------- ---------------------------------------- -------------------- ----------------------------------------------------------------------------------------------------
superman   김한국                                   010-1111-5678        제주도 서귀포시                                                                                       
happyday   김서울                                   010-3333-2222        서울 관악구                                                                                          
 */

SELECT *
FROM TBL_IDPW;
/* 
ID         PW                  
---------- --------------------
superman   java                
happyday   java007             
 */


--▣ INSERT 프로시저 실습을 위한 테이블 생성
-- 테이블명 : TBL_SUNGJUK
-- 학번, 이름, 국어점수, 영어점수, 수학점수 데이터를
-- 입력받을 수 있는 실습 테이블 생성
CREATE TABLE TBL_SUNGJUK
( HAKBUN     NUMBER
, NAME       VARCHAR2(40)
, KOR        NUMBER(3)
, ENG        NUMBER(3)
, MAT        NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
-- ==>> Table TBL_SUNGJUK이(가) 생성되었습니다.

-- 생성된 테이블에 컬럼 구조 변경(추가)
-- (총점 → TOT, 평균  → AVG 등급 →  GRADE)
ALTER TABLE TBL_SUNGJUK
ADD (TOT NUMBER(3), AVG  NUMBER(4, 1), GRADE CHAR);
-- ==>> Table TBL_SUNGJUK이(가) 변경되었습니다.

-- ※ 여기서 추가한 컬럼에 대한 항목들은 프로시저 실습을 위해 추가하는 것일 뿐
--    실제 테이블 구조에 적합하지도, 바람직하지도 않는 애용이다.
--     (국영수 점수로 등급 평균 총점 다 알 수 있는 것이기 때문에...)
 
--▣ 변경된 테이블 구조 확인
DESC TBL_SUNGJUK;
/* 
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)      
 */

-- 위의 업무를 프로시저를 생성하여 처리하게 되면
-- EXEC PRC_SUNGJUK_INSERT(1, '김한국', 90, 80, 70);
-- 이와 같이 구문 한 줄로 총점, 평균, 등급 모두 제대로 입력할 수 있다.

--▣ 생성한 프로시저(PRC_SUNGJUK_INSERT)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(1, '김한국', 90, 80, 70);
-- ==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

-- 롤백
ROLLBACK;

--▣ 데이터 확인
SELECT *
FROM TBL_SUNGJUK;
/* 
    HAKBUN NAME               KOR        ENG        MAT        TOT        AVG G
---------- ----------- ---------- ---------- ---------- ---------- ---------- -
         1 김한국              90         80         70        240         80 B
 */


-- → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(2, '김영국', 90, 50, 70);
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--▣ 데이터 확인
SELECT *
FROM TBL_SUNGJUK;
/* 
    HAKBUN NAME                   KOR        ENG        MAT        TOT        AVG G
---------- --------------- ---------- ---------- ---------- ---------- ---------- -
         1 김한국                  90         80         70        240         80 B
         2 김영국                  90         50         70        210         70 C
 */

-- → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(3, '김미국', 90, 90, 95);
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

--▣ 데이터 확인
SELECT *
FROM TBL_SUNGJUK;
/* 
    HAKBUN NAME              KOR        ENG        MAT        TOT        AVG G
---------- ---------- ---------- ---------- ---------- ---------- ---------- -
         1 김한국             90         80         70        240         80 B
         2 김영국             90         50         70        210         70 C
         3 김미국             90         90         95        275       91.7 A
 */



--▣ 생성한 프로시저(PRC_SUNGJUK_UPDATE)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_SUNGJUK_UPDATE(1, 50, 50, 50);
-- ==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.


--▣ 데이터 확인
SELECT *
FROM TBL_SUNGJUK;
/* 
    HAKBUN NAME               KOR        ENG        MAT        TOT        AVG G
---------- ----------- ---------- ---------- ---------- ---------- ---------- -
         1 김한국              50         50         50        150         50 F
         2 김영국              90         50         70        210         70 C
         3 김미국              90         90         95        275       91.7 A
 */


--▣ 변경 전 데이터 확인
SELECT *
FROM TBL_STUDENTS;
/* 
ID         NAME      TEL                  ADDR                       
---------- --------- -------------------- ---------------------------
superman   김한국    010-1111-5678        제주도 서귀포시              
happyday   김서울    010-3333-2222        서울 관악구                 
 */


--▣ 생성한 프로시저(PRC_SUNGJUK_UPDATE)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
--▣ 틀린 PW를 입력한 경우
EXEC PRC_STUDENTS_UPDATE('superman', 'java1111', '010-22222-8765', '인천 서구');
-- ==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
/* 
ID         NAME          TEL                  ADDR                       
---------- ------------- -------------------- ---------------------------
superman   김한국        010-1111-5678        제주도 서귀포시     ◀◀◀    
happyday   김서울        010-3333-2222        서울 관악구                
*/

--▣ 맞는 PW를 입력한 경우
EXEC PRC_STUDENTS_UPDATE('superman', 'java', '010-22222-8765', '인천 서구');
-- ==>>PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
/* 
ID         NAME         TEL                  ADDR                  
---------- ------------ -------------------- ----------------------
superman   김한국       010-22222-8765       인천 서구     ◀◀◀◀    
happyday   김서울       010-3333-2222        서울 관악구           
*/


DROP TABLE TBL_INSABACKUP;
-- ==>> Table TBL_INSABACKUP이(가) 삭제되었습니다.

CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
-- ==>> Table TBL_INSABACKUP이(가) 생성되었습니다.



SELECT *
FROM TBL_INSABACKUP;



-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
