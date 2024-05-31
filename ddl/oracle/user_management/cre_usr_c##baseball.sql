                                                                                                                                    
   CREATE USER "C##BASEBALL" IDENTIFIED BY VALUES 'S:DCA671EA45FAAC090DDB630E6A1                                                    
42EB7697740976D9964859B5B63E9B49B;T:2205DD9FEDA39F6F004C08BFFDFD664514EADC8D4BC3                                                    
FD11D1835F43A7038147938158CF315F6795F7BC793E0CE9FF12BCF47683708850623B559664F89A                                                    
0C7F7CD99ABFC119A4FDB0298CD69F62770A'                                                                                               
      DEFAULT TABLESPACE "USERS"                                                                                                    
      TEMPORARY TABLESPACE "TEMP";                                                                                                  
                                                                                                                                    
                                                                                                                                    
  GRANT CREATE SESSION TO "C##BASEBALL";                                                                                            
  GRANT ALTER SESSION TO "C##BASEBALL";                                                                                             
  GRANT CREATE TABLE TO "C##BASEBALL";                                                                                              
  GRANT CREATE SYNONYM TO "C##BASEBALL";                                                                                            
  GRANT CREATE PUBLIC SYNONYM TO "C##BASEBALL";                                                                                     
  GRANT DROP PUBLIC SYNONYM TO "C##BASEBALL";                                                                                       
  GRANT CREATE VIEW TO "C##BASEBALL";                                                                                               
  GRANT CREATE SEQUENCE TO "C##BASEBALL";                                                                                           
  GRANT CREATE DATABASE LINK TO "C##BASEBALL";                                                                                      
  GRANT CREATE PUBLIC DATABASE LINK TO "C##BASEBALL";                                                                               
  GRANT DROP PUBLIC DATABASE LINK TO "C##BASEBALL";                                                                                 
  GRANT CREATE PROCEDURE TO "C##BASEBALL";                                                                                          
  GRANT CREATE TRIGGER TO "C##BASEBALL";                                                                                            
  GRANT CREATE MATERIALIZED VIEW TO "C##BASEBALL";                                                                                  
  GRANT CREATE TYPE TO "C##BASEBALL";                                                                                               
  GRANT CREATE LIBRARY TO "C##BASEBALL";                                                                                            
  GRANT QUERY REWRITE TO "C##BASEBALL";                                                                                             
  GRANT CREATE DIMENSION TO "C##BASEBALL";                                                                                          
  GRANT ON COMMIT REFRESH TO "C##BASEBALL";                                                                                         
  GRANT CREATE JOB TO "C##BASEBALL";                                                                                                
  GRANT CREATE CUBE DIMENSION TO "C##BASEBALL";                                                                                     
  GRANT CREATE CUBE TO "C##BASEBALL";                                                                                               
  GRANT CREATE CUBE BUILD PROCESS TO "C##BASEBALL";                                                                                 
  GRANT CREATE ANALYTIC VIEW TO "C##BASEBALL";                                                                                      
                                                                                                                                    
                                                                                                                                    
   GRANT "CONNECT" TO "C##BASEBALL";                                                                                                
   GRANT "RESOURCE" TO "C##BASEBALL";                                                                                               
                                                                                                                                    
                                                                                                                                    
  GRANT SELECT ON "SYS"."V_$SQL_PLAN" TO "C##BASEBALL";                                                                             
  GRANT SELECT ON "SYS"."V_$SESSION" TO "C##BASEBALL";                                                                              
  GRANT EXECUTE ON "SYS"."DBMS_STATS" TO "C##BASEBALL";                                                                             
                                                                                                                                    
