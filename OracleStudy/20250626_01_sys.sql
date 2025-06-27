-- �� ���� ����Ŭ ������ ������ ���� ��ȸ
SHOW USER
-- ==>> USER��(��) "SYS"�Դϴ�.

-- SQLPLUS ������ �� ����ϴ� ��ɾ�

SHOW USER;

SELECT USER
FROM DUAL;
--==>> SYS



--============[�ּ���]==============
--1�� �ּ��� ó��(������ �ּ��� ó��)

/*
������
(������)
�ּ���
ó��
*/


--============[�ּ���]==============
SELECT 1 + 3 
FROM DUAL;
--==>> 4

SELECT 1+3
FROM DUAL;
--==>> 4

seLect 1+3
from duAL;
--==>> 4

--SELECT "������ ������ ����Ŭ ����"
--FROM DUAL;
--==>> �����߻�
/*
ORA-00972: identifier is too long
00972. 00000 -  "identifier is too long"
*Cause:    An identifier with more than 128 bytes was specified,
           or a password identifier longer than 30 bytes was specified.
*Action:   Specify at most 128 bytes for identifiers,
           and at most 30 bytes for password identifiers.
39��, 8������ ���� �߻�
*/

SELECT '�ֿ� ���ϱ������� F������'
FROM DUAL;
-- ==>> �ֿ� ���ϱ������� F������


SELECT 3.14 + 1.36
FROM DUAL;
--==>>4.5


SELECT 1.2345 - 1.2344
FROM DUAL;
--0.0001

SELECT 1.2345 - 1.4344
FROM DUAL;
--==>> -0.1999

SELECT 10*5
FROM DUAL;
--50

SELECT 10*5.2
FROM DUAL;
--52

SELECT 1000/53
FROM DUAL;
--18.86792452830188679245283018867924528302

SELECT '���ѹα�' + ' (KOREA, �ڸ���)'
FROM DUAL;
==>> ���� �߻�
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/


-- �� ����Ŭ ������ �����ϴ� ����� ���� ���� ��ȸ

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
/*
SYS	                OPEN
SYSTEM	            OPEN
ANONYMOUS	        OPEN
HR	                OPEN
APEX_PUBLIC_USER	LOCKED
FLOWS_FILES	        LOCKED
APEX_040000	        LOCKED
OUTLN	            EXPIRED & LOCKED
DIP	                EXPIRED & LOCKED
ORACLE_OCM	        EXPIRED & LOCKED
XS$NULL	            EXPIRED & LOCKED
MDSYS	            EXPIRED & LOCKED
CTXSYS	            EXPIRED & LOCKED
DBSNMP	            EXPIRED & LOCKED
XDB	                EXPIRED & LOCKED
APPQOSSYS	        EXPIRED & LOCKED
*/


SELECT USERNAME, USER_ID, ACCOUNT_STATUS, password, LOCK_DATE
FROM DBA_USERS;
/*
SYS	OPEN
SYSTEM	OPEN
ANONYMOUS	OPEN
HR	OPEN
APEX_PUBLIC_USER	LOCKED
FLOWS_FILES	LOCKED
APEX_040000	LOCKED
OUTLN	EXPIRED & LOCKED
DIP	EXPIRED & LOCKED
ORACLE_OCM	EXPIRED & LOCKED
XS$NULL	EXPIRED & LOCKED
MDSYS	EXPIRED & LOCKED
CTXSYS	EXPIRED & LOCKED
DBSNMP	EXPIRED & LOCKED
XDB	EXPIRED & LOCKED
APPQOSSYS	EXPIRED & LOCKED
*/
--==>> DBA_ �� �����ϴ� Oracle Data Dictionary View �� 
--������ ������ �������� �������� ���� ��ȸ�� �����ϴ�.
--������ ������ ��ųʸ� ������ ���� ���ص� �������.

--�ۡ�hr�� ����� ������ ��� ���·� ����
alter user hr account lock;
--User HR��(��) ����Ǿ����ϴ�

