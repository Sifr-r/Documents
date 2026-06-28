# Nuxt

Nuxt 3 is a Vue meta-framework that provides file-based routing, server-side rendering, auto-imports, and a built-in server powered by Nitro. It focuses on developer experience and performance.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Routing, server routes, composables, auto-imports, modules, middleware, and Nitro |

## Quick Reference

### Project Structure

```
├── app.vue              # Root component
├── pages/               # File-based routing
│   ├── index.vue        # /
│   └── about.vue        # /about
├── components/          # Auto-imported components
├── composables/         # Auto-imported composables
├── server/
│   └── api/             # Server API routes
│       └── hello.ts
├── middleware/          # Route middleware
├── plugins/             # Nuxt plugins
├── public/              # Static assets
└── nuxt.config.ts       # Configuration
```

### Page Component

```vue
<!-- pages/index.vue -->
<script setup lang="ts">
const { data, pending } = await useFetch('/api/hello')
</script>

<template>
  <div v-if="pending">Loading...</div>
  <div v-else>{{ data }}</div>
</template>
```

### Auto-Imports

```vue
<script setup lang="ts">
// No need to import ref, computed, useFetch, etc.
const count = ref(0)
const doubled = computed(() => count.value * 2)

// Composables from composables/ are also auto-imported
const { user } = useAuth()
</script>
```

### Server API Route

```ts
// server/api/hello.ts
export default defineEventHandler(async (event) => {
  const query = getQuery(event)
  return { message: `Hello, ${query.name ?? 'World'}` }
})
```

### useFetch

```vue
<script setup lang="ts">
const { data, pending, error, refresh } = await useFetch('/api/posts', {
  query: { page: 1 },
  pick: ['id', 'title'],
})
</script>
```

### useState (shared state across SSR)

```vue
<script setup lang="ts">
const count = useState('count', () => 0)
// Same key → same reactive value everywhere
</script>

<template>
  <button @click="count++">Count: {{ count }}</button>
</template>
```

### Navigation

```vue
<template>
  <NuxtLink to="/about">About</NuxtLink>
  <NuxtLink to="/blog" prefetch>Blog</NuxtLink>
</template>
```

### useHead

```vue
<script setup lang="ts">
useHead({
  title: 'My Page',
  meta: [
    { name: 'description', content: 'A Nuxt 3 page' },
  ],
})
</script>
```

## See Also

- [Nuxt 3 Documentation](https://nuxt.com/docs)
- [Nuxt GitHub](https://github.com/nuxt/nuxt)
- [Nitro Engine](https://nitro.unjs.io)
