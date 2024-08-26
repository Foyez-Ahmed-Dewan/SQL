CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

-- group by : merge all the similar rows into one
-- window functios: calculate by merging the similar rows, but display for each row

-- OVER() : this clause constructs a window. When it is empty
-- , the window will include all records
SELECT department,  AVG(salary) FROM employees
GROUP BY department;

SELECT department, AVG(salary) OVER() AS avg_salary 
FROM employees;


SELECT emp_no, department, salary, 
	MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

-- this below query results in error
SELECT emp_no, department, salary, MIN(salary), MAX(salary)
FROM employees;


-- PARTITION BY: inside of the OVER(), use this to form 
	-- rows into group of rows.

SELECT emp_no, department, salary,
	AVG(salary) OVER() AS company_avg,
	AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    COUNT(*) OVER(PARTITION BY department) AS each_dept_mem
FROM employees;

-- 
SELECT 
    emp_no, department, salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;


-- ORDER BY WINDOW FUNCTION
SELECT emp_no, department, salary,
	AVG(salary) OVER() AS company_avg,
	AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    COUNT(*) OVER(PARTITION BY department) AS each_dept_mem
FROM employees
ORDER BY salary;

-- look at the output, same department are on different places
-- we need to use order by inside over, this has effect on each window 
-- -- separately
SELECT emp_no, department, salary,
	AVG(salary) OVER() AS company_avg,
	AVG(salary) OVER(PARTITION BY department ORDER BY salary) AS dept_avg
FROM employees;


-- 
-- RANK() : function assigns rank to all the rows within 
-- every partition. Rank is assigned such that rank 1 
-- given to the first row and rows having same value are 
-- assigned same rank. 
-- For the next rank after two same rank values, 
-- one rank value will be skipped. 
-- For instance, if two rows share­ rank 1, the next row 
-- gets rank 3, not 2.



-- DENSE_RANK() : 
-- The difference between RANK() and DENSE_RANK() 
-- is that in DENSE_RANK(), for the next rank after two 
-- same rank, consecutive integer is used, no rank is 
-- skipped. 


-- ROW_NUMBER() :
-- ROW_NUMBER() gives each row a unique number. 
-- It numbers rows from 1 to the total rows. 
-- The rows are put into groups based on their values. 
-- Each group is called a partition. In each partition, 
-- rows get numbers one after another. No two rows have 
-- the same number in a partition. This makes 
-- ROW_NUMBER() different from RANK() and DENSE_RANK().

SELECT emp_no, department, salary,
	RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees;

SELECT emp_no, department, salary,
	DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_salary_dense_rank
FROM employees;

SELECT emp_no, department, salary,
	ROW_NUMBER() OVER(ORDER BY salary DESC) AS overall_salary_row_rank
FROM employees;


SELECT emp_no, department, salary,
	RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
	RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees;



SELECT emp_no, department, salary,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;



-- NTILE(N) : divide each parts into N groups and ranks them
SELECT emp_no, department, salary,
	NTILE(4) OVER(ORDER BY salary) AS salary_quartile
FROM employees;


SELECT emp_no, department, salary,
	NTILE(4) OVER(PARTITION BY department ORDER BY salary) AS salary_quartile
FROM employees;




-- FIRST_VALUE()
SELECT emp_no, department, salary,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) AS highest_paid_overall
FROM employees;

SELECT emp_no, department, salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept
FROM employees;



-- LEAD AND LAG
SELECT emp_no, department, salary,
    LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

SELECT emp_no, department, salary,
    LEAD(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;

SELECT emp_no, department, salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;






