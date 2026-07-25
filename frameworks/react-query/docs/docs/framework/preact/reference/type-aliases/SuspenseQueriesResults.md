
## Introduction

```ts
type SuspenseQueriesResults<T, TResults, TDepth> = TDepth["length"] extends MAXIMUM_DEPTH ? UseSuspenseQueryResult[] : T extends [] ? [] : T extends [infer Head] ? [...TResults, GetUseSuspenseQueryResult] : T extends [infer Head, ...(infer Tails)] ? SuspenseQueriesResults<[...Tails], [...TResults, GetUseSuspenseQueryResult], [...TDepth, 1]> : { [K in keyof T]: GetUseSuspenseQueryResult<T[K]> };
```

Defined in: [preact-query/src/useSuspenseQueries.ts:146](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/useSuspenseQueries.ts#L146)

SuspenseQueriesResults reducer recursively maps type param to results

