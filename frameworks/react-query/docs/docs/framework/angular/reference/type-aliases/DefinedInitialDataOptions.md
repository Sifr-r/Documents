
## Introduction

```ts
type DefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = Omit<CreateQueryOptions<TQueryFnData, TError, TData, TQueryKey>, "queryFn"> & object;
```

Defined in: [query-options.ts:40](https://github.com/TanStack/query/blob/main/packages/angular-query-experimental/src/query-options.ts#L40)


### initialData

```ts
initialData: 
  | NonUndefinedGuard
| () => NonUndefinedGuard;
```

### queryFn?

```ts
optional queryFn: QueryFunction<TQueryFnData, TQueryKey>;
```

