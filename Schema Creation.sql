--Check that the tables do not already exist 
DROP TABLE Employees;
DROP TABLE Departments;
DROP TABLE Department_Employees;
DROP TABLE Department_Manager;
DROP TABLE Salaries;
DROP TABLE Titles;

--Use to remove tables if there are errors
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS dept_emp cascade;
DROP TABLE IF EXISTS dept_manager cascade;
DROP TABLE IF EXISTS employees cascade;
DROP TABLE IF EXISTS salaries cascade;
DROP TABLE IF EXISTS titles cascade;

--CREATE ALL THE TABLES FOR THE CSVS
-------------------------------------

--Create table for DEPARTMENTS CSV
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

--Check DEPARTMENTS table was created
SELECT * FROM departments;

--Create table for TITLES CSV
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);

--Check TITLES table was created
SELECT * FROM titles;

--Create table for EMPLOYEES CSV
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR NOT NULL,
    foreign key (emp_title_id) references titles(title_id)
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL
);

--Check EMPLOYEES table was created
SELECT * FROM employees;

--Create table for DEPT_EMP CSV
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Check DEPT_EMP table was created
SELECT * FROM dept_emp;

--Create table for DEPT_MANAGER CSV
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Check DEPT_MANAGER table was created
SELECT * FROM dept_manager;

--Create table for SALARIES CSV
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);

--Check SALARIES table was created
SELECT * FROM salaries;