Queries for Questions:1-8

-- 1.List the employee number, last name, first name, sex, and salary of each employee.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
	
	
from
	"Employees"  e 
Join
	"Salaries" s on e.emp_no = s.emp_no



-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
select 
    first_name,
    last_name,
    hire_date
From
    "Employees"
where
    extract (year from hire_date) = 1986
order by
    hire_date ASC, last_name ASC, first_name ASC



-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.
select
	d.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
from
	"Department Manager"  dm 
Join
	"Employees" e on dm.emp_no = e.emp_no
Join 
	"Department" d on dm.dept_no = d.dept_no


-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select
	de.dept_no,
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name	
from
	"Employees"  e 
Join
	"Department Employee" de on e.emp_no = de.emp_no
Join



-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select
	e.first_name,
	e.last_name,
	e.sex
From
	"Employees" e
Where
	"first_name" = 'Hercules' and 
	"last_name" like 'B%';

--6.List each employee in the Sales department, including their employee number, last name, and first name.
select
    e.emp_no,
    e.last_name,
    e.first_name,
    e.hire_date
From
    "Employees" e
Join
    "Department Employee" de on e.emp_no = de.emp_no
Join
    "Department" d on de.dept_no = d.dept_no
Where
    d.dept_name = 'Sales'  


 -- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
    select
        e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
    From
        "Employees" e
    Join
        "Department Employee" de on e.emp_no = de.emp_no
    Join
        "Department" d on de.dept_no = d.dept_no
    Where
        d.dept_name in ('Sales','Development')
    
    
 --8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
    select
        e.last_name,
         count(e.emp_no) as num_last_name
    from
        "Employees" e
    group by
        e.last_name
    order by
        num_last_name desc;   

