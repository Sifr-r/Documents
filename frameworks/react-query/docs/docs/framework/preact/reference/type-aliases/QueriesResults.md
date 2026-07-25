
## Introduction

```ts
type QueriesResults<T, TResults, TDepth> = TDepth["length"] extends MAXIMUM_DEPTH ? UseQueryResult[] : T extends [] ? [] : T extends [infer Head] ? [...TResults, GetUseQueryResult] : T extends [infer Head, ...(infer Tails)] ? QueriesResults<[...Tails], [...TResults, GetUseQueryResult], [...TDepth, 1]> : { [K in keyof T]: GetUseQueryResult<T[K]> };
```

Defined in: [preact-query/src/useQueries.ts:189](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/useQueries.ts#L189)

QueriesResults reducer recursively maps type param to results

