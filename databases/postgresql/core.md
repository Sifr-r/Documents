# PostgreSQL — Core

## Data Types

```sql
-- Numeric
SMALLINT, INTEGER, BIGINT, SERIAL, BIGSERIAL
NUMERIC(10,2), REAL, DOUBLE PRECISION

-- Character
TEXT, VARCHAR(n), CHAR(n)

-- Binary
BYTEA

-- Date/Time
DATE, TIME, TIMETZ, TIMESTAMP, TIMESTAMPTZ, INTERVAL

-- Boolean
BOOLEAN  -- TRUE, FALSE, NULL

-- JSON
JSON, JSONB  -- JSONB supports indexing and operators

-- UUID
UUID  -- 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'

-- Array
TEXT[], INTEGER[], JSONB[]

-- Full-text
TSVECTOR, TSQUERY

-- Other
INET, CIDR, MACADDR, MONEY, ENUM, HSTORE, RANGE
```

## DDL

### CREATE TABLE

```sql
CREATE TABLE users (
  id         BIGSERIAL PRIMARY KEY,
  email      TEXT NOT NULL UNIQUE,
  name       TEXT NOT NULL,
  age        INTEGER CHECK (age >= 0),
  status     TEXT DEFAULT 'active',
  tags       TEXT[] DEFAULT '{}',
  data       JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE orders (
  id         BIGSERIAL PRIMARY KEY,
  user_id    BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  total      NUMERIC(10,2) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);
```

### ALTER TABLE

```sql
ALTER TABLE users ADD COLUMN phone TEXT;
ALTER TABLE users DROP COLUMN phone;
ALTER TABLE users ALTER COLUMN name SET NOT NULL;
ALTER TABLE users ALTER COLUMN status TYPE VARCHAR(20);
ALTER TABLE users RENAME COLUMN data TO metadata;
ALTER TABLE users ADD CONSTRAINT chk_age CHECK (age >= 0);
```

### Constraints

```sql
PRIMARY KEY (id)
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
UNIQUE (email)
CHECK (age >= 0)
NOT NULL
EXCLUDE USING gist (room WITH =, period WITH &&)  -- exclusion
```

### Indexes

```sql
CREATE INDEX idx_users_email ON users (email);
CREATE UNIQUE INDEX idx_users_lower_email ON users (lower(email));
CREATE INDEX idx_users_gin ON users USING gin (data);
CREATE INDEX idx_partial ON users (id) WHERE status = 'active';
CREATE INDEX idx_composite ON orders (user_id, created_at DESC);
CREATE INDEX idx_fts ON articles USING gin (to_tsvector('english', body));
```

## DML

```sql
-- INSERT
INSERT INTO users (email, name) VALUES ('a@b.com', 'Alice') RETURNING id;
INSERT INTO users (email, name) VALUES ('c@d.com','Bob'), ('e@f.com','Carol');
INSERT INTO users (email, name) VALUES ('a@b.com','Dup')
  ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name;

-- UPDATE
UPDATE users SET name = 'Alicia' WHERE id = 1 RETURNING *;
UPDATE users SET data = jsonb_set(data, '{role}', '"admin"') WHERE id = 1;

-- DELETE
DELETE FROM users WHERE id = 1 RETURNING *;
DELETE FROM orders WHERE created_at < now() - INTERVAL '1 year';
```

## Queries

### SELECT

```sql
SELECT u.name, COUNT(o.id) AS order_count, SUM(o.total) AS total_spent
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
WHERE u.created_at >= '2024-01-01'
GROUP BY u.name
HAVING SUM(o.total) > 500
ORDER BY total_spent DESC
LIMIT 20 OFFSET 0;
```

### JOINs

```sql
-- INNER, LEFT, RIGHT, FULL, CROSS
SELECT * FROM users u INNER JOIN orders o ON u.id = o.user_id;
SELECT * FROM users u LEFT JOIN orders o ON u.id = o.user_id;
-- Self join
SELECT a.name, b.name FROM users a JOIN users b ON a.manager_id = b.id;
-- LATERAL
SELECT u.name, recent.* FROM users u, LATERAL (
  SELECT * FROM orders WHERE user_id = u.id ORDER BY created_at DESC LIMIT 3
) recent;
```

### CTEs and Subqueries

