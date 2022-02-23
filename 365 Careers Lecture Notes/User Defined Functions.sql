USE employees;


DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) 
RETURNS DECIMAL (10,2)
DETERMINISTIC  #Use this word if error code 1418 appears 
BEGIN
	DECLARE v_avg_salary DECIMAL(10,2);
    
	SELECT AVG(s.salary)
	INTO v_avg_salary
	FROM employees e
    JOIN Salaries s
    ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no ; 
    
    RETURN v_avg_salary;
END $$ 
DELIMITER ; 

#Functions aren't called, they are selected.
SELECT f_emp_avg_salary(11300);
