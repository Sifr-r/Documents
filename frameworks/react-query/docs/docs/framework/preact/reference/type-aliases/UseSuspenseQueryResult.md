
## Introduction

```ts
type UseSuspenseQueryResult<TData, TError> = DistributiveOmit<DefinedQueryObserverResult<TData, TError>, "isPlaceholderData" | "promise">;
```

Defined in: [preact-query/src/types.ts:160](https://github.com/theVedanta/query/blob/main/packages/preact-query/src/types.ts#L160)

