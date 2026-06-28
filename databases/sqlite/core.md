# SQLite — Core

## Data Types

SQLite uses dynamic typing with type affinity. Any column can store any type, but SQLite attempts to coerce values to the declared type.

```sql
-- Storage classes
NULL
INTEGER   -- signed integer (1, 2, 3, 4, 6, or 8 bytes)
REAL      -- 8-byte IEEE floating point
TEXT      -- UTF-8, UTF-16BE, or UTF-16LE
BLOB      -- binary data, stored exactly as input

-- Type affinity rules
INTEGER affinity: INT, INTEGER, TINYINT, SMALLINT, MEDIUMINT, BIGINT
TEXT affinity:    CHARACTER, VARCHAR, TEXT, CLOB
BLOB affinity:    BLOB (no type keyword)
REAL affinity:    REAL, DOUBLE, FLOAT
NUMERIC affinity: NUMERIC, DECIMAL, BOOLEAN, DATE, DATETIME
```

## DDL

### CREATE TABLE

```sql
CREATE TABLE users (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  name       TEXT NOT NULL,
  email      TEXT NOT NULL UNIQUE,
  age        INTEGER CHECK (age >= 0),
  status     TEXT DEFAULT 'active',
  data       TEXT DEFAULT '{}',
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE orders (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id    INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  total      REAL NOT NULL,
  created_at TEXT DEFAULT (datetime('now'))
);

-- Without rowid (clustered primary key)
CREATE TABLE config (
  key   TEXT PRIMARY KEY,
  value TEXT
) WITHOUT ROWID;
```

### ALTER TABLE

```sql
ALTER TABLE users ADD COLUMN phone TEXT;
ALTER TABLE users RENAME COLUMN data TO metadata;
ALTER TABLE users RENAME TO app_users;

-- SQLite lacks ALTER COLUMN and DROP COLUMN before 3.35.0
-- For 3.35.0+:
ALTER TABLE users DROP COLUMN phone;
```

### Constraints

```sql
PRIMARY KEY (id)                          -- rowid alias when INTEGER
PRIMARY KEY (a, b)                        -- composite
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
UNIQUE (email)
CHECK (age >= 0)
NOT NULL
DEFAULT 'value'
```

### Indexes

```sql
CREATE INDEX idx_users_email ON users (email);
CREATE UNIQUE INDEX idx_users_lower ON users (lower(email));
CREATE INDEX idx_orders_user_date ON orders (user_id, created_at);

-- Partial index
CREATE INDEX idx_active ON users (id) WHERE status = 'active';

-- Expression index (3.9.0+)
CREATE INDEX idx_name_lower ON users (lower(name));
```

## DML

```sql
-- INSERT
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com'), ('Carol', 'carol@example.com');

-- INSERT OR REPLACE (upsert)
INSERT OR REPLACE INTO users (name, email) VALUES ('Alice', 'alice@example.com');

-- INSERT OR IGNORE
INSERT OR IGNORE INTO users (name, email) VALUES ('Alice', 'alice@example.com');

-- Upsert (3.24.0+)
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com')
  ON CONFLICT(email) DO UPDATE SET name = excluded.name;

-- UPDATE
UPDATE users SET name = 'Alicia' WHERE id = 1;
UPDATE users SET status = 'inactive' WHERE created_at < '2023-01-01';

-- DELETE
DELETE FROM users WHERE id = 1;
DELETE FROM orders WHERE created_at < '2023-01-01';

-- RETURNING (3.35.0+)
INSERT INTO users (name, email) VALUES ('Dave', 'dave@example.com') RETURNING *;
UPDATE users SET name = 'David' WHERE id = 4 RETURNING id, name;
```

## Queries

### SELECT

```sql
SELECT name, COUNT(*) AS cnt
FROM users
WHERE status = 'active'
GROUP BY name
HAVING cnt > 1
ORDER BY cnt DESC
LIMIT 10;
```

### JOINs

```sql
SELECT u.name, o.total
FROM users u
INNER JOIN orders o ON u.id = o.user_id;

SELECT u.name, o.total
FROM users u
LEFT JOIN orders o ON u.id = o.user_id;

-- Cross join
SELECT * FROM users CROSS JOIN roles;
```

### CTEs

```sql
WITH active_users AS (
  SELECT id, name FROM users WHERE status = 'active'
)
SELECT au.name, COUNT(o.id) AS orders
FROM active_users au
LEFT JOIN orders o ON o.user_id = au.id
GROUP BY au.name;

-- Recursive CTE
WITH RECURSIVE counter(x) AS (
  SELECT 1
  UNION ALL
  SELECT x + 1 FROM counter WHERE x < 10
)
SELECT * FROM counter;
```

### Window Functions

```sql
SELECT name, total,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY total DESC) AS rank,
  SUM(total) OVER (PARTITION BY user_id) AS user_total
FROM orders;
```

### UNION / INTERSECT / EXCEPT

