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


DESC TBL_INSABACKUP;
/* 
이름       널?       유형           
-------- -------- ------------ 
NUM      NOT NULL NUMBER(5)    
NAME     NOT NULL VARCHAR2(20) 
SSN      NOT NULL VARCHAR2(14) 
IBSADATE NOT NULL DATE         
CITY              VARCHAR2(10) 
TEL               VARCHAR2(15) 
BUSEO    NOT NULL VARCHAR2(15) 
JIKWI    NOT NULL VARCHAR2(15) 
BASICPAY NOT NULL NUMBER(10)   
SUDANG   NOT NULL NUMBER(10)   
*/

SELECT MAX(NUM)+1
FROM TBL_INSABACKUP;


SELECT COUNT(*)
FROM TBL_INSABACKUP;
/* 
 COUNT(*)
----------
        60
*/


--▣ 생성한 프로시저(PRC_INSA_INSERT)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
PRC_INSA_INSERT('김한국', '971006-1234567', SYSDATE, '서울', '010-4567-7564', '영업부', '대리', 500000,50000);


--▣ 실습 테이블 생성
-- 테이블 명: TBL_상품 
--한글로 만들지만 실무에서 절대 이렇게 하지말자 실습을 위한 테이블
CREATE TABLE TBL_상품
( 상품코드      VARCHAR2(20)
, 상품명        VARCHAR2(100)
, 소비자가격    NUMBER
, 재고수량      NUMBER  DEFAULT 0 --(NULL이면 아무리 더해져도 NULL 이므로)
, CONSTRAINT 상품_상품코드_PK PRIMARY KEY(상품코드)
);
-- ==>> Table TBL_상품이(가) 생성되었습니다.

--▣ 실습 테이블 생성(TBL_입고)
-- TBL_입고 테이블의 입고번호를 기본키(PK) 제약조건 설정
-- TBL_입고 테이블의 상품코드는 TBL_상품 테이블의 상품코드를
-- 참조할 수 있도록 외래키(FK) 제약조건 설정
CREATE TABLE TBL_입고
( 입고번호  NUMBER
, 상품코드  VARCHAR2(20)
, 입고일자  DATE DEFAULT SYSDATE
, 입고수량  NUMBER
, 입고단가  NUMBER
, CONSTRAINT 입고_입고번호_PK PRIMARY KEY(입고번호)
, CONSTRAINT 입고_상품코드_FK FOREIGN KEY(상품코드) REFERENCES TBL_상품(상품코드)
);
-- ==>> Table TBL_입고이(가) 생성되었습니다.

--▣ 데이터 입력 → TBL_상품 → 상품 등록
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H001', '홈런볼', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H002', '새우깡', 1200);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H003', '스윙칩', 1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H004', '치토스', 1100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H005', '포카칩', 2000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H006', '감자깡', 1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('H007', '고래밥', 1800);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C001', '오레오', 2000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C002', '빼빼로', 1800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C003', '초코칩', 1800);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C004', '에이스', 1700);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C005', '다이제', 2500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C006', '아이비', 1300);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('C007', '아이비', 1300);

INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E001', '마이쮸', 1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E002', '엠엔엠', 1100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E003', '아이셔', 1100);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E004', '비틀즈', 1200);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E005', '아폴로', 1000);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E006', '하리보', 1500);
INSERT INTO TBL_상품(상품코드, 상품명, 소비자가격) VALUES('E007', '새콜당', 1400);
-- ==>> 1 행 이(가) 삽입되었습니다. X 21회

-- 커밋
COMMIT;

SELECT *
FROM TBL_상품;

SELECT COUNT(*)
FROM TBL_상품;


SELECT *
FROM TBL_입고;
-- ==>> 선택된 행 없음

SELECT COUNT(*)
FROM TBL_입고;
/* 
  COUNT(*)
----------
         0
*/


SELECT MAX(입고번호) "결과확인"
FRO TBL_입고;
-- ==>> (null)

SELECT NVL(MAX(입고번호), 0) "결과확인"
FRO TBL_입고;
-- ==>> 0

