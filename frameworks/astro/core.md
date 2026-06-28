# Astro — Core

## .astro Component Syntax

Every `.astro` file has two parts: a frontmatter script (server-only) and an HTML template.

```astro
---
// Frontmatter: JavaScript/TypeScript, runs at build time or on the server
const name = 'Astro';
const items = await fetch('https://api.example.com/items').then(r => r.json());
---

<!-- Template: HTML with expressions -->
<h1>Hello, {name}</h1>
<ul>
  {items.map((item: { id: number; label: string }) => (
    <li>{item.label}</li>
  ))}
</ul>

<!-- Scoped styles (no leaking) -->
<style>
  h1 { color: coral; }
  li { padding: 0.5rem; }
</style>
```

### Component props

```astro
---
// components/Card.astro
interface Props {
  title: string;
  variant?: 'default' | 'highlight';
}

const { title, variant = 'default' } = Astro.props;
---

<div class:list={['card', { highlight: variant === 'highlight' }]}>
  <h2>{title}</h2>
  <slot />  <!-- children -->
</div>
```

### Special directives

```astro
<!-- class:list — conditional classes -->
<div class:list={['base', { active: isActive }, ['extra']]} />

<!-- set:html — raw HTML -->
<div set:html={rawHtml} />

<!-- set:text — escaped text -->
<p set:text={userInput} />

<!-- is:raw — skip template processing -->
<canvas is:raw />
```

## Island Architecture

Only "islands" (interactive components) ship JavaScript. The rest is static HTML.

| Directive | When it hydrates |
|-----------|-----------------|
| `client:load` | On page load |
| `client:visible` | When scrolled into view |
| `client:idle` | When browser is idle |
| `client:media="(min-width: 768px)"` | When media query matches |
| `client:only="react"` | Client-side only (skip SSR) |
| *(none)* | Static — no JS shipped |

```astro
---
import Counter from '../components/Counter.tsx';
import Sidebar from '../components/Sidebar.vue';
import Chat from '../components/Chat.svelte';
---

<!-- Static — zero JS -->
<header><h1>My Site</h1></header>

<!-- Hydrate immediately -->
<Counter client:load />

<!-- Hydrate when visible (saves bandwidth) -->
<Sidebar client:visible />

<!-- Hydrate only on desktop -->
<Chat client:media="(min-width: 1024px)" />

<!-- Skip SSR entirely (e.g., needs window) -->
<Map client:only="react" />

<!-- Multiple frameworks on one page -->
<ReactWidget client:visible />
<VueComponent client:load />
<SvelteComponent client:idle />
```

### Hydration with props

```astro
<Counter client:load initialCount={5} />
```

Props are serialized as JSON — avoid functions or non-serializable objects.

## Content Collections

Type-safe Markdown and MDX content from `src/content/`.

```ts
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  type: 'content',          // 'content' for .md/.mdx, 'data' for .json/.yaml
  schema: ({ image }) => z.object({
    title: z.string(),
    date: z.date(),
    author: z.string(),
    cover: image().optional(),
    tags: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
  }),
});

export const collections = { blog };
```

```astro
---
import { getCollection, getEntry } from 'astro:content';

// Get all blog posts
const posts = await getCollection('blog');

// Filter out drafts
const published = await getCollection('blog', ({ data }) => !data.draft);

// Get a single entry
const post = await getEntry('blog', 'hello-world');
const { Content } = await post.render();
---

<ul>
  {posts.map(p => <li><a href={`/blog/${p.slug}`}>{p.data.title}</a></li>)}
</ul>

<!-- Render MDX content -->
<Content />
```

## Routing

### Static pages

```
src/pages/
├── index.astro         # /
├── about.astro         # /about
├── blog/
│   ├── index.astro     # /blog
│   └── [slug].astro    # /blog/:slug
└── [...rest].astro     # Catch-all
```

### Dynamic routes

```astro
---
// src/pages/blog/[slug].astro
import { getCollection } from 'astro:content';

export async function getStaticPaths() {
  const posts = await getCollection('blog');
  return posts.map(post => ({
    params: { slug: post.slug },
    props: { post },
  }));
}

const { post } = Astro.props;
const { Content } = await post.render();
---

<article>
  <h1>{post.data.title}</h1>
  <Content />
</article>
```

### API endpoints

```ts
// src/pages/api/data.ts
import type { APIRoute } from 'astro';

export const GET: APIRoute = async ({ url }) => {
  const data = await fetchData();
  return new Response(JSON.stringify(data), {
    headers: { 'content-type': 'application/json' },
  });
};

export const POST: APIRoute = async ({ request }) => {
  const body = await request.json();
  return new Response(JSON.stringify({ ok: true }), { status: 201 });
};
```

## View Transitions API

Enable smooth page-to-page transitions without a full SPA.

```astro
---
import { ViewTransitions } from 'astro:transitions';
---

<html>
<head>
  <ViewTransitions />
</head>
<body>
  <nav>
    <a href="/" transition:animate="slide">Home</a>
    <a href="/about" transition:animate="slide">About</a>
  </nav>
  <main transition:animate="fade">
    <slot />
  </main>
</body>
</html>
```

### Persist elements across navigation

```astro
<!-- Keep this element and its state across page transitions -->
<video id="player" transition:persist autoplay />
```

## MDX Integration

```bash
# Install
npx astro add mdx
```

```astro
---
import { getCollection } from 'astro:content';
const posts = await getCollection('blog');
---

{posts.map(post => (
  <article>
    <h2>{post.data.title}</h2>
    <post.body />
  </article>
))}
```

MDX files can import and use Astro, React, or other components directly.

## Image Optimization

```astro
---
import { Image, Picture } from 'astro:assets';
import hero from '../assets/hero.jpg';
---

<!-- Optimized <img> -->
<Image src={hero} alt="Hero" width={800} height={400} format="webp" />

<!-- Responsive <picture> with multiple sources -->
<Picture
  src={hero}
  alt="Hero"
  widths={[400, 800, 1200]}
  sizes="(max-width: 768px) 100vw, 50vw"
/>
```

## Adapters and SSR

By default Astro generates static HTML. Use adapters for server-side rendering.

```ts
// astro.config.mjs
import { defineConfig } from 'astro/config';
import node from '@astrojs/node';

export default defineConfig({
  output: 'server',           // 'static' (default) | 'server' | 'hybrid'
  adapter: node({ mode: 'standalone' }),
});
```

### Hybrid rendering

```astro
---
// Per-page opt-in to SSR
export const prerender = false; // This page uses SSR

const data = await fetchLiveData();
---
```

## See Also

- [Astro Documentation](https://docs.astro.build)
- [Astro Islands Guide](https://docs.astro.build/en/concepts/islands)
- [Content Collections](https://docs.astro.build/en/guides/content-collections)
- [Astro GitHub](https://github.com/withastro/astro)
