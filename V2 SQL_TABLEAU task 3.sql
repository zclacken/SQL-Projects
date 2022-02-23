#Compare the average salary of female versus male employees in the entire company until year 2002,  

SELECT 
e.gender, 
d.dept_name, 
ROUND(AVG(s.salary),2) AS Salary, 
YEAR(s.from_date) AS calendar_year
FROM 
t_employees e
JOIN
t_salaries s
ON
e.emp_no = s.emp_no
JOIN 
t_dept_emp de
ON
s.emp_no = de.emp_no
JOIN
t_departments d
ON
de.dept_no = d.dept_no
GROUP BY e.gender, calendar_year, d.dept_name
HAVING calendar_year <= 2002 
ORDER BY d.dept_no, e.gender, calendar_year; 