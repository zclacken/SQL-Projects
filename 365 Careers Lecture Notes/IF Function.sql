#The IF function 
SELECT emp_no, first_name, last_name, 
IF (gender = 'M', 'Male', 'Female') AS gender
FROM employees;  