-- QA table data 
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM department_employees;
SELECT * FROM department_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT * FROM employees;
SELECT * FROM salaries;

SELECT  e.emp_no AS employee_number, 
		e.last_name, 
		e.first_name, 
		e.gender, 
		s.salary	
	FROM employees AS e
		JOIN salaries AS s ON
		e.emp_no = s.emp_no
	ORDER BY employee_number;

SELECT * FROM employees;

-- 2. List employees who were hired in 1986.

SELECT  e.emp_no AS employee_number, 
		e.last_name, 
		e.first_name, 
		e.hire_date 
	FROM employees AS e
	WHERE e.hire_date >= '1986-01-01' and e.hire_date <= '1986-12-31';
	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT * FROM employees; 
SELECT * FROM departments; 
SELECT * FROM department_manager; 


SELECT  d.dept_no AS department_number,
		d.dept_name AS department_name,
		e.emp_no AS employee_number,
		e.first_name, 
		e.last_name, 
		dm.from_date AS start_date,
		dm.to_date AS end_date
FROM departments d
	JOIN department_manager dm ON
	d.dept_no = dm.dept_no
	JOIN employees e ON
	dm.emp_no = e.emp_no
	WHERE dm.to_date = '9999-01-01';


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM department_employees;

SELECT  e.emp_no AS employee_number,
		e.last_name,
		e.first_name,
		d.dept_name AS department_name
	FROM departments d
	JOIN department_employees de ON
	d.dept_no = de.dept_no
		JOIN employees e ON
		de.emp_no = e.emp_no
ORDER BY employee_number;
		

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees;

SELECT  e.first_name, 
		e.last_name
	FROM employees e
	WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
ORDER BY e.last_name;


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM department_employees;

SELECT  e.emp_no AS employer_number,
		e.last_name,
		e.first_name,
		d.dept_name AS department_name
	FROM departments d
	JOIN department_employees de ON
	d.dept_no = de.dept_no
		JOIN employees e ON
		de.emp_no = e.emp_no
	WHERE d.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments
-- including their employee number, last name, first name, and department name

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM department_employees;

SELECT  e.emp_no AS employer_number,
		e.last_name,
		e.first_name,
		d.dept_name AS department_name
	FROM departments d
	JOIN department_employees de ON
	d.dept_no = de.dept_no
		JOIN employees e ON
		de.emp_no = e.emp_no
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
	ORDER BY e.emp_no;


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT * FROM employees;

SELECT  e.last_name, 
		COUNT(e.last_name) AS frequency_count
	FROM employees e
	GROUP BY e.last_name
ORDER BY frequency_count DESC;

