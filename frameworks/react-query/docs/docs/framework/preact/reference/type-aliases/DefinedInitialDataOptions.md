
## Introduction

```ts
type DefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = Omit<UseQueryOptions<TQueryFnData, TError, TData, TQueryKey>, "queryFn"> & object;
```

Defined in: [preact-query/src/queryOptions.ts:40](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/queryOptions.ts#L40)

