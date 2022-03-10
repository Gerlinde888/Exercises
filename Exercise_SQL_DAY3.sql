
-- MySQL - DAY3

-- 1. Report -- 


SELECT
COUNT(d.dept_no), COUNT(de.emp_no),COUNT(dm.emp_no),COUNT(e.emp_no),COUNT(s.emp_no),COUNT(t.dept_no)
FROM
(
SELECT
dept_no,
COUNT(dept_no) AS rows
FROM
departmens d JOIN dept_emp de on d.dept_no = de.dept.no
JOIN dept_manager dm on d.dept_no = dem.dept.no
JOIN employees e on e.emp_no = dm.emp_no
JOIN salaries s on e.emp_no = s.emp_no
JOIN titles t on e.emp_no = t.emp_no  
) AS line_items
;


SELECT departments, COUNT(departments.dep_no), dept_emp, COUNT(dept_emp.emp_no), dept_manager,  COUNT(dept_manager.emp_no), employees, COUNT(employees.emp_no), salaries, COUNT(salaries.emp_no), titles, COUNT(titles.emp_no) FROM employees;


-- 1. Report -- 

SELECT COUNT(*) FROM employees;

-- 2. Report -- 

SELECT COUNT(emp_no) FROM employees WHERE first_name = "Mark";

-- 3. Report -- 

SELECT COUNT(emp_no) FROM employees WHERE first_name = "Mark" AND  last_name LIKE 'A%';

-- 4. Report -- 

SELECT COUNT(emp_no) FROM employees WHERE hire_date > "1984-12-31";

-- 5. Report -- 

SELECT COUNT(emp_no) FROM employees WHERE hire_date BETWEEN "1989-12-31" AND "1998-01-01";

-- 6. Report -- 

SELECT COUNT(emp_no) FROM employees WHERE EXISTS (
SELECT salary FROM  salaries WHERE salary > 70000);

SELECT COUNT(salaries.emp_no), 
employees.l_name FROM employees INNER JOIN salaries on employees.emp_no = salaries.emp_no

WHERE EXISTS (

    SELECT
salary
FROM 
salaries
WHERE
salary > 70000) AND
;

-- 7. Report -- 


SELECT employees.last_name, employees.first_name, employees.hire_date FROM employees LEFT JOIN dept_emp on employees.emp_no = dept_emp.emp_no WHERE hire_date > 1991 and < 1993 <

RIGHT JOIN department on department.dept_no = dept_emp.dept_no WHERE department.dept_name = "Research";


SELECT employees.last_name  FROM employees 
WHERE employees.hire_date > "1991-12-31" IN (
SELECT dept_name FROM departments WHERE departments.dept_name = "Research");


SELECT employees.last_name, employees.first_name, employees.hire_date FROM employees LEFT JOIN dept_emp on employees.emp_no = dept_emp.emp_no WHERE employees.hire_date BETWEEN "1991-12-31" AND CURRENT_DATE() IN (
SELECT dept_name FROM departments WHERE departments.dept_name = "Research");


-- 8. Report -- 

SELECT employees.last_name, employees.first_name, employees.hire_date, COUNT(employees.emp_no) FROM employees LEFT JOIN dept_emp on employees.emp_no = dept_emp.emp_no WHERE 
WHERE employees.hire_date = "1991-12-31" IN (
SELECT dept_name FROM departments WHERE departments.dept_name = "Research");
