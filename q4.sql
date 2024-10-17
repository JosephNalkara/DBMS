mysql> create database q4;
Query OK, 1 row affected (0.01 sec)

mysql> use q4;
Database changed
mysql> CREATE TABLE faculty (
    ->     faculty_code INT PRIMARY KEY,
    ->     faculty_name VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE subject (
    ->     subject_code INT PRIMARY KEY,
    ->     subject_name VARCHAR(50),
    ->     max_marks INT,
    ->     faculty_code INT,
    ->     FOREIGN KEY (faculty_code) REFERENCES faculty(faculty_code)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE student (
    ->     student_code INT PRIMARY KEY,
    ->     student_name VARCHAR(50),
    ->     dob DATE,
    ->     student_branch VARCHAR(50),
    ->     admission_date DATE
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO faculty (faculty_code, faculty_name) VALUES
    -> (1, 'Dr. Smith'),
    -> (2, 'Prof. Johnson'),
    -> (3, 'Ms. Davis');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO subject (subject_code, subject_name, max_marks, faculty_code) VALUES
    -> (101, 'Mathematics', 100, 1),
    -> (102, 'Physics', 100, 1),
    -> (103, 'Chemistry', 100, 2),
    -> (104, 'Biology', 100, 3);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO student (student_code, student_name, dob, student_branch, admission_date) VALUES
    -> (1, 'Alice', '2000-01-15', 'Computer Science', '2021-08-01'),
    -> (2, 'Bob', '1999-05-22', 'Electrical', '2021-08-01'),
    -> (3, 'Anna', '2001-03-30', 'Mechanical', '2022-08-01'),
    -> (4, 'Charlie', '2002-07-10', 'Civil', '2022-08-01'),
    -> (5, 'David', '2000-11-25', 'Computer Science', '2021-08-01');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> select * from student;
+--------------+--------------+------------+------------------+----------------+
| student_code | student_name | dob        | student_branch   | admission_date |
+--------------+--------------+------------+------------------+----------------+
|            1 | Alice        | 2000-01-15 | Computer Science | 2021-08-01     |
|            2 | Bob          | 1999-05-22 | Electrical       | 2021-08-01     |
|            3 | Anna         | 2001-03-30 | Mechanical       | 2022-08-01     |
|            4 | Charlie      | 2002-07-10 | Civil            | 2022-08-01     |
|            5 | David        | 2000-11-25 | Computer Science | 2021-08-01     |
+--------------+--------------+------------+------------------+----------------+
5 rows in set (0.00 sec)

mysql> select * from subject;
+--------------+--------------+-----------+--------------+
| subject_code | subject_name | max_marks | faculty_code |
+--------------+--------------+-----------+--------------+
|          101 | Mathematics  |       100 |            1 |
|          102 | Physics      |       100 |            1 |
|          103 | Chemistry    |       100 |            2 |
|          104 | Biology      |       100 |            3 |
+--------------+--------------+-----------+--------------+
4 rows in set (0.00 sec)

mysql> select * from faculty;
+--------------+---------------+
| faculty_code | faculty_name  |
+--------------+---------------+
|            1 | Dr. Smith     |
|            2 | Prof. Johnson |
|            3 | Ms. Davis     |
+--------------+---------------+
3 rows in set (0.00 sec)
mysql> SELECT COUNT(*) AS total_faculties FROM faculty;
+-----------------+
| total_faculties |
+-----------------+
|               3 |
+-----------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM student WHERE student_name LIKE 'A%';
+--------------+--------------+------------+------------------+----------------+
| student_code | student_name | dob        | student_branch   | admission_date |
+--------------+--------------+------------+------------------+----------------+
|            1 | Alice        | 2000-01-15 | Computer Science | 2021-08-01     |
|            3 | Anna         | 2001-03-30 | Mechanical       | 2022-08-01     |
+--------------+--------------+------------+------------------+----------------+
2 rows in set (0.00 sec)

mysql> SELECT COUNT(*) AS total_students FROM student;
+----------------+
| total_students |
+----------------+
|              5 |
+----------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT student_branch) AS total_branches FROM student;
+----------------+
| total_branches |
+----------------+
|              4 |
+----------------+
1 row in set (0.00 sec)
mysql> SELECT f.faculty_name, s.subject_name
    -> FROM faculty f
    -> JOIN subject s ON f.faculty_code = s.faculty_code;
+---------------+--------------+
| faculty_name  | subject_name |
+---------------+--------------+
| Dr. Smith     | Mathematics  |
| Dr. Smith     | Physics      |
| Prof. Johnson | Chemistry    |
| Ms. Davis     | Biology      |
+---------------+--------------+
4 rows in set (0.00 sec)

mysql> SELECT f.faculty_name
    -> FROM faculty f
    -> JOIN subject s ON f.faculty_code = s.faculty_code
    -> GROUP BY f.faculty_code
    -> HAVING COUNT(s.subject_code) > 1;
+--------------+
| faculty_name |
+--------------+
| Dr. Smith    |
+--------------+
1 row in set (0.00 sec)

mysql> SELECT subject_name, max_marks
    -> FROM subject
    -> ORDER BY max_marks ASC;
+--------------+-----------+
| subject_name | max_marks |
+--------------+-----------+
| Mathematics  |       100 |
| Physics      |       100 |
| Chemistry    |       100 |
| Biology      |       100 |
+--------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT subject_name, max_marks AS Maximum
    -> FROM subject;
+--------------+---------+
| subject_name | Maximum |
+--------------+---------+
| Mathematics  |     100 |
| Physics      |     100 |
| Chemistry    |     100 |
| Biology      |     100 |
+--------------+---------+
4 rows in set (0.00 sec)

