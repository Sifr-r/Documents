# Remix — Core

## File-Based Routing

Remix uses dot-delimited file names in `app/routes/` to define the route hierarchy:

```
app/routes/
├── _index.tsx              # / (index route)
├── about.tsx               # /about
├── blog.tsx                # /blog (layout)
├── blog._index.tsx         # /blog (index inside layout)
├── blog.$slug.tsx          # /blog/:slug
├── users.$id.tsx           # /users/:id
├── $.tsx                   # Catch-all (404)
├── _auth.tsx               # Pathless layout (no URL segment)
├── _auth.login.tsx         # /login (inside _auth layout)
└── _auth.register.tsx      # /register (inside _auth layout)
```

Rules: `.` creates nesting, `$param` is dynamic, `_prefix` is pathless, `$` alone is catch-all.

## Loaders (GET data)

```tsx
import type { LoaderFunctionArgs } from '@remix-run/node';
import { json } from '@remix-run/node';
import { useLoaderData } from '@remix-run/react';

export async function loader({ request, params }: LoaderFunctionArgs) {
  const url = new URL(request.url);
  const page = Number(url.searchParams.get('page') ?? 1);
  const posts = await db.posts.findMany({ skip: (page - 1) * 10, take: 10 });
  return json({ posts, page });
}

export default function Blog() {
  const { posts, page } = useLoaderData<typeof loader>();
  return (
    <ul>
      {posts.map(post => <li key={post.id}>{post.title}</li>)}
    </ul>
  );
}
```

Loaders run on the server during GET requests. Return data with `json()` for serialization.

### Parallel loading

Nested routes each export a `loader` — Remix calls them **all in parallel** before rendering.

## Actions (POST mutations)

```tsx
import type { ActionFunctionArgs } from '@remix-run/node';
import { json, redirect } from '@remix-run/node';
import { Form, useActionData } from '@remix-run/react';

export async function action({ request }: ActionFunctionArgs) {
  const formData = await request.formData();
  const email = formData.get('email') as string;

  const errors: Record<string, string> = {};
  if (!email) errors.email = 'Email is required';
  if (!email.includes('@')) errors.email = 'Invalid email';
  if (Object.keys(errors).length) return json({ errors }, { status: 400 });

  await createUser({ email });
  return redirect('/dashboard');
}

export default function Register() {
  const data = useActionData<typeof action>();
  return (
    <Form method="post">
      <input name="email" type="email" />
      {data?.errors?.email && <p>{data.errors.email}</p>}
      <button type="submit">Register</button>
    </Form>
  );
}
```

Actions run on POST, PUT, PATCH, DELETE. After a successful action, Remix **revalidates all loaders** automatically.

## useFetcher

Non-navigating requests — stays on the same page while communicating with loaders/actions.

```tsx
import { useFetcher } from '@remix-run/react';

function AddToCart({ productId }: { productId: string }) {
  const fetcher = useFetcher<typeof action>();

  return (
    <fetcher.Form method="post" action="/api/cart">
      <input type="hidden" name="productId" value={productId} />
      <button type="submit" disabled={fetcher.state !== 'idle'}>
        {fetcher.state === 'submitting' ? 'Adding...' : 'Add to Cart'}
      </button>
    </fetcher.Form>
  );
}
```

### Fetcher states

| State | Meaning |
|-------|---------|
| `idle` | Not active |
| `loading` | Fetching data from a loader |
| `submitting` | Sending form data to an action |

### Loading data without navigation

```tsx
function Search() {
  const fetcher = useFetcher();

  return (
    <>
      <fetcher.Form method="get" action="/api/search">
        <input name="q" onChange={(e) => fetcher.submit(e.currentTarget.form)} />
      </fetcher.Form>
      {fetcher.data && <Results results={fetcher.data} />}
    </>
  );
}
```

## useLoaderData and useActionData

```tsx
import { useLoaderData, useActionData } from '@remix-run/react';

// Typed loader data
export async function loader() {
  return json({ user: await getUser() });
}

export default function Profile() {
  const { user } = useLoaderData<typeof loader>();
  // ^? { user: User }
  return <p>{user.name}</p>;
}

// Typed action data
export async function action() {
  return json({ errors: { name: 'Required' } });
}

function Form() {
  const data = useActionData<typeof action>();
  // data?.errors?.name
}
```

## Error Boundaries

```tsx
import { useRouteError, isRouteErrorResponse } from '@remix-run/react';

// Each route can export its own ErrorBoundary
export function ErrorBoundary() {
  const error = useRouteError();

  // HTTP errors thrown via Response
  if (isRouteErrorResponse(error)) {
    return (
      <div>
        <h1>{error.status}</h1>
        <p>{error.statusText}</p>
      </div>
    );
  }

  // Unexpected errors
  if (error instanceof Error) {
    return <h1>Error: {error.message}</h1>;
  }

  return <h1>Unknown error</h1>;
}
```

Throw HTTP errors from loaders:

```tsx
export async function loader({ params }: LoaderFunctionArgs) {
  const post = await getPost(params.slug!);
  if (!post) throw new Response('Not Found', { status: 404 });
  return json({ post });
}
```

## Nested Routes and Layouts

```tsx
// routes/dashboard.tsx — parent layout
import { Outlet, NavLink, useLoaderData } from '@remix-run/react';

export async function loader() {
  return json({ user: await getUser() });
}

export default function Dashboard() {
  const { user } = useLoaderData<typeof loader>();
  return (
    <div>
      <nav>
        <span>Welcome, {user.name}</span>
        <NavLink to="/dashboard">Home</NavLink>
        <NavLink to="/dashboard/settings">Settings</NavLink>
      </nav>
      <main>
        <Outlet />  {/* child route renders here */}
      </main>
    </div>
  );
}
```

Child routes (`dashboard._index.tsx`, `dashboard.settings.tsx`) render inside `<Outlet />`.

## Resource Routes

Routes without a default export act as API endpoints:

```tsx
// routes/api.health.ts — GET /api/health
import { json } from '@remix-run/node';

export async function loader() {
  return json({ status: 'ok', uptime: process.uptime() });
}
```

```tsx
// routes/api.webhook.ts — POST /api/webhook
import { json } from '@remix-run/node';

export async function action({ request }: { request: Request }) {
  const payload = await request.json();
  await processWebhook(payload);
  return json({ received: true });
}
```

## Meta Tags

```tsx
import type { MetaFunction } from '@remix-run/node';

export const meta: MetaFunction = () => [
  { title: 'My Remix App' },
  { name: 'description', content: 'A Remix application' },
  { property: 'og:title', content: 'My Remix App' },
];

// Dynamic meta using loader data
export const meta: MetaFunction<typeof loader> = ({ data }) => [
  { title: data?.post.title ?? 'Blog' },
  { name: 'description', content: data?.post.excerpt },
];
```

## See Also

- [Remix Documentation](https://remix.run/docs)
- [Remix Routing](https://remix.run/docs/en/main/guides/routing)
- [Remix Data Loading](https://remix.run/docs/en/main/guides/data-loading)
- [Remix GitHub](https://github.com/remix-run/remix)
