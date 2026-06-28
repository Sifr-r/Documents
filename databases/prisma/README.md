# Prisma

Prisma is a next-generation TypeScript ORM for Node.js with a declarative schema, type-safe queries, automatic migrations, and built-in connection pooling.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Schema definition, model attributes, Prisma Client queries, filtering, relations, migrations, transactions, raw queries, middleware, and performance |

## Quick Reference

### schema.prisma

```prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id        Int      @id @default(autoincrement())
  email     String   @unique
  name      String?
  posts     Post[]
  createdAt DateTime @default(now())
}

model Post {
  id       Int    @id @default(autoincrement())
  title    String
  author   User   @relation(fields: [authorId], references: [id])
  authorId Int
}
```

### Queries

```ts
const users = await prisma.user.findMany({ where: { email: { contains: "@example.com" } } });
const user = await prisma.user.findUnique({ where: { id: 1 } });
const created = await prisma.user.create({ data: { email: "a@b.com", name: "Alice" } });
const updated = await prisma.user.update({ where: { id: 1 }, data: { name: "Alicia" } });
await prisma.user.delete({ where: { id: 1 } });
```

### Relations

```ts
const userWithPosts = await prisma.user.findUnique({
  where: { id: 1 },
  include: { posts: true }
});
```

### Migrations

```bash
npx prisma migrate dev --name init
npx prisma db push
npx prisma generate
```

## See Also

- [Prisma Documentation](https://www.prisma.io/docs)
- [Prisma GitHub](https://github.com/prisma/prisma)
- [Prisma Examples](https://github.com/prisma/prisma-examples)