```sql
SELECT name FROM users UNION ALL SELECT name FROM admins;
SELECT name FROM users INTERSECT SELECT name FROM admins;
SELECT name FROM users EXCEPT SELECT name FROM banned;
```

## JSON Support

```sql
-- Validate
SELECT json('{"a":1}');                   -- returns valid JSON or error
SELECT json_valid('{"a":1}');             -- returns 1 or 0

-- Extract
SELECT json_extract(data, '$.name') FROM users;
SELECT data->>'$.name' FROM users;        -- shorthand (3.38.0+)
SELECT data->'$.name' FROM users;         -- returns JSON type (3.38.0+)

-- Modify
SELECT json_set(data, '$.verified', 1) FROM users;       -- set or insert
SELECT json_insert(data, '$.new', 'val') FROM users;     -- insert only if missing
SELECT json_replace(data, '$.name', 'Bob') FROM users;    -- replace only if exists
SELECT json_remove(data, '$.temp') FROM users;            -- remove

-- Array/object functions
SELECT json_array(1, 2, 3);
SELECT json_object('a', 1, 'b', 2);
SELECT json_array_length(data, '$.tags') FROM users;
SELECT json_type(data, '$.age') FROM users;

-- Table-valued functions
SELECT * FROM json_each('["a","b","c"]');
SELECT * FROM json_tree(data) FROM users WHERE id = 1;
```

## FTS5 (Full-Text Search)

```sql
CREATE VIRTUAL TABLE articles USING fts5(title, body, content='', tokenize='porter');

INSERT INTO articles (rowid, title, body) VALUES (1, 'SQLite Guide', 'Learn SQLite basics');
INSERT INTO articles (rowid, title, body) VALUES (2, 'Advanced SQL', 'Window functions and CTEs');

-- Search
SELECT * FROM articles WHERE articles MATCH 'sqlite';
SELECT * FROM articles WHERE articles MATCH 'title:sqlite';
SELECT * FROM articles WHERE articles MATCH 'sqlite OR advanced';
SELECT * FROM articles WHERE articles MATCH 'sql*';           -- prefix
SELECT * FROM articles WHERE articles MATCH 'sqlite AND NOT basic';

-- Highlighting
SELECT highlight(articles, 0, '<b>', '</b>') FROM articles WHERE articles MATCH 'sqlite';
SELECT snippet(articles, 1, '<b>', '</b>', '...', 64) FROM articles WHERE articles MATCH 'sqlite';

-- Ranking
SELECT *, rank FROM articles WHERE articles MATCH 'sqlite' ORDER BY rank;
```

## WAL Mode

```sql
-- Enable WAL (write-ahead logging) for better concurrency
PRAGMA journal_mode = WAL;

-- WAL allows concurrent readers and one writer
-- Checkpoint: flush WAL to main database
PRAGMA wal_checkpoint;           -- passive
PRAGMA wal_checkpoint(TRUNCATE); -- truncate WAL after checkpoint
```

## Transactions

```sql
BEGIN;
  INSERT INTO users (name, email) VALUES ('Eve', 'eve@example.com');
  UPDATE users SET status = 'active' WHERE id = 5;
COMMIT;

BEGIN;
  DELETE FROM orders WHERE user_id = 1;
ROLLBACK;

-- Deferred (default), Immediate, Exclusive
BEGIN IMMEDIATE;  -- acquire RESERVED lock immediately
```

## Pragmas

```sql
PRAGMA journal_mode = WAL;          -- WAL, DELETE, TRUNCATE, MEMORY, OFF
PRAGMA synchronous = NORMAL;        -- OFF, NORMAL, FULL, EXTRA
PRAGMA foreign_keys = ON;           -- enable FK enforcement (off by default!)
PRAGMA cache_size = -20000;         -- 20MB cache (negative = KB)
PRAGMA temp_store = MEMORY;         -- temp tables in memory
PRAGMA mmap_size = 268435456;       -- 256MB memory-mapped I/O
PRAGMA busy_timeout = 5000;         -- wait 5s on locked database
PRAGMA wal_autocheckpoint = 1000;   -- auto-checkpoint every 1000 pages
PRAGMA optimize;                    -- run ANALYZE if needed
```

## Performance Tips

```sql
-- Always use in a transaction for bulk inserts
BEGIN;
INSERT INTO data VALUES (...);
INSERT INTO data VALUES (...);
-- ... thousands more ...
COMMIT;

-- Use WAL mode for concurrent read/write
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;

-- Enable FK enforcement
PRAGMA foreign_keys = ON;

-- Use EXPLAIN QUERY PLAN to check query plans
EXPLAIN QUERY PLAN SELECT * FROM users WHERE email = 'alice@example.com';

-- Covering index
CREATE INDEX idx_users_email_name ON users (email, name);

-- Vacuum to reclaim space
VACUUM;
```

## See Also

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [SQLite SQL Syntax](https://www.sqlite.org/lang.html)
- [SQLite JSON1 Extension](https://www.sqlite.org/json1.html)
- [SQLite FTS5](https://www.sqlite.org/fts5.html)
