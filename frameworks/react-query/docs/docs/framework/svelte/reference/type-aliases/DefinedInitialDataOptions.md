
## Introduction

```ts
type DefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = CreateQueryOptions<TQueryFnData, TError, TData, TQueryKey> & object;
```

Defined in: [packages/svelte-query/src/queryOptions.ts:19](https://github.com/TanStack/query/blob/main/packages/svelte-query/src/queryOptions.ts#L19)


### initialData

```ts
initialData: 
  | NonUndefinedGuard
| () => NonUndefinedGuard;
```

