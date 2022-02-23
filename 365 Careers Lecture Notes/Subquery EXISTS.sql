SELECT e.first_name, e.last_name
FROM employees e
WHERE 
EXISTS
(SELECT * 
FROM dept_manager dm
WHERE dm.emp_no = e.emp_no
);

#Select the entire information for all employees whose job title is “Assistant Engineer”. 

SELECT * 
FROM employees e
WHERE EXISTS
(SELECT * 
FROM titles T 
WHERE t.emp_no = e.emp_no AND title = 'Assistant Engineer')
ORDER BY emp_no; 