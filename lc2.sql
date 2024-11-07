mysql> create database lc2;
Query OK, 1 row affected (0.00 sec)

mysql> use lc2;
Database changed
mysql> -- Create Event table
mysql> CREATE TABLE Event (
    ->     event_id INT PRIMARY KEY,
    ->     name VARCHAR(255),
    ->     description TEXT,
    ->     city VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- Create Participant table
mysql> CREATE TABLE Participant (
    ->     player_id INT PRIMARY KEY,
    ->     name VARCHAR(255),
    ->     event_id INT,
    ->     gender VARCHAR(10),
    ->     year INT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> -- Create Prizes table
mysql> CREATE TABLE Prizes (
    ->     prize_id INT PRIMARY KEY,
    ->     money INT,
    ->     event_id INT,
    ->     rankk INT,
    ->     year INT
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> -- Create Winners table
mysql> CREATE TABLE Winners (
    ->     prize_id INT,
    ->     player_id INT,
    ->     PRIMARY KEY (prize_id, player_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> -- Insert sample events
mysql> INSERT INTO Event (event_id, name, description, city)
    -> VALUES
    -> (1, 'Annual Marathon', 'A marathon race event in the city center.', 'New York'),
    -> (2, 'Summer Tennis Tournament', 'A high-profile tennis tournament for all ages.', 'Los Angeles');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> -- Insert sample participants
mysql> INSERT INTO Participant (player_id, name, event_id, gender, year)
    -> VALUES
    -> (1, 'John Doe', 1, 'Male', 2024),
    -> (2, 'Jane Smith', 1, 'Female', 2024),
    -> (3, 'Alice Johnson', 1, 'Female', 2024),
    -> (4, 'Bob Brown', 2, 'Male', 2024),
    -> (5, 'Charlie White', 2, 'Male', 2024);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> -- Insert sample prizes (manually for testing)
mysql> INSERT INTO Prizes (prize_id, money, event_id, rankk, year)
    -> VALUES
    -> (1, 1500, 1, 1, 2024),  -- 1st Prize for Event 1
    -> (2, 1000, 1, 2, 2024),  -- 2nd Prize for Event 1
    -> (3, 500, 1, 3, 2024),   -- 3rd Prize for Event 1
    -> (4, 1500, 2, 1, 2024),  -- 1st Prize for Event 2
    -> (5, 1000, 2, 2, 2024),  -- 2nd Prize for Event 2
    -> (6, 500, 2, 3, 2024);   -- 3rd Prize for Event 2
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> -- Insert sample winners
mysql> INSERT INTO Winners (prize_id, player_id)
    -> VALUES
    -> (1, 1),  -- Winner of 1st Prize for Event 1 (John Doe)
    -> (2, 2),  -- Winner of 2nd Prize for Event 1 (Jane Smith)
    -> (3, 3),  -- Winner of 3rd Prize for Event 1 (Alice Johnson)
    -> (4, 4),  -- Winner of 1st Prize for Event 2 (Bob Brown)
    -> (5, 5),  -- Winner of 2nd Prize for Event 2 (Charlie White)
    -> (6, 1);  -- Winner of 3rd Prize for Event 2 (John Doe)
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> -- Verify data in Event table
mysql> SELECT * FROM Event;
+----------+--------------------------+------------------------------------------------+-------------+
| event_id | name                     | description                                    | city        |
+----------+--------------------------+------------------------------------------------+-------------+
|        1 | Annual Marathon          | A marathon race event in the city center.      | New York    |
|        2 | Summer Tennis Tournament | A high-profile tennis tournament for all ages. | Los Angeles |
+----------+--------------------------+------------------------------------------------+-------------+
2 rows in set (0.00 sec)

mysql> 
mysql> -- Verify data in Participant table
mysql> SELECT * FROM Participant;
+-----------+---------------+----------+--------+------+
| player_id | name          | event_id | gender | year |
+-----------+---------------+----------+--------+------+
|         1 | John Doe      |        1 | Male   | 2024 |
|         2 | Jane Smith    |        1 | Female | 2024 |
|         3 | Alice Johnson |        1 | Female | 2024 |
|         4 | Bob Brown     |        2 | Male   | 2024 |
|         5 | Charlie White |        2 | Male   | 2024 |
+-----------+---------------+----------+--------+------+
5 rows in set (0.00 sec)

mysql> 
mysql> -- Verify data in Prizes table
mysql> SELECT * FROM Prizes;
+----------+-------+----------+-------+------+
| prize_id | money | event_id | rankk | year |
+----------+-------+----------+-------+------+
|        1 |  1500 |        1 |     1 | 2024 |
|        2 |  1000 |        1 |     2 | 2024 |
|        3 |   500 |        1 |     3 | 2024 |
|        4 |  1500 |        2 |     1 | 2024 |
|        5 |  1000 |        2 |     2 | 2024 |
|        6 |   500 |        2 |     3 | 2024 |
+----------+-------+----------+-------+------+
6 rows in set (0.00 sec)

mysql> 
mysql> -- Verify data in Winners table
mysql> SELECT * FROM Winners;
+----------+-----------+
| prize_id | player_id |
+----------+-----------+
|        1 |         1 |
|        2 |         2 |
|        3 |         3 |
|        4 |         4 |
|        5 |         5 |
|        6 |         1 |
+----------+-----------+
6 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_event_insert
    -> AFTER INSERT ON Event
    -> FOR EACH ROW
    -> BEGIN
    ->     -- Insert 1st prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rank, year)
    ->     VALUES (NULL, 1500, NEW.event_id, 1, YEAR(CURDATE()));
    ->     
    ->     -- Insert 2nd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rank, year)
    ->     VALUES (NULL, 1000, NEW.event_id, 2, YEAR(CURDATE()));
    ->     
    ->     -- Insert 3rd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rank, year)
    ->     VALUES (NULL, 500, NEW.event_id, 3, YEAR(CURDATE()));
    -> END $$
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'rank, year)
    VALUES (NULL, 1500, NEW.event_id, 1, YEAR(CURDATE()));
    
    ' at line 6
mysql> 
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_event_insert
    -> AFTER INSERT ON Event
    -> FOR EACH ROW
    -> BEGIN
    ->     -- Insert 1st prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 1500, NEW.event_id, 1, YEAR(CURDATE()));
    ->     
    ->     -- Insert 2nd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 1000, NEW.event_id, 2, YEAR(CURDATE()));
    ->     
    ->     -- Insert 3rd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 500, NEW.event_id, 3, YEAR(CURDATE()));
    -> END $$
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> -- Insert a new event to test the trigger
mysql> INSERT INTO Event (event_id, name, description, city)
    -> VALUES (3, 'Winter Cup', 'A fun and competitive winter sports event', 'Chicago');
