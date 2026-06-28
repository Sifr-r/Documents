# Next.js — Core

## File-Based Routing (App Router)

The `app/` directory uses file-system routing. Each folder represents a route segment:

```
app/
├── layout.tsx              # Root layout (wraps all routes)
├── page.tsx                # / → renders inside layout
├── loading.tsx             # Loading UI for this segment
├── error.tsx               # Error boundary for this segment
├── not-found.tsx           # 404 UI
├── about/page.tsx          # /about
├── blog/
│   ├── page.tsx            # /blog
│   ├── [slug]/page.tsx     # /blog/:slug
│   └── [...all]/page.tsx   # /blog/* (catch-all)
└── (marketing)/            # Route group — no URL segment
    ├── layout.tsx
    └── pricing/page.tsx    # /pricing
```

### Special files per route

| File | Purpose |
|------|---------|
| `page.tsx` | Main UI for the route |
| `layout.tsx` | Shared layout wrapping children |
| `loading.tsx` | Suspense fallback |
| `error.tsx` | Error boundary (`'use client'` required) |
| `not-found.tsx` | Triggered by `notFound()` |
| `template.tsx` | Like layout but re-mounts on navigation |

## Server vs Client Components

```tsx
// Server Component (default) — runs on server, zero JS bundle
async function PostList() {
  const posts = await db.posts.findMany();
  return <ul>{posts.map(p => <li key={p.id}>{p.title}</li>)}</ul>;
}
```

```tsx
'use client';
// Client Component — hydrated in browser, has interactivity
import { useState } from 'react';

function LikeButton({ postId }: { postId: string }) {
  const [liked, setLiked] = useState(false);
  return <button onClick={() => setLiked(l => !l)}>{liked ? '♥' : '♡'}</button>;
}
```

**When to use `'use client'`:** `useState`, `useEffect`, event handlers, browser APIs, class components.

## Data Fetching

```tsx
// Static at build time (default for GET)
async function Page() {
  const res = await fetch('https://api.example.com/posts');
  const posts = await res.json();
  return <PostList posts={posts} />;
}

// Revalidate every 60 seconds (ISR)
const data = await fetch('https://api.example.com/data', {
  next: { revalidate: 60 },
});

// No caching — always fresh (SSR)
const data = await fetch('https://api.example.com/data', {
  cache: 'no-store',
});

// On-demand revalidation
import { revalidatePath, revalidateTag } from 'next/cache';
revalidatePath('/blog');
revalidateTag('posts');
```

## Server Actions

```tsx
'use server';

import { revalidatePath } from 'next/cache';

export async function addComment(postId: string, formData: FormData) {
  const body = formData.get('body') as string;
  await db.comments.create({ postId, body });
  revalidatePath(`/blog/${postId}`);
}
```

```tsx
// Usage in a Client or Server Component
import { addComment } from './actions';

function CommentForm({ postId }: { postId: string }) {
  const action = addComment.bind(null, postId);
  return (
    <form action={action}>
      <textarea name="body" required />
      <button type="submit">Post comment</button>
    </form>
  );
}
```

## Route Handlers

```tsx
// app/api/search/route.ts
import { NextResponse } from 'next/server';

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const q = searchParams.get('q');
  const results = await db.posts.search(q);
  return NextResponse.json(results);
}

export async function POST(request: Request) {
  const body = await request.json();
  const post = await db.posts.create(body);
  return NextResponse.json(post, { status: 201 });
}
```

Supported methods: `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `HEAD`, `OPTIONS`.

## Middleware

```tsx
// middleware.ts — runs before route matching, at the edge
import { NextResponse } from 'next/server';
import type { NextRequest } from 'next/server';

export function middleware(request: NextRequest) {
  const locale = request.headers.get('accept-language')?.split(',')[0] ?? 'en';
  const response = NextResponse.next();
  response.headers.set('x-locale', locale);
  return response;
}

export const config = {
  matcher: ['/((?!api|_next/static|favicon.ico).*)'],
};
```

## Image Optimization

```tsx
import Image from 'next/image';

<Image src="/avatar.jpg" alt="User" width={200} height={200} priority />
<Image src="/banner.png" alt="Banner" fill style={{ objectFit: 'cover' }} />
<Image src={remoteUrl} alt="Remote" width={800} height={400} />
```

Remote images must be declared in `next.config.js`:

```js
// next.config.js
module.exports = {
  images: {
    remotePatterns: [
      { protocol: 'https', hostname: 'images.example.com' },
    ],
  },
};
```

## Metadata API

```tsx
// Static metadata
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: { default: 'My App', template: '%s | My App' },
  description: 'Built with Next.js',
  openGraph: { images: ['/og.png'] },
};

// Dynamic metadata per page
export async function generateMetadata({ params }): Promise<Metadata> {
  const post = await getPost(params.slug);
  return { title: post.title, description: post.excerpt };
}
```

## Dynamic Routes

```tsx
// app/blog/[slug]/page.tsx
export default function Page({ params }: { params: { slug: string } }) {
  return <div>Post: {params.slug}</div>;
}

// Pre-render known slugs at build time
export async function generateStaticParams() {
  const posts = await fetchPosts();
  return posts.map(p => ({ slug: p.slug }));
}

// Catch-all: app/docs/[...slug]/page.tsx
// params.slug is string[] — e.g. /docs/a/b → ['a', 'b']
```

## Parallel Routes (Layout Slots)

```tsx
// app/layout.tsx
export default function Layout({
  children,
  team,
  analytics,
}: {
  children: React.ReactNode;
  team: React.ReactNode;
  analytics: React.ReactNode;
}) {
  return (
    <div>
      {children}
      <div className="grid grid-cols-2">
        {team}
        {analytics}
      </div>
    </div>
  );
}
```

Slots are folders prefixed with `@`:

```
app/
├── layout.tsx
├── page.tsx
├── @team/page.tsx
└── @analytics/page.tsx
```

## Streaming and Suspense

```tsx
import { Suspense } from 'react';

export default function Page() {
  return (
    <div>
      <h1>Dashboard</h1>
      <Suspense fallback={<SkeletonCard />}>
        <SlowComponent />
      </Suspense>
      <Suspense fallback={<SkeletonList />}>
        <DataList />
      </Suspense>
    </div>
  );
}
```

Each `Suspense` boundary streams independently — the shell renders immediately while chunks arrive progressively.

## Caching Strategies

| Layer | What it caches | Where |
|-------|---------------|-------|
| Request memoization | `fetch()` results within a render | Server |
| Route cache | Route segment output | Server |
| Router cache | Visited route payloads | Client |
| Full route cache | HTML and RSC payload | Server |

Opt out per fetch with `{ cache: 'no-store' }` or per route with `export const dynamic = 'force-dynamic'`.

## See Also

- [Next.js Documentation](https://nextjs.org/docs)
- [App Router Architecture](https://nextjs.org/docs/app/building-your-application/routing)
- [Caching in Next.js](https://nextjs.org/docs/app/building-your-application/caching)
- [Next.js GitHub](https://github.com/vercel/next.js)
