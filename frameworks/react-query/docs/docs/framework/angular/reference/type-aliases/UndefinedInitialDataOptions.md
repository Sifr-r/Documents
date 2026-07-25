
## Introduction

```ts
type UndefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = CreateQueryOptions<TQueryFnData, TError, TData, TQueryKey> & object;
```

Defined in: [query-options.ts:13](https://github.com/TanStack/query/blob/main/packages/angular-query-experimental/src/query-options.ts#L13)


### initialData?

```ts
optional initialData: 
  | InitialDataFunction<NonUndefinedGuard>
| NonUndefinedGuard;
```

