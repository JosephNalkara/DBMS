mysql> create database q3;
Query OK, 1 row affected (0.01 sec)
mysql> use q3;
Database changed
mysql> CREATE TABLE account (
    ->     account_number INT PRIMARY KEY,
    ->     ifsc_code VARCHAR(50),
    ->     bank_name VARCHAR(50),
    ->     bank_branch VARCHAR(50),
    ->     account_type VARCHAR(20),
    ->     account_balance DECIMAL(15, 2)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO account (account_number, ifsc_code, bank_name, bank_branch, account_type, account_balance) VALUES
    -> (1001, 'HDFC0001234', 'HDFC Bank', 'Main Branch', 'Savings', 25000.50),
    -> (1002, 'SBI0005678', 'State Bank of India', 'City Branch', 'Current', 150000.75),
    -> (1003, 'ICICI0009101', 'ICICI Bank', 'Suburban Branch', 'Savings', 50000.00),
    -> (1004, 'AXIS0001122', 'Axis Bank', 'Town Branch', 'Savings', 3000.25),
    -> (1005, 'PNB0001314', 'Punjab National Bank', 'Village Branch', 'Fixed Deposit', 100000.00);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0
mysql> select * from account;
+----------------+--------------+----------------------+-----------------+---------------+-----------------+
| account_number | ifsc_code    | bank_name            | bank_branch     | account_type  | account_balance |
+----------------+--------------+----------------------+-----------------+---------------+-----------------+
|           1001 | HDFC0001234  | HDFC Bank            | Main Branch     | Savings       |        25000.50 |
|           1002 | SBI0005678   | State Bank of India  | City Branch     | Current       |       150000.75 |
|           1003 | ICICI0009101 | ICICI Bank           | Suburban Branch | Savings       |        50000.00 |
|           1004 | AXIS0001122  | Axis Bank            | Town Branch     | Savings       |         3000.25 |
|           1005 | PNB0001314   | Punjab National Bank | Village Branch  | Fixed Deposit |       100000.00 |
+----------------+--------------+----------------------+-----------------+---------------+-----------------+
5 rows in set (0.00 sec)
mysql> SELECT UPPER(bank_name) AS upper_bank_name FROM account;
+----------------------+
| upper_bank_name      |
+----------------------+
| HDFC BANK            |
| STATE BANK OF INDIA  |
| ICICI BANK           |
| AXIS BANK            |
| PUNJAB NATIONAL BANK |
+----------------------+
5 rows in set (0.00 sec)
mysql> SELECT LOWER(bank_name) AS lower_bank_name FROM account;
+----------------------+
| lower_bank_name      |
+----------------------+
| hdfc bank            |
| state bank of india  |
| icici bank           |
| axis bank            |
| punjab national bank |
+----------------------+
5 rows in set (0.00 sec)
mysql> SELECT LENGTH(bank_name) AS length_bank_name FROM account;
+------------------+
| length_bank_name |
+------------------+
|                9 |
|               19 |
|               10 |
|                9 |
|               20 |
+------------------+
5 rows in set (0.00 sec)
mysql> SELECT REPLACE(bank_name, 'Bank', 'Financial Institution') AS replaced_bank_name FROM account;
+---------------------------------------+
| replaced_bank_name                    |
+---------------------------------------+
| HDFC Financial Institution            |
| State Financial Institution of India  |
| ICICI Financial Institution           |
| Axis Financial Institution            |
| Punjab National Financial Institution |
+---------------------------------------+
5 rows in set (0.00 sec)
mysql> SELECT ROUND(account_balance, 2) AS rounded_balance FROM account;
+-----------------+
| rounded_balance |
+-----------------+
|        25000.50 |
|       150000.75 |
|        50000.00 |
|         3000.25 |
|       100000.00 |
+-----------------+
5 rows in set (0.00 sec)
mysql> SELECT CEIL(account_balance) AS ceiled_balance FROM account;
+----------------+
| ceiled_balance |
+----------------+
|          25001 |
|         150001 |
|          50000 |
|           3001 |
|         100000 |
+----------------+
5 rows in set (0.00 sec)
mysql> SELECT FLOOR(account_balance) AS floored_balance FROM account;
+-----------------+
| floored_balance |
+-----------------+
|           25000 |
|          150000 |
|           50000 |
|            3000 |
|          100000 |
+-----------------+
5 rows in set (0.00 sec)
mysql> SELECT SIGN(account_balance) AS sign_of_balance FROM account;
+-----------------+
| sign_of_balance |
+-----------------+
|               1 |
|               1 |
|               1 |
|               1 |
|               1 |
+-----------------+
5 rows in set (0.00 sec)
mysql> select current_date();
+----------------+
| current_date() |
+----------------+
| 2024-10-17     |
+----------------+
1 row in set (0.00 sec)
mysql> SELECT SYSDATE() AS system_date;
+---------------------+
| system_date         |
+---------------------+
| 2024-10-17 14:22:06 |
+---------------------+
1 row in set (0.00 sec)
mysql> SELECT MONTH(CURRENT_DATE) AS current_month;
+---------------+
| current_month |
+---------------+
|            10 |
+---------------+
1 row in set (0.00 sec)
mysql> SELECT YEAR(CURRENT_DATE) AS current_year;
+--------------+
| current_year |
+--------------+
|         2024 |
+--------------+
1 row in set (0.00 sec)
mysql> SELECT 
    ->     ASCII('A') AS ascii_A, 
    ->     ASCII('B') AS ascii_B, 
    ->     ASCII('C') AS ascii_C, 
    ->     ASCII('D') AS ascii_D, 
    ->     ASCII('E') AS ascii_E;
+---------+---------+---------+---------+---------+
| ascii_A | ascii_B | ascii_C | ascii_D | ascii_E |
+---------+---------+---------+---------+---------+
|      65 |      66 |      67 |      68 |      69 |
+---------+---------+---------+---------+---------+
1 row in set (0.00 sec)

