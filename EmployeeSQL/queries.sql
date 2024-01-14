Select * from public."Department_Employees"
Select * from public."Department_Managers"
Select * from public."Departments"
Select * from public."Employees"
Select * from public."Salaries"
Select * from public."Titles"


-- List the employee number, last name, first name, sex, and salary of each employee.
Select emp.emp_no,last_name,first_name,sex,salary 
from public."Employees" as emp
join public."Salaries" as sal
on emp.emp_no = sal.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name,last_name,hire_date
from public."Employees"
where EXTRACT(YEAR FROM hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dep_man.dept_no, dep.dept_name, dep_man.emp_no,emp.last_name, first_name
from public."Employees" as emp
join public."Department_Managers" as dep_man
on emp.emp_no = dep_man.emp_no
join public."Departments" as dep
on dep.dept_no = dep_man.dept_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select dep_emp.dept_no, emp.emp_no, emp.last_name, first_name, dept_name
from public."Employees" as emp
join public."Department_Employees" as dep_emp
on emp.emp_no = dep_emp.emp_no
join public."Departments" as dep
on dep.dept_no = dep_emp.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from public."Employees"
where first_name = 'Hercules'
and last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
select dep.dept_name, dep_emp.emp_no, emp.last_name, emp.first_name
from public."Departments" as dep, public."Department_Employees" as dep_emp, public."Employees" as emp
where dep.dept_no = dep_emp.dept_no
and dep_emp.emp_no = emp.emp_no
and dep.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select dep_emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from public."Departments" as dep
join public."Department_Employees" as dep_emp
on dep.dept_no = dep_emp.dept_no
join public."Employees" as emp 
on dep_emp.emp_no = emp.emp_no
where (dep.dept_name = 'Sales' OR dep.dept_name = 'Development')

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(*) as frequency_counts
from public."Employees"
group by last_name
order by frequency_counts desc


