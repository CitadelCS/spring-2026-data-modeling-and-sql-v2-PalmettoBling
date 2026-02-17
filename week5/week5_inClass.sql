-- 1. Retrieve the birth date and address of the employee(s) whose name is ‘John B. Smith’.
SELECT Bdate, Address
FROM COMPANY.EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

--2. Retrieve the name and address of all employees who work for the ‘Research’ department.
SELECT Fname, Lname, Address
FROM COMPANY.EMPLOYEE
WHERE Dno = (SELECT Dnumber
             FROM COMPANY.DEPARTMENT
             WHERE Dname = 'Research');

--3. For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.
SELECT Pnumber, Dnum, Lname, Address, Bdate
FROM COMPANY.PROJECT, COMPANY.DEPARTMENT, COMPANY.EMPLOYEE
WHERE Plocation = 'Stafford' AND Dnum = Dnumber AND Mgr_ssn = Ssn;

--4. For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor.
SELECT E.Fname, E.Lname, S.Fname, S.Lname
FROM COMPANY.EMPLOYEE E, COMPANY.EMPLOYEE S
WHERE E.Super_ssn = S.Ssn;

--5. Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.
SELECT DISTINCT Pnumber
FROM COMPANY.PROJECT P
JOIN COMPANY.DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN COMPANY.EMPLOYEE E ON D.Mgr_ssn = E.Ssn
WHERE E.Lname = 'Smith'
UNION
SELECT DISTINCT Pno
FROM COMPANY.WORKS_ON W
JOIN COMPANY.EMPLOYEE E ON W.Essn = E.Ssn
WHERE E.Lname = 'Smith';

--6. Retrieve all employees whose address is in Houston, Texas.
SELECT Fname, Lname, Address
FROM COMPANY.EMPLOYEE
WHERE Address LIKE '%Houston%TX%';

--7. Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10% raise.
SELECT E.Fname, E.Lname, E.Salary * 1.10 AS New_Salary
FROM COMPANY.EMPLOYEE E JOIN COMPANY.WORKS_ON W ON E.Ssn = W.Essn
JOIN COMPANY.PROJECT P ON W.Pno = P.Pnumber
WHERE P.Pname = 'ProductX';

--8. Retrieve the names of all employees who do not have supervisors.
SELECT Fname, Lname
FROM COMPANY.EMPLOYEE
WHERE Super_ssn IS NULL;