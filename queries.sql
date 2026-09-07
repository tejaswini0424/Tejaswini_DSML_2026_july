-- ============================================================
-- ORACLE SQL SINGLE-ROW FUNCTIONS — PRACTICE QUESTIONS
-- Compiled from your tutor's Colab notes
-- ============================================================
-- NOTE: "FROM dual" queries work on almost any free SQL site
-- (MySQL, PostgreSQL via workaround, Oracle, etc). MySQL even
-- accepts "FROM DUAL" as an optional no-op.
--
-- The HR.EMPLOYEES queries will ONLY run if your free SQL site
-- has that schema pre-loaded (some sites like LiveSQL / certain
-- Oracle sandboxes do). If your site doesn't have it, just run
-- Sections 1 and 3 (the DUAL ones) — they're self-contained.
-- ============================================================


-- ================================================
-- SECTION 1: CHARACTER FUNCTIONS — USING DUAL
-- ================================================

SELECT UPPER('oracle') FROM dual;
SELECT LOWER('ORACLE') FROM dual;
SELECT INITCAP('oracle sql programming') FROM dual;
SELECT LENGTH('oracle') FROM dual;
SELECT LENGTH('data science') FROM dual;
SELECT SUBSTR('oracle',1,3) FROM dual;
SELECT SUBSTR('oracle',2,3) FROM dual;
SELECT SUBSTR('oracle',3) FROM dual;
SELECT SUBSTR('oracle',-3) FROM dual;
SELECT CONCAT('oracle','programming') FROM dual;
SELECT CONCAT('oracle ','programming') FROM dual;
SELECT REPLACE('hello world','world','oracle') FROM dual;
SELECT REPLACE('123-456-789','-','') FROM dual;
SELECT TRIM('   oracle   ') FROM dual;
SELECT LTRIM('   oracle') FROM dual;
SELECT RTRIM('oracle   ') FROM dual;
SELECT LTRIM('****oracle','*') FROM dual;
SELECT RTRIM('1230000','0') FROM dual;
SELECT LPAD('123',5,'0') FROM dual;
SELECT LPAD('oracle',7,'_') FROM dual;
SELECT RPAD('123',5,'0') FROM dual;
SELECT RPAD('oracle',10,'*') FROM dual;
SELECT ASCII('A') FROM dual;
SELECT CHR(65) FROM dual;


-- ================================================
-- SECTION 2: CHARACTER FUNCTIONS — USING HR.EMPLOYEES
-- (needs the HR schema loaded on your SQL site)
-- ================================================

-- UPPER
SELECT first_name, UPPER(first_name)
FROM hr.employees;

-- LOWER
SELECT first_name, LOWER(first_name)
FROM hr.employees;

-- INITCAP
SELECT first_name, INITCAP(first_name)
FROM hr.employees;

-- LENGTH
SELECT first_name, LENGTH(first_name)
FROM hr.employees;

-- SUBSTR (first 3 chars)
SELECT first_name, SUBSTR(first_name,1,3)
FROM hr.employees;

-- SUBSTR (first character only)
SELECT first_name, SUBSTR(first_name,1,1)
FROM hr.employees;

-- SUBSTR (last 3 characters)
SELECT first_name, SUBSTR(first_name,-3)
FROM hr.employees;

-- CONCAT
SELECT first_name, last_name, CONCAT(first_name, last_name)
FROM hr.employees;

-- Full name using ||
SELECT first_name || ' ' || last_name AS full_name
FROM hr.employees;

-- REPLACE
SELECT first_name, REPLACE(first_name,'a','@')
FROM hr.employees;

-- TRIM
SELECT first_name, TRIM(first_name)
FROM hr.employees;

-- LTRIM
SELECT first_name, LTRIM(first_name)
FROM hr.employees;

-- RTRIM
SELECT first_name, RTRIM(first_name)
FROM hr.employees;

-- LPAD on employee_id
SELECT employee_id, LPAD(employee_id,6,'0') AS formatted_employee_id
FROM hr.employees;

-- RPAD on first_name
SELECT first_name, RPAD(first_name,15,'.')
FROM hr.employees;

-- ASCII
SELECT first_name, ASCII(first_name)
FROM hr.employees;


-- ================================================
-- SECTION 3: NUMERIC FUNCTIONS — USING DUAL
-- ================================================

-- CEIL
SELECT CEIL(10.1) FROM dual;
SELECT CEIL(10.9) FROM dual;
SELECT CEIL(10) FROM dual;
SELECT CEIL(99.01) FROM dual;

-- FLOOR
SELECT FLOOR(10.1) FROM dual;
SELECT FLOOR(10.9) FROM dual;
SELECT FLOOR(10) FROM dual;
SELECT FLOOR(99.99) FROM dual;

