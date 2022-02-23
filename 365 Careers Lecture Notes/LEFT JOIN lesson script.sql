#dept_manager_dup column on the left

SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup M
LEFT JOIN departments_dup D
ON m.dept_no = d.dept_no
GROUP BY emp_no
ORDER BY m.dept_no;

#departments_dup column on the left 

SELECT d.dept_no, d.dept_name, m.emp_no
FROM departments_dup D 
LEFT JOIN dept_manager_dup M
ON m.dept_no = d.dept_no
GROUP BY emp_no
ORDER BY d.dept_no;