# MySQL — Core

## Data Types

```sql
-- Numeric
TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
TINYINT UNSIGNED, INT UNSIGNED, BIGINT UNSIGNED
FLOAT, DOUBLE, DECIMAL(10,2)
BOOLEAN  -- alias for TINYINT(1)

-- String
CHAR(n), VARCHAR(n)
TINYTEXT, TEXT, MEDIUMTEXT, LONGTEXT
BINARY(n), VARBINARY(n)
TINYBLOB, BLOB, MEDIUMBLOB, LONGBLOB
ENUM('val1','val2','val3')
SET('a','b','c')

-- Date/Time
DATE, TIME, DATETIME, TIMESTAMP, YEAR

-- JSON
JSON  -- stored as binary, supports functions

-- Spatial
GEOMETRY, POINT, LINESTRING, POLYGON
```

## DDL

### CREATE TABLE

```sql
CREATE TABLE users (
  id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  age        TINYINT UNSIGNED CHECK (age <= 150),
  status     ENUM('active','inactive','banned') DEFAULT 'active',
  metadata   JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_email (email),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE orders (
  id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id    BIGINT UNSIGNED NOT NULL,
  total      DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;
```

### ALTER TABLE

```sql
ALTER TABLE users ADD COLUMN phone VARCHAR(20) AFTER email;
ALTER TABLE users DROP COLUMN phone;
ALTER TABLE users MODIFY COLUMN name VARCHAR(200) NOT NULL;
ALTER TABLE users CHANGE COLUMN name full_name VARCHAR(200) NOT NULL;
ALTER TABLE users ADD INDEX idx_created (created_at);
ALTER TABLE users DROP INDEX idx_email;
ALTER TABLE users ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES users(id);
```

### Constraints

```sql
PRIMARY KEY (id)
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
UNIQUE (email)
CHECK (age >= 0)
NOT NULL
DEFAULT 'value'
```

## DML

```sql
-- INSERT
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob','bob@example.com'), ('Carol','carol@example.com');

-- INSERT IGNORE (skip duplicates)
INSERT IGNORE INTO users (name, email) VALUES ('Alice', 'alice@example.com');

-- REPLACE (delete + insert on duplicate)
REPLACE INTO users (name, email) VALUES ('Alice', 'alice@example.com');

-- ON DUPLICATE KEY UPDATE (upsert)
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com')
  ON DUPLICATE KEY UPDATE name = VALUES(name);

-- UPDATE
UPDATE users SET name = 'Alicia' WHERE id = 1;
UPDATE users u JOIN orders o ON u.id = o.user_id SET u.status = 'vip' WHERE o.total > 1000;

-- DELETE
DELETE FROM users WHERE id = 1;
DELETE u FROM users u JOIN orders o ON u.id = o.user_id WHERE o.total < 0;
TRUNCATE TABLE sessions;  -- fast delete all, reset auto_increment
```

## Queries

### SELECT

```sql
SELECT u.name, COUNT(o.id) AS order_count, SUM(o.total) AS total
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at >= '2024-01-01'
GROUP BY u.id, u.name
HAVING total > 500
ORDER BY total DESC
LIMIT 20 OFFSET 0;
```

### JOINs

```sql
-- INNER, LEFT, RIGHT, CROSS
SELECT * FROM users u INNER JOIN orders o ON u.id = o.user_id;
SELECT * FROM users u LEFT JOIN orders o ON u.id = o.user_id;
-- Self join
SELECT a.name, b.name AS manager FROM users a JOIN users b ON a.manager_id = b.id;
-- Natural join (matches on same-named columns)
SELECT * FROM users NATURAL JOIN user_profiles;
```

### Subqueries and CTEs

```sql
-- Subquery
SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE total > 100);
SELECT * FROM users WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id);

-- Derived table
SELECT t.name, t.cnt FROM (
  SELECT u.name, COUNT(*) AS cnt FROM users u GROUP BY u.name
) t WHERE t.cnt > 5;

-- CTE (8.0+)
WITH top_users AS (
  SELECT user_id, SUM(total) AS spent FROM orders GROUP BY user_id
)
SELECT u.name, t.spent FROM users u JOIN top_users t ON u.id = t.user_id WHERE t.spent > 1000;

-- Recursive CTE
WITH RECURSIVE nums AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 10
)
SELECT * FROM nums;
```

### Window Functions (8.0+)

```sql
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rn
RANK() OVER (ORDER BY score DESC)
DENSE_RANK() OVER (ORDER BY score DESC)
LAG(salary, 1) OVER (ORDER BY hire_date)
LEAD(salary, 1) OVER (ORDER BY hire_date)
SUM(total) OVER (PARTITION BY user_id ORDER BY created_at)
NTILE(4) OVER (ORDER BY revenue)
```

