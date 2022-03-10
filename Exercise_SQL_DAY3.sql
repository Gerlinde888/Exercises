-- Task1
SELECT count(*) from departments;
SELECT count(*) from dept_emp;
SELECT count(*) from dept_manager;
SELECT count(*) from employees;
SELECT count(*) from salaries;
SELECT count(*) from titles;


-- Task2
SELECT first_name FROM employees WHERE first_name = "Mark";

-- Task3
select first_name, last_name FROM employees where first_name = "Eric" and last_name like "a%";

-- Tastk4
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date >= 1985;

-- Task5
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN "1990-01-01" AND "1997-12-31";

-- Task6
SELECT first_name, last_name
FROM employees
WHERE emp_no in (SELECT emp_no
                 FROM salaries
                 WHERE salary > 70000);

-- Task7

JOIN WAY

SELECT employees.first_name, employees.last_name, employees.hire_date, departments.dept_name
FROM employees
JOIN dept_emp on employees.emp_no = dept_emp.emp_no
JOIN departments on departments.dept_no = dept_emp.dept_no
WHERE employees.hire_date > 1992 and departments.dept_name = "Research";

OR SUBQUERY WAY

SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.emp_no in (SELECT dept_emp.emp_no
                 FROM dept_emp
                 WHERE dept_emp.dept_no IN 
                          (SELECT departments.dept_no
                           FROM departments
                           WHERE departments.dept_name = "Research"))
                           AND employees.hire_date BETWEEN
 "1992-01-01" AND CURRENT_DATE()
 AND employees.emp_no in (SELECT salaries.emp_no
                          FROM salaries
                          WHERE salaries.to_date > CURRENT_DATE())
;                         

-- Task8
SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.emp_no in (SELECT dept_emp.emp_no
                           FROM dept_emp
                           WHERE dept_emp.dept_no in 
                           (SELECT departments.dept_no
                            FROM departments
                            WHERE departments.dept_name = "Finance"))
                            AND employees.hire_date BETWEEN
                            "1985-01-01" AND CURRENT_DATE()
                            AND employees.emp_no in (SELECT salaries.emp_no
                            FROM salaries
                            WHERE salaries.to_date > CURRENT_DATE()
                            AND salaries.salary > 75000);   
                                                                       

-- Task9
SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary
FROM employees
JOIN titles on employees.emp_no = titles.emp_no
JOIN salaries on employees.emp_no = salaries.emp_no

-- Task10
SELECT employees.first_name, employees.last_name, employees.birth_date, employees.gender, employees.hire_date, titles.title, salaries.salary
FROM employees
JOIN titles on employees.emp_no = titles.emp_no
JOIN salaries on employees.emp_no = salaries.emp_no
WHERE titles.title = "manager";