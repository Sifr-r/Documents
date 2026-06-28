# SolidJS — Core

## Signals (createSignal)

Signals are the foundational reactive primitive. Reading a signal inside a tracking scope (effect, memo, JSX) subscribes that scope to changes.

```tsx
import { createSignal } from 'solid-js';

const [count, setCount] = createSignal(0);

// Read
console.log(count()); // 0

// Write
setCount(5);
setCount(c => c + 1); // functional update

// Options
const [value, setValue] = createSignal(0, { equals: false }); // always notify
const [obj, setObj] = createSignal({ x: 1 }, { equals: (a, b) => a.x === b.x });
```

## Effects

### createEffect

Runs after the DOM updates. Automatically tracks signal dependencies.

```tsx
import { createSignal, createEffect } from 'solid-js';

const [count, setCount] = createSignal(0);

createEffect(() => {
  // Re-runs whenever count() changes
  console.log('Count is now:', count());
});

// With cleanup / onCleanup
createEffect((prev) => {
  const c = count();
  const timer = setInterval(() => console.log(c), 1000);
  return () => clearInterval(timer); // cleanup
});
```

### createMemo

Cached derived value — only recomputes when dependencies change.

```tsx
import { createSignal, createMemo } from 'solid-js';

const [count, setCount] = createSignal(0);
const doubled = createMemo(() => count() * 2);
const label = createMemo(() => `Count: ${doubled()}`);

// Memo is lazy — only computes when read
console.log(doubled()); // 0
```

### createRenderEffect

Runs synchronously during the render phase, before DOM updates. Use for DOM measurements.

```tsx
import { createRenderEffect } from 'solid-js';

createRenderEffect(() => {
  // Runs before browser paint — good for DOM measurements
  const el = document.getElementById('box');
  if (el) console.log(el.offsetHeight);
});
```

## Resources (createResource)

Wraps async data with loading/error states and automatic refetching.

```tsx
import { createSignal, createResource } from 'solid-js';

const [page, setPage] = createSignal(1);

// Source signal triggers refetch when it changes
const [users, { refetch }] = createResource(page, async (p) => {
  const res = await fetch(`/api/users?page=${p}`);
  return res.json();
});

// In JSX
<Show when={!users.loading} fallback={<p>Loading users...</p>}>
  <For each={users()}>
    {(user) => <li>{user.name}</li>}
  </For>
</Show>

// Properties
users()          // data
users.loading    // boolean
users.error      // Error | undefined

// Refetch manually
refetch();
```

### Initial value

```tsx
const [data] = createResource(fetchData, { initialValue: [] });
```

## Control Flow

### For

Efficient list rendering — only updates changed items, not the entire list.

```tsx
import { For } from 'solid-js';

<For each={items()} fallback={<p>No items</p>}>
  {(item, index) => <li>{index()}: {item.name}</li>}
</For>
```

### Show

Conditional rendering — mounts/unmounts children.

```tsx
import { Show } from 'solid-js';

<Show when={user()} fallback={<p>Please log in</p>}>
  <p>Welcome, {user()!.name}</p>
</Show>

// Non-null assertion variant
<Show when={user()} keyed>
  {(u) => <p>Welcome, {u.name}</p>}
</Show>
```

### Switch / Match

Multi-branch conditional.

```tsx
import { Switch, Match } from 'solid-js';

<Switch fallback={<p>Unknown status</p>}>
  <Match when={status() === 'idle'}><p>Ready</p></Match>
  <Match when={status() === 'loading'}><p>Loading...</p></Match>
  <Match when={status() === 'error'}><p>Something went wrong</p></Match>
</Switch>
```

### Dynamic

Render a component determined at runtime.

```tsx
import { Dynamic } from 'solid-js';

<Dynamic component={isAdmin ? AdminPanel : UserPanel} />
```

## Stores (createStore)

Deep reactive state with fine-grained tracking. Only the parts you read are tracked.

```tsx
import { createStore } from 'solid-js/store';

const [state, setState] = createStore({
  user: { name: 'John', preferences: { theme: 'dark' } },
  todos: [],
  count: 0,
});

// Path-based updates (no spread needed)
setState('user', 'name', 'Jane');
setState('user', 'preferences', 'theme', 'light');
setState('count', c => c + 1);
setState('todos', t => [...t, { id: 1, text: 'Learn Solid', done: false }]);
setState('todos', 0, 'done', true);

// Read in JSX — only tracked properties re-render
<p>Name: {state.user.name}</p>
<p>Theme: {state.user.preferences.theme}</p>
```

### produce

Immutable-style updates via a mutable draft.

```tsx
import { produce } from 'solid-js/store';

setState(produce((s) => {
  s.user.name = 'Jane';
  s.todos.push({ id: 2, text: 'New task', done: false });
}));
```

## Context

```tsx
import { createContext, useContext, createSignal } from 'solid-js';

interface ThemeContextType {
  theme: () => string;
  setTheme: (t: string) => void;
}

const ThemeContext = createContext<ThemeContextType>();

function ThemeProvider(props: { children: any }) {
  const [theme, setTheme] = createSignal('light');
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {props.children}
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  const ctx = useContext(ThemeContext)!;
  return (
    <div class={ctx.theme()}>
      <button onClick={() => ctx.setTheme(ctx.theme() === 'light' ? 'dark' : 'light')}>
        Toggle theme
      </button>
    </div>
  );
}
```

## Suspense and Transitions

```tsx
import { Suspense, useTransition } from 'solid-js';

// Suspense wraps async boundaries
<Suspense fallback={<p>Loading...</p>}>
  <AsyncData />
</Suspense>

// Transitions keep the old UI while new data loads
const [isPending, startTransition] = useTransition();

startTransition(() => setPage(p => p + 1));
```

## JSX Patterns

```tsx
// Event handlers
<button onClick={(e) => console.log(e.clientX)}>Click</button>

// Style binding
<div style={{ color: color(), "font-size": `${size()}px` }} />
<div style={{ color: color() }} />

// classList
<div classList={{ active: isActive(), selected: isSelected() }} />

// Spread props
<div {...props}>Content</div>

// Refs
let ref: HTMLDivElement;
<div ref={ref}>I have a ref</div>

// onMount / onCleanup
import { onMount, onCleanup } from 'solid-js';
onMount(() => { console.log('Mounted'); });
onCleanup(() => { console.log('Cleanup'); });
```

## See Also

- [SolidJS Documentation](https://docs.solidjs.com)
- [SolidJS Reactivity Guide](https://docs.solidjs.com/guides/reactivity)
- [SolidJS Stores](https://docs.solidjs.com/reference/basic-reactivity/create-store)
- [SolidJS GitHub](https://github.com/solidjs/solid)
