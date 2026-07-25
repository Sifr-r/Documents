# SvelteKit

Full-stack web framework built on Svelte featuring filesystem routing, SSR, API routes, and data loading.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

### Page Route (`src/routes/+page.svelte`)
```svelte
<script>
  let { data } = $props();
</script>

<h1>{data.title}</h1>
```

### Server Load (`src/routes/+page.server.ts`)
```typescript
import type { PageServerLoad } from './$types';

export const load: PageServerLoad = async () => {
  return { title: 'Hello SvelteKit' };
};
```

## See Also

- [SvelteKit Official Documentation](https://neuledge.com)
