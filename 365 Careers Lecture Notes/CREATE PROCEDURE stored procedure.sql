USE employees;

DROP PROCEDURE IF EXISTS select_employees;

#Create Procedure 
DELIMITER $$   
CREATE PROCEDURE select_employees()
BEGIN
	SELECT * FROM employees
    LIMIT 1000; 
END$$  
DELIMITER ;

#Invoke procedure
CALL employees.select_employees();

#Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE PROCEDURE average_salary()
BEGIN
	SELECT AVG(salary) AS average_salary
    FROM salaries;
    END$$
DELIMITER ;

CALL average_salary();