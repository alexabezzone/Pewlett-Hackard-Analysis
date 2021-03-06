SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
--INTO retirement_titles
FROM employees AS e
    JOIN title AS t
        ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT(u.title), u.title
INTO retiring_titles_count
FROM unique_titles AS u
GROUP BY u.title 
ORDER BY COUNT(u.title) DESC;

SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date, 
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de ON (de.emp_no = e.emp_no)
JOIN title AS t ON (t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


