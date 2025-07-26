SELECT USER
FROM DUAL;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SET SERVEROUTPUT ON;
-----------------------------
CREATE OR REPLACE PROCEDURE proc_lecturer_login
( P_ID IN VARCHAR2
, P_PW IN VARCHAR2
, R_MSG OUT VARCHAR2
)
IS
    STATUS VARCHAR2(100):= 2;
BEGIN
    -- 기본 ID/PW : LECTURE_ID/SSN 끝 7자
    -- NEW ID/PW : LOGIN_ID/LOGIN_PW
    SELECT NVL2((SELECT  NAME FROM TBL_LECTURER WHERE  NAME = P_ID OR LOGIN_ID = P_ID), '0', '-1')  INTO STATUS
      FROM DUAL;     
    IF STATUS = -1 THEN
        -- R_MSG := '아이디가 존재하지 않습니다.';
        R_MSG := '-1';
    ELSE -- 아이디가 조회된경우
        SELECT NVL2((SELECT NAME FROM TBL_LECTURER
                           WHERE (NAME = P_ID AND SUBSTR(SSN, 8) = P_PW )
                            OR (LOGIN_ID = P_ID AND LOGIN_PW = P_PW)), '0', '-2') INTO R_MSG
           FROM DUAL;
    END IF;  
END;

----------------------------------------------
-- UPDATE
UPDATE TBL_LECTURER
SET LOGIN_ID = 'BuleSKY', LOGIN_PW = 'korea@'
WHERE LECTURER_ID = 10000002;


-- 실행
variable r_msg varchar2(300);
exec proc_lecturer_login('천소아','korea@',:r_msg);
PRINT r_msg;

exec proc_lecturer_login('천소아','1074231',:r_msg);
PRINT r_msg;

exec proc_lecturer_login('천소아','BuleSKY',:r_msg);
PRINT r_msg;

exec proc_lecturer_login('BuleSKY','korea@',:r_msg);
PRINT r_msg;

----------------------------------------------
SELECT *
FROM TBL_LECTURER
WHERE LECTURER_ID = 10000002;

---------------------

----------------------------------------------
-- 커밋
COMMIT;
 

------------------------------------------------------------------------------
-- 커밋
COMMIT;

--------------------------------------------------------------------------------------------