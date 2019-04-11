---
geometry: margin=1cm
output: pdf_document
---
##### Create / Delete Database
```sql
CREATE DATABASE dbNameYouWant
CREATE DATABASE dbNameYouWant CHARACTER SET utf8
DROP DATABASE dbNameYouWant
ALTER DATABASE dbNameYouWant CHARACTER SET utf8
```
##### Backup Database to SQL File
```bash
mysqldump -u Username -p dbNameYouWant > databasename_backup.sql
```
##### Restore from backup SQL File
```bash
mysql - u Username -p dbNameYouWant < databasename_backup.sql
```
##### Repair Tables After Unclean Shutdown
```bash
mysqlcheck --all-databases
mysqlcheck --all-databases --fast
```
##### Browsing
```sql
SHOW DATABASES
SHOW TABLES
SHOW FIELDS FROM table / DESCRIBE table
SHOW CREATE TABLE table
SHOW PROCESSLIST
KILL process_number
```
##### Select
```sql
SELECT * FROM table
SELECT * FROM table1, table2, ...
SELECT field1, field2, ... FROM table1, table2, ...
SELECT ... FROM ... WHERE condition
SELECT ... FROM ... WHERE condition GROUPBY field
SELECT ... FROM ... WHERE condition GROUPBY field HAVING condition2
SELECT ... FROM ... WHERE condition ORDER BY field1, field2
SELECT ... FROM ... WHERE condition ORDER BY field1, field2 DESC
SELECT ... FROM ... WHERE condition LIMIT 10
SELECT DISTINCT field1 FROM ...
SELECT DISTINCT field1, field2 FROM ...
```
##### Select - Join
```sql
SELECT ... FROM t1 JOIN t2 ON t1.id1 = t2.id2 WHERE condition
SELECT ... FROM t1 LEFT JOIN t2 ON t1.id1 = t2.id2 WHERE condition
SELECT ... FROM t1 JOIN (t2 JOIN t3 ON ...) ON ...
```
##### Conditions
```sql
field1 = value1
field1 <> value1
field1 LIKE 'value _ %'
field1 IS NULL
field1 IS NOT NULL
field1 IS IN (value1, value2)
field1 IS NOT IN (value1, value2)
condition1 AND condition2
condition1 OR condition2
```
##### Insert
```sql
INSERT INTO table1 (field1, field2, ...) VALUES (value1, value2, ...)
```
##### Delete
```sql
DELETE FROM table1 / TRUNCATE table1
DELETE FROM table1 WHERE condition
DELETE FROM table1, table2 FROM table1, table2 WHERE table1.id1 =
  table2.id2 AND condition
```
##### Update
```sql
UPDATE table1 SET field1=new_value1 WHERE condition
UPDATE table1, table2 SET field1=new_value1, field2=new_value2, ... WHERE
  table1.id1 = table2.id2 AND condition
```
##### Create / Delete / Modify Table
###### Create
```sql
CREATE TABLE table (field1 type1, field2 type2, ...)
CREATE TABLE table (field1 type1, field2 type2, ..., INDEX (field))
CREATE TABLE table (field1 type1, field2 type2, ..., PRIMARY KEY (field1))
CREATE TABLE table (field1 type1, field2 type2, ..., PRIMARY KEY (field1,
field2))
```
```sql
CREATE TABLE table1 (fk_field1 type1, field2 type2, ...,
  FOREIGN KEY (fk_field1) REFERENCES table2 (t2_fieldA))
    [ON UPDATE|ON DELETE] [CASCADE|SET NULL]
```
```sql
CREATE TABLE table1 (fk_field1 type1, fk_field2 type2, ...,
 FOREIGN KEY (fk_field1, fk_field2) REFERENCES table2 (t2_fieldA, t2_fieldB))
```
```sql
CREATE TABLE table IF NOT EXISTS (...)
```
```sql
CREATE TEMPORARY TABLE table (...)
```
###### Drop

