
## Introduction

```ts
type DefinedCreateQueryResult<TData, TError, TState> = BaseQueryNarrowing<TData, TError> & MapToSignals<OmitKeyof<TState, keyof BaseQueryNarrowing, "safely">>;
```

Defined in: [types.ts:110](https://github.com/TanStack/query/blob/main/packages/angular-query-experimental/src/types.ts#L110)


### TData

`TData` = `unknown`

### TError

`TError` = `DefaultError`

### TState

`TState` = `DefinedQueryObserverResult`\<`TData`, `TError`\>

