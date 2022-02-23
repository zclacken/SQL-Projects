SELECT m.dept_no, m.emp_no, d.dept_name
FROM
dept_manager_dup M,
departments_dup D
WHERE m.dept_no = d.dept_no
ORDER BY m.dept_no;

SELECT 
    m.emp_no, 
    e.First_name, 
    e.last_name, 
    m.dept_no, 
    m.from_date
FROM
    dept_manager M,
    employees E
WHERE
    m.emp_no = e.emp_no
ORDER BY m.dept_no;