--�� �ٽ� ����� ���� ���� ��ȸ
select username, account_status
from dba_users;

--�ۡ�hr�� ����� ������ ��� ���� ���·� ����
alter user hr account unlock;
--User HR��(��) ����Ǿ����ϴ�.

--��  �ٽ� ����� ���� ���� ��ȸ
select * 
from dba_users;
/*
SYS	0		OPEN		25/12/22	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
SYSTEM	5		OPEN		25/12/22	SYSTEM	TEMP	14/05/29	DEFAULT	SYS_GROUP		10G 11G 	N	PASSWORD
ANONYMOUS	35		OPEN		14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP			N	PASSWORD
APEX_PUBLIC_USER	45		LOCKED	14/05/29	14/11/25	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
FLOWS_FILES	44		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APEX_040000	47		LOCKED	14/05/29	14/11/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
HR	43		LOCKED	25/06/26	25/12/23	USERS	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
OUTLN	9		EXPIRED & LOCKED	25/06/25	25/06/25	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DIP	14		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
ORACLE_OCM	21		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XS$NULL	2147483638		EXPIRED & LOCKED	14/05/29	14/05/29	SYSTEM	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
MDSYS	42		EXPIRED & LOCKED	14/05/29	25/06/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
CTXSYS	32		EXPIRED & LOCKED	25/06/25	25/06/25	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
DBSNMP	29		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
XDB	34		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
APPQOSSYS	30		EXPIRED & LOCKED	14/05/29	14/05/29	SYSAUX	TEMP	14/05/29	DEFAULT	DEFAULT_CONSUMER_GROUP		10G 11G 	N	PASSWORD
*/

SELECT USERNAME, ACCOUNT_STATUS
FROM DBA_USERS;
/*
SYS	OPEN
SYSTEM	OPEN
ANONYMOUS	OPEN
HR	OPEN
APEX_PUBLIC_USER	LOCKED
FLOWS_FILES	LOCKED
APEX_040000	LOCKED
OUTLN	EXPIRED & LOCKED
DIP	EXPIRED & LOCKED
ORACLE_OCM	EXPIRED & LOCKED
XS$NULL	EXPIRED & LOCKED
MDSYS	EXPIRED & LOCKED
CTXSYS	EXPIRED & LOCKED
DBSNMP	EXPIRED & LOCKED
XDB	EXPIRED & LOCKED
APPQOSSYS	EXPIRED & LOCKED
*/

----------------[���̺� �����̽� ����]-------------------

--�� TABLESPACE ����

--��. TABLESPACEF ��?
--    ���׸�Ʈ(���̺�, �ε���, ...)�� ��Ƶδ�(�����صδ�) ����Ŭ�� ������ ���� ������ �ǹ��Ѵ�.
--CREATE : ������ ����
--INSERT : ������ �Է�

CREATE TABLESPACE TBS_EDUA                  -- CREATE ���� ��ü�� �� ����
DATAFILE 'C:\TESTORADATA\TBS_EUDA01.DBF'    -- ���������� ����Ǵ� ������ ����
SIZE 4M                                     -- ������ ������ ���� �뷮
EXTENT MANAGEMENT LOCAL                     -- ����Ŭ ������ ���׸�Ʈ�� �˾Ƽ� ����
SEGMENT SPACE MANAGEMENT AUTO;              -- ���׸�Ʈ ���� ������ �ڵ����� ����Ŭ ������...
--==>> TABLESPACE TBS_EDUA��(��) �����Ǿ����ϴ�.

--��. ���̺� �����̽� ���� ������ �����ϱ� ����
--    �������� ��ο� ���͸�('C:\TESTORADATA') ������ ��

--�� ������ ���̺� �����̽� ��ȸ
--   ���̺� �����̽��� : TBS_EDUA
SELECT *
FROM DBA_TABLESPACES;

