SELECT dm.*, d.*
FROM dept_manager dm
CROSS JOIN departments d
ORDER BY dm.emp_no, d.dept_no;

SELECT e.*, d.*
FROM departments D 
CROSS JOIN dept_manager dm
JOIN employees e 
ON dm.emp_no = e.emp_no
WHERE d.dept_no <> dm.dept_no
ORDER BY dm.emp_no, d.dept_no;