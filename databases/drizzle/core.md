# Drizzle ORM — Core

## Schema Definition

### PostgreSQL

```ts
import { pgTable, serial, text, integer, boolean, timestamp, jsonb, uuid, pgEnum } from "drizzle-orm/pg-core";

export const roleEnum = pgEnum("role", ["user", "admin", "moderator"]);

export const users = pgTable("users", {
  id:        serial("id").primaryKey(),
  uuid:      uuid("uuid").defaultRandom().notNull(),
  name:      text("name").notNull(),
  email:     text("email").notNull().unique(),
  age:       integer("age"),
  active:    boolean("active").default(true),
  role:      roleEnum("role").default("user"),
  metadata:  jsonb("metadata").$type<Record<string, unknown>>(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});
```

### MySQL

```ts
import { mysqlTable, int, varchar, text, boolean, timestamp, mysqlEnum } from "drizzle-orm/mysql-core";

export const users = mysqlTable("users", {
  id:        int("id").primaryKey().autoincrement(),
  name:      varchar("name", { length: 100 }).notNull(),
  email:     varchar("email", { length: 255 }).notNull().unique(),
  bio:       text("bio"),
  status:    mysqlEnum("status", ["active", "inactive"]).default("active"),
  createdAt: timestamp("created_at").defaultNow(),
});
```

### SQLite

```ts
import { sqliteTable, integer, text, real, blob } from "drizzle-orm/sqlite-core";

export const users = sqliteTable("users", {
  id:        integer("id").primaryKey({ autoIncrement: true }),
  name:      text("name").notNull(),
  email:     text("email").notNull().unique(),
  score:     real("score").default(0),
  avatar:    blob("avatar", { mode: "buffer" }),
});
```

## Column Types

```ts
// Common across dialects
serial("id").primaryKey()             // auto-increment integer
integer("age")                        // integer
text("name")                          // text / varchar
boolean("active").default(true)       // boolean
timestamp("created_at").defaultNow()  // timestamp
jsonb("data").$type<MyType>()         // JSONB (pg) with type

// PostgreSQL-specific
uuid("id").defaultRandom()            // UUID
text("tags").array()                  // TEXT[]
real("price")                         // REAL
numeric("amount", { precision: 10, scale: 2 })
interval("duration")

// Modifiers
.notNull()                            // NOT NULL
.unique()                             // UNIQUE
.default(value)                       // DEFAULT
.references(() => otherTable.id)      // FOREIGN KEY
.primaryKey()                         // PRIMARY KEY
```

## Relations

```ts
import { relations } from "drizzle-orm";

export const usersRelations = relations(users, ({ many, one }) => ({
  posts:   many(posts),
  profile: one(profiles),
}));

export const postsRelations = relations(posts, ({ one }) => ({
  author: one(users, { fields: [posts.authorId], references: [users.id] }),
}));

export const profilesRelations = relations(profiles, ({ one }) => ({
  user: one(users, { fields: [profiles.userId], references: [users.id] }),
}));
```

## Queries

### Select

```ts
import { eq, and, or, gt, lt, like, inArray, desc, asc, sql } from "drizzle-orm";

// All rows
const allUsers = await db.select().from(users);

// Specific columns
const names = await db.select({ name: users.name, email: users.email }).from(users);

// With where
const active = await db.select().from(users).where(eq(users.active, true));

// Multiple conditions
const filtered = await db.select().from(users).where(
  and(gt(users.age, 18), eq(users.active, true))
);

// Order, limit, offset
const page = await db.select().from(users)
  .orderBy(desc(users.createdAt), asc(users.name))
  .limit(10).offset(20);
```

### Insert

```ts
// Single
await db.insert(users).values({ name: "Alice", email: "a@b.com" });

// Multiple
await db.insert(users).values([
  { name: "Alice", email: "a@b.com" },
  { name: "Bob",   email: "b@b.com" },
]);

// Returning
const [user] = await db.insert(users).values({ name: "Alice", email: "a@b.com" }).returning();

// On conflict (upsert)
await db.insert(users).values({ name: "Alice", email: "a@b.com" })
  .onConflictDoUpdate({ target: users.email, set: { name: "Alice Updated" } });
```

### Update

```ts
await db.update(users).set({ name: "Alicia" }).where(eq(users.id, 1));
await db.update(users).set({ active: false }).where(lt(users.lastLogin, new Date("2024-01-01")));

// Returning
const [updated] = await db.update(users).set({ name: "Alicia" }).where(eq(users.id, 1)).returning();
```

### Delete

