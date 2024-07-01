CREATE TABLE IF NOT EXISTS departments (
	dept_no VARCHAR(6),
	dept_name VARCHAR(30) NOT NULL,
	Primary Key (dept_no)
);

CREATE TABLE IF NOT EXISTS titles (
	title_id VARCHAR(7),
	title VARCHAR(30) NOT NULL,
	Primary Key (title_id)
);

CREATE TYPE genders AS ENUM ('M','F');
	
CREATE TABLE IF NOT EXISTS employees (
	emp_no INT,
	emp_title_id VARCHAR(7) NOT NULL references titles(title_id),
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex genders NOT NULL,
	hire_date DATE DEFAULT NOW(),
	Primary Key (emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp (
	dept_emp_id SERIAL,
	emp_no INT NOT NULL references employees(emp_no),
	dept_no VARCHAR(6) NOT NULL references departments(dept_no),
	Primary Key (dept_emp_id)
);

CREATE TABLE IF NOT EXISTS dept_manager (
	dept_man_id SERIAL,
	dept_no VARCHAR(6) NOT NULL references departments(dept_no),
	emp_no INT NOT NULL references employees(emp_no),
	Primary Key (dept_man_id)
);

CREATE TABLE IF NOT EXISTS salaries ( 
	salary_id SERIAL, 
	emp_no INT NOT NULL references employees(emp_no),
	salary INT NOT NULL,
	Primary Key (salary_id)
);