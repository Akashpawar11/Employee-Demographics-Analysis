-- Ron Swanson is not in the employee_demographics
-- Andy Dwyer is not in any department	
    
-- 1.Find all employees and their ages
SELECT first_name , last_name, age
FROM employee_demographics ;

-- 2.List employees and their occupations from the employee salary table
SELECT employee_id, first_name , last_name, occupation , salary
FROM employee_salary ;

-- 3.Find the total number of employees in the department "Parks and Recreation":

SELECT count(*) as employee_total
FROM employee_salary as s JOIN  parks_departments AS d on s.dept_id = d.department_id
where department_name = "Parks and Recreation";

--  Display employees with a salary greater than $60,000
SELECT first_name, last_name , salary
FROM employee_salary
WHERE salary > 60000 ;

-- Find employees and their respective departments
SELECT es.first_name, es.last_name, pd.department_name 
FROM employee_salary es
JOIN parks_departments pd ON es.dept_id = pd.department_id;

-- List employees with their age and salary
SELECT es.first_name , es.last_name , es.salary , ed.age
FROM employee_salary es
JOIN employee_demographics ed on es.employee_id = ed.employee_id ; 

-- Find the youngest employee in the company
SELECT first_name , last_name , age
FROM employee_demographics
ORDER BY age asc
limit 1 ; 

-- Find the employee with the highest salary
SELECT first_name , last_name , salary
FROM employee_salary
ORDER BY salary desc
limit 1 ; 

-- List all female employees and their occupations
SELECT ed.first_name , ed.last_name, es.occupation
FROM employee_demographics ed
JOIN employee_salary es ON  ed.employee_id = ed.employee_id
WHERE ed.gender ='Female' ;

-- Find employees whose salary is between $30,000 and $70,000
SELECT first_name , last_name , salary
FROM employee_salary
where salary between 30000 and 70000 ; 

-- Calculate the average salary for each department 
SELECT pd.department_name , AVG(es.salary) AS avg_salary 
FROM employee_salary AS es
JOIN parks_departments AS pd ON es.dept_id = pd.department_id
GROUP BY department_name ; 

--  Count how many employees are above the age of 40
SELECT COUNT(*) AS employees_above_40 
FROM employee_demographics
WHERE age > 40 ;

--  Get the total salary expense of the company
SELECT SUM(salary) AS total_salary_expense
FROM employee_salary ; 

--   List all employees and their departments, including those with no assigned department
SELECT es.first_name, es.last_name, pd.department_name 
FROM employee_salary es
LEFT JOIN parks_departments pd ON es.dept_id = pd.department_id
WHERE pd.department_name IS NULL;

--  Find employees with the same first name
SELECT first_name, COUNT(*) AS count 
FROM employee_demographics 
GROUP BY first_name 
HAVING COUNT(*) > 1;

-- Calculate the average age of employees by gender
SELECT gender ,  AVG(age) as avg_age_gender
FROM employee_demographics
GROUP BY gender
 



