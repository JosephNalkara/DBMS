mysql> create database q7;
Query OK, 1 row affected (0.00 sec)
mysql> use q7;
Database changed
mysql> CREATE TABLE employee (
    ->     employee_no INT PRIMARY KEY,
    ->     employee_name VARCHAR(50),
    ->     job VARCHAR(50),
    ->     department_no INT,
    ->     salary DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.02 sec)
mysql> select * from employee;

mysql> INSERT INTO employee (employee_no, employee_name, job, department_no, salary) VALUES
    -> (1, 'karthi', 'Developer', 101, 70000.00),
    -> (2, 'rishan', 'Designer', 102, 60000.00),
    -> (3, 'kuku', 'Manager', 101, 90000.00),
    -> (4, 'anujith', 'ASP', 103, 80000.00),
    -> (5, 'krishna', 'Analyst', 102, 75000.00);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

+-------------+---------------+-----------+---------------+----------+
| employee_no | employee_name | job       | department_no | salary   |
+-------------+---------------+-----------+---------------+----------+
|           1 | karthi        | Developer |           101 | 70000.00 |
|           2 | rishan        | Designer  |           102 | 60000.00 |
|           3 | kuku          | Manager   |           101 | 90000.00 |
|           4 | anujith       | ASP       |           103 | 80000.00 |
|           5 | krishna       | Analyst   |           102 | 75000.00 |
+-------------+---------------+-----------+---------------+----------+
5 rows in set (0.00 sec)
mysql> CREATE VIEW employee_view AS
    -> SELECT employee_no, employee_name, job, department_no, salary
    -> FROM employee;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from employee_view;
+-------------+---------------+-----------+---------------+----------+
| employee_no | employee_name | job       | department_no | salary   |
+-------------+---------------+-----------+---------------+----------+
|           1 | karthi        | Developer |           101 | 70000.00 |
|           2 | rishan        | Designer  |           102 | 60000.00 |
|           3 | kuku          | Manager   |           101 | 90000.00 |
|           4 | anujith       | ASP       |           103 | 80000.00 |
|           5 | krishna       | Analyst   |           102 | 75000.00 |
+-------------+---------------+-----------+---------------+----------+
5 rows in set (0.00 sec)

mysql> SELECT employee_no, employee_name, department_no, job FROM employee_view;
+-------------+---------------+---------------+-----------+
| employee_no | employee_name | department_no | job       |
+-------------+---------------+---------------+-----------+
|           1 | karthi        |           101 | Developer |
|           2 | rishan        |           102 | Designer  |
|           3 | kuku          |           101 | Manager   |
|           4 | anujith       |           103 | ASP       |
|           5 | krishna       |           102 | Analyst   |
+-------------+---------------+---------------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM employee_view WHERE job = 'ASP';
+-------------+---------------+------+---------------+----------+
| employee_no | employee_name | job  | department_no | salary   |
+-------------+---------------+------+---------------+----------+
|           4 | anujith       | ASP  |           103 | 80000.00 |
+-------------+---------------+------+---------------+----------+
1 row in set (0.00 sec)

mysql> UPDATE employee SET department_no = 104 WHERE employee_no = 4; -- Changing department of employee with employee_no = 4
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_view;
+-------------+---------------+-----------+---------------+----------+
| employee_no | employee_name | job       | department_no | salary   |
+-------------+---------------+-----------+---------------+----------+
|           1 | karthi        | Developer |           101 | 70000.00 |
|           2 | rishan        | Designer  |           102 | 60000.00 |
|           3 | kuku          | Manager   |           101 | 90000.00 |
|           4 | anujith       | ASP       |           104 | 80000.00 |
|           5 | krishna       | Analyst   |           102 | 75000.00 |
+-------------+---------------+-----------+---------------+----------+
5 rows in set (0.00 sec)

mysql> drop view employee_view;
Query OK, 0 rows affected (0.01 sec)

