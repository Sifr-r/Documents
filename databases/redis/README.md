# Redis

Redis 7+ is an in-memory data structure store used as a database, cache, and message broker. It supports strings, hashes, lists, sets, sorted sets, streams, and pub/sub.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Strings, hashes, lists, sets, sorted sets, streams, pub/sub, transactions, Lua scripting, persistence, and cluster mode |

## Quick Reference

### Strings

```bash
SET user:1 "Alice"
GET user:1
SET session:abc "data" EX 3600    # expire in 1 hour
INCR page:views
```

### Hashes

```bash
HSET user:1 name Alice age 30
HGET user:1 name
HGETALL user:1
```

### Lists

```bash
LPUSH queue "task1"
RPUSH queue "task2"
RPOP queue
LRANGE queue 0 -1
```

### Sets

```bash
SADD tags "redis" "database" "nosql"
SMEMBERS tags
SINTER tags:popular tags:recent
```

### Sorted Sets

```bash
ZADD leaderboard 100 "Alice" 85 "Bob"
ZRANGE leaderboard 0 -1 WITHSCORES
ZRANGEBYSCORE leaderboard 80 100
```

### Pub/Sub

```bash
SUBSCRIBE news
PUBLISH news "Breaking: Redis 8 released"
```

### Key Expiry

```bash
EXPIRE key 60
TTL key
PERSIST key
```

## See Also

- [Redis Documentation](https://redis.io/docs/)
- [Redis Commands](https://redis.io/commands/)
- [Redis University](https://university.redis.com/)
