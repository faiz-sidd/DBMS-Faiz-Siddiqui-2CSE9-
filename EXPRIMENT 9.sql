--1. Display the name of Employee who earns highest salary..

    SELECT ename
    FROM employee
     \WHERE sal = (SELECT MAX(sal) FROM employee);

--2. Display all the employee number and name of eployee working as clerk and earning highest salary among clerk ..  

    SELECT empno, ename
    FROM employee
    WHERE job = 'CLERK'
AND sal = (
    SELECT MAX(sal)
    FROM employee
    WHERE job = 'CLERK'
    );

--3. Dispaly the names of the  Salesman who earn a salary  more than highest salary of any clerk salary...

SELECT ename
FROM employee
WHERE job = 'SALESMAN'
AND sal > (
    SELECT MAX(sal)
    FROM employee
    WHERE job = 'CLERK'
);

--4. 	Display the names of clerks who earn salary more than that of james of that of sal lesser than that of scott ...

SELECT ename
FROM employee
WHERE job = 'CLERK'
AND sal > (
    SELECT sal FROM employee WHERE ename = 'JAMES'
)
AND sal < (
    SELECT sal FROM employee WHERE ename = 'SCOTT'
);


--5.	Display the names of employees who earn a sal more than that of james or that of salary greater than that of scott. 

SELECT ename
FROM employee
WHERE sal > (
    SELECT sal FROM employee WHERE ename = 'JAMES'
)
OR sal > (
    SELECT sal FROM employee WHERE ename = 'SCOTT'
);

--6. Display the names of the employees who earn highest salary in their respective departments...

SELECT ename, deptno, sal
FROM employee e
WHERE sal = (
    SELECT MAX(sal)
    FROM employee
    WHERE deptno = e.deptno
);

--7. 	Display the names of employees who earn highest salaries in their respective job groups...
  
SELECT ename, job, sal
FROM employee e
WHERE sal = (
    SELECT MAX(sal)
    FROM employee
    WHERE job = e.job
);

--8.Display the employee names who are working in accounting dept...

SELECT ename
FROM employee
WHERE deptno = (
    SELECT deptno
    FROM department
    WHERE dname = 'ACCOUNTING'
);

--9. Display the employee names who are working in chicago...

SELECT ename
FROM employee
WHERE deptno = (
    SELECT deptno
    FROM department
    WHERE loc = 'CHICAGO'
);


--10.  Display the job groups having total salary greater than the maximum salary for managers...

SELECT job, SUM(sal) AS total_salary
FROM employee
GROUP BY job
HAVING SUM(sal) > (
    SELECT MAX(sal)
    FROM employee
    WHERE job = 'MANAGER'
);
