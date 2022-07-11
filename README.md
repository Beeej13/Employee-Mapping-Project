# Employee-Mapping-Project
**Objective**
To facilitate a better understanding, managers have provided ratings for each employee which will help the HR department to finalize the employee performance mapping. Find the maximum salary of the employees and ensure that all jobs are meeting the organization's profile standard. You also need to calculate bonuses to find extra cost for expenses. This will raise the overall performance of the organization by ensuring that all required employees receive training.

Showcasing of SQL queries and their functionality mapping out employees in a company

1. List employees and their respective dept.

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
  FROM emp_record_table;
  ![1](https://user-images.githubusercontent.com/107674973/178289366-dc7251f0-8e76-4963-a6ff-a3821d6709f9.png)


2. List employees with a rating >2

SELECT EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT 
  FROM emp_record_table
 WHERE EMP_RATING > 2;
 ![2](https://user-images.githubusercontent.com/107674973/178289675-f331b94f-954f-40b6-905b-3381398f5079.png)

3. List the managers of the company as well as the president using Manager ID 
  
SELECT FIRST_NAME, LAST_NAME , MANAGER_ID
  FROM EMP_RECORD_TABLE
 WHERE ROLE = 'MANAGER' OR MANAGER_ID IS NULL;
 ![3](https://user-images.githubusercontent.com/107674973/178316839-b2cbe8b6-5c5d-48d7-85c8-48867262dc23.png)

4. List employees from two different tables using UNION

SELECT FIRST_NAME, LAST_NAME, DEPT
  FROM EMP_RECORD_TABLE
 WHERE DEPT = 'FINANCE'
 
 UNION
 
SELECT FIRST_NAME, LAST_NAME, DEPT
  FROM EMP_RECORD_TABLE
 WHERE DEPT = 'HEALTHCARE';
 ![4](https://user-images.githubusercontent.com/107674973/178317122-ce15f484-64b0-4a8a-833b-9e6e77b7666a.png)

5. Grouping employees based on their dept and comparing their rating  
  
SELECT EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, EMP_RATING
  FROM EMP_RECORD_TABLE
 GROUP BY DEPT, EMP_ID;
 ![5](https://user-images.githubusercontent.com/107674973/178317520-67931fc8-2846-4e69-9360-9d8e4ef8f31c.png)

6. Calculate min and max salary of employees in each role	

SELECT MIN(SALARY), MAX(SALARY), ROLE
  FROM EMP_RECORD_TABLE
 GROUP BY ROLE;
 ![6](https://user-images.githubusercontent.com/107674973/178317962-de7bde71-015f-450a-a937-cf3f2a5b3274.png)
 
 7. Ranking employees based on exp in their role

SELECT FIRST_NAME, LAST_NAME, EXP, ROLE
  FROM EMP_RECORD_TABLE
 ORDER BY EXP DESC;
 ![7](https://user-images.githubusercontent.com/107674973/178318284-3d115a10-4ee0-4b0d-ba0a-b902dbf06197.png)
 
 8. List employees with exp > 10 years using a nestled query

SELECT *
  FROM EMP_RECORD_TABLE
 WHERE EXP > ANY (SELECT FIRST_NAME
				 FROM EMP_RECORD_TABLE
				WHERE EXP > 10);
![8](https://user-images.githubusercontent.com/107674973/178318719-a839ff4e-f2f8-46d4-b2b3-0fda9a3c98da.png)

9. Creating a stored procedure to retrieve details of employees with more than 3 years of experience

CREATE DEFINER=`root`@`localhost` PROCEDURE `3_YEAR_EMP`()
BEGIN
	SELECT *
	FROM EMP_RECORD_TABLE
	WHERE EXP > 3; 
END

10. Create index for employees named Eric to improve cost and perfomance of query

Before 

EXPLAIN SELECT FIRST_NAME
  FROM EMP_RECORD_TABLE
 WHERE FIRST_NAME = 'ERIC';
 ![9](https://user-images.githubusercontent.com/107674973/178347299-f5c65153-4b93-4908-b54c-6f9658715912.png)

After

CREATE INDEX FINDERIC
ON EMP_RECORD_TABLE (FIRST_NAME(100));
![10](https://user-images.githubusercontent.com/107674973/178347538-a4820000-b759-477e-9648-96c49458441d.png)

11. Average salary distribution based on continent and country

SELECT COUNTRY, CONTINENT, AVG(SALARY) AS AVERAGE_SALARY
  FROM EMP_RECORD_TABLE
 GROUP BY COUNTRY, CONTINENT
 ORDER BY AVERAGE_SALARY ASC;
 ![11](https://user-images.githubusercontent.com/107674973/178347683-0b9afc90-9630-49d0-97ac-0080059916c3.png)




 
