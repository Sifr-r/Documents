# Prisma — Core

## schema.prisma

```prisma
datasource db {
  provider = "postgresql"           // postgresql, mysql, sqlite, sqlserver, mongodb, cockroachdb
  url      = env("DATABASE_URL")
}

generator client {
  provider      = "prisma-client-js"
  output        = "./generated/client"  // optional custom output
  previewFeatures = ["driverAdapters"]  // optional preview features
}
```

## Model Definition

```prisma
model User {
  id        Int       @id @default(autoincrement())
  email     String    @unique
  name      String?                       // optional (nullable)
  age       Int       @default(0)
  role      Role      @default(USER)
  posts     Post[]
  profile   Profile?
  tags      String[]                      // array (PostgreSQL only)
  metadata  Json?
  active    Boolean   @default(true)
  createdAt DateTime  @default(now())
  updatedAt DateTime  @updatedAt

  @@index([email, name])                  // composite index
  @@unique([email, name])                 // composite unique
  @@map("app_users")                      // custom table name
}

model Profile {
  id     Int    @id @default(autoincrement())
  bio    String
  user   User   @relation(fields: [userId], references: [id], onDelete: Cascade)
  userId Int    @unique
}

model Post {
  id         Int      @id @default(autoincrement())
  title      String
  content    String?
  published  Boolean  @default(false)
  author     User     @relation(fields: [authorId], references: [id])
  authorId   Int
  categories Category[]
  createdAt  DateTime @default(now())

  @@index([authorId])
}

// Many-to-many
model Category {
  id    Int    @id @default(autoincrement())
  name  String @unique
  posts Post[]
}

enum Role {
  USER
  ADMIN
  MODERATOR
}
```

### Attributes

```prisma
@id                                    // primary key
@unique                                // unique constraint
@default(autoincrement())              // auto-increment
@default(now())                        // default timestamp
@default(uuid())                       // default UUID
@default(cuid())                       // default CUID
@updatedAt                             // auto-update on write
@relation(fields: [fk], references: [id]) // foreign key
@map("column_name")                    // map to different column
@db.Text                               // native database type
@db.VarChar(255)                       // native type with args

@@index([field1, field2])              // composite index
@@unique([field1, field2])             // composite unique
@@id([field1, field2])                 // composite primary key
@@map("table_name")                    // custom table name
@@ignore                               // skip this model
```

## Prisma Client

### Setup

```ts
import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient({
  log: ["query", "info", "warn", "error"],
});
```

### findUnique

```ts
const user = await prisma.user.findUnique({ where: { id: 1 } });
const user = await prisma.user.findUnique({ where: { email: "a@b.com" } });
```

### findMany

```ts
const users = await prisma.user.findMany();
const users = await prisma.user.findMany({ take: 10, skip: 20 });
const users = await prisma.user.findMany({ orderBy: { createdAt: "desc" } });
```

### create

```ts
const user = await prisma.user.create({
  data: { email: "a@b.com", name: "Alice", posts: { create: { title: "Hello" } } }
});
```

### update

```ts
const user = await prisma.user.update({ where: { id: 1 }, data: { name: "Alicia" } });
```

### upsert

```ts
const user = await prisma.user.upsert({
  where: { email: "a@b.com" },
  update: { name: "Alice Updated" },
  create: { email: "a@b.com", name: "Alice" }
});
```

### delete / deleteMany

```ts
await prisma.user.delete({ where: { id: 1 } });
await prisma.user.deleteMany({ where: { active: false } });
```

### count / aggregate

```ts
const count = await prisma.user.count({ where: { active: true } });
const result = await prisma.user.aggregate({
  _count: true, _avg: { age: true }, _min: { age: true }, _max: { age: true }
});
```

## Filtering

