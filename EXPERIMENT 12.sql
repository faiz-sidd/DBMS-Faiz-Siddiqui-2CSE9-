--1.	Display those employees whose salary is less than his manager but more than salary of any other managers. 

   SELECT e.ename
   FROM employee e
   JOIN employee m ON e.mgr = m.empno
  WHERE e.sal < m.sal
  AND e.sal > ANY (
    SELECT sal FROM employee WHERE job = 'MANAGER'
);


--2.Find out the number of employees whose salary is greater than their manager salary? 

   SELECT COUNT(*) AS total_employees
    FROM employee e
   JOIN employee m ON e.mgr = m.empno
    WHERE e.sal > m.sal;


--3.Display those managers who are not working under president but they are working under any other manager? 

  
    SELECT e.ename
     FROM employee e
     JOIN employee m ON e.mgr = m.empno
     WHERE e.job = 'MANAGER'
    AND m.job <> 'PRESIDENT';


--4.Delete those department where no employee working? 
  
     DELETE FROM department
     WHERE deptno NOT IN (
    SELECT DISTINCT deptno FROM employee
      );


--5. Delete those records from emp table whose deptno not available in dept table? 
  
     DELETE FROM employee
    WHERE deptno NOT IN (
    SELECT deptno FROM department
    );

--6.Display those earners whose salary is out of the grade available in sal grade table? 
  
     SELECT ename, sal
    FROM employee
   WHERE sal NOT BETWEEN
    (SELECT MIN(losal) FROM salgrade)
   AND (SELECT MAX(hisal) FROM salgrade);


--7.Display employee name, sal, comm. And whose net pay is greater than any other in the company? 
  
SELECT ename, sal, comm,
       (sal + IFNULL(comm,0)) AS net_pay
FROM employee
WHERE (sal + IFNULL(comm,0)) >= ANY (
    SELECT sal FROM employee
);


--8.Display those employees who are working in sales or research..  

  
SELECT e.ename
FROM employee e
JOIN department d ON e.deptno = d.deptno
WHERE d.dname IN ('SALES','RESEARCH');

--9. Display the grade of jones? 
  
SELECT s.grade
FROM employee e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.ename = 'JONES';


--10. Display the department name the no of characters of which is equal to no of employees in any other department?

SELECT d.dname
FROM department d
WHERE LENGTH(d.dname) IN (
    SELECT COUNT(*)
    FROM employee
    GROUP BY deptno
);
