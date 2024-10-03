
mysql> create database movie
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> use movie
Database changed
mysql> create table actor (
    ->   act_id int not null primary key,
    ->   act_name varchar(20),
    ->   act_gender char(1)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> create table director (
    ->   dir_id int not null primary key,
    ->   dir_name varchar(20),
    ->   dir_phone varchar(20)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> create table movies (
    ->   mov_id int not null primary key,
    ->   mov_title varchar(20),
    ->   mov_year year,
    ->   mov_lang varchar(20),
    ->   dir_id int references director(dir_id) on delete cascade
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> create table movie_cast (
    ->   act_id int,
    ->   mov_id int,
    ->   role varchar(20),
    ->   foreign key (act_id) references actor(act_id) on delete cascade,
    ->   foreign key (mov_id) references movies(mov_id) on delete cascade
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> create table rating (
    ->   mov_id int,
    ->   rev_stars varchar(25),
    ->   foreign key (mov_id) references movies(mov_id) on delete cascade
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> insert into actor values (101, 'rahul', 'm');
Query OK, 1 row affected (0.01 sec)

mysql> insert into actor values (102, 'ankitha', 'f');
Query OK, 1 row affected (0.00 sec)

mysql> insert into actor values (103, 'radhika', 'f');
Query OK, 1 row affected (0.00 sec)

mysql> insert into actor values (104, 'chethan', 'm');
Query OK, 1 row affected (0.01 sec)

mysql> insert into actor values (105, 'vivan', 'm');
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> select * from actor;
+--------+----------+------------+
| act_id | act_name | act_gender |
+--------+----------+------------+
|    101 | rahul    | m          |
|    102 | ankitha  | f          |
|    103 | radhika  | f          |
|    104 | chethan  | m          |
|    105 | vivan    | m          |
+--------+----------+------------+
5 rows in set (0.00 sec)

mysql> 
mysql> insert into director values (201, 'anup', '918181818');
Query OK, 1 row affected (0.00 sec)

mysql> insert into director values (202, 'hitchcock', '918181812');
Query OK, 1 row affected (0.00 sec)

mysql> insert into director values (203, 'shashank', '918181813');
Query OK, 1 row affected (0.01 sec)

mysql> insert into director values (204, 'steven spielberg', '918181814');
Query OK, 1 row affected (0.00 sec)

mysql> insert into director values (205, 'anand', '918181815');
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> select * from director;
+--------+------------------+-----------+
| dir_id | dir_name         | dir_phone |
+--------+------------------+-----------+
|    201 | anup             | 918181818 |
|    202 | hitchcock        | 918181812 |
|    203 | shashank         | 918181813 |
|    204 | steven spielberg | 918181814 |
|    205 | anand            | 918181815 |
+--------+------------------+-----------+
5 rows in set (0.00 sec)

mysql> 
mysql> insert into movies values (1001, 'manasu', 2017, 'kannada', 201);
Query OK, 1 row affected (0.01 sec)

mysql> insert into movies values (1002, 'aakasham', 2015, 'telugu', 204);
Query OK, 1 row affected (0.00 sec)

mysql> insert into movies values (1003, 'kaliyona', 2008, 'kannada', 201);
Query OK, 1 row affected (0.00 sec)

mysql> insert into movies values (1004, 'war horse', 2011, 'english', 202);
Query OK, 1 row affected (0.00 sec)

mysql> insert into movies values (1005, 'home', 2012, 'english', 205);
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> insert into movie_cast values (101, 1002, 'hero');
Query OK, 1 row affected (0.00 sec)

mysql> insert into movie_cast values (101, 1001, 'hero');
Query OK, 1 row affected (0.00 sec)

mysql> insert into movie_cast values (103, 1003, 'heroine');
Query OK, 1 row affected (0.01 sec)

mysql> insert into movie_cast values (103, 1002, 'guest');
Query OK, 1 row affected (0.00 sec)

mysql> insert into movie_cast values (104, 1004, 'hero');
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> select * from movie_cast;
+--------+--------+---------+
| act_id | mov_id | role    |
+--------+--------+---------+
|    101 |   1002 | hero    |
|    101 |   1001 | hero    |
|    103 |   1003 | heroine |
|    103 |   1002 | guest   |
|    104 |   1004 | hero    |
+--------+--------+---------+
5 rows in set (0.00 sec)

mysql> 
mysql> insert into rating values (1001, 4);
Query OK, 1 row affected (0.01 sec)

mysql> insert into rating values (1002, 2);
Query OK, 1 row affected (0.00 sec)

mysql> insert into rating values (1003, 5);
Query OK, 1 row affected (0.00 sec)

mysql> insert into rating values (1004, 4);
Query OK, 1 row affected (0.00 sec)

mysql> insert into rating values (1005, 3);
Query OK, 1 row affected (0.01 sec)

mysql> 
mysql> delete from rating where mov_id = 1002;
Query OK, 1 row affected (0.00 sec)

mysql> select mov_title 
    -> from movies 
    -> where dir_id = (select dir_id from director where dir_name = 'hitchcock');
+-----------+
| mov_title |
+-----------+
| war horse |
+-----------+
1 row in set (0.00 sec)

mysql> 
mysql> 
mysql> select m.mov_title
    -> from movies m
    -> natural join movie_cast mc
    -> where act_id in (
    ->     select act_id
    ->     from movie_cast
    ->     group by act_id
    ->     having count(act_id) > 1
    -> )
    -> group by mov_title
    -> having count(*) > 1;
+-----------+
| mov_title |
+-----------+
| aakasham  |
+-----------+
1 row in set (0.00 sec)

mysql> 
mysql> 
mysql> select distinct act_name
    -> from actor
    -> join movie_cast using(act_id)
    -> join movies using(mov_id)
    -> where mov_year < 2000 or mov_year > 2020;
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> select mov_title, max(rev_stars)
    -> from movies natural join rating
    -> group by mov_title
    -> order by mov_title;
+-----------+----------------+
| mov_title | max(rev_stars) |
+-----------+----------------+
| home      | 3              |
| kaliyona  | 5              |
| manasu    | 4              |
| war horse | 4              |
+-----------+----------------+
4 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> update rating
    -> set rev_stars = 5
    -> where mov_id in (
    ->     select mov_id 
    ->     from director natural join movies
    ->     where dir_name = 'steven spielberg'
    -> );
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> select * from rating
    -> order by mov_id;
+--------+-----------+
| mov_id | rev_stars |
+--------+-----------+
|   1001 | 4         |
|   1003 | 5         |
|   1004 | 4         |
|   1005 | 3         |
+--------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT m.mov_title, MAX(r.rev_stars) AS highest_stars
    -> FROM movies m
    -> JOIN rating r ON m.mov_id = r.mov_id
    -> GROUP BY m.mov_title
    -> HAVING COUNT(r.mov_id) > 0
    -> ORDER BY m.mov_title;
+-----------+---------------+
| mov_title | highest_stars |
+-----------+---------------+
| home      | 3             |
| kaliyona  | 5             |
| manasu    | 4             |
| war horse | 4             |
+-----------+---------------+
4 rows in set (0.00 sec)

mysql> select * from movies;
+--------+-----------+----------+----------+--------+
| mov_id | mov_title | mov_year | mov_lang | dir_id |
+--------+-----------+----------+----------+--------+
|   1001 | manasu    |     2017 | kannada  |    201 |
|   1002 | aakasham  |     2015 | telugu   |    204 |
|   1003 | kaliyona  |     2008 | kannada  |    201 |
|   1004 | war horse |     2011 | english  |    202 |
|   1005 | home      |     2012 | english  |    205 |
+--------+-----------+----------+----------+--------+
5 rows in set (0.00 sec)

