
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
    emp_no INTEGER NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INTEGER NOT NULL
);

SELECT * FROM Salarys;

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

CREATE TABLE Titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

SELECT* FROM Titles;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp_no, last_name, first_name, sex
FROM Employees
WHERE emp_no IN (
	SELECT emp_no
	FROM Salary
	WHERE salary
);

--List the first name, last name, and hire date for the employees who were hired in 1986.

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

--List each employee in the Sales department, including their employee number, last name, and first name.

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).