-- MOD
SELECT MOD(10,3) FROM dual;
SELECT MOD(20,5) FROM dual;
SELECT MOD(11,2) FROM dual;
SELECT MOD(100,7) FROM dual;

-- ABS
SELECT ABS(-10.3) FROM dual;
SELECT ABS(-100) FROM dual;
SELECT ABS(100) FROM dual;
SELECT ABS(0) FROM dual;

-- POWER
SELECT POWER(2,3) FROM dual;
SELECT POWER(5,2) FROM dual;
SELECT POWER(10,3) FROM dual;
SELECT POWER(2,0.5) FROM dual;
SELECT POWER(2,1/2) FROM dual;

-- SQRT
SELECT SQRT(2) FROM dual;
SELECT SQRT(16) FROM dual;
SELECT SQRT(25) FROM dual;
SELECT SQRT(100) FROM dual;


-- ================================================
-- SECTION 4: NUMERIC FUNCTIONS — USING HR.EMPLOYEES
-- ================================================

-- CEIL on monthly salary
SELECT employee_id, salary,
       salary / 12 AS divided_salary,
       CEIL(salary / 12) AS ceil_value
FROM hr.employees;

-- FLOOR on monthly salary
SELECT employee_id, salary,
       salary / 12 AS divided_salary,
       FLOOR(salary / 12) AS floor_value
FROM hr.employees;

-- MOD on employee_id
SELECT employee_id, MOD(employee_id,2) AS remainder
FROM hr.employees;

-- Even employee IDs
SELECT employee_id, first_name
FROM hr.employees
WHERE MOD(employee_id,2) = 0;

-- Odd employee IDs
SELECT employee_id, first_name
FROM hr.employees
WHERE MOD(employee_id,2) = 1;

-- ABS: difference from 10000
SELECT employee_id, salary,
       ABS(salary - 10000) AS salary_difference
FROM hr.employees;

-- POWER: salary squared
SELECT employee_id, salary,
       POWER(salary,2) AS salary_square
FROM hr.employees;

-- SQRT: salary square root
SELECT employee_id, salary,
       SQRT(salary) AS salary_square_root
FROM hr.employees;


-- ================================================
-- SECTION 5: FINAL PRACTICE SET — CHARACTER (DUAL)
-- ================================================

SELECT UPPER('data engineering') FROM dual;
SELECT LOWER('DATA ENGINEERING') FROM dual;
SELECT INITCAP('oracle database administrator') FROM dual;
SELECT LENGTH('machine learning') FROM dual;
SELECT SUBSTR('artificial intelligence',1,10) FROM dual;
SELECT CONCAT('Oracle ','SQL') FROM dual;
SELECT REPLACE('hello python','python','oracle') FROM dual;
SELECT TRIM('    database    ') FROM dual;
SELECT LTRIM('00000500','0') FROM dual;
SELECT RTRIM('500000','0') FROM dual;
SELECT LPAD('500',8,'0') FROM dual;
SELECT RPAD('SQL',10,'.') FROM dual;
SELECT ASCII('A') FROM dual;
SELECT CHR(65) FROM dual;


-- ================================================
-- SECTION 6: FINAL PRACTICE SET — NUMERIC (DUAL)
-- ================================================

SELECT CEIL(25.01) FROM dual;
SELECT FLOOR(25.99) FROM dual;
SELECT MOD(25,4) FROM dual;
SELECT ABS(-999.50) FROM dual;
SELECT POWER(3,4) FROM dual;
SELECT SQRT(81) FROM dual;


-- ================================================
-- SECTION 7: FINAL PRACTICE SET — HR.EMPLOYEES
-- ================================================

SELECT first_name, UPPER(first_name)
FROM hr.employees;

SELECT first_name, LOWER(first_name)
FROM hr.employees;

SELECT first_name, INITCAP(first_name)
FROM hr.employees;

SELECT first_name, LENGTH(first_name)
FROM hr.employees;

SELECT first_name, SUBSTR(first_name,1,3)
FROM hr.employees;

SELECT first_name || ' ' || last_name AS full_name
FROM hr.employees;

SELECT employee_id, LPAD(employee_id,6,'0') AS formatted_id
FROM hr.employees;

SELECT first_name, RPAD(first_name,20,'.') AS formatted_name
FROM hr.employees;

SELECT employee_id, salary,
       CEIL(salary / 12) AS ceil_monthly_salary
FROM hr.employees;

SELECT employee_id, salary,
       FLOOR(salary / 12) AS floor_monthly_salary
FROM hr.employees;

SELECT employee_id, MOD(employee_id,2) AS remainder
FROM hr.employees;

SELECT employee_id, salary,
       ABS(salary - 10000) AS difference_from_10000
FROM hr.employees;

SELECT employee_id, salary,
       POWER(salary,2) AS salary_square
FROM hr.employees;

SELECT employee_id, salary,
       SQRT(salary) AS salary_square_root
FROM hr.employees;
