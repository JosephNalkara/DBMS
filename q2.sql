mysql> create database employee
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> use employee;
Database changed
mysql> CREATE TABLE EMPLOYEE (
    ->     Emp_id INT PRIMARY KEY,
    ->     Emp_Name VARCHAR(100) NOT NULL,
    ->     Street_no VARCHAR(20),
    ->     City VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> CREATE TABLE WORKS (
    ->     Emp_id INT,
    ->     Company_Name VARCHAR(100),
    ->     Salary DECIMAL(10, 2),
    ->     PRIMARY KEY (Emp_id, Company_Name),
    ->     FOREIGN KEY (Emp_id) REFERENCES EMPLOYEE(Emp_id),
    ->     FOREIGN KEY (Company_Name) REFERENCES COMPANY(Company_Name)
    -> );
Query OK, 0 rows affected (0.02 sec)
mysql> 
mysql> CREATE TABLE COMPANY (
    ->     Company_Name VARCHAR(100) PRIMARY KEY,
    ->     City VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE MANAGES (
    ->     Emp_id INT,
    ->     Manager_id INT,
    ->     PRIMARY KEY (Emp_id),
    ->     FOREIGN KEY (Emp_id) REFERENCES EMPLOYEE(Emp_id),
    ->     FOREIGN KEY (Manager_id) REFERENCES EMPLOYEE(Emp_id)
    -> );
Query OK, 0 rows affected (0.01 sec)
mysql> INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Street_no, City) VALUES (1, 'Alice Johnson', '123 Elm St', 'New York');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Street_no, City) VALUES (2, 'Bob Smith', '456 Oak St', 'San Francisco');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Street_no, City) VALUES (3, 'Charlie Brown', '789 Pine St', 'Boston');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Street_no, City) VALUES (4, 'Diana Prince', '101 Maple St', 'New York');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Street_no, City) VALUES (5, 'Eve Adams', '202 Birch St', 'San Francisco');

mysql> select * from EMPLOYEE;
+--------+---------------+--------------+---------------+
| Emp_id | Emp_Name      | Street_no    | City          |
+--------+---------------+--------------+---------------+
|      1 | Alice Johnson | 123 Elm St   | New York      |
|      2 | Bob Smith     | 456 Oak St   | San Francisco |
|      3 | Charlie Brown | 789 Pine St  | Boston        |
|      4 | Diana Prince  | 101 Maple St | New York      |
+--------+---------------+--------------+---------------+
4 rows in set (0.00 sec)
mysql> INSERT INTO WORKS (Emp_id, Company_Name, Salary) VALUES (1, 'SBI', 70000.00), (2, 'Indian Bank', 75000.00), (3, 'SBI', 72000.00), (4, 'Indian Bank', 68000.00);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0
mysql> select * from WORKS;
+--------+--------------+----------+
| Emp_id | Company_Name | Salary   |
+--------+--------------+----------+
|      1 | SBI          | 70000.00 |
|      2 | Indian Bank  | 75000.00 |
|      3 | SBI          | 72000.00 |
|      4 | Indian Bank  | 68000.00 |
+--------+--------------+----------+
4 rows in set (0.00 sec)
mysql> INSERT INTO COMPANY (Company_Name, City) VALUES
    -> ('SBI', 'New York'),
    -> ('Indian Bank', 'Chicago');
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from COMPANY;
+--------------+----------+
| Company_Name | City     |
+--------------+----------+
| Indian Bank  | Chicago  |
| SBI          | New York |
+--------------+----------+
2 rows in set (0.00 sec)
mysql> INSERT INTO MANAGES (Emp_id, Manager_id) VALUES
    -> (2, 1),  
    -> (4, 3);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0
mysql> select * from MANAGES;
+--------+------------+
| Emp_id | Manager_id |
+--------+------------+
|      2 |          1 |
|      4 |          3 |
+--------+------------+
2 rows in set (0.00 sec)
______________________________________________________________________________________________________________________________________________________
