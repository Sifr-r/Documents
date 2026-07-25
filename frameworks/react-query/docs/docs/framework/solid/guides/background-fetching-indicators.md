
## Introduction

[//]: # 'Example'

```tsx
import { Switch, Match, Show, For } from 'solid-js'

function Todos() {
  const todosQuery = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodos,
  }))

  return (
    
      <Match when={todosQuery.isPending}>
        <span>Loading...</span>
      
      <Match when={todosQuery.isError}>
        <span>Error: {todosQuery.error.message}</span>
      
      <Match when={todosQuery.isSuccess}>
        <Show when={todosQuery.isFetching}>
          <div>Refreshing...</div>
        
        <div>
          <For each={todosQuery.data}>{(todo) => <Todo todo={todo} />}
        </div>
      
    
  )
}
```

[//]: # 'Example'
[//]: # 'Example2'

```tsx
import { useIsFetching } from '@tanstack/solid-query'

function GlobalLoadingIndicator() {
  const isFetching = useIsFetching()

  return (
    <Show when={isFetching()}>
      <div>Queries are fetching in the background...</div>
    
  )
}
```

[//]: # 'Example2'

