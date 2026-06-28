# Next.js

Next.js 14+ is a React meta-framework built on the App Router architecture. It provides server-side rendering, static generation, and server components out of the box with file-based routing.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | App Router, Server Components, data fetching, Server Actions, Middleware, and caching |

## Quick Reference

### App Router File Structure

```
app/
├── layout.tsx          # Root layout
├── page.tsx            # Home page (/)
├── about/page.tsx      # /about
├── blog/
│   ├── page.tsx        # /blog
│   └── [slug]/page.tsx # /blog/:slug (dynamic)
├── api/
│   └── users/route.ts  # Route handler (GET, POST)
└── not-found.tsx       # 404 page
```

### Server Component (default)

```tsx
// app/page.tsx — runs on the server, no JS sent to client
async function Page() {
  const data = await fetch('https://api.example.com/data').then(r => r.json());

  return (
    <ul>
      {data.map((item: { id: number; name: string }) => (
        <li key={item.id}>{item.name}</li>
      ))}
    </ul>
  );
}

export default Page;
```

### Client Component

```tsx
'use client';

import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);
  return <button onClick={() => setCount(c => c + 1)}>Count: {count}</button>;
}

export default Counter;
```

### Route Handler

```tsx
// app/api/users/route.ts
import { NextResponse } from 'next/server';

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const page = searchParams.get('page') ?? '1';
  return NextResponse.json({ page });
}

export async function POST(request: Request) {
  const body = await request.json();
  return NextResponse.json({ created: body }, { status: 201 });
}
```

### Server Action

```tsx
// app/actions.ts
'use server';

export async function createPost(formData: FormData) {
  const title = formData.get('title') as string;
  // mutate data on the server
  await db.posts.create({ title });
}
```

```tsx
// app/page.tsx
import { createPost } from './actions';

function NewPost() {
  return (
    <form action={createPost}>
      <input name="title" required />
      <button type="submit">Create</button>
    </form>
  );
}
```

### Middleware

```tsx
// middleware.ts (project root)
import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const token = request.cookies.get('token');
  if (!token) {
    return NextResponse.redirect(new URL('/login', request.url));
  }
  return NextResponse.next();
}

export const config = {
  matcher: ['/dashboard/:path*'],
};
```

### Image Optimization

```tsx
import Image from 'next/image';

<Image
  src="/hero.jpg"
  alt="Hero"
  width={1200}
  height={600}
  priority            // preload above-the-fold images
  placeholder="blur"  // blur placeholder
/>
```

### Link and Navigation

```tsx
import Link from 'next/link';

<Link href="/blog/hello-world" prefetch={false}>Read post</Link>
<Link href="/about" replace>Replace history entry</Link>
```

### Dynamic Routes

```tsx
// app/blog/[slug]/page.tsx
export async function generateStaticParams() {
  const posts = await fetchPosts();
  return posts.map((post) => ({ slug: post.slug }));
}

export default async function Page({ params }: { params: { slug: string } }) {
  const post = await getPost(params.slug);
  return <article>{post.content}</article>;
}
```

### Metadata API

```tsx
// app/layout.tsx or page.tsx
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'My App',
  description: 'A Next.js application',
  openGraph: { title: 'My App', description: 'A Next.js application' },
};
```

## See Also

- [Next.js Documentation](https://nextjs.org/docs)
- [App Router](https://nextjs.org/docs/app)
- [Next.js GitHub](https://github.com/vercel/next.js)
