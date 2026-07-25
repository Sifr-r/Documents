
## Introduction

```ts
type CreateBaseMutationResult<TData, TError, TVariables, TOnMutateResult> = Override<MutationObserverResult<TData, TError, TVariables, TOnMutateResult>, {
  mutate: CreateMutateFunction<TData, TError, TVariables, TOnMutateResult>;
}> & object;
```

Defined in: [packages/svelte-query/src/types.ts:114](https://github.com/TanStack/query/blob/main/packages/svelte-query/src/types.ts#L114)

