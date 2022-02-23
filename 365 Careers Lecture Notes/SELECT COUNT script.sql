SELECT COUNT(emp_no) FROM employees;

SELECT COUNT(DISTINCT first_name) FROM employees; 

SELECT COUNT(*) FROM salaries
WHERE salary >= '100000';

SELECT COUNT(*) FROM dept_manager;