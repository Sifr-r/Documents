
## Introduction

```ts
function mutationOptions<TData, TError, TVariables, TOnMutateResult>(options): MutationObserverOptions<TData, TError, TVariables, TOnMutateResult>;
```

Defined in: [packages/lit-query/src/mutationOptions.ts:22](https://github.com/TanStack/query/blob/main/packages/lit-query/src/mutationOptions.ts#L22)

Preserves and types mutation options for reuse across Lit Query APIs.


### options

`MutationObserverOptions`\<`TData`, `TError`, `TVariables`, `TOnMutateResult`\>

Mutation options to preserve.



## Returns

`MutationObserverOptions`\<`TData`, `TError`, `TVariables`, `TOnMutateResult`\>

The same options object.



## Example

```ts
import { mutationOptions } from '@tanstack/lit-query'

const addTodoOptions = mutationOptions({
  mutationKey: ['add-todo'],
  mutationFn: (title: string) => addTodo(title),
})
```

