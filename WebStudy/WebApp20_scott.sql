SELECT USER
FROM DUAL;
/* 
USER
------------------------------
SCOTT
*/

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;


--○ 실습 테이블 생성
-- 테이블명 : TBL_BOARD
CREATE TABLE TBL_BOARD
( NUM       NUMBER(9)                   NOT NULL    -- 게시물 번호
, NAME      VARCHAR2(30)                NOT NULL    -- 게시물 작성자  // 회원가입 연동시 - ID 로 식별
, PWD       VARCHAR2(20)                NOT NULL    -- 게시물 암호    // 회원가입 연동시 - 암호 필요X
, EMAIL     VARCHAR2(50)                            -- 게시물 이메일
, SUBJECT   VARCHAR2(100)               NOT NULL    -- 게시물 제목
, CONTENT   VARCHAR2(4000)              NOT NULL    -- 게시물 내용   // 첨부파일, 스마트에디터 구성 시 별도로 테이블 생성하는 경우도 많다.
, IPADDR    VARCHAR2(20)                            -- 접속한 클라이언트 IP 주소  // 작성자의 IP
, HITCOUNT  NUMBER      DEFAULT 0       NOT NULL    -- 게시물 조회수  // 최근에는 로그 기록(별도의 로그 테이블 생성하여)으로 확인, 별도 관리하는 경우도 많다. 
, CREATED   DATE        DEFAULT SYSDATE NOT NULL    -- 게시물 작성일  //-- 업무정책상 : 최초 입력일, 최총수정일 등...
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)          -- 게시물 번호에 PK 제약조건 설정
);

--
COMMIT;

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM
FROM TBL_BOARD;

--> 한줄 구성 
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED )
VALUES(1, 'KIM', '1234', 'cgs@test.com', '첫번째 게시물입니다.', '첫번째 게시물 내용입니다.','211.238.142.161', 0, SYSDATE);

--○ 한 줄 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED ) VALUES(1, 'KIM', '1234', 'cgs@test.com', '첫번째 게시물입니다.', '첫번째 게시물 내용입니다.','211.238.142.161', 0, SYSDATE);

--○ 확인
SELECT * FROM TBL_BOARD;

-- 롤백
ROLLBACK;

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD;
/* 
     COUNT
----------
      2673
*/


--○ 한 줄 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;

---------------------
-- ○ 특정 영역의 (시작번호 ~ 끝번호) 게시물 목록을 읽어오는 쿼리문 구성
--    번호, 작성자, 제목, 조회수, 작성일
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM (
    SELECT ROWNUM RNUM, DATA.*
    FROM(
        SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
        FROM TBL_BOARD
        -- WHERE SUBJECT LIKE '%검색어%'
        -- WHERE NAME LIKE '%검색어%'
        -- WHERE CONTENT LIKE '%검색어%'
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10
-- ORDER BY RNUM DESC
;

--
SELECT *
FROM TBL_BOARD
ORDER BY NUM;

-- 위의 구문을 테스트하기 위한 특정 게시물 삭제
DELETE
FROM TBL_BOARD
WHERE NUM IN (2,4,5,8,11,12);

--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD
SET HITCOUNT = HITCOUNT + 1  -- 조회수 1 증가, HITCOUNT += 1 -- HITCOUNT++
WHERE NUM = 1;

-- 실무적 -> 접근 상세 내역 테이블 -> COUNT() -> 통계

SELECT *
FROM TBL_BOARD
ORDER BY NUM;


COMMIT;

--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
-- 조회항목: 게시물번호, 작성자, 패스워드, 이메일, 제목, 내용, IP주소, 조회수, 작성일
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT
      , TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    --   , TO_CHAR(CREATED, 'YYYY-MM-DD HH24:MI:SS') AS CREATED
FROM TBL_BOARD
WHERE NUM = 1630;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE
FROM TBL_BOARD
WHERE NUM = 500;

-- 커밋
COMMIT;

--○ 특정 게시물을 수정하는 쿼리문 구성
--  (게시물 상세보기 페이지 → Article.jsp 내에서의 처리)
-- 수정가능항목: 작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD
SET NAME = '도우너'
   , PWD = '59876'
   , EMAIL = 'dwn@test.com'
    , SUBJECT = '수정한 제목'
    , CONTENT = '수정한 내용'
WHERE NUM = 22;

SELECT *
FROM TBL_BOARD
WHERE NUM = 22;

-- 테스트 용도
UPDATE TBL_BOARD
SET  CONTENT = '수정한 내용 \n 2줄 \n 3줄 \n 4줄 \n 5줄 \n 6줄 \n 7줄 \n 8줄 \n 9줄 \n 10줄 \n 11줄 \n 12줄 \n 13줄 \n 14줄 \n 15줄 \n 16줄 \n 17줄 \n 18줄 \n 19줄 \n 20줄'
WHERE NUM = 22;

SELECT *
FROM TBL_BOARD
WHERE NUM = 22;


-- 커밋
COMMIT;

----------------------------------------------------------------------------
-- ○ 특정 게시물(ex.50)의 다음 번호를 읽어오는 쿼리문 구성
SELECT ROWNUM, TBL_BOARD.*
FROM TBL_BOARD
WHERE NUM = 50;
-- ==>>          1         50 김길동50                       java006$             apple50@test.com                                   취미에 대해 작성한 게시물50                                                                             영화감상 관련 내용물 작성                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           211.238.142.157               2 17/10/20
----------------------------------------------------------------------------
SELECT ROWNUM, DATA.NUM
FROM 
(
    SELECT *
    FROM TBL_BOARD
    WHERE NUM > 50
    ORDER BY NUM ASC
) DATA
WHERE ROWNUM = 1;


SELECT NVL(MIN(NUM), -1) AS NEXTNUM
FROM TBL_BOARD
WHERE NUM > 50;
-- WHERE NUM > 2673;
-- ORDER BY NUM ASC
----------------------------------------------------------------------------
-- ○ 특정 게시물(ex.50)의 이전 번호를 읽어오는 쿼리문 구성
SELECT ROWNUM, DATA.NUM
FROM 
(
    SELECT *
    FROM TBL_BOARD
    WHERE NUM < 50
    ORDER BY NUM DESC
) DATA
WHERE ROWNUM = 1;

SELECT NVL(MAX(NUM), -1) AS BEFORENUM
FROM TBL_BOARD
WHERE NUM < 50;
----------------------------------------------------------------------------
--○  실습 진행간 처리
-- 기존 게시물 모두 삭제
DELETE FROM TBL_BOARD;

-- 확인
SELECT *
FROM TBL_BOARD;

-- 커밋
COMMIT;

------------------------[검색 기능 추가]----------------------------------------
--○ 검색 기능을 추가하는 과정에서 구성한 쿼리문
--  검색 대상 : 제목, 작성자, 내용

--○ DB 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE SUBJECT LIKE '%검색어%'
--WHERE NAME LIKE '%검색어%'
--WHERE CONTENT LIKE '%검색어%'
;

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE NAME LIKE '%검색어%'
-- WHERE SUBJECT LIKE '%검색어%'
--WHERE CONTENT LIKE '%검색어%'
;

SELECT COUNT(*) AS COUNT
FROM TBL_BOARD
WHERE CONTENT LIKE '%검색어%'
-- WHERE NAME LIKE '%검색어%'
-- WHERE SUBJECT LIKE '%검색어%'
;

--○ 




--○ 


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ 
-- ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ → ← ↓ 
-- … ： º↑ /* */ ─ ┃ ┛┯ ┐┘ ￦ --/▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼/
