SELECT USER
FROM DUAL;

-- ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
-- ==>> Session이(가) 변경되었습니다.

SET SERVEROUTPUT ON;
-----------------------------
CREATE OR REPLACE PROCEDURE proc_lecturer_login
( P_ID IN VARCHAR2
, P_PW IN VARCHAR2
, R_DATA OUT VARCHAR2
, R_MSG  OUT VARCHAR2
)
IS
    STATUS NUMBER(8):= -1;
BEGIN
    R_DATA := NULL;
    R_MSG := TO_CHAR(STATUS);

    -- 기본 ID/PW : LECTURER_ID/SSN 끝 7자
    -- NEW ID/PW : LOGIN_ID/LOGIN_PW
    SELECT NVL((SELECT  LECTURER_ID FROM TBL_LECTURER WHERE  NAME = P_ID OR LOGIN_ID = P_ID), -1)  INTO STATUS
      FROM DUAL;     
    IF STATUS != -1 THEN
        R_DATA := NULL;
        R_MSG := TO_CHAR(STATUS);
        SELECT NVL((SELECT LECTURER_ID FROM TBL_LECTURER
                           WHERE (NAME = P_ID AND SUBSTR(SSN, 8) = P_PW )
                            OR (LOGIN_ID = P_ID AND LOGIN_PW = P_PW)), -2) INTO STATUS
        FROM DUAL;

        IF STATUS = -2 THEN
            R_DATA := NULL;
            R_MSG :=  TO_CHAR(STATUS);
        ELSE
            R_DATA := LPAD(STATUS, 8, '0');
            R_MSG := '0';
        END IF;
    END IF;    
END;

----------------------------------------------
-- UPDATE
UPDATE TBL_LECTURER
SET LOGIN_ID = 'BuleSKY', LOGIN_PW = 'korea@'
WHERE LECTURER_ID = 10000002;

--------------------------------------
-- 커밋
COMMIT;

--------------------------------------
-- 실행
variable r_data varchar2(300);
variable r_msg varchar2(300);
exec proc_lecturer_login('엄찬옥','1672871', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec proc_lecturer_login('천소아','1074231', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;

exec proc_lecturer_login('천소아','BuleSKY', :r_data, :r_msg);
PRINT r_data;
PRINT r_msg;


exec proc_lecturer_login('BuleSKY','korea@', :r_data, :r_msg);
PRINT r_data;
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