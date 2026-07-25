# React Query (TanStack Query) — Core Guide

## Overview

Powerful asynchronous state management and data fetching library for React applications.

## Key Patterns & Usage

### Basic Query (`useQuery`)
```typescript
import { useQuery, QueryClient, QueryClientProvider } from '@tanstack/react-query';

const queryClient = new QueryClient();

function UserProfile({ userId }) {
  const { data, isLoading, error } = useQuery({
    queryKey: ['user', userId],
    queryFn: () => fetch(`/api/users/${userId}`).then(res => res.json())
  });

  if (isLoading) return <div>Loading...</div>;
  return <div>{data.name}</div>;
}
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docs/eslint/eslint-plugin-query.md`](docs/docs/eslint/eslint-plugin-query.md)
- [`docs/eslint/exhaustive-deps.md`](docs/docs/eslint/exhaustive-deps.md)
- [`docs/eslint/infinite-query-property-order.md`](docs/docs/eslint/infinite-query-property-order.md)
- [`docs/eslint/mutation-property-order.md`](docs/docs/eslint/mutation-property-order.md)
- [`docs/eslint/no-rest-destructuring.md`](docs/docs/eslint/no-rest-destructuring.md)
- [`docs/eslint/no-unstable-deps.md`](docs/docs/eslint/no-unstable-deps.md)
- [`docs/eslint/no-void-query-fn.md`](docs/docs/eslint/no-void-query-fn.md)
- [`docs/eslint/prefer-query-options.md`](docs/docs/eslint/prefer-query-options.md)
- [`docs/eslint/stable-query-client.md`](docs/docs/eslint/stable-query-client.md)
- [`docs/framework/angular/angular-httpclient-and-other-data-fetching-clients.md`](docs/docs/framework/angular/angular-httpclient-and-other-data-fetching-clients.md)
- [`docs/framework/angular/devtools.md`](docs/docs/framework/angular/devtools.md)
- [`docs/framework/angular/guides/background-fetching-indicators.md`](docs/docs/framework/angular/guides/background-fetching-indicators.md)
- [`docs/framework/angular/guides/caching.md`](docs/docs/framework/angular/guides/caching.md)
- [`docs/framework/angular/guides/default-query-function.md`](docs/docs/framework/angular/guides/default-query-function.md)
- [`docs/framework/angular/guides/dependent-queries.md`](docs/docs/framework/angular/guides/dependent-queries.md)
- [`docs/framework/angular/guides/disabling-queries.md`](docs/docs/framework/angular/guides/disabling-queries.md)
- [`docs/framework/angular/guides/important-defaults.md`](docs/docs/framework/angular/guides/important-defaults.md)
- [`docs/framework/angular/guides/infinite-queries.md`](docs/docs/framework/angular/guides/infinite-queries.md)
- [`docs/framework/angular/guides/initial-query-data.md`](docs/docs/framework/angular/guides/initial-query-data.md)
- [`docs/framework/angular/guides/invalidations-from-mutations.md`](docs/docs/framework/angular/guides/invalidations-from-mutations.md)
- ... and 353 more files under `docs/`
