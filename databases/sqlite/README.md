# SQLite

SQLite 3.40+ is a self-contained, serverless, zero-configuration, transactional SQL database engine embedded directly into applications.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Data types, DDL, DML, queries, JSON support, FTS5, WAL mode, transactions, pragmas, and performance tips |

## Quick Reference

### Create Table

```sql
CREATE TABLE users (
  id    INTEGER PRIMARY KEY AUTOINCREMENT,
  name  TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  data  TEXT DEFAULT '{}',
  created_at TEXT DEFAULT (datetime('now'))
);
```

### Insert

```sql
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT OR REPLACE INTO users (name, email) VALUES ('Alice', 'alice@example.com');
```

### Select

```sql
SELECT u.name, COUNT(o.id) AS orders
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
GROUP BY u.name
HAVING orders > 0;
```

### JSON Functions

```sql
SELECT json_extract(data, '$.role') FROM users;
SELECT json_set(data, '$.verified', 1) FROM users WHERE id = 1;
SELECT * FROM users WHERE json_extract(data, '$.role') = 'admin';
```

### FTS5 (Full-Text Search)

```sql
CREATE VIRTUAL TABLE articles USING fts5(title, body);
INSERT INTO articles (title, body) VALUES ('SQLite Guide', 'Learn SQLite...');
SELECT * FROM articles WHERE articles MATCH 'sqlite guide';
```

### WAL Mode

```sql
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
```

## See Also

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [SQLite Syntax](https://www.sqlite.org/lang.html)
- [SQLite FTS5](https://www.sqlite.org/fts5.html)