SELECT MAX(NVL(입고번호, 0) "결과확인"
FRO TBL_입고;
-- ==>> (null)

EXEC PRC_입고_INSERT('H001', 10, 1000);

SELECT *
FROM TBL_상품;
/* 
상품코드                 상품명          소비자가격     재고수량
-------------------- ----------------- ---------- ----------
H001                 홈런볼                  1500         10
 */

SELECT COUNT(*)
FROM TBL_입고;
/* 
  COUNT(*)
----------
         1
*/

SELECT *
FROM TBL_입고;
/* 
      입고번호 상품코드                 입고일자             입고수량       입고단가
---------- -------------------- ---------- ---------- ----------
         1 H001                 2025-07-14         10       1000
 */


EXEC PRC_입고_INSERT('H001', 10, 1200);

SELECT *
FROM TBL_상품;
/* 
21개 행이 선택되었습니다. 


PL/SQL 프로시저가 성공적으로 완료되었습니다.


상품코드                 상품명          소비자가격    재고수량
-------------------- ----------------- ---------- ----------
H001                 홈런볼                  1500         20
 */

EXEC PRC_입고_INSERT('H002', 10, 1200);
-- ==> PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_입고_INSERT('H001', 10, 1000);
EXEC PRC_입고_INSERT('H002', 20, 1000);
EXEC PRC_입고_INSERT('H003', 30, 1000);
EXEC PRC_입고_INSERT('H004', 10, 1000);
EXEC PRC_입고_INSERT('H005', 20, 1000);

EXEC PRC_입고_INSERT('C001', 10, 1000);
EXEC PRC_입고_INSERT('C002', 20, 1000);
EXEC PRC_입고_INSERT('C003', 30, 1000);
EXEC PRC_입고_INSERT('C004', 10, 1000);
EXEC PRC_입고_INSERT('C005', 20, 1000);

EXEC PRC_입고_INSERT('E001', 10, 1000);
EXEC PRC_입고_INSERT('E002', 20, 1000);
EXEC PRC_입고_INSERT('E003', 30, 1000);
EXEC PRC_입고_INSERT('E004', 10, 1000);
EXEC PRC_입고_INSERT('E005', 20, 1000);
-- ==> PL/SQL 프로시저가 성공적으로 완료되었습니다. x 15


SELECT COUNT(*)
FROM TBL_입고;


SELECT *
FROM TBL_상품;
/* 

상품코드               상품명       소비자가격   재고수량
-------------------- ---------   ---------- ----------
H001                 홈런볼            1500         30
H002                 새우깡            1200         30
H003                 스윙칩            1000         30
H004                 치토스            1100         10
H005                 포카칩            2000         20
H006                 감자깡            1000          0
H007                 고래밥            1800          0
C001                 오레오            2000         10
C002                 빼빼로            1800         20
C003                 초코칩            1800         30
C004                 에이스            1700         10
C005                 다이제            2500         20
C006                 아이비            1300          0
C007                 아이비            1300          0
E001                 마이쮸            1000         10
E002                 엠엔엠            1100         20
E003                 아이셔            1100         30
E004                 비틀즈            1200         10
E005                 아폴로            1000         20
E006                 하리보            1500          0
E007                 새콜당            1400          0

21개 행이 선택되었습니다. 
*/


--▣▣▣ 프로시저 내에서의 예외 처리 ▣▣▣--
--▣ 실습 테이블 생성(TBL_MEMBER)
-- CITY에 입력할 수 있는 데이터는, 
-- 경기, 대전과 같은 특정 값만 입력이 가능하도록 하려고 하는 것.
CREATE TABLE TBL_MEMBER
( NUM       NUMBER
, NAME      VARCHAR2(30)
, TEL       VARCHAR2(60)
, CITY      VARCHAR2(60)
, CONSTRAINT MEMBER_NUM_PK PRIMARY KEY (NUM)
);
--==>> Table TBL_MEMBER이(가) 생성되었습니다.


--▣ 생성한 프로시저(PRC_MEMBER_INSERT)가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_MEMBER_INSERT('김한국', '010-1111-2222', '서울');
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_MEMBER_INSERT('김한일', '010-1111-2222', '경기');
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_MEMBER_INSERT('김한이', '010-1111-2222', '인천');
-- ==>> ORA-20001: 서울, 경기, 대전만 입력이 가능합니다.
EXEC PRC_MEMBER_INSERT('김한삼', '010-1111-2222', '충남');
-- ==>> ORA-20001: 서울, 경기, 대전만 입력이 가능합니다.
EXEC PRC_MEMBER_INSERT('김한칠', '010-1111-2222', '대전');
-- ==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_MEMBER;
/* 
 NUM NAME     TEL                 CITY    
---- -------- ------------------- --------
   1 김한국   010-1111-2222       서울    
   2 김한일   010-1111-2222       경기    
   3 김한칠   010-1111-2222       대전    
 */


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩  →   ←  ↓  …  ： º↑ /* */  ─ ┃ ┛┯ ┐┘ ￦
--/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
--/*================[ 7월 XX일(금) ]========================*/

-----------------[ 강사님 풀이 - START ] ------------------------------
-----------------[ 강사님 풀이 - END ] --------------------------------

-----------------[ 실습 - START ] ----------------------------
-----------------[ 실습 - END ] ------------------------------
