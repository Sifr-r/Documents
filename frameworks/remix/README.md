# Remix

Remix 2+ is a full-stack React framework built on web standards. It emphasizes nested routes, progressive enhancement, and the loader/action data model for seamless server-client interaction.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Routing, loaders, actions, useFetcher, error boundaries, and nested layouts |

## Quick Reference

### File Structure

```
app/
├── root.tsx                # Root layout
├── entry.server.tsx        # Server entry
├── entry.client.tsx        # Client entry
├── routes/
│   ├── _index.tsx          # / (index route)
│   ├── about.tsx           # /about
│   ├── blog._index.tsx     # /blog
│   ├── blog.$slug.tsx      # /blog/:slug
│   └── blog.tsx            # /blog layout (nested)
└── tailwind.css
```

### Loader (GET data)

```tsx
// routes/blog.$slug.tsx
import type { LoaderFunctionArgs } from '@remix-run/node';
import { json } from '@remix-run/node';
import { useLoaderData } from '@remix-run/react';

export async function loader({ params }: LoaderFunctionArgs) {
  const post = await getPost(params.slug!);
  if (!post) throw new Response('Not Found', { status: 404 });
  return json({ post });
}

export default function Post() {
  const { post } = useLoaderData<typeof loader>();
  return <article dangerouslySetInnerHTML={{ __html: post.html }} />;
}
```

### Action (POST mutations)

```tsx
import type { ActionFunctionArgs } from '@remix-run/node';
import { json, redirect } from '@remix-run/node';
import { useActionData, Form } from '@remix-run/react';

export async function action({ request }: ActionFunctionArgs) {
  const formData = await request.formData();
  const title = formData.get('title') as string;
  const errors: Record<string, string> = {};
  if (!title) errors.title = 'Title is required';
  if (Object.keys(errors).length) return json({ errors }, { status: 400 });
  await createPost({ title });
  return redirect('/blog');
}

export default function NewPost() {
  const { errors } = useActionData<typeof action>() ?? {};
  return (
    <Form method="post">
      <input name="title" />
      {errors?.title && <span>{errors.title}</span>}
      <button type="submit">Create</button>
    </Form>
  );
}
```

### useFetcher (non-navigating requests)

```tsx
import { useFetcher } from '@remix-run/react';

function LikeButton({ postId }: { postId: string }) {
  const fetcher = useFetcher();
  const isLiking = fetcher.state === 'submitting';

  return (
    <fetcher.Form method="post" action={`/api/like/${postId}`}>
      <button disabled={isLiking}>{isLiking ? 'Liking...' : '♥ Like'}</button>
    </fetcher.Form>
  );
}
```

### Error Boundary

```tsx
import { useRouteError, isRouteErrorResponse } from '@remix-run/react';

export function ErrorBoundary() {
  const error = useRouteError();

  if (isRouteErrorResponse(error)) {
    return <h1>{error.status} {error.statusText}</h1>;
  }

  return <h1>Something went wrong</h1>;
}
```

### Nested Routes

```tsx
// routes/blog.tsx — layout
import { Outlet } from '@remix-run/react';

export default function BlogLayout() {
  return (
    <div>
      <h1>Blog</h1>
      <Outlet />  {/* child route renders here */}
    </div>
  );
}
```

### Meta Tags

```tsx
import type { MetaFunction } from '@remix-run/node';

export const meta: MetaFunction<typeof loader> = ({ data }) => [
  { title: data?.post.title ?? 'Blog' },
  { name: 'description', content: data?.post.excerpt },
];
```

## See Also

- [Remix Documentation](https://remix.run/docs)
- [Remix GitHub](https://github.com/remix-run/remix)
- [Remix Tutorials](https://remix.run/docs/en/main/tutorials/blog)