```sql
-- CTE
WITH top_users AS (
  SELECT user_id, SUM(total) AS spent FROM orders GROUP BY user_id HAVING SUM(total) > 1000
)
SELECT u.name, t.spent FROM users u JOIN top_users t ON u.id = t.user_id;

-- Recursive CTE
WITH RECURSIVE tree AS (
  SELECT id, name, parent_id, 1 AS depth FROM categories WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id, t.depth + 1 FROM categories c JOIN tree t ON c.parent_id = t.id
)
SELECT * FROM tree;

-- Subqueries
SELECT * FROM users WHERE id IN (SELECT user_id FROM orders WHERE total > 100);
SELECT * FROM users WHERE EXISTS (SELECT 1 FROM orders WHERE orders.user_id = users.id);
```

### UNION / INTERSECT / EXCEPT

```sql
SELECT name FROM customers UNION SELECT name FROM suppliers;
SELECT name FROM customers INTERSECT SELECT name FROM suppliers;
SELECT name FROM customers EXCEPT SELECT name FROM suppliers;
```

## Window Functions

```sql
ROW_NUMBER()  OVER (PARTITION BY dept ORDER BY salary DESC)  -- unique row number
RANK()        OVER (PARTITION BY dept ORDER BY salary DESC)  -- ties get same rank
DENSE_RANK()  OVER (ORDER BY score DESC)                     -- no gaps after ties
LAG(salary, 1)  OVER (ORDER BY hire_date)                    -- previous row value
LEAD(salary, 1) OVER (ORDER BY hire_date)                    -- next row value
FIRST_VALUE(name) OVER (PARTITION BY dept ORDER BY salary DESC)
SUM(total) OVER (PARTITION BY user_id ORDER BY created_at ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
NTILE(4) OVER (ORDER BY revenue)  -- divide into 4 buckets
```

## JSONB

```sql
-- Create
SELECT '{"name":"Alice","age":30}'::jsonb;
SELECT jsonb_build_object('name', 'Alice', 'tags', jsonb_build_array('admin'));

-- Operators
data @> '{"role":"admin"}'       -- contains
data ? 'email'                   -- key exists
data ?| array['a','b']           -- any key exists
data ?& array['a','b']           -- all keys exist

-- Access
data->'name'                     -- get as jsonb
data->>'name'                    -- get as text
data#>>'{address,city}'          -- nested text

-- Modify
jsonb_set(data, '{name}', '"Bob"')          -- set value
data || '{"verified": true}'::jsonb         -- merge
data - 'old_key'                            -- remove key
jsonb_set(data, '{tags,0}', '"new"')       -- array element
```

## Full-Text Search

```sql
-- Setup
ALTER TABLE articles ADD COLUMN search_vector TSVECTOR;
UPDATE articles SET search_vector = to_tsvector('english', title || ' ' || body);
CREATE INDEX idx_articles_search ON articles USING gin (search_vector);

-- Query
SELECT title FROM articles
WHERE search_vector @@ plainto_tsquery('english', 'postgres performance')
ORDER BY ts_rank(search_vector, plainto_tsquery('postgres performance')) DESC;

-- tsquery operators
to_tsquery('cat & dog');
to_tsquery('cat | dog');
to_tsquery('!cat');
to_tsquery('cat:*');  -- prefix matching
```

## Transactions

```sql
BEGIN;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  SAVEPOINT sp1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
  ROLLBACK TO sp1;   -- undo after savepoint
COMMIT;

-- Isolation levels
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
```

## Performance

```sql
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'a@b.com';
VACUUM ANALYZE users;

-- Partial index
CREATE INDEX idx_active_orders ON orders (user_id) WHERE status = 'pending';
-- Covering index
CREATE INDEX idx_users_email_name ON users (email) INCLUDE (name);
-- pg_stat_statements
SELECT query, calls, mean_exec_time FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 10;
```

## Extensions

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";     -- uuid_generate_v4()
CREATE EXTENSION IF NOT EXISTS pgcrypto;         -- gen_random_bytes(), crypt()
CREATE EXTENSION IF NOT EXISTS postgis;          -- spatial types and functions
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements"; -- query stats
CREATE EXTENSION IF NOT EXISTS citext;           -- case-insensitive text
```

## See Also

- [PostgreSQL Documentation](https://www.postgresql.org/docs/current/)
- [PostgreSQL Wiki](https://wiki.postgresql.org/)
- [Planet PostgreSQL](https://planet.postgresql.org/)
- [PostgreSQL Extensions](https://pgxn.org/)
