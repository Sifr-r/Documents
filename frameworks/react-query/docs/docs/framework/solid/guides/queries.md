
## Introduction

[//]: # 'SubscribeDescription'

To subscribe to a query in your components, call the `useQuery` function with at least:
[//]: # 'SubscribeDescription'

[//]: # 'Example'

```tsx
import { useQuery } from '@tanstack/solid-query'

function App() {
  const todosQuery = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodoList,
  }))
}
```

[//]: # 'Example'
[//]: # 'Example2'

```tsx
const todosQuery = useQuery(() => ({
  queryKey: ['todos'],
  queryFn: fetchTodoList,
}))
```

[//]: # 'Example2'
[//]: # 'Example3'

```tsx
import { Switch, Match, For } from 'solid-js'

function Todos() {
  const todosQuery = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodoList,
  }))

  return (
    
      <Match when={todosQuery.isPending}>
        <span>Loading...</span>
      
      <Match when={todosQuery.isError}>
        <span>Error: {todosQuery.error.message}</span>
      
      <Match when={todosQuery.isSuccess}>
        <ul>
          <For each={todosQuery.data}>{(todo) => <li>{todo.title}</li>}
        </ul>
      
    
  )
}
```

[//]: # 'Example3'
[//]: # 'Example4'

```tsx
import { Switch, Match, For } from 'solid-js'

function Todos() {
  const todosQuery = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodoList,
  }))

  return (
    
      <Match when={todosQuery.status === 'pending'}>
        <span>Loading...</span>
      
      <Match when={todosQuery.status === 'error'}>
        <span>Error: {todosQuery.error.message}</span>
      
      <Match when={todosQuery.status === 'success'}>
        <ul>
          <For each={todosQuery.data}>{(todo) => <li>{todo.title}</li>}
        </ul>
      
    
  )
}
```

[//]: # 'Example4'
[//]: # 'Materials'
[//]: # 'Materials'

