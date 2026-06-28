# Redis — Core

## Strings

```bash
SET key "value"                    # set value
SET key "value" EX 60              # set with expiry (seconds)
SET key "value" PX 5000            # set with expiry (milliseconds)
SET key "value" NX                 # set only if not exists
SET key "value" XX                 # set only if exists
GET key                            # get value
MSET k1 "v1" k2 "v2"              # set multiple
MGET k1 k2                         # get multiple
INCR counter                       # increment by 1
INCRBY counter 5                   # increment by N
DECR counter                       # decrement by 1
DECRBY counter 3                   # decrement by N
APPEND key "suffix"                # append to value
STRLEN key                         # get length
GETRANGE key 0 4                   # substring
SETRANGE key 5 "new"               # overwrite at offset
TTL key                            # time-to-live in seconds
PTTL key                           # time-to-live in milliseconds
EXPIRE key 60                      # set TTL
PERSIST key                        # remove TTL
TYPE key                           # get type
DEL key                            # delete key
EXISTS key                         # check existence
KEYS pattern                       # find keys (use SCAN in prod)
SCAN 0 MATCH user:* COUNT 100      # iterate keys
```

## Hashes

```bash
HSET user:1 name "Alice" age 30    # set fields
HGET user:1 name                   # get field
HMSET user:1 name "Bob" age 25     # set multiple fields (deprecated, use HSET)
HMGET user:1 name age              # get multiple fields
HGETALL user:1                     # get all fields and values
HKEYS user:1                       # get all field names
HVALS user:1                       # get all values
HLEN user:1                        # number of fields
HEXISTS user:1 name                # field exists?
HDEL user:1 age                    # delete field
HINCRBY user:1 age 1               # increment field (integer)
HINCRBYFLOAT item:1 price 1.5      # increment field (float)
HSETNX user:1 name "Carol"         # set only if not exists
```

## Lists

```bash
LPUSH list "a"                     # push to head
RPUSH list "b"                     # push to tail
LPOP list                          # pop from head
RPOP list                          # pop from tail
LRANGE list 0 -1                   # get range (all elements)
LINDEX list 0                      # get by index
LLEN list                          # length
LSET list 0 "new"                  # set at index
LINSERT list BEFORE "a" "x"       # insert before element
LREM list 2 "a"                    # remove N occurrences
LTRIM list 0 99                    # trim to range
LPOS list "a"                      # position of element
BLPOP list 0                       # blocking pop from head
BRPOP list 0                       # blocking pop from tail
RPOPLPUSH src dst                  # pop from src, push to dst
```

## Sets

```bash
SADD myset "a" "b" "c"            # add members
SREM myset "a"                     # remove member
SMEMBERS myset                     # get all members
SISMEMBER myset "a"                # is member?
SCARD myset                        # number of members
SRANDMEMBER myset 2                # random members
SPOP myset                         # remove and return random

# Multi-set operations
SINTER set1 set2                   # intersection
SUNION set1 set2                   # union
SDIFF set1 set2                    # difference
SINTERSTORE dst set1 set2          # store intersection
SUNIONSTORE dst set1 set2          # store union
SDIFFSTORE dst set1 set2           # store difference
SMOVE src dst "a"                  # move member between sets
```

## Sorted Sets

```bash
ZADD zs 1 "a" 2 "b" 3 "c"        # add with scores
ZREM zs "a"                        # remove member
ZSCORE zs "b"                      # get score
ZRANK zs "b"                       # rank (0-based, ascending)
ZREVRANK zs "b"                    # rank (descending)
ZCARD zs                           # number of members
ZCOUNT zs 1 3                      # count in score range

ZRANGE zs 0 -1                     # all members ascending
ZRANGE zs 0 -1 WITHSCORES          # with scores
ZREVRANGE zs 0 4                   # top 5 descending
ZRANGEBYSCORE zs 80 100            # by score range
ZRANGEBYLEX zs "[a" "[z"           # by lexicographic range

ZINCRBY zs 5 "a"                   # increment score
ZREMRANGEBYSCORE zs 0 10           # remove by score range
ZREMRANGEBYRANK zs 0 4             # remove by rank
ZUNIONSTORE dst 2 zs1 zs2          # union of sorted sets
ZINTERSTORE dst 2 zs1 zs2          # intersection
```

## Streams

```bash
XADD mystream * name Alice age 30           # append entry (auto-ID)
XADD mystream 1234-0 name Bob              # append with specific ID
XLEN mystream                               # number of entries
XRANGE mystream - +                         # read all (min to max)
XREVRANGE mystream + - COUNT 5             # latest 5

XREAD COUNT 2 STREAMS mystream 0           # read from stream(s)
XREAD BLOCK 0 STREAMS mystream $           # blocking read

# Consumer groups
XGROUP CREATE mystream mygroup $ MKSTREAM  # create group
XREADGROUP GROUP mygroup consumer1 COUNT 1 STREAMS mystream >  # read
XACK mystream mygroup 1234-0              # acknowledge
XPENDING mystream mygroup                  # pending entries
XDEL mystream 1234-0                       # delete entry
XTRIM mystream MAXLEN 1000                 # trim to length
```

## Pub/Sub

```bash
SUBSCRIBE channel1 channel2                # subscribe
UNSUBSCRIBE channel1                       # unsubscribe
PUBLISH channel1 "message"                 # publish
PSUBSCRIBE news.*                          # pattern subscribe
PUBLISH news.tech "Redis update"           # publish to pattern channel
PUBSUB CHANNELS                            # list active channels
PUBSUB NUMSUB channel1                     # subscriber count
```

## Transactions

```bash
MULTI                                    # start transaction
SET key1 "val1"
SET key2 "val2"
EXEC                                     # execute all
DISCARD                                  # abort

WATCH key1 key2                          # optimistic locking
MULTI
SET key1 "new"
EXEC                                     # fails if watched keys changed
```

## Lua Scripting

```bash
EVAL "return redis.call('SET', KEYS[1], ARGV[1])" 1 mykey "myval"
EVALSHA <sha> 1 mykey "myval"            # run cached script

# Load script
SCRIPT LOAD "return redis.call('GET', KEYS[1])"
```

```js
// Node.js (ioredis)
const result = await redis.eval(
  `local val = redis.call('GET', KEYS[1])
   return tonumber(val) + tonumber(ARGV[1])`,
  1, "counter", 10
);
```

## Persistence

```bash
# RDB snapshots
SAVE                                     # blocking snapshot
BGSAVE                                   # background snapshot
CONFIG SET save "900 1"                  # save if 1 change in 900s

# AOF (append-only file)
CONFIG SET appendonly yes
CONFIG SET appendfsync everysec          # fsync policy: always, everysec, no
BGREWRITEAOF                             # rewrite AOF file

# Check
INFO persistence
```

## Cluster Mode

```bash
# Redis Cluster: automatic sharding across nodes
# 16384 hash slots distributed across masters
CLUSTER INFO
CLUSTER NODES
CLUSTER SLOTS

# Key hashing: {tag} ensures keys go to same slot
SET {user:1}.name "Alice"
SET {user:1}.email "a@b.com"

# Redis Sentinel: high availability
SENTINEL masters
SENTINEL get-master-addr-by-name mymaster
```

## See Also

- [Redis Documentation](https://redis.io/docs/)
- [Redis Commands Reference](https://redis.io/commands/)
- [Redis University](https://university.redis.com/)
- [Redis GitHub](https://github.com/redis/redis)
