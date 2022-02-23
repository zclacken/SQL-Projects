SELECT e.first_name, e.last_name
FROM employees e
WHERE e.emp_no
IN (SELECT dm.emp_no FROM dept_manager dm);

#Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

SELECT dm.*
FROM dept_manager dm  
WHERE dm.emp_no
IN
(SELECT e.emp_no 
FROM employees e 
WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01') 