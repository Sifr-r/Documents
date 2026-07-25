
## Introduction

```ts
type UndefinedInitialDataOptions<TQueryFnData, TError, TData, TQueryKey> = QueryObserverOptions<TQueryFnData, TError, TData, TQueryFnData, TQueryKey> & object;
```

Defined in: [packages/lit-query/src/queryOptions.ts:58](https://github.com/TanStack/query/blob/main/packages/lit-query/src/queryOptions.ts#L58)

Query options where `initialData` can be omitted or undefined.


### initialData?

```ts
optional initialData:
  | InitialDataFunction<NonUndefinedGuard>
| NonUndefinedGuard;
```

