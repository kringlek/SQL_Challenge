-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no as "employee number",
	   emp.last_name as "last name",
   	   emp.first_name as "first name",
       emp.sex, salaries.salary
from employees emp
inner join salaries  on salaries.emp_no = emp.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name as "first name",
       last_name as "last name",
       hire_date as "hire date"
from employees
where date_part('year', hire_date) = 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's 
--    employee number, last name, first name.
select dmg.dept_no as "department number",
		  dep.dept_name as "department name",
	      dmg.emp_no as "manager`s employee number",
		  emp.last_name as "last name",
		  emp.first_name as "first name"
		  from dept_manager dmg
inner join employees emp on emp.emp_no = dmg.emp_no
inner join departments dep on dep.dept_no = dmg.dept_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and 
--    department name.
select emp.emp_no as "employee number",
          emp.last_name  as "last name",
          emp.first_name as "first name",
          dep.dept_name  as "department name"
from employees emp 
inner join dept_emp dem on dem.emp_no = emp.emp_no
inner join departments dep on dep.dept_no = dem.dept_no

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name as "first name",
       last_name  as "last name", sex 
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select emp.emp_no as "employee number",
          emp.last_name  as "last name",
          emp.first_name as "first name",
          dep.dept_name  as "department name"
from employees emp 
inner join dept_emp dem on dem.emp_no  = emp.emp_no
inner join departments dep on dep.dept_no = dem.dept_no
where dep.dept_name  = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--    and department name.
select emp.emp_no as "employee number",
         emp.last_name  as "last name",
         emp.first_name as "first name",
         dep.dept_name  as "department name"
from employees emp 
inner join dept_emp dem on dem.emp_no  = emp.emp_no
inner join departments dep on dep.dept_no = dem.dept_no
where dep.dept_name in ('Sales', 'Development')
	  
--  8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name,
       count(last_name) as "count last name"
from employees
group by last_name
order by "count last name" desc