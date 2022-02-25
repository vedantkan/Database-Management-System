USE employees;

# Task 1
SELECT e.emp_no, first_name, last_name, max(salary) 
FROM employees AS e 
JOIN salaries AS s ON e.emp_no = s.emp_no 
GROUP BY e.emp_no;

#Task 2
SELECT dept_name, count(emp_no) AS emp_count 
FROM dept_emp AS de 
INNER JOIN departments AS d ON de.dept_no = d.dept_no 
GROUP BY dept_name 
ORDER BY emp_count 
LIMIT 1;

#Task 3
SELECT e.emp_no, first_name, last_name, title 
FROM employees AS e 
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE title LIKE 'Senior%'
GROUP BY title, e.emp_no;

#Task 4
SELECT d.dept_name, MAX(salary) AS max_salary, AVG(salary) AS avg_salary
FROM departments AS d JOIN dept_emp as de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no 
GROUP BY d.dept_name
ORDER BY max_salary DESC
LIMIT 1;

#Task 5
SELECT title, AVG(salary)
FROM salaries AS s 
JOIN titles AS t ON s.emp_no = t.emp_no
WHERE title LIKE 'Senior Engineer'
GROUP BY title;