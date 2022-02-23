USE employees_mod;
#Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.

SELECT e.gender, d.dept_name, AVG(s.salary) AS salary, h.calendar_year 
FROM 
(SELECT YEAR(hire_date) AS calendar_year 
FROM t_employees e
GROUP BY calendar_year) h 
CROSS JOIN
t_dept_manager dm
JOIN
t_departments d 
ON
dm.dept_no = d.dept_no
JOIN
t_salaries s
ON
dm.emp_no = s.emp_no
JOIN
t_employees e
ON
s.emp_no = e.emp_no
WHERE h.calendar_year < 2002
GROUP BY e.gender, h.calendar_year;




