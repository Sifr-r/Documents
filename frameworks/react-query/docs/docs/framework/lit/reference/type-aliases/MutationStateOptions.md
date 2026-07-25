### filters?

```ts
optional filters: Accessor;
```

Defined in: [packages/lit-query/src/useMutationState.ts:21](https://github.com/TanStack/query/blob/main/packages/lit-query/src/useMutationState.ts#L21)

Filters used to select mutations from the mutation cache.

***

### select()?

```ts
optional select: (mutation) => TResult;
```

Defined in: [packages/lit-query/src/useMutationState.ts:23](https://github.com/TanStack/query/blob/main/packages/lit-query/src/useMutationState.ts#L23)

Maps each matching mutation to the value returned by the accessor.

#### Parameters

##### mutation

`Mutation`

#### Returns

`TResult`

