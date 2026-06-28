# Nuxt — Core

## File-Based Routing (pages/)

```
pages/
├── index.vue           # /
├── about.vue           # /about
├── blog/
│   ├── index.vue       # /blog
│   └── [slug].vue      # /blog/:slug (dynamic)
├── users/
│   └── [id].vue        # /users/:id
└── [...all].vue        # Catch-all (404)
```

### Dynamic Routes

```vue
<!-- pages/blog/[slug].vue -->
<script setup lang="ts">
const route = useRoute()
const { data } = await useFetch(`/api/posts/${route.params.slug}`)
</script>

<template>
  <article>{{ data }}</article>
</template>
```

### Nested Routes with NuxtPage

```vue
<!-- pages/dashboard.vue -->
<template>
  <div>
    <nav>Sidebar</nav>
    <NuxtPage />  <!-- child route renders here -->
  </div>
</template>
```

```
pages/
├── dashboard.vue          # Parent layout
└── dashboard/
    ├── index.vue          # /dashboard
    └── settings.vue       # /dashboard/settings
```

### Route Middleware

```ts
// middleware/auth.ts
export default defineNuxtRouteMiddleware((to, from) => {
  const { loggedIn } = useAuth()
  if (!loggedIn.value && to.path !== '/login') {
    return navigateTo('/login')
  }
})
```

```vue
<!-- Apply to a page -->
<script setup lang="ts">
definePageMeta({
  middleware: ['auth'],
})
</script>
```

## Server Routes (server/api/)

```ts
// server/api/posts/index.ts — GET /api/posts
export default defineEventHandler(async (event) => {
  const posts = await db.posts.findMany()
  return posts
})
```

```ts
// server/api/posts/[id].ts — GET /api/posts/:id
export default defineEventHandler(async (event) => {
  const id = getRouterParam(event, 'id')
  const post = await db.posts.findUnique({ where: { id: Number(id) } })
  if (!post) throw createError({ statusCode: 404, message: 'Not found' })
  return post
})
```

```ts
// server/api/posts/index.post.ts — POST /api/posts
export default defineEventHandler(async (event) => {
  const body = await readBody(event)
  const post = await db.posts.create({ data: body })
  return post
})
```

Helpers: `getQuery(event)`, `readBody(event)`, `getRouterParam(event, 'key')`, `setCookie(event, name, value)`, `getCookie(event, name)`.

## Composables

### useFetch

```vue
<script setup lang="ts">
const { data, pending, error, refresh, execute } = await useFetch('/api/posts', {
  method: 'GET',
  query: { page: 1, limit: 10 },
  pick: ['id', 'title'],              // only keep these fields
  transform: (res) => res.data,       // transform response
  immediate: true,                     // fetch immediately (default)
  watch: [/* reactive sources */],     // re-fetch when changed
})
</script>
```

### useAsyncData

```vue
<script setup lang="ts">
// More control than useFetch — use any async function
const { data } = await useAsyncData('user', async () => {
  const [user, posts] = await Promise.all([
    $fetch('/api/user'),
    $fetch('/api/posts'),
  ])
  return { user, posts }
})
</script>
```

### useState

```vue
<script setup lang="ts">
// SSR-safe shared state — survives hydration
const counter = useState('counter', () => 0)

// In any component, same key → same ref
</script>

<template>
  <button @click="counter++">{{ counter }}</button>
</template>
```

### useRoute and useRouter

```vue
<script setup lang="ts">
const route = useRoute()
const router = useRouter()

console.log(route.params.id)
console.log(route.query.page)

await router.push('/about')
</script>
```

## Auto-Imports

Nuxt auto-imports from Vue, Nuxt itself, and project directories:

| Auto-imported | Source |
|--------------|--------|
| `ref`, `computed`, `watch` | Vue |
| `useFetch`, `useState`, `useHead` | Nuxt |
| Components in `components/` | Project |
| Composables in `composables/` | Project |
| Utils in `utils/` | Project |

```vue
<!-- components/BaseButton.vue → auto-imported as <BaseButton> -->
<template>
  <BaseButton>Click me</BaseButton>
</template>
```

## Modules

```ts
// nuxt.config.ts
export default defineNuxtConfig({
  modules: [
    '@pinia/nuxt',
    '@nuxtjs/tailwindcss',
    '@vueuse/nuxt',
  ],
  tailwindcss: {
    configPath: 'tailwind.config.ts',
  },
})
```

Create a custom module:

```ts
// modules/my-module.ts
import { defineNuxtModule } from '@nuxt/kit'

export default defineNuxtModule({
  meta: { name: 'my-module', configKey: 'myModule' },
  setup(options, nuxt) {
    // extend Nuxt at build time
  },
})
```

## Nitro Server Engine

Nitro powers the server layer — universal deployment across Node, Deno, Cloudflare Workers, Vercel Edge, and more.

```ts
// server/plugins/logger.ts — server plugin
export default defineNitroPlugin((nitro) => {
  nitro.hooks.hook('request', (event) => {
    console.log(`${event.method} ${event.path}`)
  })
})
```

```ts
// server/middleware/timing.ts — runs on every request
export default defineEventHandler((event) => {
  const start = performance.now()
  event.node.res.on('finish', () => {
    console.log(`${event.path} took ${performance.now() - start}ms`)
  })
})
```

## Plugins

```ts
// plugins/analytics.client.ts — client-only plugin
export default defineNuxtPlugin(() => {
  // runs once on app init
  console.log('Analytics initialized')
})
```

```ts
// plugins/my-plugin.ts — SSR + client
export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.provide('greet', (name: string) => `Hello, ${name}!`)
})
```

```vue
<!-- Use provided value -->
<script setup lang="ts">
const { $greet } = useNuxtApp()
</script>

<template>
  <p>{{ $greet('World') }}</p>
</template>
```

## See Also

- [Nuxt 3 Documentation](https://nuxt.com/docs)
- [Nuxt Composables](https://nuxt.com/docs/guide/directory-structure/composables)
- [Nitro Documentation](https://nitro.unjs.io)
- [Nuxt GitHub](https://github.com/nuxt/nuxt)
