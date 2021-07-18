-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/aF2EYZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Data Modelling for Employee Database

-- The tables were created by using QuickDBD and exporting the results. 

--Before creating tables, the database is checked to make sure that tables do not already exist 
DROP TABLE Employees;
DROP TABLE Departments;
DROP TABLE Department_Employees;
DROP TABLE Department_Manager;
DROP TABLE Salaries;
DROP TABLE Titles;

-- CSV 1: DEPARTMENTS
-- Department number is the primary key
-- Department number is present in DEPT_MANAGER AND DEPT_EMP CSVs

-- Define table name
CREATE TABLE "departments" (
    -- Department number is a string object and set as the primary key
    "dept_no" VARCHAR   NOT NULL,
    -- Department name is a string object
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- CSV 2: TITLES
-- Title id is the primary key
-- Title id is present in EMPLOYEES CSV as emp_title_id
-- Define table name
CREATE TABLE "titles" (
    -- Title ID is a string object and the primary key
    "title_id" VARCHAR   NOT NULL,
    -- Title is a string object
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- CSV 3: EMPLOYEES
-- Employee number is the primary key
-- Employee number is present in DEPT_EMP, DEPT_MANAGER and SALARIES CSVs
-- Define table name
CREATE TABLE "employees" (
    -- Employee number is an integer and set as the primary key
    "emp_no" INT   NOT NULL,
    -- Employee title ID is the primary key in the TITLES table.
    -- Here, it is a foreign key.
    "emp_title_id" VARCHAR   NOT NULL,
    -- Employee birth date is a string object
    "birth_date" VARCHAR   NOT NULL,
    -- Employee first name is a string object
    "first_name" VARCHAR   NOT NULL,
    -- Employee last name is a string object
    "last_name" VARCHAR   NOT NULL,
    -- Employee sex is a string object
    "sex" VARCHAR   NOT NULL,
    -- Employee hire date is a string object
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- CSV 4: EMPLOYEE DEPARTMENT
-- Define table name
CREATE TABLE "dept_emp" (
    -- Employees number is an integer and the primary key in the EMPLOYEE table.
    -- Here it is a foreign key.
    "emp_no" INT   NOT NULL,
    -- Department number is a string object and the primary key in the DEPARTMENTS table.
    -- Here, it is a foreign key.
    "dept_no" VARCHAR   NOT NULL
);

-- CSV 5: DEPT MANAGER
-- Define table name
CREATE TABLE "dept_manager" (
    -- Department number a string object and the primary key in the DEPARTMENTS table.
    -- Here it is a foreign key.
    "dept_no" VARCHAR   NOT NULL,
    -- Employee number is an integer and is the primary key in the EMPLOYEES table.
    -- Here, it is a foreign key.
    "emp_no" INT   NOT NULL
);

-- CSV 6: SALARIES
-- Define table name
CREATE TABLE "salaries" (
    -- Employee number is an integer and is a primary key in the EMPLOYEES table.
    -- Here, it is a foreign key.
    "emp_no" INT   NOT NULL,
    -- Employee salary is an integer
    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

--CSV files are uploaded in the same order as the tables have been created 