--�� �������� ���� �̸� ��ȸ
SELECT *
FROM DBA_DATA_FILES;
/*
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\USERS.DBF	4	USERS	104857600	12800	AVAILABLE	4	YES	11811160064	1441792	1280	103809024	12672	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSAUX.DBF	2	SYSAUX	692060160	84480	AVAILABLE	2	YES	34359721984	4194302	1280	691011584	84352	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\UNDOTBS1.DBF	3	UNDOTBS1	398458880	48640	AVAILABLE	3	YES	524288000	64000	640	397410304	48512	ONLINE
C:\ORACLEXE\APP\ORACLE\ORADATA\XE\SYSTEM.DBF	1	SYSTEM	377487360	46080	AVAILABLE	1	YES	629145600	76800	1280	376438784	45952	SYSTEM
C:\TESTORADATA\TBS_EUDA01.DBF	5	TBS_EDUA	4194304	512	AVAILABLE	5	NO	0	0	0	3145728	384	ONLINE
*/

-- �� ����Ŭ ����� ���� ����
CREATE USER kni IDENTIFIED BY java006$
DEFAULT TABLESPACE TBS_EDUA;
-- �� �н������ ��.�ҹ��ڸ� �����Ѵ�.��
--==>> User KNI��(��) �����Ǿ����ϴ�.
-- kni ��� ����ڸ� ����ڴ�.(�����ϰڴ�.)
-- �� ������ ���� �����ϴ� ����Ŭ ��ü��(���׸�Ʈ����)
-- �⺻������(default) TBS_EDUA ��� ���̺����̽��� ������ �� �ֵ��� �����ϰڴ�.

-- ��. ������ ����Ŭ ����� ����(kni)�� ���� ����Ŭ ������ ���� �õ�
-- ==>> ���� �Ұ�(����)
--����: ���� -�׽�Ʈ ����: ORA-01045: user KNI lacks CREATE SESSION privilege; logon denied
--  �� ��CREATE SESSION�������� ���� ������....


-- �� ������ ����Ŭ ����� ����()�� ���� ������ ������ �� �ֵ���
--    ��CREATE SESSION������ �ο� �� SYS ��...
GRANT CREATE SESSION TO KNI;
--==>> Grant��(��) �����߽��ϴ�.

-- ��  ������ ����Ŭ ����� ����(KNI)�� ���� ���̺��� �����ϴ� �������� ���� �߻�

-- ��  ������ ����Ŭ ����� ����(KNI)�� �ý��� ���� ���� ��ȸ
SELECT *
FROM DBA_SYS_PRIVS;
-- ���� ����� ����

SELECT *
FROM DBA_SYS_PRIVS -- ������ ��ųʸ� ��
WHERE GRANTEE = 'KNI';  -- ��.�ҹ��� ����
--==>> KNI	CREATE SESSION	NO

-- ��  ������ ����Ŭ ����� ����()�� ���̺� ������ ������ �� �ֵ��� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO KNI;
--==>> Grant��(��) �����߽��ϴ�.

SELECT *
FROM DBA_SYS_PRIVS -- ������ ��ųʸ� ��
WHERE GRANTEE = 'KNI';  -- ��.�ҹ��� ����
/*
KNI	CREATE SESSION	NO
KNI	CREATE TABLE	NO
*/

/*��������������������������*/
--==========[ 6�� 27��(��) ]=========================
SELECT USER
FROM DUAL;
--==>>SYS

/*
  �� ������ ����Ŭ ����� ����(KNI)�� ���̺����̽�(TBS_EDUA)����
     ����� �� �ִ� ����(�Ҵ緮) ũ�� ���� �� ������(UNLIMITED)
*/
ALTER USER KNI
QUOTA UNLIMITED ON TBS_EDUA;
--==>> User KNI��(��) ����Ǿ����ϴ�.




--### �� �� �� ���� ? �� �� �� �� �� �� �� �� �� �� �� �� ��  ��  ��  ��  ��  �� ���� /* */  �� �� ���� ���� ��







