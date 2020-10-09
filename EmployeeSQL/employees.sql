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

-- 1) List the following details of each employee: employee number, last name, first name, sex, and salary.
Select employees.emp_no, last_name, first_name, sex, salary
From employees
inner join salaries
on  employees.emp_no = salaries.emp_no
;

--2)List first name, last name and hire date for employees who where hired in 1986.
Select first_name, last_name, hire_date
From employees
where hire_date Between '1986-01-01' and '1986-12-31'
;

--3)List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, and first name.
Select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
From departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no
;

--4)List the department of each employee with the following information: employee number,
--last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
;

--5)List first name, last name, and sex for employees whose first name is "Hercules" and last names with "B".
Select first_name, last_name, sex
From employees
where first_name = 'Hercules' and last_name like 'B%'
;

--6)List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales'
;

--7)List all employees in the Sales and Development departments, including their employee number, last name, first name,
--and department name
Select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
;

--8)In descending order, list the frequency count of employees last name, i.e., how many employees share each last name.
Select last_name,
Count(last_name) as Frequency
from employees
group by last_name
order by count(last_name) Desc
;