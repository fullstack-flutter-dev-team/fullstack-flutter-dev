SELECT USER
FROM DUAL;
/* 
USER
------------------------------
SCOTT
*/

--○ 기존 테이블 구조 확인
DESC TBL_BOARD;


--○ 
DECLARE
  V_NUM       NUMBER(9)         := 0;
  V_NAME      VARCHAR2(30);
  V_PWD       VARCHAR2(20);
  V_EMAIL     VARCHAR2(50);
  V_SUBJECT   VARCHAR2(100);
  V_CONTENT   VARCHAR2(4000);
  V_IPADDR    VARCHAR2(20);
  V_HITCOUNT  NUMBER;
  V_CREATED   DATE              := TO_DATE('2020-0828', 'YYYY-MM-DD');
BEGIN
    LOOP
        EXIT WHEN V_NUM > 2672;

        V_NUM      := V_NUM + 1;

        IF(MOD(V_NUM,5)=0) THEN
                V_PWD := 'java006$';
                V_CONTENT := '애니메이션 관련 내용물 작성';
                V_IPADDR := '211.238.142.157';
                V_NAME := '김';
                V_SUBJECT := '취미';
                -- V_EMAIL := 'hong';
                -- V_HITCOUNT := 30;
            ELSIF(MOD(V_NUM,3)=0) THEN
                V_PWD := 'net007$';
                V_CONTENT := '스트레칭과 관련한 내용물 작성';
                V_IPADDR := '211.238.142.158';
                V_NAME := '유';
                V_SUBJECT := '건강';
                -- V_EMAIL := 'park';
                -- V_HITCOUNT := 20;
            ELSIF(MOD(V_NUM,7)=0) THEN
                V_PWD := 'java007$';
                V_CONTENT := '야구 관련한 내용물 작성';
                V_IPADDR :='211.238.142.162';
                V_NAME := '최';
                V_SUBJECT := '스포츠';
                -- V_EMAIL := 'choi';
                -- V_HITCOUNT := 10;
            ELSE
                V_PWD := 'java002$';
                V_CONTENT := '비오는 날 관련 내용물 작성';
                V_IPADDR := '211.238.142.174';
                V_NAME := '이';
                -- V_EMAIL := 'lee';
                V_SUBJECT := '날씨';
                -- V_HITCOUNT := 70;
        END IF;
        
        V_NAME := V_NAME || '길동' || LTRIM(TO_CHAR(V_NUM));
        V_SUBJECT := V_SUBJECT ||'에 대해 작성한 게시물' || LTRIM(TO_CHAR(V_NUM));
        V_CREATED := V_CREATED + 1;
        -- V_EMAIL := V_EMAIL || '@test.com';
        
        IF (MOD(V_NUM, 2) = 0) THEN
            V_EMAIL := 'apple' || V_NUM || '@test.com';
            V_HITCOUNT := MOD(V_NUM, 3);
        ELSIF (MOD(V_NUM, 3) = 0) THEN
            V_EMAIL := 'test' || V_NUM || '@test.com';
            V_HITCOUNT := MOD(V_NUM, 4);
        ELSIF (MOD(V_NUM, 4) = 0) THEN
            V_EMAIL := 'study' || V_NUM || '@test.com';
            V_HITCOUNT := MOD(V_NUM, 5);
        ELSE 
            V_EMAIL := 'happy' || V_NUM || '@test.com';
            V_HITCOUNT := 21;
        END IF;
    
        INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(V_NUM, V_NAME, V_PWD, V_EMAIL, V_SUBJECT, V_CONTENT, V_IPADDR, V_HITCOUNT, V_CREATED);
    END LOOP;
END;
-- ---------------------

SELECT *
FROM TBL_BOARD;


--○ 커밋
COMMIT;


--○ 
--○ 




--○ 


-- ### --▣ --※ ○ ★ 『』 ? ▣ ◀▶ ▼ ▲ 
-- ⓐ ⓑ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ → ← ↓ 
-- … ： º↑ /* */ ─ ┃ ┛┯ ┐┘ ￦ --/▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼/