```ts
where: { name: "Alice" }
where: { name: { contains: "ali", mode: "insensitive" } }
where: { name: { startsWith: "A" } }
where: { name: { endsWith: "ce" } }
where: { age: { gt: 18, lt: 65 } }        // gt, gte, lt, lte
where: { role: { in: ["ADMIN", "USER"] } }
where: { role: { notIn: ["BANNED"] } }
where: { email: { equals: "a@b.com" } }
where: { name: { not: null } }

// Logical
where: { AND: [{ active: true }, { age: { gte: 18 } }] }
where: { OR:  [{ role: "ADMIN" }, { role: "MODERATOR" }] }
where: { NOT: { status: "banned" } }
```

## Relations

### include / select

```ts
// Include related
await prisma.user.findMany({ include: { posts: true, profile: true } });

// Include with filters
await prisma.user.findMany({
  include: { posts: { where: { published: true }, orderBy: { createdAt: "desc" }, take: 5 } }
});

// Select specific fields
await prisma.user.findMany({
  select: { id: true, name: true, posts: { select: { title: true } } }
});
```

### Nested writes

```ts
// Create with related records
await prisma.user.create({
  data: {
    email: "a@b.com",
    posts: { create: [{ title: "Post 1" }, { title: "Post 2" }] },
    profile: { create: { bio: "Hello" } }
  }
});

// Connect existing
await prisma.post.create({
  data: { title: "New", author: { connect: { id: 1 } } }
});

// Disconnect
await prisma.user.update({
  where: { id: 1 },
  data: { posts: { disconnect: { id: 5 } } }
});
```

## Migrations

```bash
# Development: create and apply migration
npx prisma migrate dev --name add_user_table

# Apply migrations in production
npx prisma migrate deploy

# Push schema to DB without migration (prototyping)
npx prisma db push

# Reset database
npx prisma migrate reset

# Generate client after schema change
npx prisma generate

# View schema visually
npx prisma studio
```

## Transactions

```ts
// Interactive transaction
const [user, post] = await prisma.$transaction(async (tx) => {
  const user = await tx.user.create({ data: { email: "a@b.com", name: "Alice" } });
  const post = await tx.post.create({ data: { title: "Hello", authorId: user.id } });
  return [user, post];
});

// Batch transaction
await prisma.$transaction([
  prisma.user.update({ where: { id: 1 }, data: { name: "Updated" } }),
  prisma.post.delete({ where: { id: 5 } }),
]);
```

## Raw Queries

```ts
// Raw query (SELECT)
const users = await prisma.$queryRaw`SELECT * FROM users WHERE active = true`;

// Raw execute (INSERT, UPDATE, DELETE)
const result = await prisma.$executeRaw`UPDATE users SET active = false WHERE id = ${1}`;

// Unsafe (string interpolation — use carefully)
const users = await prisma.$queryRawUnsafe("SELECT * FROM users WHERE age > $1", 18);
```

## Middleware

```ts
prisma.$use(async (params, next) => {
  // Before query
  console.log(`Query: ${params.model}.${params.action}`);
  const start = Date.now();

  const result = await next(params);

  // After query
  console.log(`Took ${Date.now() - start}ms`);
  return result;
});

// Example: soft delete middleware
prisma.$use(async (params, next) => {
  if (params.action === "delete") {
    params.action = "update";
    params.args.data = { deleted: true };
  }
  return next(params);
});
```

## Performance

```ts
// Connection pooling (built-in via Prisma Accelerate or external like PgBouncer)
const prisma = new PrismaClient({
  datasources: { db: { url: "postgresql://user:pass@pooler:6543/db?pgbouncer=true" } }
});

// Select only needed fields
await prisma.user.findMany({ select: { id: true, name: true } });

// Avoid N+1: use include
await prisma.user.findMany({ include: { posts: true } });

// Batch operations
await prisma.user.createMany({ data: [{ email: "a@b.com" }, { email: "c@d.com" }] });
```

## See Also

- [Prisma Documentation](https://www.prisma.io/docs)
- [Prisma Schema Reference](https://www.prisma.io/docs/orm/reference/prisma-schema-reference)
- [Prisma Client API Reference](https://www.prisma.io/docs/orm/reference/prisma-client-reference)
- [Prisma GitHub](https://github.com/prisma/prisma)
