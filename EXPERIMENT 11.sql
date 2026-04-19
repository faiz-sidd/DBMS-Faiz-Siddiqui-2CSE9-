--1.Delete those employees who joined the company before 31dec-82 while there dept location is ‘new york’ or ‘chicago’. 

DELETE e
FROM employee e
JOIN department d ON e.deptno = d.deptno
WHERE e.hiredate < '1982-12-31'
AND d.location IN ('NEW YORK','CHICAGO');

--2.Display employee name, job, deptname, location for all who are working as managers.

SELECT e.ename, e.job, d.dname, d.location
FROM employee e
JOIN department d ON e.deptno = d.deptno
WHERE e.job = 'MANAGER';

--3. Display name and salary of ford if his sal is equal to high sal of his grade. 

SELECT e.ename, e.sal
FROM employee e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.ename = 'FORD'
AND e.sal = (
    SELECT MAX(e2.sal)
    FROM employee e2
    JOIN salgrade s2 ON e2.sal BETWEEN s2.losal AND s2.hisal
    WHERE s2.grade = s.grade
);

--4.Find out the top 5 earner of company.
  
SELECT ename, sal
FROM employee
ORDER BY sal DESC
LIMIT 5;

--5. Display the name of those employees who are getting highest salary. 
  
SELECT ename
FROM employee
WHERE sal = (SELECT MAX(sal) FROM employee);

--6.Display those employees whose salary is equal to average of maximum and minimum. 
  
SELECT ename
FROM employee
WHERE sal = (
    (SELECT MAX(sal) FROM employee) +
    (SELECT MIN(sal) FROM employee)
)/2;

--7.Display dname where at least 3 are working and display only dname..
  
SELECT d.dname
FROM employee e
JOIN department d ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(*) >= 3;

--8.	Display name of those managers names whose salary is more than average salary of company. 
  
SELECT ename
FROM employee
WHERE job = 'MANAGER'
AND sal > (SELECT AVG(sal) FROM employee);

--9.Display those managers name whose salary is more than an average salary of his employees. 
  
SELECT m.ename
FROM employee m
WHERE m.job = 'MANAGER'
AND m.sal > (
    SELECT AVG(e.sal)
    FROM employee e
    WHERE e.mgr = m.empno
);

--10. Display employee name, sal, comm and net pay for those employees whose net pay are greater than or equal to any other employee salary of the company

SELECT ename, sal, comm, (
    sal + IFNULL(comm,0)
    ) AS net_pay 
    FROM employee
    WHERE (
        sal + IFNULL(comm,0)
        ) >= ANY (SELECT sal FROM employee);
