CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date 
FROM dept_emp
GROUP BY emp_no;

SELECT
emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM dept_emp 
GROUP BY emp_no;

#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

CREATE OR REPLACE VIEW v_dept_manager_avg_salary AS
SELECT ROUND(AVG(s.salary),2) AS average_salary
FROM salaries S
JOIN dept_manager dm 
ON s.emp_no = dm.emp_no;