### UNION

```sql
SELECT name FROM users UNION SELECT name FROM admins;
SELECT name FROM users UNION ALL SELECT name FROM admins;
```

## Stored Procedures and Functions

```sql
-- Procedure
DELIMITER //
CREATE PROCEDURE GetUserOrders(IN userId BIGINT, OUT totalOrders INT)
BEGIN
  SELECT COUNT(*) INTO totalOrders FROM orders WHERE user_id = userId;
  SELECT * FROM orders WHERE user_id = userId;
END //
DELIMITER ;
CALL GetUserOrders(1, @total);
SELECT @total;

-- Function
DELIMITER //
CREATE FUNCTION FullName(first VARCHAR(50), last VARCHAR(50))
RETURNS VARCHAR(101) DETERMINISTIC
BEGIN
  RETURN CONCAT(first, ' ', last);
END //
DELIMITER ;
SELECT FullName(name, 'Smith') FROM users;

-- Control flow
IF ... THEN ... ELSEIF ... THEN ... ELSE ... END IF;
CASE WHEN ... THEN ... ELSE ... END CASE;
WHILE ... DO ... END WHILE;
REPEAT ... UNTIL ... END REPEAT;
```

## Triggers

```sql
DELIMITER //
CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
  SET NEW.updated_at = NOW();
END //
DELIMITER ;

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
  UPDATE users SET order_count = order_count + 1 WHERE id = NEW.user_id;

SHOW TRIGGERS;
DROP TRIGGER before_user_update;
```

## Views

```sql
CREATE VIEW active_users AS
  SELECT id, name, email FROM users WHERE status = 'active';

CREATE OR REPLACE VIEW user_stats AS
  SELECT u.name, COUNT(o.id) AS orders, SUM(o.total) AS total
  FROM users u LEFT JOIN orders o ON u.id = o.user_id
  GROUP BY u.id, u.name;

SELECT * FROM active_users WHERE name LIKE 'A%';
DROP VIEW active_users;
```

## Indexes

```sql
-- B-tree (default)
CREATE INDEX idx_email ON users (email);
CREATE UNIQUE INDEX idx_username ON users (username);
CREATE INDEX idx_name_email ON users (name, email);  -- composite

-- Full-text
CREATE FULLTEXT INDEX idx_ft ON posts (title, body);
SELECT * FROM posts WHERE MATCH(title, body) AGAINST('mysql performance' IN NATURAL LANGUAGE MODE);
SELECT * FROM posts WHERE MATCH(title, body) AGAINST('+mysql -oracle' IN BOOLEAN MODE);

-- Spatial
CREATE SPATIAL INDEX idx_loc ON places (location);

-- Manage
SHOW INDEX FROM users;
DROP INDEX idx_email ON users;
ALTER TABLE users ADD INDEX idx_status (status);
```

## Transactions

```sql
START TRANSACTION;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;

START TRANSACTION;
  INSERT INTO log (action) VALUES ('refund');
ROLLBACK;

-- Savepoints
START TRANSACTION;
  SAVEPOINT sp1;
  DELETE FROM orders WHERE id = 1;
  ROLLBACK TO sp1;
COMMIT;

-- Isolation levels
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;  -- default
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

## User Management

```sql
CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE ON mydb.* TO 'appuser'@'localhost';
GRANT ALL PRIVILEGES ON mydb.* TO 'admin'@'%';
REVOKE DELETE ON mydb.* FROM 'appuser'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'appuser'@'localhost';
DROP USER 'appuser'@'localhost';
ALTER USER 'appuser'@'localhost' IDENTIFIED BY 'newpassword';
```

## Performance

```sql
EXPLAIN SELECT * FROM users WHERE email = 'alice@example.com';
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'alice@example.com';  -- 8.0.18+
EXPLAIN FORMAT=JSON SELECT * FROM orders WHERE total > 100;

-- Optimizer hints
SELECT /*+ INDEX(users idx_email) */ * FROM users WHERE email = 'a@b.com';
SELECT /*+ NO_INDEX_MERGE(users) */ * FROM users WHERE status = 'active';

-- Table analysis
ANALYZE TABLE users;
SHOW TABLE STATUS LIKE 'users';
SHOW PROCESSLIST;
```

## See Also

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL 8.0 Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
- [MySQL Performance Blog](https://www.percona.com/blog/)
- [Planet MySQL](https://planet.mysql.com/)
