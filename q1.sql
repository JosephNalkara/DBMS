mysql> create database LC1;
Query OK, 1 row affected (0.01 sec)

mysql> use LC1;
Database changed
mysql> create table STUDENT(student_id int primary key, Name varchar(20),Department varchar(20),Mark1 int,Mark2 int,CGPA int);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into STUDENT values(101,'Maaji','IT',80,80,8);
Query OK, 1 row affected (0.01 sec)

mysql> insert into STUDENT values(102,'Amal','CS',85,95,9);
Query OK, 1 row affected (0.00 sec)

mysql> insert into STUDENT values(103,'Thejus','CS',75,85,7);
Query OK, 1 row affected (0.01 sec)

mysql> insert into STUDENT values(104,'Karthik','CS',60,80,7);
Query OK, 1 row affected (0.00 sec)

mysql> insert into STUDENT values(105,'Anu','IT',70,70,7);
Query OK, 1 row affected (0.00 sec)

mysql> create table HOSTEL_DETAILS(std_id int primary key,stud_name varchar(20),block varchar(5),room_no int);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into HOSTEL_DETAILS values(101,'Maaji','A',101);
Query OK, 1 row affected (0.00 sec)

mysql> insert into HOSTEL_DETAILS values(102,'Amal','B',102);
Query OK, 1 row affected (0.00 sec)

mysql> insert into HOSTEL_DETAILS values(103,'Thejus','C',103);
Query OK, 1 row affected (0.01 sec)

mysql> insert into HOSTEL_DETAILS values(104,'Karthik','B',104);
Query OK, 1 row affected (0.00 sec)

mysql> insert into HOSTEL_DETAILS values(105,'Muhsina','A',108);
Query OK, 1 row affected (0.00 sec)

mysql> select Student_id,Name,Department,Mark1,Mark2,CGPA,block,room_no from STUDENT,HOSTEL_DETAILS where STUDENT.Student_id=HOSTEL_DETAILS.std_id;
+------------+---------+------------+-------+-------+------+-------+---------+
| Student_id | Name    | Department | Mark1 | Mark2 | CGPA | block | room_no |
+------------+---------+------------+-------+-------+------+-------+---------+
|        101 | Maaji   | IT         |    80 |    80 |    8 | A     |     101 |
|        102 | Amal    | CS         |    85 |    95 |    9 | B     |     102 |
|        103 | Thejus  | CS         |    75 |    85 |    7 | C     |     103 |
|        104 | Karthik | CS         |    60 |    80 |    7 | B     |     104 |
|        105 | Anu     | IT         |    70 |    70 |    7 | A     |     108 |
+------------+---------+------------+-------+-------+------+-------+---------+
5 rows in set (0.00 sec)

mysql> Alter table HOSTEL_DETAILS rename to Hostel;
Query OK, 0 rows affected (0.03 sec)

mysql> update STUDENT set CGPA=8 where Student_id=103;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from STUDENT where CGPA>=8;
+------------+--------+------------+-------+-------+------+
| student_id | Name   | Department | Mark1 | Mark2 | CGPA |
+------------+--------+------------+-------+-------+------+
|        101 | Maaji  | IT         |    80 |    80 |    8 |
|        102 | Amal   | CS         |    85 |    95 |    9 |
|        103 | Thejus | CS         |    75 |    85 |    8 |
+------------+--------+------------+-------+-------+------+
3 rows in set (0.00 sec)

mysql> select * from Hostel where block='A';
+--------+-----------+-------+---------+
| std_id | stud_name | block | room_no |
+--------+-----------+-------+---------+
|    101 | Maaji     | A     |     101 |
|    105 | Muhsina   | A     |     108 |
+--------+-----------+-------+---------+
2 rows in set (0.00 sec)

mysql> select * from STUDENT where Department='CS';
+------------+---------+------------+-------+-------+------+
| student_id | Name    | Department | Mark1 | Mark2 | CGPA |
+------------+---------+------------+-------+-------+------+
|        102 | Amal    | CS         |    85 |    95 |    9 |
|        103 | Thejus  | CS         |    75 |    85 |    8 |
|        104 | Karthik | CS         |    60 |    80 |    7 |
+------------+---------+------------+-------+-------+------+
3 rows in set (0.00 sec)

mysql> delete from Hostel where room_no=108;
Query OK, 1 row affected (0.00 sec)

mysql> update STUDENT set Department='EC' where Name='Anu';😁

