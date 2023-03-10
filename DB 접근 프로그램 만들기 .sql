
SELECT * FROM titles;
-- Staff --> 결과집합으로 Staff 직원의 이력을 결과 집합으로 만들기 

SELECT *
FROM employees AS e
INNER JOIN titles AS t 
ON e.emp_no = t.emp_no 
WHERE t.title = 'Staff'
ORDER BY e.emp_no desc
LIMIT 10;

-- 2단계 
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
INNER JOIN titles AS t 
ON e.emp_no = t.emp_no 
WHERE t.title = 'Staff'

ORDER BY e.emp_no desc
LIMIT 10;

DESC employees;

SELECT * , count(salary)
FROM salaries
GROUP BY emp_no;

SELECT * 
FROM employees;

-- 풀 네임을 받아 직원의 연봉 받은 횟수를 반환하는 기능을 만들어 주세요 (JAVA 연결)
SELECT count(salary)
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE e.first_name = 'Georgi'AND e.last_name = 'Facello';

