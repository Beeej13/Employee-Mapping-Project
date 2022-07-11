CREATE DATABASE employee;

USE employee;

-- List employees and their respective dept.

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
  FROM emp_record_table;
  
-- List employees with a rating >2

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
  FROM emp_record_table
 WHERE EMP_RATING > 2;
 
SELECT CONCAT(FIRST_NAME,LAST_NAME) AS NAME
  FROM EMP_RECORD_TABLE;
 
-- List the managers of the company as well as the president using Manager ID 
  
SELECT FIRST_NAME, LAST_NAME , MANAGER_ID
  FROM EMP_RECORD_TABLE
 WHERE ROLE = 'MANAGER' OR MANAGER_ID IS NULL;
 
-- List employees from two different tables using UNION

SELECT FIRST_NAME, LAST_NAME, DEPT
  FROM EMP_RECORD_TABLE
 WHERE DEPT = 'FINANCE'
 
 UNION
 
SELECT FIRST_NAME, LAST_NAME, DEPT
  FROM EMP_RECORD_TABLE
 WHERE DEPT = 'HEALTHCARE';

-- Grouping employees based on their dept and comparing their rating  
  
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING
  FROM EMP_RECORD_TABLE
 GROUP BY DEPT, EMP_ID;
 
-- Calculate min and max salary of employees in each role	

SELECT MIN(SALARY), MAX(SALARY), ROLE
  FROM EMP_RECORD_TABLE
 GROUP BY ROLE;
 
-- Ranking employees based on exp in their role

SELECT FIRST_NAME, LAST_NAME, EXP, ROLE
  FROM EMP_RECORD_TABLE
 ORDER BY EXP DESC;
 
-- List employees in various countries with salary > 6000

SELECT FIRST_NAME, LAST_NAME, COUNTRY, SALARY
  FROM EMP_RECORD_TABLE
 WHERE SALARY >6000;
 
-- List employees with exp>10 years using a nestled query

SELECT *
  FROM EMP_RECORD_TABLE
 WHERE EXP > ANY (SELECT FIRST_NAME
				 FROM EMP_RECORD_TABLE
				WHERE EXP > 10);

-- Creating a stored procedure to retrieve details of employees with more than 3 years of experience
-- CHECK STORED PROCEDURES


-- Create stored function to check if data science jobs match experience (CHECK STORED FUNCTIONS)

-- Create index for employees named Eric

CREATE INDEX FINDERIC
ON EMP_RECORD_TABLE (FIRST_NAME(100));

-- Displayed improvement of cost and performance of the query

EXPLAIN SELECT FIRST_NAME
  FROM EMP_RECORD_TABLE
  WHERE FIRST_NAME = 'ERIC';

-- Calculate bonus based on 5% of salary and rating

SELECT FIRST_NAME, LAST_NAME, ((SALARY * 0.05) * EMP_RATING) BONUS
  FROM EMP_RECORD_TABLE;
  
-- Average salary distribution based on continent and country

SELECT COUNTRY, CONTINENT, AVG(SALARY) AS AVERAGE_SALARY
  FROM EMP_RECORD_TABLE
 GROUP BY COUNTRY, CONTINENT
 ORDER BY AVERAGE_SALARY ASC;