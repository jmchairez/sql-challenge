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

Select * From departments

create table titles (
	title_id Varchar Primary Key,
	title Varchar not null
);

Select * from titles

create table salaries (
	emp_no integer Primary Key,
	salary Float not null
);

Select * from salaries

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

Select * From employees

create table dept_emp (
	emp_no integer not null,
	dept_no Varchar not null
);

Select * from dept_emp

create table dept_manager (
	dept_no Varchar not null,
	emp_no integer references salaries(emp_no),
	Primary Key (emp_no)
);

Select * from dept_manager
