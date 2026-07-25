# NextAuth.js (Auth.js) — Core Guide

## Overview

Complete open-source authentication solution for Next.js and Auth.js applications.

## Key Patterns & Usage

### Next.js App Router Auth Setup (`auth.ts`)
```typescript
import NextAuth from "next-auth";
import GitHub from "next-auth/providers/github";

export const { handlers, auth, signIn, signOut } = NextAuth({
  providers: [GitHub],
});
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docs/README.md`](docs/docs/README.md)
- [`docs/pages/404.mdx`](docs/docs/pages/404.mdx)
- [`docs/pages/concepts/database-models.mdx`](docs/docs/pages/concepts/database-models.mdx)
- [`docs/pages/concepts/index.mdx`](docs/docs/pages/concepts/index.mdx)
- [`docs/pages/concepts/oauth.mdx`](docs/docs/pages/concepts/oauth.mdx)
- [`docs/pages/concepts/session-strategies.mdx`](docs/docs/pages/concepts/session-strategies.mdx)
- [`docs/pages/contributors.mdx`](docs/docs/pages/contributors.mdx)
- [`docs/pages/getting-started/adapters/azure-tables.mdx`](docs/docs/pages/getting-started/adapters/azure-tables.mdx)
- [`docs/pages/getting-started/adapters/d1.mdx`](docs/docs/pages/getting-started/adapters/d1.mdx)
- [`docs/pages/getting-started/adapters/dgraph.mdx`](docs/docs/pages/getting-started/adapters/dgraph.mdx)
- [`docs/pages/getting-started/adapters/drizzle.mdx`](docs/docs/pages/getting-started/adapters/drizzle.mdx)
- [`docs/pages/getting-started/adapters/dynamodb.mdx`](docs/docs/pages/getting-started/adapters/dynamodb.mdx)
- [`docs/pages/getting-started/adapters/edgedb.mdx`](docs/docs/pages/getting-started/adapters/edgedb.mdx)
- [`docs/pages/getting-started/adapters/fauna.mdx`](docs/docs/pages/getting-started/adapters/fauna.mdx)
- [`docs/pages/getting-started/adapters/firebase.mdx`](docs/docs/pages/getting-started/adapters/firebase.mdx)
- [`docs/pages/getting-started/adapters/hasura.mdx`](docs/docs/pages/getting-started/adapters/hasura.mdx)
- [`docs/pages/getting-started/adapters/kysely.mdx`](docs/docs/pages/getting-started/adapters/kysely.mdx)
- [`docs/pages/getting-started/adapters/mikro-orm.mdx`](docs/docs/pages/getting-started/adapters/mikro-orm.mdx)
- [`docs/pages/getting-started/adapters/mongodb.mdx`](docs/docs/pages/getting-started/adapters/mongodb.mdx)
- [`docs/pages/getting-started/adapters/neo4j.mdx`](docs/docs/pages/getting-started/adapters/neo4j.mdx)
- ... and 143 more files under `docs/`
