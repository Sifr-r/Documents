# Qwik — Core

## Resumability

Qwik serializes the application state, event handlers, and component structure into HTML at build time. On the client, it **resumes** from where the server left off — no hydration, no re-execution of component code.

Key principles:
- Event handlers are serialized as lazy-loadable references
- The global `$()` function marks serialization boundaries
- The optimizer splits code into tiny chunks loaded on demand
- Time to Interactive is near-instant regardless of app size

## $() Boundary

The `$()` function marks code that should be serialized and lazy-loaded. Any `$`-suffixed API (`component$`, `useTask$`, `onClick$`) is a shorthand for `$()`.

```tsx
import { $, component$ } from '@builder.io/qwik';

export const App = component$(() => {
  // Explicit $() boundary
  const handleClick = $(() => {
    console.log('This closure is lazy-loaded on click');
  });

  // Shorthand: onClick$ is equivalent to onClick={$(() => ...)}
  return <button onClick$={() => console.log('Also lazy')}>Click</button>;
});
```

Rules:
- Closures inside `$()` can only close over serializable values (signals, primitives, plain objects)
- Functions, classes, and DOM nodes cannot be captured inside `$()`
- Use signals to pass reactive data across boundaries

## Signals

### useSignal

Fine-grained reactive primitive. Reading `.value` in JSX creates a subscription.

```tsx
import { component$, useSignal } from '@builder.io/qwik';

export const Counter = component$(() => {
  const count = useSignal(0);

  return (
    <div>
      <p>Count: {count.value}</p>
      <button onClick$={() => count.value++}>Increment</button>
      <button onClick$={() => count.value = 0}>Reset</button>
    </div>
  );
});
```

### useStore

Reactive store for objects and arrays — mutations trigger re-renders.

```tsx
import { component$, useStore } from '@builder.io/qwik';

export const TodoList = component$(() => {
  const store = useStore({
    items: [] as string[],
    draft: '',
  });

  return (
    <div>
      <input
        value={store.draft}
        onInput$={(e) => store.draft = (e.target as HTMLInputElement).value}
      />
      <button onClick$={() => {
        store.items.push(store.draft);
        store.draft = '';
      }}>
        Add
      </button>
      <ul>
        {store.items.map((item, i) => <li key={i}>{item}</li>)}
      </ul>
    </div>
  );
});
```

## Tasks

### useTask$

Runs during rendering (server or client). Use `track()` to declare dependencies.

```tsx
import { component$, useSignal, useTask$ } from '@builder.io/qwik';

export const Search = component$(() => {
  const query = useSignal('');
  const results = useSignal<string[]>([]);

  useTask$(async ({ track, cleanup }) => {
    // Track query signal — re-runs when it changes
    const q = track(() => query.value);

    if (q.length < 3) {
      results.value = [];
      return;
    }

    // Debounce with cleanup
    const controller = new AbortController();
    cleanup(() => controller.abort());

    const res = await fetch(`/api/search?q=${q}`, { signal: controller.signal });
    results.value = await res.json();
  });

  return (
    <div>
      <input onInput$={(e) => query.value = (e.target as HTMLInputElement).value} />
      <For each={results.value}>{(item) => <div>{item}</div>}</For>
    </div>
  );
});
```

### useVisibleTask$

Runs only on the client, after the component becomes visible in the viewport. Use for browser-only APIs.

```tsx
import { component$, useSignal, useVisibleTask$ } from '@builder.io/qwik';

export const LazyMap = component$(() => {
  const mapRef = useSignal<HTMLDivElement>();

  useVisibleTask$(() => {
    // Only loads when scrolled into view
    const map = new google.maps.Map(mapRef.value!, { center: { lat: 0, lng: 0 } });
  });

  return <div ref={mapRef} style={{ height: '400px' }} />;
});
```

## Components (component$)

```tsx
import { component$ } from '@builder.io/qwik';

// Props are always reactive
export const Card = component$<{ title: string; count: number }>((props) => {
  return (
    <div class="card">
      <h2>{props.title}</h2>
      <p>Count: {props.count}</p>
      <Slot />  {/* children projection */}
    </div>
  );
});

// Usage
<Card title="Hello" count={5}>
  <p>Slot content</p>
</Card>
```

## Routing (Qwik City)

```
src/routes/
├── index.tsx             # /
├── layout.tsx            # Root layout
├── about/index.tsx       # /about
├── blog/
│   ├── index.tsx         # /blog
│   ├── [slug]/index.tsx  # /blog/:slug
│   └── layout.tsx        # /blog layout
└── api/
    └── data.ts           # API endpoint
```

### Route Loaders

```tsx
// src/routes/blog/[slug]/index.tsx
import { component$ } from '@builder.io/qwik';
import { routeLoader$ } from '@builder.io/qwik-city';

export const usePost = routeLoader$(async ({ params, status }) => {
  const post = await db.posts.findBySlug(params.slug);
  if (!post) {
    return status(404);
  }
  return post;
});

export default component$(() => {
  const post = usePost();
  return (
    <article>
      <h1>{post.value.title}</h1>
      <div dangerouslySetInnerHTML={post.value.html} />
    </article>
  );
});
```

### Route Actions (mutations)

```tsx
import { component$, useSignal } from '@builder.io/qwik';
import { routeAction$, zod$, z } from '@builder.io/qwik-city';

export const useCreatePost = routeAction$(
  async (data) => {
    const post = await db.posts.create(data);
    return { postId: post.id };
  },
  zod$({
    title: z.string().min(1),
    body: z.string().min(10),
  })
);

export default component$(() => {
  const action = useCreatePost();
  return (
    <form action={action}>
      <input name="title" />
      <textarea name="body" />
      <button type="submit">Create</button>
      {action.value?.postId && <p>Created post #{action.value.postId}</p>}
    </form>
  );
});
```

## server$ (RPC)

Call server-only code from the client as if it were a regular function.

```tsx
import { component$, useSignal } from '@builder.io/qwik';
import { server$ } from '@builder.io/qwik-city';

// Defined at module scope — always runs on server
const searchProducts = server$(async (query: string) => {
  // Can access DB, env vars, etc.
  const products = await db.products.search(query);
  return products;
});

export default component$(() => {
  const results = useSignal<any[]>([]);

  return (
    <button onClick$={async () => {
      results.value = await searchProducts('shoes');
    }}>
      Search: {results.value.length} results
    </button>
  );
});
```

## Slots and Projections

```tsx
import { component$, Slot } from '@builder.io/qwik';

// Named slots
export const Layout = component$(() => (
  <div>
    <header><Slot name="header" /></header>
    <main><Slot /></main>
    <footer><Slot name="footer" /></footer>
  </div>
));

// Usage
<Layout>
  <div q:slot="header"><h1>Page Title</h1></div>
  <p>Main content</p>
  <div q:slot="footer"><p>Footer</p></div>
</Layout>
```

## Optimizer

The Qwik optimizer (Vite plugin) automatically:
- Splits components into individual lazy-loadable chunks
- Extracts `$()` closures into separate modules
- Generates symbol references for resumability
- Minimizes the initial JavaScript payload

No manual code-splitting or lazy loading needed — the optimizer handles it.

## See Also

- [Qwik Documentation](https://qwik.dev/docs)
- [Qwik Concepts](https://qwik.dev/docs/concepts/think-qwik)
- [Qwik City](https://qwik.dev/docs/qwikcity)
- [Qwik GitHub](https://github.com/QwikDev/qwik)
