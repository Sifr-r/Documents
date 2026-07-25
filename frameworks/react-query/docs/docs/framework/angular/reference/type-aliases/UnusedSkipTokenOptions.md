
## Introduction

```ts
type UnusedSkipTokenOptions<TQueryFnData, TError, TData, TQueryKey> = OmitKeyof<CreateQueryOptions<TQueryFnData, TError, TData, TQueryKey>, "queryFn"> & object;
```

Defined in: [query-options.ts:25](https://github.com/TanStack/query/blob/main/packages/angular-query-experimental/src/query-options.ts#L25)


### queryFn?

```ts
optional queryFn: Exclude<CreateQueryOptions<TQueryFnData, TError, TData, TQueryKey>["queryFn"], SkipToken | undefined>;
```

