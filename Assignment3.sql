USE vbk10;

USE employees;
DELIMITER $$

CREATE FUNCTION fn_highest_paid_employee(num1 int)
RETURNS DOUBLE 
NOT DETERMINISTIC
BEGIN 
	SELECT e.emp_no, first_name, last_name, max(salary) 
	FROM employees AS e 
	JOIN salaries AS s ON e.emp_no = s.emp_no 
	GROUP BY e.emp_no
	ORDER BY MAX(salary) DESC 
	LIMIT num1;
END$$
DELIMITER ;

# Taske-2

DELIMITER $$
CREATE DEFINER=`vbk10`@`%` PROCEDURE `sp_smallest_dept`(OUT d_name varchar(30))
BEGIN
	SELECT dept_name INTO d_name
	FROM employees.dept_emp AS de 
	INNER JOIN employees.departments AS d ON de.dept_no = d.dept_no 
	GROUP BY dept_name 
	ORDER BY count(emp_no) 
	LIMIT 1;
END
DELIMITER ;

CALL sp_smallest_dept(@dept_name);
SELECT @dept_name;

#TASK-4
DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee(
	dob DATE NOT NULL,
	f_name VARCHAR(30) NOT NULL, 
	l_name VARCHAR(30) NOT NULL, 
	gender VARCHAR(5) NOT NULL,
	dep_id VARCHAR(10) NOT NULL, 
	title VARCHAR(20) NOT NULL,
	sal INT NOT NULL,
    emp_no INT PRIMARY KEY AUTO_INCREMENT NOT NULL 
)Engine=InnoDB;

DROP TABLE IF EXISTS department;
CREATE TABLE IF NOT EXISTS department(
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE IF NOT EXISTS dept_emp(
	fk_emp_no INT NOT NULL, 
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	FOREIGN KEY(fk_emp_no) REFERENCES employee(emp_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

DROP TABLE IF EXISTS title;
CREATE TABLE IF NOT EXISTS title(
	fk_emp_no INT PRIMARY KEY NOT NULL, 
    title VARCHAR(50) NOT NULL,
    FOREIGN KEY(fk_emp_no) REFERENCES employee(emp_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

DROP TABLE IF EXISTS salary;
CREATE TABLE IF NOT EXISTS salary(
	fk1_emp_no INT PRIMARY KEY NOT NULL, 
    salary INT NOT NULL,
    FOREIGN KEY(fk1_emp_no) REFERENCES employee(emp_no)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

# Task-4
CALL vbk10_sp_create_new_employee('1970-03-16','bachhan', 'pandey', 'M', 'd001', 'BHAI', 2000000);
SELECT MAX(emp_no) FROM employees;
CALL vbk10_sp_create_new_employee('1970-03-16','chanky', 'pandey', 'F', 'd002', 'BHAI', 2000);
SELECT MAX(emp_no) FROM employees;

SELECT * FROM departments WHERE dept_no = 'd001';
SELECT * FROM employee;

SELECT MAX(emp_no) FROM employees;


use employees;
	select * from employees
	WHERE emp_no = 500014;