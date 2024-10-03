use q5;
Database changed
CREATE TABLE Depart (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerID INT,
    Loc VARCHAR(100)
);

CREATE TABLE Emp (
    EmpNo INT PRIMARY KEY,
    Name VARCHAR(50),
    Job VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Commission DECIMAL(10, 2),
    DepartmentNo INT,
    FOREIGN KEY (DepartmentNo) REFERENCES Depart(DepartmentID)
);
INSERT INTO Depart (DepartmentID, DepartmentName, ManagerID, Loc) VALUES
(1, 'Human Resources', 101, 'Building A'),
(2, 'Finance', 102, 'Building B'),
(3, 'IT', 103, 'Building C'),
(4, 'Sales', 104, 'Building D');

INSERT INTO Emp (EmpNo, Name, Job, Salary, HireDate, Commission, DepartmentNo) VALUES
(101, 'Alice Smith', 'HR Manager', 7000.00, '1991-01-15', 5000.00, 1),
(102, 'Bob Johnson', 'Finance Manager', 800.00, '1997-02-10', 6000.00, 2),
(103, 'Charlie Brown', 'IT Manager', 90000.00, '2021-03-05', 7000.00, 3),
(104, 'Diana Prince', 'Sales Manager', 7500.00, '2020-04-20', 5500.00, 4),
(201, 'Eve Adams', 'HR Specialist', 500.00, '2021-06-01', NULL, 1),
(202, 'Frank Castle', 'Accountant', 60000.00, '2020-07-15', NULL, 2),
(203, 'Amit', 'Developer', 700.00, '2022-08-10', NULL, 3),
(204, 'john', 'Sales Associate', 45000.00, '2021-09-12', NULL, 4);
mysql> select * from Depart;
+--------------+-----------------+-----------+------------+
| DepartmentID | DepartmentName  | ManagerID | Loc        |
+--------------+-----------------+-----------+------------+
|            1 | Human Resources |       101 | Building A |
|            2 | Finance         |       102 | Building B |
|            3 | IT              |       103 | Building C |
|            4 | Sales           |       104 | Building D |
+--------------+-----------------+-----------+------------+
4 rows in set (0.00 sec)
mysql> select * from Emp;
+-------+---------------+-----------------+----------+------------+------------+--------------+
| EmpNo | Name          | Job             | Salary   | HireDate   | Commission | DepartmentNo |
+-------+---------------+-----------------+----------+------------+------------+--------------+
|   101 | Alice Smith   | HR Manager      |  7000.00 | 1991-01-15 |    5000.00 |            1 |
|   102 | Bob Johnson   | Finance Manager |   800.00 | 1997-02-10 |    6000.00 |            2 |
|   103 | Charlie Brown | IT Manager      | 90000.00 | 2021-03-05 |    7000.00 |            3 |
|   104 | Diana Prince  | Sales Manager   |  7500.00 | 2020-04-20 |    5500.00 |            4 |
|   201 | Eve Adams     | HR Specialist   |   500.00 | 2021-06-01 |       NULL |            1 |
|   202 | Frank Castle  | Accountant      | 60000.00 | 2020-07-15 |       NULL |            2 |
|   203 | Amit          | Developer       |   700.00 | 2022-08-10 |       NULL |            3 |
|   204 | john          | Sales Associate | 45000.00 | 2021-09-12 |       NULL |            4 |
+-------+---------------+-----------------+----------+------------+------------+--------------+
8 rows in set (0.00 sec)
mysql> SELECT Name, Salary
    -> FROM Emp
    -> WHERE Salary NOT BETWEEN 5000 AND 35000;
+---------------+----------+
| Name          | Salary   |
+---------------+----------+
| Bob Johnson   |   800.00 |
| Charlie Brown | 90000.00 |
| Eve Adams     |   500.00 |
| Frank Castle  | 60000.00 |
| Amit          |   700.00 |
| john          | 45000.00 |
+---------------+----------+
6 rows in set (0.00 sec)
mysql> SELECT Name, Job, HireDate
    -> FROM Emp
    -> WHERE HireDate BETWEEN '1990-02-20' AND '1998-05-01'
    -> ORDER BY HireDate ASC;
