
## Introduction

```ts
type UnusedSkipTokenInfiniteOptions<TQueryFnData, TError, TData, TQueryKey, TPageParam> = OmitKeyof<UseInfiniteQueryOptions<TQueryFnData, TError, TData, TQueryKey, TPageParam>, "queryFn"> & object;
```

Defined in: [preact-query/src/infiniteQueryOptions.ts:34](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/infiniteQueryOptions.ts#L34)


### queryFn?

```ts
optional queryFn: Exclude<UseInfiniteQueryOptions<TQueryFnData, TError, TData, TQueryKey, TPageParam>["queryFn"], SkipToken | undefined>;
```

