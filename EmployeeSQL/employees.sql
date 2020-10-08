Drop Table if exists departments;
Drop Table if exists employees;
Drop Table if exists dept_emp;
Drop Table if exists dept_manager;
Drop Table if exists salaries;
Drop Table if exists titles;

create table departments (
	dept_no Varchar Primary Key,
	dept_name Varchar not null
);

create table titles (
	title_id Varchar Primary Key,
	title Varchar not null
);

create table salaries (
	emp_no integer Primary Key,
	salary Float not null
);

create table employees (
	emp_no Integer references salaries(emp_no),
	emp_title_id VARCHAR references titles(title_id),
	birth_date Date not null,
	first_name VARCHAR not null,
	last_name VARCHAR not null,
	sex VARCHAR not null,
	hire_date Date not null,
	Primary Key (emp_no, emp_title_id)
);

create table dept_emp (
	emp_no integer not null,
	dept_no Varchar not null
);

create table dept_manager (
	dept_no Varchar not null,
	emp_no integer references salaries(emp_no),
	Primary Key (emp_no)
);

Select employees.emp_no, last_name, first_name, sex, salary
From employees
inner join salaries
on  employees.emp_no = salaries.emp_no
;

Select first_name, last_name, hire_date
From employees
where hire_date Between '1986-01-01' and '1986-12-31'
;

