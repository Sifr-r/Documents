# tRPC — Core Guide

## Overview

End-to-end type-safe API framework for TypeScript applications without code generation.

## Key Patterns & Usage

### Router Definition (`server.ts`)
```typescript
import { initTRPC } from '@trpc/server';
import { z } from 'zod';

const t = initTRPC.create();

export const appRouter = t.router({
  getUser: t.procedure
    .input(z.object({ id: z.string() }))
    .query(async ({ input }) => {
      return { id: input.id, name: 'Alice' };
    }),
});

export type AppRouter = typeof appRouter;
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`www/docs/client/cors.md`](docs/www/docs/client/cors.md)
- [`www/docs/client/headers.md`](docs/www/docs/client/headers.md)
- [`www/docs/client/links/httpBatchLink.md`](docs/www/docs/client/links/httpBatchLink.md)
- [`www/docs/client/links/httpBatchStreamLink.md`](docs/www/docs/client/links/httpBatchStreamLink.md)
- [`www/docs/client/links/httpLink.md`](docs/www/docs/client/links/httpLink.md)
- [`www/docs/client/links/httpSubscriptionLink.md`](docs/www/docs/client/links/httpSubscriptionLink.md)
- [`www/docs/client/links/localLink.mdx`](docs/www/docs/client/links/localLink.mdx)
- [`www/docs/client/links/loggerLink.md`](docs/www/docs/client/links/loggerLink.md)
- [`www/docs/client/links/overview.md`](docs/www/docs/client/links/overview.md)
- [`www/docs/client/links/retryLink.md`](docs/www/docs/client/links/retryLink.md)
- [`www/docs/client/links/splitLink.mdx`](docs/www/docs/client/links/splitLink.mdx)
- [`www/docs/client/links/wsLink.md`](docs/www/docs/client/links/wsLink.md)
- [`www/docs/client/nextjs/app-router/server-actions.mdx`](docs/www/docs/client/nextjs/app-router/server-actions.mdx)
- [`www/docs/client/nextjs/app-router/setup.mdx`](docs/www/docs/client/nextjs/app-router/setup.mdx)
- [`www/docs/client/nextjs/overview.mdx`](docs/www/docs/client/nextjs/overview.mdx)
- [`www/docs/client/nextjs/pages-router/aborting-procedures.md`](docs/www/docs/client/nextjs/pages-router/aborting-procedures.md)
- [`www/docs/client/nextjs/pages-router/server-side-helpers.md`](docs/www/docs/client/nextjs/pages-router/server-side-helpers.md)
- [`www/docs/client/nextjs/pages-router/setup.mdx`](docs/www/docs/client/nextjs/pages-router/setup.mdx)
- [`www/docs/client/nextjs/pages-router/ssg.md`](docs/www/docs/client/nextjs/pages-router/ssg.md)
- [`www/docs/client/nextjs/pages-router/ssr.md`](docs/www/docs/client/nextjs/pages-router/ssr.md)
- ... and 67 more files under `docs/`
