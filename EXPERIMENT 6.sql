-- 1. DISPLAY  EMPNO,ENAME,DEPTNO,FROM EMPLOYEE TABLE .INSTEAD OF DISPLAY DEPARTMENT NUMBER DISPLAY THE RELATED DEPARTMENT 
--  NAME (USE DECODE FUNCTION)
SELECT e.empno, e.ename,
    CASE e.deptno
        WHEN 10 THEN 'RESEARCH'
        WHEN 20 THEN 'ACCOUNTING'
        WHEN 30 THEN 'SALES'
        WHEN 40 THEN 'OPERATIONS'
    END AS department
FROM employee e;

-- 2. DISPLAY YOUR AGE IN DAYS...
  
SELECT DATEDIFF(CURDATE(), '2000-01-01') AS age_in_days;

-- 3. DISPLAY YOUR AGE IN MONTHS ....
  
SELECT TIMESTAMPDIFF(MONTH, '2000-01-01', CURDATE()) AS age_in_months;

-- 4. DISPLAY THE  current date as 15th August Friday Nineteen Ninety-Seven...
  
SELECT DATE_FORMAT('1997-08-15', '%D %M %W %Y') AS formatted_date;

-- 5.  SCOTT HAS JOINED THE COMPANY ON WEDNESDAY 13TH AUGUST 1990...
  
SELECT CONCAT(
        ename,' has joined the company on ',
        DATE_FORMAT(hiredate,'%W %D %M %Y')
    ) AS joining_info FROM employee
             WHERE ename = 'SCOTT';

-- 6.  FIND THE DATE FOR NEAREST SATURDAY AFTER CURRENT DATE .. 
  
  SELECT DATE_ADD(CURDATE(), INTERVAL (7 - DAYOFWEEK(CURDATE())) DAY) AS next_saturday;

-- 7.  DISPLAY CURRENT TIME...
  
        SELECT CURTIME();

-- 8. DISPLAY THE DATE THREE MONTHS BEFORE THE CURRENT DATE .....
  
SELECT DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

-- 9.  DISPLAY THOSE  Employees who joined  the COMPANY IN  MONTH of DECEMBER...
    SELECT ename, hiredate FROM employee
          WHERE MONTH(hiredate) = 12;

-- 10.  DISPLAY THOSE  Employees whose first 2 characters FROM HIREDATE  EQUAL TO last 2 characters of salary.....
   SELECT ename FROM employee
      WHERE LEFT(YEAR(hiredate),2) = RIGHT(sal,2);

-- 11.  DISPLAY THOSE EMPLOYEES WHOSE 10% OF SALARY IS EQUAL TO THE YEAR OF JOINING....
        SELECT ename FROM employee
             WHERE sal \* 0.10 = YEAR(hiredate);

-- 12. DISPLAY THOSE EMPLOYEES WHO HAS JOINED BEFORE 15TH OF THE MONTH ....
SELECT ename, hiredate FROM employee
        WHERE DAY(hiredate) < 15;

-- 13.  DISPLAY THOSE EMPLOYEES WHOSE JOINING  DATE IS AVAILABLE IN DEPTNO....
SELECT ename FROM employee
         WHERE DAY(hiredate) = deptno;