+-------------+-----------------+------------+
| Name        | Job             | HireDate   |
+-------------+-----------------+------------+
| Alice Smith | HR Manager      | 1991-01-15 |
| Bob Johnson | Finance Manager | 1997-02-10 |
+-------------+-----------------+------------+
2 rows in set (0.00 sec)
mysql> SELECT Name AS Employee, Salary AS MonthlySalary
    -> FROM Emp
    -> WHERE Salary BETWEEN 5000 AND 12000
    ->   AND DepartmentNo IN (2, 4);
+--------------+---------------+
| Employee     | MonthlySalary |
+--------------+---------------+
| Diana Prince |       7500.00 |
+--------------+---------------+
1 row in set (0.00 sec)
mysql> SELECT Name, HireDate
    -> FROM Emp
    -> WHERE YEAR(HireDate) = 1994;
+--------------+------------+
| Name         | HireDate   |
+--------------+------------+
| Diana Prince | 1994-01-10 |
+--------------+------------+
1 row in set (0.00 sec)
mysql> SELECT Name, Salary, Commission
    -> FROM Emp
    -> WHERE Commission IS NOT NULL
    -> ORDER BY Salary DESC, Commission DESC;
+---------------+----------+------------+
| Name          | Salary   | Commission |
+---------------+----------+------------+
| Charlie Brown | 90000.00 |    7000.00 |
| Diana Prince  |  7500.00 |    5500.00 |
| Alice Smith   |  7000.00 |    5000.00 |
| Bob Johnson   |   800.00 |    6000.00 |
+---------------+----------+------------+
4 rows in set (0.00 sec)
mysql> SELECT Name, Job
    -> FROM Emp
    -> WHERE mid IS NULL;
+---------------+-----------------+
| Name          | Job             |
+---------------+-----------------+
| Alice Smith   | HR Manager      |
| Bob Johnson   | Finance Manager |
| Charlie Brown | IT Manager      |
| Diana Prince  | Sales Manager   |
| Eve Adams     | HR Specialist   |
| Frank Castle  | Accountant      |
| Amit          | Developer       |
| john          | Sales Associate |
+---------------+-----------------+
8 rows in set (0.00 sec)
mysql> SELECT Name
    -> FROM Emp
    -> WHERE Name LIKE '__a%';
+---------------+
| Name          |
+---------------+
| Charlie Brown |
| Diana Prince  |
| Frank Castle  |
+---------------+
3 rows in set (0.00 sec)
mysql> SELECT Name
    -> FROM Emp
    -> WHERE Name LIKE '%a%' AND Name LIKE '%e%';
+---------------+
| Name          |
+---------------+
| Alice Smith   |
| Charlie Brown |
| Diana Prince  |
| Eve Adams     |
| Frank Castle  |
+---------------+
5 rows in set (0.00 sec)
mysql> SELECT Name, Job, Salary
    -> FROM Emp
    -> WHERE (Job = 'Sales Representative' OR Job = 'Stock Clerk')
    ->   AND Salary NOT IN (20000, 4000, 7000);
Empty set (0.00 sec)
mysql> SELECT Emp.Name, Emp.DepartmentNo, Depart.DepartmentName
    -> FROM Emp
    -> JOIN Depart ON Emp.DepartmentNo = Depart.DepartmentID;
+---------------+--------------+-----------------+
| Name          | DepartmentNo | DepartmentName  |
+---------------+--------------+-----------------+
| Alice Smith   |            1 | Human Resources |
| Eve Adams     |            1 | Human Resources |
| Bob Johnson   |            2 | Finance         |
| Frank Castle  |            2 | Finance         |
| Charlie Brown |            3 | IT              |
| Amit          |            3 | IT              |
| Diana Prince  |            4 | Sales           |
| john          |            4 | Sales           |
+---------------+--------------+-----------------+
8 rows in set (0.00 sec)
mysql> SELECT DISTINCT Emp.EmpNo, Emp.Name
    -> FROM Emp
    -> WHERE DepartmentNo IN (
    ->     SELECT DepartmentNo
    ->     FROM Emp
    ->     WHERE Name LIKE '%u%'
    -> );
Empty set (0.01 sec)
mysql> SELECT Emp.Name, Emp.HireDate
    -> FROM Emp
    -> WHERE DepartmentNo = (
    ->     SELECT DepartmentNo
    ->     FROM Emp
    ->     WHERE Name = 'Amit'
    -> )
    -> AND Name <> 'John';
+---------------+------------+
| Name          | HireDate   |
+---------------+------------+
| Charlie Brown | 2021-03-05 |
| Amit          | 2022-08-10 |
+---------------+------------+
2 rows in set (0.01 sec)
😘
