
## Introduction

```ts
type UnusedSkipTokenOptions<TQueryFnData, TError, TData, TQueryKey> = OmitKeyof<QueryObserverOptions<TQueryFnData, TError, TData, TQueryFnData, TQueryKey>, "queryFn"> & object;
```

Defined in: [packages/lit-query/src/queryOptions.ts:34](https://github.com/TanStack/query/blob/main/packages/lit-query/src/queryOptions.ts#L34)

Query options where `queryFn` is present and not a `skipToken`.


### queryFn?

```ts
optional queryFn: Exclude<QueryObserverOptions<TQueryFnData, TError, TData, TQueryFnData, TQueryKey>["queryFn"], SkipToken | undefined>;
```

