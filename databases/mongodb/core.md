# MongoDB — Core

## Documents and Collections

```js
// Document (BSON)
{
  _id: ObjectId("507f1f77bcf86cd799439011"),
  name: "Alice",
  age: 30,
  tags: ["admin", "user"],
  address: { city: "NYC", zip: "10001" },
  created: ISODate("2024-01-15T10:00:00Z")
}

// Collections are schema-flexible; documents in the same collection can differ
db.createCollection("users");
db.users.drop();
```

## CRUD

### Insert

```js
db.users.insertOne({
  name: "Alice",
  email: "alice@example.com",
  age: 30
});

db.users.insertMany([
  { name: "Bob", email: "bob@example.com" },
  { name: "Carol", email: "carol@example.com" }
]);
```

### Find

```js
db.users.find({});                                    // all documents
db.users.findOne({ email: "alice@example.com" });     // first match
db.users.find({ age: { $gt: 25 } }).sort({ name: 1 }).limit(10);
db.users.find({}, { name: 1, email: 1, _id: 0 });    // projection
db.users.find().skip(20).limit(10);                   // pagination
```

### Update

```js
db.users.updateOne({ _id: id }, { $set: { age: 31 } });
db.users.updateMany({ status: "inactive" }, { $set: { archived: true } });
db.users.replaceOne({ _id: id }, { name: "Alice", age: 32 });  // full replace
```

### Delete

```js
db.users.deleteOne({ _id: id });
db.users.deleteMany({ archived: true });
```

### FindOneAndUpdate / FindOneAndDelete

```js
db.users.findOneAndUpdate(
  { _id: id },
  { $set: { status: "active" } },
  { returnDocument: "after" }   // return updated doc
);
db.users.findOneAndDelete({ _id: id });
```

## Query Operators

```js
// Comparison
{ $eq: 5 }         // equal
{ $ne: 5 }         // not equal
{ $gt: 5 }         // greater than
{ $gte: 5 }        // greater or equal
{ $lt: 5 }         // less than
{ $lte: 5 }        // less or equal
{ $in: [1, 2, 3] } // in array
{ $nin: [4, 5] }   // not in array

// Logical
{ $and: [{ a: 1 }, { b: 2 }] }
{ $or:  [{ a: 1 }, { b: 2 }] }
{ $not: { $gt: 5 } }
{ $nor: [{ a: 1 }, { b: 2 }] }

// Element
{ $exists: true }
{ $type: "string" }

// Evaluation
{ $regex: /^alice/i }
{ $expr: { $gt: ["$spent", "$budget"] } }
{ $mod: [10, 0] }   // divisible by 10

// Array
{ $all: ["a", "b"] }   // contains all
{ $elemMatch: { $gt: 5 } } // at least one element matches
{ $size: 3 }              // array length
```

## Update Operators

```js
{ $set:    { name: "Bob" } }           // set field
{ $unset:  { temp_field: "" } }        // remove field
{ $inc:    { views: 1 } }              // increment
{ $mul:    { price: 1.1 } }            // multiply
{ $min:    { score: 0 } }              // set if less than current
{ $max:    { score: 100 } }            // set if greater than current
{ $rename: { old_name: "new_name" } }  // rename field
{ $currentDate: { updated: true } }    // set to current date

// Array operators
{ $push:    { tags: "new" } }          // append to array
{ $push:    { tags: { $each: ["a","b"], $sort: 1 } } }
{ $pull:    { tags: "old" } }          // remove from array
{ $addToSet:{ tags: "unique" } }       // add if not exists
{ $pop:     { tags: 1 } }              // remove last (-1 for first)
```

## Aggregation Pipeline

```js
db.orders.aggregate([
  // Stage 1: Filter
  { $match: { status: "completed", created: { $gte: ISODate("2024-01-01") } } },

  // Stage 2: Group
  { $group: {
    _id: "$user_id",
    total: { $sum: "$amount" },
    count: { $sum: 1 },
    avg: { $avg: "$amount" },
    orders: { $push: "$$ROOT" }
  }},

  // Stage 3: Project
  { $project: { total: 1, count: 1, avg: { $round: ["$avg", 2] } } },

  // Stage 4: Sort
  { $sort: { total: -1 } },

  // Stage 5: Limit
  { $limit: 10 }
]);

// Lookup (join)
{ $lookup: { from: "users", localField: "user_id", foreignField: "_id", as: "user" } }

// Unwind (destructure array)
{ $unwind: "$tags" }
{ $unwind: { path: "$tags", preserveNullAndEmptyArrays: true } }

// Bucket
{ $bucket: { groupBy: "$age", boundaries: [0, 18, 30, 50, 100], default: "Other" } }

// Facet (multiple pipelines)
{ $facet: {
  byStatus: [{ $group: { _id: "$status", count: { $sum: 1 } } }],
  byRegion: [{ $group: { _id: "$region", count: { $sum: 1 } } }]
}}
```

## Indexes

```js
// Single field
db.users.createIndex({ email: 1 });

// Compound
db.orders.createIndex({ user_id: 1, created: -1 });

// Unique
db.users.createIndex({ email: 1 }, { unique: true });

// Text
db.posts.createIndex({ title: "text", body: "text" });
db.posts.find({ $text: { $search: "mongodb tutorial" } });

// TTL (auto-delete after seconds)
db.sessions.createIndex({ created: 1 }, { expireAfterSeconds: 3600 });

// Partial
db.users.createIndex({ email: 1 }, { partialFilterExpression: { status: "active" } });

// Wildcard (for unpredictable fields)
db.products.createIndex({ "$**": 1 });

// List and drop
db.users.getIndexes();
db.users.dropIndex("email_1");
```

## Schema Validation

```js
db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "email"],
      properties: {
        name:  { bsonType: "string" },
        email: { bsonType: "string", pattern: "^.+@.+$" },
        age:   { bsonType: "int", minimum: 0 }
      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
});

// Add to existing collection
db.runCommand({
  collMod: "users",
  validator: { $jsonSchema: { /* ... */ } }
});
```

## Transactions

```js
const session = db.getMongo().startSession();
session.startTransaction();

try {
  const users = session.getDatabase("mydb").getCollection("users");
  const orders = session.getDatabase("mydb").getCollection("orders");

  users.updateOne({ _id: userId }, { $inc: { balance: -100 } }, { session });
  orders.insertOne({ user_id: userId, amount: 100 }, { session });

  session.commitTransaction();
} catch (e) {
  session.abortTransaction();
  throw e;
} finally {
  session.endSession();
}
```

## Change Streams

```js
const pipeline = [
  { $match: { operationType: { $in: ["insert", "update"] } } },
  { $project: { "fullDocument.name": 1, operationType: 1 } }
];

const stream = db.users.watch(pipeline);
for await (const change of stream) {
  console.log(change.operationType, change.fullDocument);
}
```

## See Also

- [MongoDB Documentation](https://www.mongodb.com/docs/)
- [MongoDB Aggregation Reference](https://www.mongodb.com/docs/manual/reference/operator/aggregation-pipeline/)
- [MongoDB Node.js Driver](https://www.mongodb.com/docs/drivers/node/current/)
- [Mongoose ODM](https://mongoosejs.com/)
