

CREATE SALGRADE TABLE
CREATE TABLE salgrade (
    grade INT,
    losal INT,
    hisal INT
);

Insert values
INSERT INTO salgrade VALUES
(1,700,1200),
(2,1201,1400),
(3,1401,2000),
(4,2001,3000),
(5,3001,9999);

--1. Display all employees with their department name

   SELECT e.ename, d.dname
   FROM employee e
   JOIN department d ON e.deptno = d.deptno;
   Basic INNER JOIN
     
--2.DISPLAY THOSE  Employees whose manager NAMES  is JONES ,AND ALSO DISPLAY THEIR MANAGER NAME...
     

    SELECT e.ename AS employee, m.ename AS manager
FROM employee e
     JOIN employee m ON e.mgr = m.empno
      WHERE m.ename = 'JONES';

--3.DISPLAY  Employee name, HIS job,   HIS dept name, his manager name,his grade and make out of an under department wise..

SELECT 
    e.ename,
    e.job,
    d.dname,
    m.ename AS manager,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
LEFT JOIN employee m ON e.mgr = m.empno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
ORDER BY d.dname;


--4.List out all the  Employees name ,job and salary grade and department name for everyone in the company 
-- except 'CLERK', sort on salry display the highest salary...

SELECT 
    e.ename,
    e.job,
    d.dname,
    s.grade,
    e.sal
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.job <> 'CLERK'
ORDER BY e.sal DESC;

--5. Display employee name , his job & his  manager name. dispaly also employees who are without manager....

SELECT 
    e.ename,
    e.job,
    IFNULL(m.ename, 'No Manager') AS manager
FROM employee e
LEFT JOIN employee m ON e.mgr = m.empno;

--6. List the employee name ,job ,annual salary deptno,dept name, and grade who earn 36000 a year 
-- OR who are not clerks...

SELECT 
    e.ename,
    e.job,
    e.sal*12 AS annual_salary,
    d.deptno,
    d.dname,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal*12 = 36000
OR e.job <> 'CLERK';


--7. List ename ,job ,annual sal,deptno,deptname and grade  who earn 30000 a year 
-- OR who are not clerks...

SELECT 
    e.ename,
    e.job,
    e.sal*12 AS annual_salary,
    d.deptno,
    d.dname,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal*12 = 30000
AND e.job <> 'CLERK';

--8.List out all  Employees by name and number  along with their   Managers names and numbers  also dispaly ''no manager;;
--who haas no manager...

SELECT 
    e.empno,
    e.ename,
    IFNULL(m.empno, '-') AS mgr_no,
    IFNULL(m.ename, 'No Manager') AS manager
FROM employee e
LEFT JOIN employee m ON e.mgr = m.empno;


--9.SELECT  Department name, deptno  & sum of salaries...

SELECT d.dname, d.deptno, SUM(e.sal) AS total_salary
      FROM department d
      JOIN employee e ON d.deptno = e.deptno
      GROUP BY d.dname, d.deptno;

--10. Display  Employee number, name & location of the  department in which he is working.....

     SELECT e.empno, e.ename, d.loc
     FROM employee e
     JOIN department d ON e.deptno = d.deptno;

--11. Display Employee name & department  name for each employee..

       SELECT e.ename, d.dname
       FROM employee e
       JOIN department d ON e.deptno = d.deptno;
