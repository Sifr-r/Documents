# Astro

Astro 4+ is a content-focused web framework that ships zero JavaScript by default. It uses an island architecture to hydrate only the interactive parts of a page, and supports components from React, Vue, Svelte, and more.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | .astro syntax, islands, content collections, routing, View Transitions, MDX, and SSR |

## Quick Reference

### .astro Component

```astro
---
// Frontmatter: runs on the server at build time
const title = 'Hello Astro';
const items = ['one', 'two', 'three'];
---

<h1>{title}</h1>
<ul>
  {items.map(item => <li>{item}</li>)}
</ul>

<style>
  h1 { color: coral; }
</style>
```

### Island Architecture

```astro
---
import ReactCounter from '../components/Counter.tsx';
import VueSidebar from '../components/Sidebar.vue';
---

<!-- Static — no JS shipped -->
<h1>My Blog</h1>

<!-- Hydrate only when visible -->
<ReactCounter client:visible />

<!-- Hydrate on page load -->
<VueSidebar client:load />

<!-- Client-side only (not rendered on server) -->
<ChatWidget client:only="react" />
```

### Content Collections

```astro
---
import { getCollection } from 'astro:content';
const posts = await getCollection('blog');
---

<ul>
  {posts.map(post => (
    <li><a href={`/blog/${post.slug}`}>{post.data.title}</a></li>
  ))}
</ul>
```

```ts
// src/content/config.ts
import { defineCollection, z } from 'astro:content';

export const collections = {
  blog: defineCollection({
    schema: z.object({
      title: z.string(),
      date: z.date(),
      tags: z.array(z.string()).optional(),
    }),
  }),
};
```

### View Transitions

```astro
---
import { ViewTransitions } from 'astro:transitions';
---

<html>
<head>
  <ViewTransitions />
</head>
<body>
  <h1>Page with smooth transitions</h1>
</body>
</html>
```

### MDX Pages

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

### Image Optimization

```astro
---
import { Image } from 'astro:assets';
import hero from '../assets/hero.jpg';
---

<Image src={hero} alt="Hero" width={800} height={400} />
```

### Routing

```
src/pages/
├── index.astro        # /
├── about.astro        # /about
├── blog/
│   ├── index.astro    # /blog
│   └── [slug].astro   # /blog/:slug (dynamic)
└── api/
    └── data.ts        # /api/data (endpoint)
```

## See Also

- [Astro Documentation](https://docs.astro.build)
- [Astro Islands](https://docs.astro.build/en/concepts/islands)
- [Astro GitHub](https://github.com/withastro/astro)
