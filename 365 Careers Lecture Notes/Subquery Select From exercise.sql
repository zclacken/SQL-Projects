DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager
(
emp_no INT(11) NOT NULL,
dept_no CHAR(4) NULL,
manager_no INT (11) NOT NULL
); 

INSERT INTO emp_manager
SELECT U.* FROM 
