
## Introduction

```ts
type DefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = Omit<QueryObserverOptions<TQueryFnData, TError, TData, TQueryFnData, TQueryKey>, "queryFn"> & object;
```

Defined in: [packages/lit-query/src/queryOptions.ts:16](https://github.com/TanStack/query/blob/main/packages/lit-query/src/queryOptions.ts#L16)

Query options with `initialData` that guarantees defined query data.


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

