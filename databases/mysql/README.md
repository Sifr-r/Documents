# MySQL

MySQL 8+ is a widely used open-source relational database with strong performance, replication, JSON support, window functions, and a mature ecosystem.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Data types, DDL, DML, queries, stored procedures, triggers, views, indexes, transactions, user management, and performance |

## Quick Reference

### Create Table

```sql
CREATE TABLE users (
  id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  status     ENUM('active','inactive') DEFAULT 'active',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
```

### Select

```sql
SELECT u.name, COUNT(o.id) AS orders
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
GROUP BY u.name
HAVING orders > 5
ORDER BY orders DESC;
```

### JOINs

```sql
SELECT u.name, p.title
FROM users u
INNER JOIN posts p ON p.author_id = u.id
WHERE p.published = TRUE;
```

### Stored Procedure

```sql
DELIMITER //
CREATE PROCEDURE GetUserOrders(IN userId BIGINT)
BEGIN
  SELECT * FROM orders WHERE user_id = userId;
END //
DELIMITER ;
CALL GetUserOrders(1);
```

### Indexes

```sql
CREATE INDEX idx_email ON users (email);
CREATE FULLTEXT INDEX idx_ft ON posts (title, body);
```

## See Also

- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Reference Manual](https://dev.mysql.com/doc/refman/8.0/en/)
- [MySQL Workbench](https://www.mysql.com/products/workbench/)
