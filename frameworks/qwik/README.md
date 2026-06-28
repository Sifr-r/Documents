# Qwik

Qwik is a resumable framework that delivers instant-load web applications. It serializes application state into HTML at build time and resumes execution on the client without re-running component code — no hydration step required.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Resumability, $() boundaries, signals, tasks, components, routing, server$, and the optimizer |

## Quick Reference

### Component

```tsx
import { component$ } from '@builder.io/qwik';

export const Greeting = component$((props: { name: string }) => {
  return <h1>Hello, {props.name}</h1>;
});
```

### Signals (reactive state)

```tsx
import { component$, useSignal } from '@builder.io/qwik';

export const Counter = component$(() => {
  const count = useSignal(0);
  const doubled = useSignal(0);

  return (
    <div>
      <p>Count: {count.value}, Doubled: {doubled.value}</p>
      <button onClick$={() => {
        count.value++;
        doubled.value = count.value * 2;
      }}>
        Increment
      </button>
    </div>
  );
});
```

### $() Boundary (lazy-loaded code)

```tsx
import { component$, $ } from '@builder.io/qwik';

export const Button = component$(() => {
  // $ marks a serialization boundary — code is lazy-loaded
  const handleClick = $(async () => {
    console.log('Clicked! This code is lazy-loaded.');
  });

  return <button onClick$={handleClick}>Click me</button>;
});
```

### Tasks

```tsx
import { component$, useSignal, useTask$ } from '@builder.io/qwik';

export const Search = component$(() => {
  const query = useSignal('');
  const results = useSignal<string[]>([]);

  // Runs on server and re-runs when query changes
  useTask$(async ({ track }) => {
    const q = track(() => query.value);
    if (q.length > 2) {
      results.value = await fetchSearch(q);
    }
  });

  return (
    <div>
      <input onInput$={(e) => query.value = (e.target as HTMLInputElement).value} />
      <ul>{results.value.map(r => <li>{r}</li>)}</ul>
    </div>
  );
});
```

### Route Loader

```tsx
import { component$ } from '@builder.io/qwik';
import { routeLoader$ } from '@builder.io/qwik-city';

export const usePosts = routeLoader$(async () => {
  const res = await fetch('https://api.example.com/posts');
  return res.json();
});

export default component$(() => {
  const posts = usePosts();
  return (
    <ul>
      {posts.value.map((post: { id: number; title: string }) => (
        <li key={post.id}>{post.title}</li>
      ))}
    </ul>
  );
});
```

### Server Functions (RPC)

```tsx
import { component$, useSignal } from '@builder.io/qwik';
import { server$ } from '@builder.io/qwik-city';

const getUser = server$(async (id: string) => {
  // This runs only on the server
  return db.users.findById(id);
});

export default component$(() => {
  const user = useSignal<any>(null);
  return (
    <button onClick$={async () => {
      user.value = await getUser('123');
    }}>
      Load user: {user.value?.name}
    </button>
  );
});
```

## See Also

- [Qwik Documentation](https://qwik.dev/docs)
- [Qwik City](https://qwik.dev/docs/qwikcity)
- [Qwik GitHub](https://github.com/QwikDev/qwik)