```sql
DROP TABLE table
DROP TABLE IF EXISTS table
DROP TABLE table1, table2, ...
```
###### Alter
```sql
ALTER TABLE table MODIFY field1 type1
ALTER TABLE table MODIFY field1 type1 NOT NULL ...
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 NOT NULL ...
ALTER TABLE table ALTER field1 SET DEFAULT ...
ALTER TABLE table ALTER field1 DROP DEFAULT
ALTER TABLE table ADD new_name_field1 type1
ALTER TABLE table ADD new_name_field1 type1 FIRST
ALTER TABLE table ADD new_name_field1 type1 AFTER another_field
ALTER TABLE table DROP field1
ALTER TABLE table ADD INDEX (field);
```
###### Change field order
```sql
ALTER TABLE table MODIFY field1 type1 FIRST
ALTER TABLE table MODIFY field1 type1 AFTER another_field
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 FIRST
ALTER TABLE table CHANGE old_name_field1 new_name_field1 type1 AFTER
  another_field
```
##### Keys
```sql
CREATE TABLE table (..., PRIMARY KEY (field1, field2))
CREATE TABLE table (..., FOREIGN KEY (field1, field2) REFERENCES table2
(t2_field1, t2_field2))
```
##### Users and Privileges
```sql
GRANT ALL PRIVILEGES ON base.* TO 'user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, DELETE ON base.* TO 'user'@'localhost' IDENTIFIED BY 'password';
REVOKE ALL PRIVILEGES ON base.* FROM 'user'@'host'; -- one permission only
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user'@'host'; -- all permissions
```
```sql
SET PASSWORD = PASSWORD('new_pass')
SET PASSWORD FOR 'user'@'host' = PASSWORD('new_pass')
SET PASSWORD = OLD_PASSWORD('new_pass')
```
```sql
DROP USER 'user'@'host'
```
Host ‘%’ indicates any host.
##### Trigger
```sql
CREATE
    [DEFINER = user]
    TRIGGER trigger_name
    trigger_time trigger_event
    ON tbl_name FOR EACH ROW
    trigger_body

trigger_time: { BEFORE | AFTER }
trigger_event: { INSERT | UPDATE | DELETE }
```
##### Find Duplicate
```sql
SELECT Lastname, firstname, email, phone, COUNT(*) AS [duplicates]
FROM contact
GROUP BY Lastname, firstName, email, Phone
HAVING COUNT(*) >1
```
##### view
```sql
CREATE
    [OR REPLACE]
    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = user]
    [SQL SECURITY { DEFINER | INVOKER }]
    VIEW view_name [(column_list)]
    AS select_statement
    [WITH [CASCADED | LOCAL] CHECK OPTION]
```
##### index
```sql
CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name
    [index_type]
    ON tbl_name (key_part,...)
    [index_option]
    [algorithm_option | lock_option] ...

key_part: {col_name [(length)] | (expr)} [ASC | DESC]

index_option:
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'
  | {VISIBLE | INVISIBLE}

index_type:
    USING {BTREE | HASH}

algorithm_option:
    ALGORITHM [=] {DEFAULT | INPLACE | COPY}

lock_option:
    LOCK [=] {DEFAULT | NONE | SHARED | EXCLUSIVE}
```
##### procedure & function
```sql
CREATE
    [DEFINER = user]
    PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body
CREATE
    [DEFINER = user]
    FUNCTION sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body
proc_parameter:
    [ IN | OUT | INOUT ] param_name type
func_parameter:
    param_name type
type:
    Any valid MySQL data type
characteristic:
    COMMENT 'string'
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }
routine_body:
    Valid SQL routine statement
```
```sql
DELIMITER //
CREATE PROCEDURE GetAllListings()
 BEGIN
 SELECT nid, type, title  FROM node where type = 'lms_listing' order by nid desc;
END //
DELIMITER;
```
```sql
DELIMITER $$
CREATE FUNCTION CustomerLevel(p_creditLimit double) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE lvl varchar(10);
    IF p_creditLimit > 50000 THEN
 SET lvl = 'PLATINUM';
    ELSEIF (p_creditLimit <= 50000 AND p_creditLimit >= 10000) THEN
        SET lvl = 'GOLD';
    ELSEIF p_creditLimit < 10000 THEN
        SET lvl = 'SILVER';
    END IF;
 RETURN (lvl);
END $$
DELIMITER;
```
##### Event
```sql
CREATE
    [DEFINER = user]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT 'string']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval] ...
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval] ...]
    [ENDS timestamp [+ INTERVAL interval] ...]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}
```
```sql
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL
);
CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
  INSERT INTO messages(message,created_at)
  VALUES('Test MySQL Event 1',NOW());
```
##### Cursors
```sql
DECLARE finished INTEGER DEFAULT 0;
DECLARE email varchar(255) DEFAULT "";
 
-- declare cursor for employee email
DEClARE email_cursor CURSOR FOR 
 SELECT email FROM employees;
 
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER 
FOR NOT FOUND SET finished = 1;

OPEN email_cursor;

get_email: LOOP
 FETCH email_cursor INTO v_email;
 IF v_finished = 1 THEN 
 LEAVE get_email;
 END IF;
 -- build email list
 SET email_list = CONCAT(v_email,";",email_list);
END LOOP get_email;
```
```sql
ELIMITER $$
 
CREATE PROCEDURE build_email_list (INOUT email_list varchar(4000))
BEGIN
 
 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_email varchar(100) DEFAULT "";
 
 -- declare cursor for employee email
 DEClARE email_cursor CURSOR FOR 
 SELECT email FROM employees;
 
 -- declare NOT FOUND handler
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 OPEN email_cursor;
 
 get_email: LOOP
 
 FETCH email_cursor INTO v_email;
 
 IF v_finished = 1 THEN 
 LEAVE get_email;
 END IF;
 
 -- build email list
 SET email_list = CONCAT(v_email,";",email_list);
 
 END LOOP get_email;
 
 CLOSE email_cursor;
 
END$$
 
DELIMITER ;
```
##### transaction
```sql
START TRANSACTION
    [transaction_characteristic [, transaction_characteristic] ...]

transaction_characteristic: {
    WITH CONSISTENT SNAPSHOT
  | READ WRITE
  | READ ONLY
}

BEGIN [WORK]
COMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
ROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
SET autocommit = {0 | 1}
```
```sql
START TRANSACTION;
SELECT @A:=SUM(salary) FROM table1 WHERE type=1;
UPDATE table2 SET summary=@A WHERE type=1;
COMMIT;
```