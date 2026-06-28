# PostgreSQL

PostgreSQL 16+ is an advanced open-source relational database with strong standards compliance, extensibility, and support for JSON, full-text search, and advanced queries.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Data types, DDL, DML, queries, window functions, JSONB, full-text search, transactions, performance, and extensions |

## Quick Reference

### Create Table

```sql
CREATE TABLE users (
  id         BIGSERIAL PRIMARY KEY,
  email      TEXT NOT NULL UNIQUE,
  name       TEXT,
  data       JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now()
);
```

### Select with CTEs

```sql
WITH active AS (
  SELECT id, name FROM users WHERE created_at > now() - INTERVAL '30 days'
)
SELECT * FROM active ORDER BY name;
```

### Joins

```sql
SELECT u.name, o.total
FROM users u
INNER JOIN orders o ON o.user_id = u.id
WHERE o.total > 100;
```

### Window Functions

```sql
SELECT name, total,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total DESC) AS rank
FROM orders;
```

### JSONB

```sql
SELECT * FROM users WHERE data @> '{"role": "admin"}';
UPDATE users SET data = data || '{"verified": true}' WHERE id = 1;
```

### Indexes

```sql
CREATE INDEX idx_users_email ON users (email);
CREATE INDEX idx_users_data ON users USING gin (data);
CREATE INDEX idx_active ON users (id) WHERE created_at > '2024-01-01';
```

### Transactions

```sql
BEGIN;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

## See Also

- [PostgreSQL Documentation](https://www.postgresql.org/docs/current/)
- [PostgreSQL Wiki](https://wiki.postgresql.org/)
- [pgAdmin](https://www.pgadmin.org/)
