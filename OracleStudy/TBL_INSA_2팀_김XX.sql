--○ 테이블 생성 (SCOTT.TBL_INSA)
CREATE TABLE TBL_INSA
( NUM      NUMBER(5)    NOT NULL
, NAME     VARCHAR2(20) NOT NULL
, SSN      VARCHAR2(14) NOT NULL
, IBSADATE DATE         NOT NULL
, CITY     VARCHAR2(10)
, TEL      VARCHAR2(15)
, BUSEO    VARCHAR2(15) NOT NULL
, JIKWI    VARCHAR2(15) NOT NULL
, BASICPAY NUMBER(10)   NOT NULL
, SUDANG   NUMBER(10)   NOT NULL
, CONSTRAINT TBL_INSA_NUM_PK PRIMARY KEY(NUM)
);
-- ==>> Table TBL_INSA이(가) 생성되었습니다.

--○ 데이터 입력
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1001, '홍길동', '771212-1022432', TO_DATE('1998-10-11', 'YYYY-MM-DD'), '서울', '011-2356-4528', '기획부', '부장', 2610000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1002, '이순신', '801007-1544236', TO_DATE('2000-11-29', 'YYYY-MM-DD'), '경기', '010-4758-6532', '총무부', '사원', 1320000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1003, '이순애', '770922-2312547', TO_DATE('1999-02-25', 'YYYY-MM-DD'), '인천', '010-4231-1236', '개발부', '부장', 2550000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1004, '김정훈', '790304-1788896', TO_DATE('2000-10-01', 'YYYY-MM-DD'), '전북', '019-5236-4221', '영업부', '대리', 1954200, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1005, '한석봉', '811112-1566789', TO_DATE('2004-08-13', 'YYYY-MM-DD'), '서울', '018-5211-3542', '총무부', '사원', 1420000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1006, '이기자', '780505-2978541', TO_DATE('2002-02-11', 'YYYY-MM-DD'), '인천', '010-3214-5357', '개발부', '과장', 2265000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1007, '장인철', '780506-1625148', TO_DATE('1998-03-16', 'YYYY-MM-DD'), '제주', '011-2345-2525', '개발부', '대리', 1250000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1008, '김영년', '821011-2362514', TO_DATE('2002-04-30', 'YYYY-MM-DD'), '서울', '016-2222-4444', '홍보부', '사원', 950000 , 145000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1009, '나윤균', '810810-1552147', TO_DATE('2003-10-10', 'YYYY-MM-DD'), '경기', '019-1111-2222', '인사부', '사원', 840000 , 220400);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1010, '김종서', '751010-1122233', TO_DATE('1997-08-08', 'YYYY-MM-DD'), '부산', '011-3214-5555', '영업부', '부장', 2540000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1011, '유관순', '801010-2987897', TO_DATE('2000-07-07', 'YYYY-MM-DD'), '서울', '010-8888-4422', '영업부', '사원', 1020000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1012, '정한국', '760909-1333333', TO_DATE('1999-10-16', 'YYYY-MM-DD'), '강원', '018-2222-4242', '홍보부', '사원', 880000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1013, '조미숙', '790102-2777777', TO_DATE('1998-06-07', 'YYYY-MM-DD'), '경기', '019-6666-4444', '홍보부', '대리', 1601000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1014, '황진이', '810707-2574812', TO_DATE('2002-02-15', 'YYYY-MM-DD'), '인천', '010-3214-5467', '개발부', '사원', 1100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1015, '이현숙', '800606-2954687', TO_DATE('1999-07-26', 'YYYY-MM-DD'), '경기', '016-2548-3365', '총무부', '사원', 1050000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1016, '이상헌', '781010-1666678', TO_DATE('2001-11-29', 'YYYY-MM-DD'), '경기', '010-4526-1234', '개발부', '과장', 2350000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1017, '엄용수', '820507-1452365', TO_DATE('2000-08-28', 'YYYY-MM-DD'), '인천', '010-3254-2542', '개발부', '사원', 950000 , 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1018, '이성길', '801028-1849534', TO_DATE('2004-08-08', 'YYYY-MM-DD'), '전북', '018-1333-3333', '개발부', '사원', 880000 , 123000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1019, '박문수', '780710-1985632', TO_DATE('1999-12-10', 'YYYY-MM-DD'), '서울', '017-4747-4848', '인사부', '과장', 2300000, 165000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1020, '유영희', '800304-2741258', TO_DATE('2003-10-10', 'YYYY-MM-DD'), '전남', '011-9595-8585', '자재부', '사원', 880000 , 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1021, '홍길남', '801010-1111111', TO_DATE('2001-09-07', 'YYYY-MM-DD'), '경기', '011-9999-7575', '개발부', '사원', 875000 , 120000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1022, '이영숙', '800501-2312456', TO_DATE('2003-02-25', 'YYYY-MM-DD'), '전남', '017-5214-5282', '기획부', '대리', 1960000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1023, '김인수', '731211-1214576', TO_DATE('1995-02-23', 'YYYY-MM-DD'), '서울', NULL           , '영업부', '부장', 2500000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1024, '김말자', '830225-2633334', TO_DATE('1999-08-28', 'YYYY-MM-DD'), '서울', '011-5248-7789', '기획부', '대리', 1900000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1025, '우재옥', '801103-1654442', TO_DATE('2000-10-01', 'YYYY-MM-DD'), '서울', '010-4563-2587', '영업부', '사원', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1026, '김숙남', '810907-2015457', TO_DATE('2002-08-28', 'YYYY-MM-DD'), '경기', '010-2112-5225', '영업부', '사원', 1050000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1027, '김영길', '801216-1898752', TO_DATE('2000-10-18', 'YYYY-MM-DD'), '서울', '019-8523-1478', '총무부', '과장', 2340000, 170000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1028, '이남신', '810101-1010101', TO_DATE('2001-09-07', 'YYYY-MM-DD'), '제주', '016-1818-4848', '인사부', '사원', 892000 , 110000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1029, '김말숙', '800301-2020202', TO_DATE('2000-09-08', 'YYYY-MM-DD'), '서울', '016-3535-3636', '총무부', '사원', 920000 , 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1030, '정정해', '790210-2101010', TO_DATE('1999-10-17', 'YYYY-MM-DD'), '부산', '019-6564-6752', '총무부', '과장', 2304000, 124000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1031, '지재환', '771115-1687988', TO_DATE('2001-01-21', 'YYYY-MM-DD'), '서울', '019-5552-7511', '기획부', '부장', 2450000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1032, '심심해', '810206-2222222', TO_DATE('2000-05-05', 'YYYY-MM-DD'), '전북', '016-8888-7474', '자재부', '사원', 880000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1033, '김미나', '780505-2999999', TO_DATE('1998-06-07', 'YYYY-MM-DD'), '서울', '011-2444-4444', '영업부', '사원', 1020000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1034, '이정석', '820505-1325468', TO_DATE('2005-09-26', 'YYYY-MM-DD'), '경기', '011-3697-7412', '기획부', '사원', 1100000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1035, '정영희', '831010-2153252', TO_DATE('2002-05-16', 'YYYY-MM-DD'), '인천', NULL           , '개발부', '사원', 1050000, 140000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1036, '이재영', '701126-2852147', TO_DATE('2003-08-10', 'YYYY-MM-DD'), '서울', '011-9999-9999', '자재부', '사원', 960400 , 190000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1037, '최석규', '770129-1456987', TO_DATE('1998-10-15', 'YYYY-MM-DD'), '인천', '011-7777-7777', '홍보부', '과장', 2350000, 187000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1038, '손인수', '791009-2321456', TO_DATE('1999-11-15', 'YYYY-MM-DD'), '부산', '010-6542-7412', '영업부', '대리', 2000000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1039, '고순정', '800504-2000032', TO_DATE('2003-12-28', 'YYYY-MM-DD'), '경기', '010-2587-7895', '영업부', '대리', 2010000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1040, '박세열', '790509-1635214', TO_DATE('2000-09-10', 'YYYY-MM-DD'), '경북', '016-4444-7777', '인사부', '대리', 2100000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1041, '문길수', '721217-1951357', TO_DATE('2001-12-10', 'YYYY-MM-DD'), '충남', '016-4444-5555', '자재부', '과장', 2300000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1042, '채정희', '810709-2000054', TO_DATE('2003-10-17', 'YYYY-MM-DD'), '경기', '011-5125-5511', '개발부', '사원', 1020000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1043, '양미옥', '830504-2471523', TO_DATE('2003-09-24', 'YYYY-MM-DD'), '서울', '016-8548-6547', '영업부', '사원', 1100000, 210000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1044, '지수환', '820305-1475286', TO_DATE('2004-01-21', 'YYYY-MM-DD'), '서울', '011-5555-7548', '영업부', '사원', 1060000, 220000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1045, '홍원신', '690906-1985214', TO_DATE('2003-03-16', 'YYYY-MM-DD'), '전북', '011-7777-7777', '영업부', '사원', 960000 , 152000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1046, '허경운', '760105-1458752', TO_DATE('1999-05-04', 'YYYY-MM-DD'), '경남', '017-3333-3333', '총무부', '부장', 2650000, 150000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1047, '산마루', '780505-1234567', TO_DATE('2001-07-15', 'YYYY-MM-DD'), '서울', '018-0505-0505', '영업부', '대리', 2100000, 112000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1048, '이기상', '790604-1415141', TO_DATE('2001-06-07', 'YYYY-MM-DD'), '전남', NULL           , '개발부', '대리', 2050000, 106000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1049, '이미성', '830908-2456548', TO_DATE('2000-04-07', 'YYYY-MM-DD'), '인천', '010-6654-8854', '개발부', '사원', 1300000, 130000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1050, '이미인', '810403-2828287', TO_DATE('2003-06-07', 'YYYY-MM-DD'), '경기', '011-8585-5252', '홍보부', '대리', 1950000, 103000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1051, '권영미', '790303-2155554', TO_DATE('2000-06-04', 'YYYY-MM-DD'), '서울', '011-5555-7548', '영업부', '과장', 2260000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1052, '권옥경', '820406-2000456', TO_DATE('2000-10-10', 'YYYY-MM-DD'), '경기', '010-3644-5577', '기획부', '사원', 1020000, 105000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1053, '김싱식', '800715-1313131', TO_DATE('1999-12-12', 'YYYY-MM-DD'), '전북', '011-7585-7474', '자재부', '사원', 960000 , 108000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1054, '정상호', '810705-1212141', TO_DATE('1999-10-16', 'YYYY-MM-DD'), '강원', '016-1919-4242', '홍보부', '사원', 980000 , 114000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1055, '정한나', '820506-2425153', TO_DATE('2004-06-07', 'YYYY-MM-DD'), '서울', '016-2424-4242', '영업부', '사원', 1000000, 104000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1056, '전용재', '800605-1456987', TO_DATE('2004-08-13', 'YYYY-MM-DD'), '인천', '010-7549-8654', '영업부', '대리', 1950000, 200000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1057, '이미경', '780406-2003214', TO_DATE('1998-02-11', 'YYYY-MM-DD'), '경기', '016-6542-7546', '자재부', '부장', 2520000, 160000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1058, '김신제', '800709-1321456', TO_DATE('2003-08-08', 'YYYY-MM-DD'), '인천', '010-2415-5444', '기획부', '대리', 1950000, 180000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1059, '임수봉', '810809-2121244', TO_DATE('2001-10-10', 'YYYY-MM-DD'), '서울', '011-4151-4154', '개발부', '사원', 890000 , 102000);
INSERT INTO TBL_INSA (NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
VALUES (1060, '김신애', '810809-2111111', TO_DATE('2001-10-10', 'YYYY-MM-DD'), '서울', '011-4151-4444', '개발부', '사원', 900000 , 102000);
-- ==>> 1 행 이(가) 삽입되었습니다.

--※ 세션 기본값 설정
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SELECT *
FROM TBL_INSA;


--○ 커밋
COMMIT;
-- ==>> 커밋 완료.

 

------------------------------------------------------------------------------------------------------------
--2조_김XX
-- 금요일 까지 , 해결한 문제는 주석처리(결과도), 쿼리문만 주석처리(X)
01. TBL_INSA 테이블 전체자료 조회

02. SCOTT 사용자 소유 테이블 목록 확인(2가지 구문 활용)

--03. TBL_INSA 테이블 구조 확인
DESC TBL_INSA;
--==>>
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

04. TBL_INSA 테이블의 이름(NAME), 기본급(BASICPAY) 조회

05. TBL_INSA 테이블의 이름(NAME), 기본급(BASICPAY), 수당(SUDANG), 기본급+수당 조회

06. TBL_INSA 테이블의 이름(NAME), 출신도(CITY), 부서명(BUSEO) 조회. 별칭(ALIAS) 사용.


07. 서울 사람의 이름(NAME), 출신도(CITY), 부서명(BUSEO), 직위(JIKWI) 조회

08. 출신도가 서울 사람이면서       --> WHERE 구문
    기본급이 150만원 이상인 사람   --> WHERE 구문
    조회 (NAME, CITY, BASICPAY, SSN)

09. 출신도가 '인천' 이면서, 기본급이 100만원이상 ~ 200만원 미만인 경우만 모든정보 조회.

10. 출신도가 서울 사람이거나 부서가 개발부인 자료 조회 (NAME, CITY, BUSEO)

11. 출신도가 서울, 경기인 사람만 조회 (NAME, CITY, BUSEO). IN 연산자 사용.

12. 부서가 '개발부' 이거나 '영업부'인 사원의 모든정보 조회. IN 연산자 사용.

13. 급여(BASICPAY + SUDANG)가 250만원 이상인 사람 조회. --> WHERE 구문
    단, 필드명은 한글로 출력. --> 별칭(ALIAS)
    (NAME, BASICPAY, SUDANG, BASICPAY+SUDANG)

14. 주민번호를 기준으로 남자(성별 자릿수가 1, 3)만 조회. 
    ( 이름(NAME), 주민번호(SSN) )
    단, SUBSTR() 함수 이용.

15. 주민번호를 기준으로 80년대 태어난 사람만 조회. 
    ( 이름(NAME), 주민번호(SSN) )

16. 서울 사람 중에서 70년대 태어난 사람만 조회. SUBSTR() 함수 이용.

17. 서울 사람 중에서 70년대 태어난 남자만 조회. SUBSTR() 함수 이용.

18. 서울 사람이면서 김씨만 조회
    단, 성씨가 한 글자라는 가정. 
    ( 이름, 출신도 )
    SUBSTR() 함수 이용.

19. 2000년도에 입사한 사람 조회. (이름, 출신도, 입사일).

20. 2000년 10월에 입사한 사람 조회. (이름, 출신도, 입사일).

21. 주민번호를 기준으로 직원의 나이 조회.
    단, 모든 직원이 1900년대에 태어났다는 가정. (이름, 주민번호, 나이)

22. 주민번호 기준으로 현재 나이대가 20대인 사람만 조회.

23. 주민번호 기준으로 5월 생만 조회. 
    단, SUBSTR() 함수 이용.

24. 주민번호 기준으로 5월 생만 조회. 
    단, TO_CHAR() 함수 이용.

25. 출신도 내림차순으로 정렬하고, 출신도가 같으면 기본급 내림차순 정렬 조회

26. 서울 사람 중에서 기본급+수당(→급여) 내림차순으로 정렬.
    ( 이름, 출신도, 기본급+수당 )

27. 여자 중 부서 오름차순으로 정렬하고, 부서가 같으면 기본급 내림차순 정렬. 
    ( 이름, 주민번호, 부서, 기본급 )

28. 남자 중 나이를 기준으로 오름차순 정렬하여 조회.

29. 서울 지역 사람들 중에서 입사일이 빠른 사람을 먼저 볼 수 있도록 조회.

30. 성씨가 김씨가 아닌 사람 조회. 
    단, 성씨는 한 글자라고 가정.
    ( 이름, 출신도, 기본급 ).

31. 출신도가 서울, 부산, 대구 이면서
    전화번호에 5 또는 7이 포함된 데이터를 조회하되
    부서명의 마지막 부는 출력되지 않도록함. (개발부 → 개발)
    ( 이름, 출신도, 부서명, 전화번호 )

32. 전화번호가 있으면 '-'을 제거하여 조회하고, 
    없으면 '전화번호없음'으로 조회.

추가문제. (기본 문제 풀이가 모두 끝난 후 작성한다.)
          HR계정의 EMPLOYEES 테이블에서 커미션 받는 사람의 수와
          안받는 사람의 수를 조회한다.
          출력형태 ---------------
              구분        인원수
          커미션받는사원    XXX
          커미션없는사원    XXX
          모든사원          XXX

33. TBL_INSA 테이블에서 BASICPAY + SUDANG 이 
    100만원 미만, 100만원 이상~200만원 미만, 
    200만원 이상인 직원들의 수 조회.

34. TBL_INSA 테이블에서 주민번호를 가지고 생년월일의 년도별 직원수 조회.

35. 주민번호를 기준으로 월별 오름차순, 월이 같으면 년도 내림차순 조회.
    (이름, 주민번호)

36. 입사일을 기준으로  월별 오름차순, 월이 같으면 년도 내림차순 조회.
    단, 모든 정보 조회.
    (주의. 입사일은 자료형이 DATE이다.)

37. 전체인원수, 남자인원수, 여자인원수를 동시 조회.

38. 개발부, 영업부, 총무부 인원수 조회.  COUNT(), DECODE() 함수 이용.

39. 서울 사람의 남자 인원수 조회.

40. 부서가 영업부이고, 남자 인원수, 여자 인원수 조회.  COUNT(), DECODE() 함수 이용.

41. 개발부, 영업부, 총무부 인원수 조회. 단, 지역은 '서울'로 한정.

42. 서울 사람의 남자와 여자의 기본급합 조회.

43. 남자와 여자의 기본급 평균값 조회. AVG(), DECODE() 함수 이용.

44. 개발부의 남자, 여자 기본급 평균값 조회.

45. 부서별 남자와 여자 인원수 구하기

46. 지역별 남자와 여자 인원수 구하기

47. 입사년도별 남자와 여자 인원수 구하기

48. 영업부, 총무부 인원만을 가지고 입사년도별 남자와 여자 인원수 구하기

49. 서울 사람중 부서별 남자와 여자인원수, 남자와 여자 급여합 조회.

50. 부서별 인원수 출력. 인원수가 10 이상인 경우만.

51. 부서별 남,여 인원수 출력. 여자인원수가 5명 이상인 부서만 조회.

52. 이름, 성별, 나이 조회
    성별: 주민번호 활용 1,3 → 남자, 2,4 → 여자 (DECODE() 사용)
    나이: 주민번호 활용

53. 서울 사람 중에서 기본급이 200만원 이상인 사람 조회. 
    ( 이름, 기본급 )

54. 입사월별 인원수 구하기. (월, 인원수)   COUNT, GROUP BY, TO_CHAR 사용
    출력형태 ----------
     월  인원수
    1월    10명
    2월    25명


55. 이름, 생년월일, 기본급, 수당을 조회.
    생년월일은 주민번호 기준 (2000-10-10 형식으로 출력)
    기본급은 \1,000,000 형식으로 출력

56. 이름, 출신도, 기본급을 조회하되 출신도 내림차순 출력(1차 정렬 기준).
    출신도가 같으면 기본급 오름차순 출력(2차 정렬 기준).

57. 전화번호가 NULL이 아닌것만 조회. (이름, 전화번호)

58. 근무년수가 10년 이상인 사람 조회. (이름, 입사일)

59. 주민번호를 기준으로 75~82년생 조회. (이름, 주민번호, 출신도).
    SUBSTR() 함수, BEWTEEN AND 구문, TO_NUMBER() 함수 이용.

60. 근무년수가 5~10년인 사람 조회. (이름, 입사일)

61. 김씨, 이씨, 박씨만 조회 (이름, 부서). SUBSTR() 함수 이용.

62. 입사일을 "년-월-일 요일" 형식으로 남자만 조회 (이름, 주민번호, 입사일)

63. 부서별 직위별 급여합 구하기. (부서, 직위, 급여합)

64. 부서별 직위별 인원수, 급여합, 급여평균 구하기. (부서, 직위, 급여합)

65. 부서별 직위별 인원수를 구하되 인원수가 5명 이상인 경우만 조회.

66. 2000년에 입사한 여사원 조회. (이름, 주민번호, 입사일)

67. 성씨가 한 글자(김, 이, 박 등)라는 가정하에 성씨별 인원수 조회 (성씨, 인원수)

68. 출신도(CITY)별 성별 인원수 조회.

69. 부서별 남자인원수가 5명 이상인 부서와 남자인원수 조회.

70. 입사년도별 인원수 조회.

71. 전체인원수, 2000년, 1999년, 1998년도에 입사한 인원을 다음의 형식으로 조회.
    출력형태 ---------------    
    전체 2000 1999 1998
      60    x    x    x

72. 아래 형식으로 지역별 인원수 조회.
    출력형태 -----------------
    전체 서울  인천  경기
      60    x     x     x

73. 기본급(BASICPAY)이 평균 이하인 사원 조회. (이름, 기본급). AVG() 함수. 서브쿼리.

74. 기본급 상위 10%만 조회. (이름, 기본급)

75. 기본급 순위가 5순위까지만 조회. (모든 정보)

76. 입사일이 빠른 순서로 5순위까지만 조회. (모든 정보)

77. 평균 급여보다 많은 급여를 받는 직원 정보 조회. (모든 정보)

78. '이순애' 직원의 급여보다 더 많은 급여를 받는 직원 조회. (모든 정보)
    단, 이순애 직원의 급여가 변하더라도 작성된 쿼리문은 기능 수행이 가능하도록 조회.

79. 총무부의 평균 급여보다 많은 급여를 받는 직원들의 이름, 부서명 조회.

80. 총무부 직원들의 평균 수당보다 더 많은 수당을 받는 직원 정보 조회.

81. 직원 전체 평균 급여보다 많은 급여를 받는 직원의 수 조회.

82. '홍길동' 직원과 같은 부서의 직원 정보 조회.
    단, 홍길동 직원의 부서가 바뀌더라도 작성된 쿼리문은 기능 수행이 가능하도록 조회.

83. '김신애' 직원과 같은 부서, 직위를 가진 직원 정보 조회.
    단, 김신애 직원의 부서 및 직위가 바뀌더라도 작성된 쿼리문은 기능 수행이 가능하도록 조회.

84. 부서별 기본급이 가장 높은 사람 조회. (이름, 부서, 기본급)
    단, 사원들의 기본급이 변경되더라도 작성된 쿼리문은 기능 수행이 가능하도록 조회.

85. 남, 여별 기본급 순위 조회.

86. 지역(CITY)별로 급여(기본급+수당) 1순위 직원만 조회.

87. 부서별 인원수가 가장 많은 부서 및 인원수 조회.

88. 지역(CITY)별 인원수가 가장 많은 지역 및 인원수 조회.

89. 지역(CITY)별 평균 급여(BASICPAY + SUDANG)가
    가장 높은 지역 및 평균급여 조회.

90. 여자 인원수가 가장 많은 부서 및 인원수 조회.

91. 지역별 인원수 순위 조회.

92. 지역별 인원수 순위 조회하되 5순위까지만 출력.

93. 이름, 부서, 출신도, 기본급, 수당, 기본급+수당, 세금, 실수령액 조회
    단, 세금: 총급여가 250만원 이상이면 2%, 200만원 이상이면 1%, 나머지 0.
    실수령액: 총급여-세금

94. 부서별 평균 급여를 조회하되, A, B, C 등급으로 나눠서 출력.
    200만원 초과 - A등급
    150~200만원  - B등급
    150만원 미만 - C등급

95. 기본급+수당이 가장 많은 사람의 이름, 기본급+수당 조회.
    MAX() 함수, 하위 쿼리 이용.


----------------------------------------------------------------------------
















