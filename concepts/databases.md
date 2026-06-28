# Databases

## SQL Fundamentals

```sql
-- Query
SELECT id, name, email
FROM users
WHERE active = true
  AND created_at > '2026-01-01'
ORDER BY created_at DESC
LIMIT 20 OFFSET 0;

-- Join
SELECT u.name, o.total
FROM users u
JOIN orders o ON u.id = o.user_id
WHERE o.status = 'completed';

-- Left Join (keep all users even without orders)
SELECT u.name, COUNT(o.id) as order_count
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;

-- Aggregate
SELECT status, COUNT(*), SUM(total) as revenue
FROM orders
GROUP BY status
HAVING COUNT(*) > 5;  -- filter after grouping

-- Insert
INSERT INTO users (name, email) VALUES ('Ada', 'ada@example.com');
INSERT INTO users (name, email) VALUES
  ('Bob', 'bob@example.com'),
  ('Cal', 'cal@example.com');

-- Update
UPDATE users SET active = false WHERE last_login < '2025-01-01';

-- Delete
DELETE FROM sessions WHERE expires_at < NOW();

-- Upsert (PostgreSQL)
INSERT INTO users (id, name, email) VALUES (1, 'Ada', 'new@example.com')
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email;
```

## Indexing

```sql
-- B-tree (default) — equality + range queries
CREATE INDEX idx_users_email ON users(email);

-- Composite index — left-to-right column order matters
CREATE INDEX idx_orders_user_status ON orders(user_id, status);
-- Good for: WHERE user_id = ? AND status = ?
-- Good for: WHERE user_id = ?  (leftmost prefix)
-- Bad for:  WHERE status = ?   (not leftmost)

-- Unique index
CREATE UNIQUE INDEX idx_users_email_unique ON users(email);

-- Partial index (filtered)
CREATE INDEX idx_active_users ON users(email) WHERE active = true;

-- Text search (PostgreSQL)
CREATE INDEX idx_articles_search ON articles
USING GIN (to_tsvector('english', title || ' ' || body));

-- Check index usage
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'ada@example.com';
```

## Transactions

```sql
BEGIN;
  UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
-- If either fails, ROLLBACK automatically
```

**ACID:**
- **A**tomicity — all or nothing
- **C**onsistency — valid state before and after
- **I**solation — concurrent transactions don't interfere
- **D**urability — committed data survives crashes

**Isolation Levels:**

| Level | Dirty Read | Non-repeatable Read | Phantom Read |
|---|---|---|---|
| Read Uncommitted | Yes | Yes | Yes |
| Read Committed | No | Yes | Yes |
| Repeatable Read | No | No | Yes |
| Serializable | No | No | No |

Default: Read Committed (PostgreSQL, most DBs), Repeatable Read (MySQL default).

## Connection Pooling

```python
# SQLAlchemy + asyncpg (Python)
from sqlalchemy.ext.asyncio import create_async_engine

engine = create_async_engine(
    "postgresql+asyncpg://user:pass@localhost/db",
    pool_size=10,          # max connections
    max_overflow=20,       # extra if pool exhausted
    pool_pre_ping=True,    # check connection alive before use
)
```

```go
// pgxpool (Go)
config, _ := pgxpool.ParseConfig(os.Getenv("DATABASE_URL"))
config.MaxConns = 10
pool, _ := pgxpool.NewWithConfig(ctx, config)
defer pool.Close()
```

## Migrations

Version control your schema. Never modify old migrations — add new ones.

```sql
-- 001_create_users.up.sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 002_add_avatar.up.sql
ALTER TABLE users ADD COLUMN avatar_url TEXT;
```

```bash
# Tools: golang-migrate, alembic (Python), Flyway (Java)
migrate -path ./migrations -database "$DATABASE_URL" up
migrate -path ./migrations -database "$DATABASE_URL" down 1
```

## N+1 Problem

```python
# BAD — N+1 queries
users = db.query(User).all()
for user in users:
    orders = db.query(Order).filter(Order.user_id == user.id).all()
    # 1 query for users + N queries for orders

# GOOD — eager loading
users = db.query(User).options(joinedload(User.orders)).all()
# 1 query with JOIN
```

## Pagination

```sql
-- Offset-based (simple, but drifts on inserts)
SELECT * FROM users ORDER BY id LIMIT 20 OFFSET 40;

-- Cursor-based (stable, better performance)
SELECT * FROM users WHERE id > 12345 ORDER BY id LIMIT 20;
-- Client stores last seen id as cursor
```

## See Also

- [http.md](http.md) — REST APIs over databases
- [testing.md](testing.md) — database integration tests
