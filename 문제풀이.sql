USE employees;
-- 문제 풀자 1
-- employees 테이블과 salaries테이블을 이용하여 
-- 연봉이 100000 이상인 사람 중 연봉이 높은 순으로 사번, 연봉, 고용일을 출력하시오.
-- 단, 중첩 서브쿼리(WHERE절)를 사용하고, 컬럼 50개까지 출력하시오.

SELECT * FROM employees;
SELECT * FROM salaries;

-- 연봉 >= 100000 연봉높은순:오름차순 정렬 emp_no
SELECT * 
FROM salaries 
WHERE salary >= 100000
ORDER BY salary DESC;

-- 직원  emp_no + (salary 추가) 
SELECT emp_no, hire_date
FROM employees;

-- answer 1
SELECT e.emp_no, salary, hire_date 
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE salary IN(SELECT salary FROM salaries WHERE salary >= 100000)
ORDER BY salary DESC LIMIT 50;

-- 현우 문제 
-- 중첩 쿼리문을 사용하여 각 부서의 번호와 해당되는 부서의 '현재' 매니저의 사번, 성, 이름, 생일을 조회해보자
SELECT * FROM dept_manager; -- emp_no, dept_no, to_date-> '현재'
SELECT * FROM employees; -- emp_no, birth_date ,first_name, last_name 

-- '현재' 조건  
SELECT * 
FROM dept_manager
WHERE to_date LIKE '9999%'; 

-- 내 답 
SELECT dept_no, m.emp_no, first_name, last_name, birth_date
FROM dept_manager AS m
LEFT JOIN employees AS e
ON m.emp_no = e.emp_no
WHERE to_date IN(SELECT to_date FROM dept_manager WHERE to_date LIKE '9999%');

-- 현우 답 
SELECT d.dept_no, e.emp_no, e.first_name, e.last_name, e.birth_date
FROM employees as e
INNER JOIN dept_manager as d
ON e.emp_no = d.emp_no
WHERE e.emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01');

-- 서영 문제 
-- 현재 'Senior'가 포함되지 않는 직급에 속해있는 사원들 중,
-- 현재 급여를 65000~66000 사이로 받고 있는 사원들의 수???를 구하시오
-- 단, FROM 절과 WHERE 절 모두 서브 쿼리를 사용하시오 
SELECT * FROM employees;
SELECT * FROM titles; -- senior 포함 엑스 
SELECT * FROM salaries; -- 65000~66000 

-- 'Senior'가 포함되지 않는 사원 + 현재
SELECT * 
FROM titles
WHERE title NOT LIKE 'senior%' AND to_date = '9999-01-01';

-- 급여를 65000~66000 사이로 받고 있는 사원들  
SELECT *
FROM salaries
WHERE salary BETWEEN 65000 AND 66000 AND to_date = '9999-01-01' ;

-- 다시 풀기
SELECT count(*)
FROM (SELECT * 
		FROM titles 
        WHERE title NOT LIKE '%senior%' 
        AND to_date = '9999-01-01') AS t
INNER JOIN salaries AS s 
ON t.emp_no = s.emp_no
WHERE salary IN(SELECT salary FROM salaries WHERE salary BETWEEN 65000 AND 66000) AND s.to_date = '9999-01-01';
-- 현재 'Senior'가 포함되지 않는 직급에 속해 있는 사원들 중,
-- 현재 급여를 65000 ~ 66000 사이로 받고 있는 사원들의 수를 구하시오.
-- 단, FROM 절과 WHERE 절 모두 서브 쿼리를 사용하시오.

SELECT * FROM titles;
SELECT * FROM employees;

SELECT COUNT(*) AS '사원 수'
FROM (
        SELECT e.emp_no
        FROM employees AS e
        INNER JOIN titles AS t
        ON e.emp_no = t.emp_no
        WHERE NOT (title LIKE '%Senior%')
                    AND t.to_date = '9999-01-01'
    ) AS et
WHERE emp_no IN (
        SELECT emp_no
        FROM salaries
        WHERE (salary BETWEEN 65000 AND 66000)
                AND (to_date = '9999-01-01')
    ); 
    
-- 현서 문제 
-- 1998년 이후 기준으로 봉급제일 많이 받는 부서 순으로 조회해보세요
-- departments, salaries, dept_emp
-- 중첩쿼리 



















