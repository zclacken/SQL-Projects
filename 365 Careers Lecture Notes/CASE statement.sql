SELECT emp_no, first_name, last_name,
CASE 
	WHEN gender = 'M' THEN 'Male'
	ELSE 'Female' 
END AS gender
FROM employees;

#Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. 
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT e.emp_no, e.first_name, e.last_name,
CASE
	WHEN dm.emp_no IS NOT NULL THEN 'Manager' # or dm.emp_no = e.emp_no 
    ELSE 'Employee'
END AS Title
FROM employees e
LEFT JOIN dept_manager dm
ON e.emp_no = dm.emp_no 
WHERE e.emp_no > 109990;

#Extract a dataset containing the following information about the managers: employee number, first name, and last name.
#Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee
#and another one saying whether this salary raise was higher than $30,000 or NOT

SELECT dm.emp_no, e.first_name, e.last_name,
MAX(salary) - MIN(salary) AS Difference, 
CASE
	WHEN MAX(salary) - MIN(salary) > 30000 THEN 'Higher'
    ELSE 'Not'
END AS Higher_Than_30000 
FROM dept_manager dm
JOIN employees e
ON dm.emp_no =e.emp_no
JOIN salaries s
ON dm.emp_no = s.emp_no
GROUP BY dm.emp_no;

#Extract the employee number, first name, and last name of the first 100 employees
#and add a fourth column, called “current_employee” saying “Is still employed”
#if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 

SELECT e.emp_no, e.first_name, e.last_name,
CASE
	WHEN MAX(de.to_date) > sysdate() THEN 'is_still_employed'
    ELSE 'not_an_employee_anymore'
END AS Current_Employee
FROM employees e
JOIN dept_emp de
ON e.emp_no = de.emp_no
GROUP BY de.emp_no
LIMIT 100; 
    


