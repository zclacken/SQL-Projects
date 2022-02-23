SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees E
JOIN salaries S
ON e.emp_no = s.emp_no
WHERE s.salary > 145000
ORDER BY s.salary;

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM employees E
JOIN titles T 
ON e.emp_no = t.emp_no
WHERE first_name = 'margareta' AND last_name = 'markovitch';