# SolidJS

SolidJS is a fine-grained reactive JavaScript library for building user interfaces. It uses true reactivity with direct DOM manipulation — no virtual DOM — resulting in exceptional performance and small bundle sizes.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Signals, effects, memos, resources, control flow, stores, and context |

## Quick Reference

### Component

```tsx
function Greeting(props: { name: string }) {
  return <h1>Hello, {props.name}</h1>;
}

// Usage
<Greeting name="Solid" />
```

### Signals (reactive state)

```tsx
import { createSignal } from 'solid-js';

function Counter() {
  const [count, setCount] = createSignal(0);
  const doubled = () => count() * 2; // derived value

  return (
    <div>
      <p>Count: {count()}, Doubled: {doubled()}</p>
      <button onClick={() => setCount(c => c + 1)}>Increment</button>
    </div>
  );
}
```

### Effects

```tsx
import { createSignal, createEffect, createMemo } from 'solid-js';

const [count, setCount] = createSignal(0);

// Runs whenever dependencies change
createEffect(() => {
  console.log('Count is:', count());
});

// Memoized derived value
const doubled = createMemo(() => count() * 2);
```

### Resources (async data)

```tsx
import { createResource, createSignal } from 'solid-js';

function UserList() {
  const [page, setPage] = createSignal(1);
  const [users] = createResource(page, (p) => fetchUsers(p));

  return (
    <div>
      <Show when={!users.loading} fallback={<p>Loading...</p>}>
        <ul>
          <For each={users()}>{(user) => <li>{user.name}</li>}</For>
        </ul>
      </Show>
      <button onClick={() => setPage(p => p + 1)}>Next</button>
    </div>
  );
}
```

### Control Flow

```tsx
import { For, Show, Switch, Match } from 'solid-js';

<Show when={user()} fallback={<p>Please log in</p>}>
  <p>Welcome, {user()!.name}</p>
</Show>

<For each={items()}>{(item, index) =>
  <li>{index()}: {item.name}</li>
}</For>

<Switch fallback={<p>Unknown</p>}>
  <Match when={status() === 'loading'}><p>Loading...</p></Match>
  <Match when={status() === 'error'}><p>Error!</p></Match>
  <Match when={status() === 'ready'}><p>Ready!</p></Match>
</Switch>
```

### Stores (deep reactivity)

```tsx
import { createStore } from 'solid-js/store';

const [state, setState] = createStore({
  user: { name: 'John', age: 30 },
  items: [1, 2, 3],
});

// Fine-grained updates
setState('user', 'name', 'Jane');
setState('items', items => [...items, 4]);
```

### Context

```tsx
import { createContext, useContext } from 'solid-js';

const ThemeContext = createContext('light');

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  const theme = useContext(ThemeContext);
  return <div class={theme}>Toolbar</div>;
}
```

### Suspense

```tsx
import { Suspense } from 'solid-js';

<Suspense fallback={<p>Loading...</p>}>
  <AsyncComponent />
</Suspense>
```

## See Also

- [SolidJS Documentation](https://docs.solidjs.com)
- [SolidJS Playground](https://playground.solidjs.com)
- [SolidJS GitHub](https://github.com/solidjs/solid)
