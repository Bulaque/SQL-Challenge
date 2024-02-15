-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/plsLpu
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Table is not showing anything
CREATE TABLE Department (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);

SELECT * FROM Department;

-- Table is not showing anything
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

-- Table does not show anything
CREATE TABLE Salarys (
    salarysemp_no INTEGER PRIMARY KEY NOT NULL,
    salary INTEGER NOT NULL
);

SELECT * FROM Salarys;

-- Table does not show anything
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

-- Table works fine
CREATE TABLE Titles (
    title_id VARCHAR(255) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

SELECT* FROM Titles;



