-- Module Challenge
-- The Number of Retiring Employees by Title 

-- Retirement Titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
	ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Unique Titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;


-- Retiring Titles table
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY (title) 
ORDER BY count DESC;


-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e. birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_employees AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
	ON (e.emp_no = t.emp_no)
WHERE de.to_date = '9999-01-01'
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no	