1-- DISPLAY THE  Total number of Employees working in the Company...
SELECT COUNT(*) AS total_employees 
   FROM employee;

2-- DISPLAY THE  Total salary being paid to all Employees.....
  SELECT SUM(sal) AS total_salary
     FROM employee;

3-- DISPLAY THE  Maximum salary from Employee Table....

SELECT MAX(sal) AS max_salary 
    FROM employee;

4-- DISPLAY THE  Minimum salary from Employee Table...
SELECT MIN(sal) AS min_salary
    FROM employee;

5-- DISPLAY THE  Average salary from Employee Table...
SELECT AVG(sal) AS avg_salary
    FROM employee;

6-- DISPLAY THE  Maximum salary being paid to Clerks...
SELECT MAX(sal) AS max_clerk_salary FROM employee
     WHERE job = 'CLERK';

7--DISPLAY THE  Maximum salary being paid in department no "20"..
SELECT MAX(sal) AS max_dept20_salary FROM employee
        WHERE deptno = 20;

8-- DISPLAY THE  Minimum salary paid to any salesman....
SELECT MIN(sal) AS min_salesman_salary FROM employee
     WHERE job = 'SALESMAN';

9-- DISPLAY THE Average salary drawn by Managers..
SELECT AVG(sal) AS avg_manager_salary FROM employee
        WHERE job = 'MANAGER';

10--DISPLAY TH Total salary drawn by analyst working in DEPARTMENT NUMBER "40"..
SELECT SUM(sal) AS total_analyst_salary FROM employee
      WHERE job = 'ANALYST' AND deptno = 40;

11-- DISPLAY  THE NAMES OF THE  EMPLOYEE  in "UPPERCASE".....
SELECT UPPER(ename)
       FROM employee;

12-- DISPLAY THE NAMES OF THE EMPLOYEE in "LOWERCASE"..
SELECT LOWER(ename) 
      FROM employee;

13--DISPLAY THE NAMES OF THE EMPLOYEE IN "PROPER CASE"...
SELECT CONCAT(
       UPPER(LEFT(ename,1)),
       LOWER(SUBSTRING(ename,2))
) AS Proper_Name  
      FROM employee;

14-- DISPLAY THE LENGTH OF YOUR  NAME USING APPROPRIATE FUNCTION...
SELECT LENGTH('MOHAMMAD FAIZ') AS name_length;

15-- DISPLAY THE LENGTH OF ALL EMPLOYEE NAMES ...
SELECT ename, LENGTH(ename) AS name_length 
     FROM employee;