```ts
await db.delete(users).where(eq(users.id, 1));
await db.delete(users).where(eq(users.active, false));

// Returning
const [deleted] = await db.delete(users).where(eq(users.id, 1)).returning();
```

## Operators

```ts
import { eq, ne, gt, gte, lt, lte, and, or, not, like, ilike, inArray, between, isNull, isNotNull, sql } from "drizzle-orm";

eq(users.name, "Alice")                  // =
ne(users.name, "Alice")                  // !=
gt(users.age, 18)                        // >
gte(users.age, 18)                       // >=
lt(users.age, 65)                        // <
lte(users.age, 65)                       // <=
like(users.name, "%ali%")                // LIKE
ilike(users.name, "%ali%")               // ILIKE (pg)
inArray(users.role, ["admin", "user"])   // IN
between(users.age, 18, 65)               // BETWEEN
isNull(users.deletedAt)                  // IS NULL
isNotNull(users.email)                   // IS NOT NULL
not(eq(users.active, true))              // NOT
and(gt(users.age, 18), eq(users.active, true))  // AND
or(eq(users.role, "admin"), eq(users.role, "mod")) // OR

// Raw SQL expression
sql`${users.age} + 1`
sql`lower(${users.name})`
```

## Joins

```ts
import { eq } from "drizzle-orm";

// Inner join
const result = await db.select()
  .from(users)
  .innerJoin(posts, eq(posts.authorId, users.id));

// Left join
const result = await db.select()
  .from(users)
  .leftJoin(posts, eq(posts.authorId, users.id));

// Select specific columns from join
const result = await db.select({
  userName: users.name,
  postTitle: posts.title,
}).from(users).innerJoin(posts, eq(posts.authorId, users.id));

// Using relational queries
import { drizzle } from "drizzle-orm/node-postgres";
const db = drizzle(pool, { schema: { users, usersRelations } });

const userWithPosts = await db.query.users.findFirst({
  where: eq(users.id, 1),
  with: { posts: { where: eq(posts.published, true) } }
});
```

## Migrations

```bash
# Generate migration SQL from schema changes
npx drizzle-kit generate --name add_users_table

# Push schema directly to database (dev)
npx drizzle-kit push

# Run generated migrations
npx drizzle-kit migrate

# Open visual schema editor
npx drizzle-kit studio
```

```ts
// drizzle.config.ts
import { defineConfig } from "drizzle-kit";
export default defineConfig({
  schema: "./src/schema.ts",
  out:    "./drizzle",
  dialect: "postgresql",
  dbCredentials: { url: process.env.DATABASE_URL! },
});
```

## Transactions

```ts
// Callback-style
await db.transaction(async (tx) => {
  await tx.update(users).set({ balance: sql`balance - 100` }).where(eq(users.id, 1));
  await tx.update(users).set({ balance: sql`balance + 100` }).where(eq(users.id, 2));
});

// Nested savepoints
await db.transaction(async (tx) => {
  await tx.insert(users).values({ name: "Alice", email: "a@b.com" });
  await tx.transaction(async (tx2) => {
    await tx2.insert(posts).values({ title: "Hello", authorId: 1 });
  });
});
```

## Raw SQL

```ts
import { sql } from "drizzle-orm";

// Typed query
const result = await db.execute(sql`SELECT * FROM users WHERE age > ${18}`);

// With mapping
const users = await db.all<typeof users.$inferSelect>(
  sql`SELECT * FROM users WHERE active = true ORDER BY created_at DESC`
);

// Insert with raw SQL
await db.insert(users).values({
  name: "Alice",
  createdAt: sql`now()`,
});

// Fragments in queries
await db.select().from(users).where(sql`${users.age} > ${18} AND lower(${users.name}) = 'alice'`);
```

## Performance

```ts
// Prepared statements (pg)
const stmt = db.select().from(users).where(eq(users.id, sql.placeholder("id"))).prepare("get_user");
const user = await stmt.execute({ id: 1 });

// Batch inserts
await db.insert(users).values([
  { name: "Alice", email: "a@b.com" },
  { name: "Bob",   email: "b@b.com" },
  // ... thousands more
]);

// Select only needed columns
await db.select({ id: users.id, name: users.name }).from(users);

// Use indexes via schema
export const emailIdx = pgIndex("email_idx").on(users.email);
```

## See Also

- [Drizzle ORM Documentation](https://orm.drizzle.team/docs/overview)
- [Drizzle ORM GitHub](https://github.com/drizzle-team/drizzle-orm)
- [Drizzle Kit Documentation](https://orm.drizzle.team/kit-docs/overview)
- [Drizzle Examples](https://github.com/drizzle-team/drizzle-orm/tree/main/examples)
