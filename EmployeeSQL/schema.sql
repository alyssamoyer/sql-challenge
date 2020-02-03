-- Create a new table for departments 
CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

-- Create a new table for employees 
CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- Create a new table for dept_emp
CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  from_date DATE NOT NULL,
  to_date DATE,
  PRIMARY KEY (emp_no, dept_no, from_date)
);

-- Create a new table for dept_manager
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  from_date DATE NOT NULL,
  to_date DATE,
  PRIMARY KEY (emp_no, dept_no, from_date)
);

-- Create a new table for salaries
CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  salary INTEGER NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  PRIMARY KEY (emp_no, salary, from_date)
);

-- Create a new table for titles
CREATE TABLE titles (
  emp_no INTEGER NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  title VARCHAR(50) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  PRIMARY KEY (emp_no, title, from_date)
);

--Read departments csv into departments table
COPY departments 
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\departments.csv'
CSV HEADER;

--Read employees csv into employees table
COPY employees
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\employees.csv'
CSV HEADER;

--Read dept_emp csv into dept_emp table
COPY dept_emp
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\dept_emp.csv'
CSV HEADER;

--Read dept_manager csv into dept_manager table
COPY dept_manager
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\dept_manager.csv'
CSV HEADER;

--Read salaries csv into salaries table
COPY salaries
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\salaries.csv'
CSV HEADER;

--Read titles csv into titles table
COPY titless
FROM 'C:\Users\allym\OneDrive\Documents\Boot Camp Homework\sql-challenge\Data\titles.csv'
CSV HEADER;

