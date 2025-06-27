--�� ���ӵ� ����� Ȯ��
SELECT USER
FROM DUAL;
--==>> KNI

--�� ���̺� ����
-- ���̺�� : TBL_ORAUSERTEST
--CREATE TABLE ���̺��;
--CREATE USER ������;
/*
CREATE TABLE TBL_ORAUSERTEST
(
  NO     ������
, NAME   ������
);
*/
CREATE TABLE TBL_ORAUSERTEST
(
  NO     NUMBER(2)      -- ���� Ÿ������ -99 ~ 99
, NAME   VARCHAR2(30)   -- ���� Ÿ������ 30 BYTE ���� ����
);
--==>> ���� �߻�
/*
���� ���� -
ORA-01031: insufficient privileges (�� ���� �����)
01031. 00000 -  "insufficient privileges"
*Cause:    An attempt was made to perform a database operation without
           the necessary privileges.
*Action:   Ask your database administrator or designated security
           administrator to grant you the necessary privileges
*/

/*
    �� ���� KNI ������ CREATE SESSION ���Ѹ� ���� ������
       ���̺��� ������ �� �ִ� ������ �������� ���� �����̴�.
       �׷��Ƿ�, �� ������ ���� ���̺��� �����ϱ� ���ؼ��� 
       �����ڷκ��� ���̺� ���� ������ �ο��޾ƾ� �Ѵ�.
*/
     

--�� ������(SYS)�� ���� ���̺� ���� ������ �ο����� �� �ٽ� ���̺� ����  
CREATE TABLE TBL_ORAUSERTEST
(
  NO     NUMBER(2)      -- ���� Ÿ������ -99 ~ 99
, NAME   VARCHAR2(30)   -- ���� Ÿ������ 30 BYTE ���� ����
);
--==>> ���� �߻�
/*
    ���� ���� -
    ORA-01950: no privileges on tablespace 'TBS_EDUA'
    01950. 00000 -  "no privileges on tablespace '%s'"
    *Cause:    User does not have privileges to allocate an extent in the
               specified tablespace.
    *Action:   Grant the user the appropriate system privileges or grant the user
               space resource on the tablespace.
*/

/*
  �� ���̺� ���� ����(CREATE TABLE) ���� �ο����� ��Ȳ������
     KNI ����� ������ �⺻ ���̺����̽�(DEFAULT TABLESPACE : TBS_EDUA)�� ���� 
     ��� ����(�Ҵ緮)�� �ο����� ���� ����.
     �׷��Ƿ�, �� ���̺����̽��� ����� �� �ִ� ������ ���ٴ�
     �����޼����� ����Ŭ�� ������ְ� �ִ� ����.

*/

-- ������ �ü�� : �Ҵ緮

/*��������������������������*/
--==========[ 6�� 27��(��) ]=========================
SELECT USER
FROM DUAL;
--==>> KNI


/*
  �� ������(SYS)�� ���� ���̺����̽�(TBS_EDUA)�� ���� �Ҵ緮�� �ο����� ����
      �ٽ� ���̺� ����  
*/
CREATE TABLE TBL_ORAUSERTEST
(
  NO     NUMBER(2)      -- ���� Ÿ������ -99 ~ 99
, NAME   VARCHAR2(30)   -- ���� Ÿ������ 30 BYTE ���� ����
);
--==>>Table TBL_ORAUSERTEST��(��) �����Ǿ����ϴ�.

--�� �ڽſ��� �ο��� �Ҵ緮 ��ȸ
SELECT *
FROM USER_TS_QUOTAS;  -- ��
--==>>  TBS_EDUA	65536	-1	8	-1	NO
--                         ----    ---
--                          -1 �� �������� �ǹ���









--### �� �� �� ���� ? �� �� �� �� �� �� �� �� �� �� �� �� ��  ��  ��  ��  ��  �� ���� /* */  �� �� ���� ���� ��
