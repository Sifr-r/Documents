
## Introduction

The `@tanstack/solid-query` package provides a 1st-class API for using TanStack Query with SolidJS.



## Example

```tsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from '@tanstack/solid-query'
import { Switch, Match, For } from 'solid-js'

const queryClient = new QueryClient()

function Example() {
  const query = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodos,
  }))

  return (
    <div>
      
        <Match when={query.isPending}>
          <p>Loading...</p>
        
        <Match when={query.isError}>
          <p>Error: {query.error.message}</p>
        
        <Match when={query.isSuccess}>
          <For each={query.data}>{(todo) => <p>{todo.title}</p>}
        
      
    </div>
  )
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      
    
  )
}
```



## Important Differences between Solid Query & React Query

Solid Query offers an API similar to React Query, but there are some key differences to be mindful of.

- Arguments to `solid-query` primitives (like `useQuery`, `useMutation`, `useIsFetching`) are functions, so that they can be tracked in a reactive scope.

```tsx
// ❌ react version
useQuery({
  queryKey: ['todos', todo],
  queryFn: fetchTodos,
})

// ✅ solid version
useQuery(() => ({
  queryKey: ['todos', todo],
  queryFn: fetchTodos,
}))
```

- Suspense works for queries out of the box if you access the query data inside a `` boundary.

```tsx
import { For, Suspense } from 'solid-js'

function Example() {
  const query = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodos,
  }))
  return (
    <div>
      {/* ✅ Will trigger loading fallback, data accessed in a suspense boundary. */}
      <Suspense fallback={'Loading...'}>
        <For each={query.data}>{(todo) => <div>{todo.title}</div>}
      
      {/* ❌ Will not trigger loading fallback, data not accessed in a suspense boundary. */}
      <For each={query.data}>{(todo) => <div>{todo.title}</div>}
    </div>
  )
}
```

- Solid Query primitives do not support destructuring. The return value from these functions is a store, and their properties are only tracked in a reactive context.

```tsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from '@tanstack/solid-query'
import { Match, Switch } from 'solid-js'

const queryClient = new QueryClient()

export default function App() {
  return (
    <QueryClientProvider client={queryClient}>
      
    
  )
}

function Example() {
  // ❌ react version -- supports destructing outside reactive context
  // const { isPending, error, data } = useQuery({
  //   queryKey: ['repoData'],
  //   queryFn: () =>
  //     fetch('https://api.github.com/repos/tannerlinsley/react-query').then(
  //       (res) => res.json()
  //     ),
  // })

  // ✅ solid version -- does not support destructuring outside reactive context
  const query = useQuery(() => ({
    queryKey: ['repoData'],
    queryFn: () =>
      fetch('https://api.github.com/repos/tannerlinsley/react-query').then(
        (res) => res.json(),
      ),
  }))

  // ✅ access query properties in JSX reactive context
  return (
    
      <Match when={query.isPending}>Loading...
      <Match when={query.isError}>Error: {query.error.message}
      <Match when={query.isSuccess}>
        <div>
          <h1>{query.data.name}</h1>
          <p>{query.data.description}</p>
          <strong>👀 {query.data.subscribers_count}</strong>{' '}
          <strong>✨ {query.data.stargazers_count}</strong>{' '}
          <strong>🍴 {query.data.forks_count}</strong>
        </div>
      
    
  )
}
```

- Signals and store values can be passed in directly to function arguments. Solid Query will update the query `store` automatically.

```tsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from '@tanstack/solid-query'
import { createSignal, For } from 'solid-js'

const queryClient = new QueryClient()

function Example() {
  const [enabled, setEnabled] = createSignal(false)
  const [todo, setTodo] = createSignal(0)



## Important Differences between Solid Query & React Query (part 2)

// ✅ passing a signal directly is safe and observers update
  // automatically when the value of a signal changes
  const todosQuery = useQuery(() => ({
    queryKey: ['todos'],
    queryFn: fetchTodos,
    enabled: enabled(),
  }))

  const todoDetailsQuery = useQuery(() => ({
    queryKey: ['todo', todo()],
    queryFn: fetchTodo,
    enabled: todo() > 0,
  }))

  return (
    <div>
      
        <Match when={todosQuery.isPending}>
          <p>Loading...</p>
        
        <Match when={todosQuery.isError}>
          <p>Error: {todosQuery.error.message}</p>
        
        <Match when={todosQuery.isSuccess}>
          <For each={todosQuery.data}>
            {(todo) => (
              <button onClick={() => setTodo(todo.id)}>{todo.title}</button>
            )}
          
        
      
      <button onClick={() => setEnabled(!enabled())}>Toggle enabled</button>
    </div>
  )
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      
    
  )
}
```

- Errors can be caught and reset using SolidJS' native `ErrorBoundary` component.
  Set `throwOnError` or the `suspense` option to `true` to make sure errors are thrown to the `ErrorBoundary`

- Since Property tracking is handled through Solid's fine grained reactivity, options like `notifyOnChangeProps` are not needed