ERROR 1054 (42S22): Unknown column 'rank' in 'field list'
mysql> -- Rename the column from rankk to rank
mysql> ALTER TABLE Prizes CHANGE `rankk` `rank` INT;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_event_insert
    -> AFTER INSERT ON Event
    -> FOR EACH ROW
    -> BEGIN
    ->     -- Insert 1st prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rankk, year)
    ->     VALUES (NULL, 1500, NEW.event_id, 1, YEAR(CURDATE()));
    ->     
    ->     -- Insert 2nd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rankk, year)
    ->     VALUES (NULL, 1000, NEW.event_id, 2, YEAR(CURDATE()));
    ->     
    ->     -- Insert 3rd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, rankk, year)
    ->     VALUES (NULL, 500, NEW.event_id, 3, YEAR(CURDATE()));
    -> END $$
ERROR 1359 (HY000): Trigger already exists
mysql> 
mysql> DELIMITER ;
mysql> DROP TRIGGER IF EXISTS after_event_insert;
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE TRIGGER after_event_insert
    -> AFTER INSERT ON Event
    -> FOR EACH ROW
    -> BEGIN
    ->     -- Insert 1st prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 1500, NEW.event_id, 1, YEAR(CURDATE()));
    ->     
    ->     -- Insert 2nd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 1000, NEW.event_id, 2, YEAR(CURDATE()));
    ->     
    ->     -- Insert 3rd prize record
    ->     INSERT INTO Prizes (prize_id, money, event_id, `rank`, year)
    ->     VALUES (NULL, 500, NEW.event_id, 3, YEAR(CURDATE()));
    -> END $$
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELIMITER ;
mysql> -- Insert a new event to test the trigger
mysql> INSERT INTO Event (event_id, name, description, city)
    -> VALUES (3, 'Winter Cup', 'A fun and competitive winter sports event', 'Chicago');
ERROR 1048 (23000): Column 'prize_id' cannot be null
mysql> INSERT INTO Event (event_id, name, description, city)
    ->     -> VALUES (3, 'Winter Cup', 'A fun and competitive winter sports event', 'Chicago');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> VALUES (3, 'Winter Cup', 'A fun and competitive winter sports event', 'Chicag' at line 2
mysql> ALTER TABLE Prizes
    -> MODIFY COLUMN prize_id INT AUTO_INCREMENT;
Query OK, 6 rows affected (0.06 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> -- Insert a new event to test the trigger
mysql> INSERT INTO Event (event_id, name, description, city)
    -> VALUES (3, 'Winter Cup', 'A fun and competitive winter sports event', 'Chicago');
Query OK, 1 row affected (0.00 sec)

mysql> -- Verify the inserted prizes
mysql> SELECT * FROM Prizes WHERE event_id = 3;
+----------+-------+----------+------+------+
| prize_id | money | event_id | rank | year |
+----------+-------+----------+------+------+
|        7 |  1500 |        3 |    1 | 2024 |
|        8 |  1000 |        3 |    2 | 2024 |
|        9 |   500 |        3 |    3 | 2024 |
+----------+-------+----------+------+------+
3 rows in set (0.00 sec)

