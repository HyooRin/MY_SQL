USE employees;
-- 문제 풀자
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

SELECT emp_no, salary, hire_date 
FROM 