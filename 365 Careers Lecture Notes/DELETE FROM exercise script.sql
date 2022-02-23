USE employees;
COMMIT;

SELECT * FROM departments
ORDER BY dept_no DESC;

DELETE FROM departments
WHERE dept_no = 'd010';

ROLLBACK;