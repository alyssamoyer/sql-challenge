-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

--join the employee and salary tables on employee number
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.

--Filter employees table for those hired in1986
SELECT * 
    FROM employees 
    WHERE hire_date >= '1986-01-01' 
        AND hire_date < '1987-01-01'

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

--Join departments, employees, and dept_managers tables. Lists managers of all time.
SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no=m.dept_no
INNER JOIN employees AS e ON
m.emp_no=e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

--Join employees, dept_emp, and department tables. Filters for only the employee's current position so no employee is listed twice.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
de.dept_no=d.dept_no
WHERE de.to_date ='1/1/9999';

--5. List all employees whose first name is "Hercules" and last names begin with "B."

--Filter employees tables for those with the first name Herculus and the last name begins with B (Using a wildcard)
SELECT * 
    FROM employees 
    WHERE first_name = 'Hercules' 
        AND last_name LIKE 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

--Join employees, dept_emp, and department tables. Filters only those in the sales department. Filters for only the employee's current position so no employee is listed twice.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
de.dept_no=d.dept_no
WHERE de.to_date ='1/1/9999'
    AND d.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no=de.emp_no
INNER JOIN departments AS d ON
de.dept_no=d.dept_no
WHERE de.to_date ='1/1/9999'
    AND (d.dept_name = 'Sales'
    OR d.dept_name = 'Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)  AS "total_last_names" 
FROM employees
GROUP BY last_name
ORDER BY "total_last_names" DESC;