INSERT INTO employees
(
emp_no,
birth_date,
first_name, 
last_name,
gender,
hire_date
) VALUES
(
999901,
'1986-04-21',
'John',
'Smith',
'M',
'2011-01-01'
);

INSERT INTO employees
VALUES
(999903,
'1977-09-14',
'Johnathan', 
'Creek',
'M',
'1999-01-01'
);

SELECT * FROM employees
ORDER BY emp_no DESC
LIMIT 10;
