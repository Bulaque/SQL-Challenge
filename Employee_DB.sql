-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/plsLpu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE Department (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);

SELECT * FROM Department;

CREATE TABLE Employees (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL
);

SELECT * FROM Employees;

CREATE TABLE Salarys (
    salarysemp_no INTEGER PRIMARY KEY NOT NULL,
    salary INTEGER NOT NULL
);

SELECT * FROM Salarys;

CREATE TABLE Titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

SELECT* FROM Titles;

CREATE TABLE Department_Employee (
    emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM Department_Employee;

CREATE TABLE Department_Manager (
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Department(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM Department_Manager;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salarys.salary
FROM Employees
INNER JOIN Salarys ON
Employees.emp_no=Salarys.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT Department_Manager.dept_no, Department.dept_name, Department_Manager.emp_no, Employees.last_name, Employees.first_name
FROM Department_Manager
	INNER JOIN Department ON
	Department_Manager.dept_no=Department.dept_no
	INNER JOIN Employees ON
	Department_Manager.emp_no=Employees.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT Department_Employee.dept_no, Department_Employee.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Department_Employee
	INNER JOIN Employees ON 
	Department_Employee.emp_no=Employees.emp_no
	INNER JOIN Department ON
	Department_Employee.dept_no=Department.dept_no
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT Department_Employee.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Department_Employee
	INNER JOIN Employees ON 
	(Department_Employee.emp_no=Employees.emp_no)
	INNER JOIN Department ON
	(Department_Employee.dept_no=Department.dept_no)
	WHERE Department.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT Department_Employee.emp_no, Employees.last_name, Employees.first_name, Department.dept_name
FROM Department_Employee
	INNER JOIN Employees ON 
	(Department_Employee.emp_no=Employees.emp_no)
	INNER JOIN Department ON
	(Department_Employee.dept_no=Department.dept_no)
	WHERE Department.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Freq Counts"
FROM Employees
GROUP BY last_name
ORDER BY "Freq Counts" DESC;
