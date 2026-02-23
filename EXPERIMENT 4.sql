1-- DISPLAY THE LIST OF Employees who HAVE  joined THE COMPANY  before 30TH JunE 1980 OR after 31ST Dec 1981...
  
       SELECT * FROM employee
   WHERE hiredate < '1980-06-30' OR hiredate > '1981-12-31';


2-- DISPLAY THE  Names of employees whose NAMES HAVE  second alphabet  "A" IN THEIR NAMES ....


       SELECT ename FROM employee
               WHERE ename LIKE '_A%';

3--DISPLAY THE NAMES OF EMPLOYEES WHOSE NAMES IS EXACTLY FIVE CHARACTERS IN LENGTH...
  
       SELECT ename FROM employee
 WHERE LENGTH(ename) = 5;

4-- DISPLAY THE NAMES OF EMPLOYEES WHOSE NAMES HAVE SECOND   alphabet  "A" IN THEIR NAMES ....-> SAME AS QUESTION 2..

 SELECT ename FROM employee
         WHERE ename LIKE '_A%';


5-- DISPLAY THE NAMES OF EMPLOYEES WHOE ARE NOT WORKING AS  salesman, clerk or analyst......
  
    SELECT ename FROM employee
          WHERE job NOT IN ('SALESMAN','CLERK','ANALYST');

6-- DISPLAY THE NAME OF  Employee ALONG WITH THEIR ANNUAL salary (SAL*12).THE NAMES OF THE EMPLOYEE EARNING HIGHEST SALARY SHOULD APPEAR FIRST...


     SELECT ename, sal*12 AS annual_salary FROM employee
ORDER BY sal DESC;


7-- DISPLAY Name, sal, hra, pf, da, totalsal FOR EACH EMPLPOYEE .THE OUTPUT SHOULD BE IN THE ORDER OF TOTAL SAL, hra = 15% OF SAL ,
--  da =  10% Of sal,   pf = 5% of sal,   TOTAL SALRY WILL BW (sal * hra*da)-pf...
  


SELECT
    ename,  sal,
    sal*0.15 AS hra,
    sal*0.10 AS da,
    sal*0.05 AS pf,
    (sal + (sal*0.15) + (sal*0.10) - (sal*0.05)) AS totalsal
FROM employee
       ORDER BY totalsal DESC;


8--  Update  the salary of each empoyee  by 10% increment who are not eligible for commission...


      UPDATE employee SET sal = sal + (sal * 0.10)
  WHERE comm IS NULL OR comm = 0;

9--Display those Employees whose salary is MORE THAN  3000 after GIVING 20% increment....
  
  SELECT ename FROM employee
         WHERE sal + (sal * 0.20) > 3000;

10-- DISPLAY THOSE  Employees whose salary contains at least 3 digits...
            SELECT ename, sal FROM employee
    WHERE LENGTH(sal) >= 3;
