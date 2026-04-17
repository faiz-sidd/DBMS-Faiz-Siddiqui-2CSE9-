--1.	Display the names of employees from department number 10 with salary greater than that of any employee working in other departments. 

SELECT ename
FROM employee
WHERE deptno = 10
AND sal > ANY (
    SELECT sal FROM employee WHERE deptno <> 10
);


--2.Display the names of employee from department number 10 with salary greater than that of all employee working in other departments. 
SELECT ename
FROM employee
WHERE deptno = 10
AND sal > ALL (
    SELECT sal FROM employee WHERE deptno <> 10
);


--3. Display the details of employees who are in sales dept and grade is 3. 

SELECT e.*
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE d.dname = 'SALES'
AND s.grade = 3;

--4. Display those who are not managers and who are managers anyone. 

SELECT *
FROM employee
WHERE job <> 'MANAGER';

--5. Display those employees whose manager name is jones. 

SELECT e.ename
FROM employee e
JOIN employee m ON e.mgr = m.empno
WHERE m.ename = 'JONES';

--6. Display ename who are working in sales dept. 

SELECT e.ename
FROM employee e
JOIN department d ON e.deptno = d.deptno
WHERE d.dname = 'SALES';

--7.Display employee name, deptname, salary and comm. For those sal in between 2000 to 5000 while location is chicago. 

SELECT e.ename, d.dname, e.sal, e.comm
FROM employee e
JOIN department d ON e.deptno = d.deptno
WHERE e.sal BETWEEN 2000 AND 5000
AND d.location = 'CHICAGO';

--8. Display those employees whose salary greater than his manager salary. 

SELECT e.ename
FROM employee e
JOIN employee m ON e.mgr = m.empno
WHERE e.sal > m.sal;

--9. Display those employees who are working in the same dept where his manager is working. 

SELECT e.ename
FROM employee e
JOIN employee m ON e.mgr = m.empno
WHERE e.deptno = m.deptno;

--10. Display grade and employees name for the dept no 10 or 30 but grade is not 4, while joined the company before 31-dec-82. 
  
SELECT e.ename, s.grade
FROM employee e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.deptno IN (10,30)
AND s.grade <> 4
AND e.hiredate < '1982-12-31';
