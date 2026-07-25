
## Introduction

```ts
function useSuspenseInfiniteQuery<TQueryFnData, TError, TData, TQueryKey, TPageParam>(options, queryClient?): UseSuspenseInfiniteQueryResult<TData, TError>;
```

Defined in: [preact-query/src/useSuspenseInfiniteQuery.ts:17](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/useSuspenseInfiniteQuery.ts#L17)


### TQueryFnData

`TQueryFnData`

### TError

`TError` = `Error`

### TData

`TData` = `InfiniteData`\<`TQueryFnData`, `unknown`\>

### TQueryKey

`TQueryKey` *extends* readonly `unknown`[] = readonly `unknown`[]

### TPageParam

`TPageParam` = `unknown`


### options

[`UseSuspenseInfiniteQueryOptions`](../interfaces/UseSuspenseInfiniteQueryOptions.md)\<`TQueryFnData`, `TError`, `TData`, `TQueryKey`, `TPageParam`\>

### queryClient?

`QueryClient`

