mysqldump -h investdb.clp2ztogrluw.ap-northeast-2.rds.amazonaws.com -u admin -p --databases invest invest_communication invest_company invest_investment invest_investor_relations invest_shop invest_user



-- 사용자 계정 생성 'id'@'localhost' 이면 로컬에서만 접속 가능

CREATE USER '아이디'@'%' IDENTIFIED BY '비밀번호';



-- 사용자 권한 주기

GRANT ALL PRIVILEGES ON 데이터베이스.* TO '아이디'@'%';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, ALTER
, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW
, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EVENT, TRIGGER 
ON `corona`.* TO 'corona'@'%' WITH GRANT OPTION;

mysql -u admin -p -h testdb.clp2ztogrluw.ap-northeast-2.rds.amazonaws.com