
## Introduction

```ts
type CreateInfiniteQueryResult<TData, TError> = BaseQueryNarrowing<TData, TError> & MapToSignals<InfiniteQueryObserverResult<TData, TError>>;
```

Defined in: [types.ts:117](https://github.com/TanStack/query/blob/main/packages/angular-query-experimental/src/types.ts#L117)

