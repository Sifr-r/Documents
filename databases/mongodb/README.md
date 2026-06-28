# MongoDB

MongoDB 7+ is a document-oriented NoSQL database that stores flexible, JSON-like documents (BSON) with powerful querying, aggregation, and indexing capabilities.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Documents and collections, CRUD, query/update operators, aggregation pipeline, indexes, schema validation, transactions, and change streams |

## Quick Reference

### Find

```js
db.users.find({ age: { $gt: 25 } }).sort({ name: 1 }).limit(10);
db.users.findOne({ email: "alice@example.com" });
```

### Insert

```js
db.users.insertOne({ name: "Alice", age: 30, tags: ["admin"] });
db.users.insertMany([
  { name: "Bob", age: 28 },
  { name: "Carol", age: 35 }
]);
```

### Update

```js
db.users.updateOne({ _id: id }, { $set: { age: 31 } });
db.users.updateMany({ status: "inactive" }, { $set: { archived: true } });
```

### Aggregation Pipeline

```js
db.orders.aggregate([
  { $match: { status: "completed" } },
  { $group: { _id: "$user_id", total: { $sum: "$amount" } } },
  { $sort: { total: -1 } },
  { $limit: 5 }
]);
```

### Indexes

```js
db.users.createIndex({ email: 1 }, { unique: true });
db.posts.createIndex({ title: "text", body: "text" });
```

### Lookup (Join)

```js
db.orders.aggregate([
  { $lookup: { from: "users", localField: "user_id", foreignField: "_id", as: "user" } },
  { $unwind: "$user" }
]);
```

## See Also

- [MongoDB Documentation](https://www.mongodb.com/docs/)
- [MongoDB University](https://university.mongodb.com/)
- [MongoDB Atlas](https://www.mongodb.com/atlas)
