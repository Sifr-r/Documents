# Databases

Reference documentation for popular databases and ORMs.

## Relational Databases

| Database | Description | Directory |
|---|---|---|
| PostgreSQL | Advanced open-source RDBMS (16+) | [postgresql/](postgresql/) |
| MySQL | Popular open-source RDBMS (8+) | [mysql/](mysql/) |
| SQLite | Embedded relational database (3.40+) | [sqlite/](sqlite/) |

## NoSQL Databases

| Database | Description | Directory |
|---|---|---|
| MongoDB | Document database (7+) | [mongodb/](mongodb/) |
| Redis | In-memory data structure store (7+) | [redis/](redis/) |

## ORMs & Query Builders

| Tool | Language | Directory |
|---|---|---|
| Prisma | TypeScript | [prisma/](prisma/) |
| Drizzle | TypeScript | [drizzle/](drizzle/) |

## Quick Reference

```sql
-- PostgreSQL
SELECT * FROM users WHERE age > 18 ORDER BY created_at DESC LIMIT 10;

-- MongoDB
db.users.find({ age: { $gt: 18 } }).sort({ created_at: -1 }).limit(10);

-- Redis
HSET user:1 name "Alice" age 30
HGETALL user:1
```