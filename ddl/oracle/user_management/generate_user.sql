-- sqlplus sys/password@localhost:1521/xe as sysdba
accept username prompt 'Enter Username : '
--spool &&outfile..gen
spool cre_usr_&&username..sql
SET LONG 100000 PAGESIZE 0 head off verify off feedback off linesize 132
exec dbms_metadata.set_transform_param(dbms_metadata.SESSION_TRANSFORM,'SQLTERMINATOR',TRUE);
SELECT dbms_metadata.get_ddl('USER','&&username') FROM dual
 UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('SYSTEM_GRANT','&&username') from dual
 UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('ROLE_GRANT','&&username') from dual
 UNION ALL
SELECT DBMS_METADATA.GET_GRANTED_DDL('OBJECT_GRANT','&&username') from dual;
spool off
