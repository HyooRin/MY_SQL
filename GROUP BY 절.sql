
USE employees;
SHOW TABLES;

SELECT * FROM salaries
LIMIT 10; 
-- LIMIT 10, 5;

SELECT *
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10001;

-- Group by 절에 조건절을 사용할 때는 having 절을 사용 
-- 2단계 
SELECT * , count(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계 max, min 
SELECT * , count(salary) AS COUNT,
		max(salary) AS MAX, min(salary) AS MIN,
        sum(salary) AS SUM, round(avg(salary), 2) AS avg
FROM salaries
GROUP BY emp_no;

-- 1단계 
SELECT *
FROM employees
GROUP BY gender;

-- 2단계 
SELECT *, count(gender)
FROM employees
GROUP BY gender;

-- 조건 두개 걸기 
SELECT * , count(hire_date)
FROM employees
GROUP BY hire_date, gender;

-- 
SELECT * FROM employees;
-- employees(1) :  dept_emp(N)
SELECT * FROM dept_emp;
-- dept_emp(N) : departments(1) -- 1 : N
SELECT * FROM departments;

-- employees : departments --> N : M 관계 차수를 가진다.
-- 중간 테이블 dept_emp 만들어서 N : M 를 표현하고 있다.

-- employees : dept_emp --> 1: N 관계로 풀어진다.
-- departments : dept_emp --> 1: N 관계로 풀어진다.  

-- 1단계 
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 중복 컬럼 제거하기 
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

SELECT * FROM departments;

-- 3 단계 
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no;

-- 4단계
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments AS dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 문제 풀기
-- 1. emp_no로 그룹을 나누고 title table에서 title과 /  salaries table에서 salary를 출력하라. (join 사용)
SELECT t.title, s.salary
FROM titles AS t
INNER JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY t.emp_no; 

-- 2. 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라.(몇명인지도 출력)
-- 확인하기
 SELECT *, count(*)        
FROM salaries
GROUP BY emp_no
HAVING salary >= 65000;

-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT *, max(salary)
FROM salaries AS s
LEFT JOIN titles AS t
ON s.emp_no = t.emp_no
GROUP BY s.emp_no
HAVING title LIKE '% Engineer';

-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT dept_name, count(dp.dept_no) AS count
FROM departments AS dp
LEFT JOIN dept_emp AS e
ON dp.dept_no = e. dept_no
GROUP BY dp.dept_no;

-- 5. 각 직급별로 몇 명이 있는지 출력해보자
SELECT * , count(title)
FROM titles
GROUP BY title;

-- 6. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT *, max(salary)
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY gender
HAVING gender = 'M';










