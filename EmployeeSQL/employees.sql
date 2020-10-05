Drop Table if exists departments;
Drop Table if exists employees;
Drop Table if exists dept_emp;
Drop Table if exists dept_manager;

create table departments (
	dept_no Integer Primary Key,
	dept_name Varchar(30) not null
);

Select * From departments

create table employees (
	emp_no Integer not null primary key,
	emp_title_id VARCHAR(30) not null,
	birth_date Date not null,
	first_name VARCHAR(30) not null,
	last_name VARCHAR(30) not null,
	sex VARCHAR(30) not null,
	hire_date Date not null
);

Select * From employees

create table dept_emp (
	emp_no integer not null,
	dept_no Integer not null,
	emp_id integer not null,
	Foreign Key (emp_id) references employees(emp_no)
);

Select * from dept_emp

create table dept_manager (
	dept_no Integer not null,
	emp_no integer not null,
	emp_id integer not null,
	Foreign Key (emp_id) references employees(emp_no)
);

Select * from dept_manager

create table salaries (
	emp_no integer not null,
	salary Float not null,
	emp_id integer not null,
	Foreign Key (emp_id) references employees(emp_no)
);

Select * from salaries

create table titles (
	title_id integer not null,
	title Varchar(30) not null,
	emp_id integer not null,
	Foreign Key (emp_id) references employees(emp_no)
);

Select * from titles