SELECT first_name FROM employees
GROUP BY first_name;

SELECT first_name, COUNT(first_name) FROM employees
GROUP BY first_name
ORDER BY first_name;