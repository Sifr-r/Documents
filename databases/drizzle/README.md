# Drizzle ORM

Drizzle ORM is a lightweight, TypeScript-first ORM for Node.js that provides type-safe SQL schema definitions, queries, and migrations with minimal abstraction over raw SQL.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Schema definition, column types, relations, queries, operators, joins, migrations, transactions, raw SQL, and performance |

## Quick Reference

### Schema Definition

```ts
import { pgTable, serial, text, boolean, timestamp } from "drizzle-orm/pg-core";

export const users = pgTable("users", {
  id:        serial("id").primaryKey(),
  name:      text("name").notNull(),
  email:     text("email").notNull().unique(),
  active:    boolean("active").default(true),
  createdAt: timestamp("created_at").defaultNow(),
});
```

### Queries

```ts
import { eq } from "drizzle-orm";

const allUsers = await db.select().from(users);
const user = await db.select().from(users).where(eq(users.id, 1));
await db.insert(users).values({ name: "Alice", email: "a@b.com" });
await db.update(users).set({ name: "Alicia" }).where(eq(users.id, 1));
await db.delete(users).where(eq(users.id, 1));
```

### Relations

```ts
import { relations } from "drizzle-orm";

export const usersRelations = relations(users, ({ many }) => ({
  posts: many(posts),
}));
```

### Migrations

```bash
npx drizzle-kit generate
npx drizzle-kit push
npx drizzle-kit migrate
```

## See Also

- [Drizzle ORM Documentation](https://orm.drizzle.team/docs/overview)
- [Drizzle ORM GitHub](https://github.com/drizzle-team/drizzle-orm)
- [Drizzle Kit](https://orm.drizzle.team/kit-docs/overview)
