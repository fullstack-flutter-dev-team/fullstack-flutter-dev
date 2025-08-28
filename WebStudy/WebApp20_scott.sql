SELECT USER
FROM DUAL;
/* 
USER
------------------------------
SCOTT
*/

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;

--
commit;

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
        ORDER BY NUM DESC
    ) DATA
)
WHERE RNUM >= 1 AND RNUM <= 10
ORDER BY RNUM DESC
;



--○ 


--○ 
--○ 
--○ 




--○ 


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ 
-- ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ → ← ↓ 
-- … ： º↑ /* */ ─ ┃ ┛┯ ┐┘ ￦ --/▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼/
