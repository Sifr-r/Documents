# SvelteKit — Core Guide

## Overview

Full-stack web framework built on Svelte featuring filesystem routing, SSR, API routes, and data loading.

## Key Patterns & Usage

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

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`documentation/docs/10-getting-started/10-introduction.md`](docs/documentation/docs/10-getting-started/10-introduction.md)
- [`documentation/docs/10-getting-started/20-creating-a-project.md`](docs/documentation/docs/10-getting-started/20-creating-a-project.md)
- [`documentation/docs/10-getting-started/25-project-types.md`](docs/documentation/docs/10-getting-started/25-project-types.md)
- [`documentation/docs/10-getting-started/30-project-structure.md`](docs/documentation/docs/10-getting-started/30-project-structure.md)
- [`documentation/docs/10-getting-started/40-web-standards.md`](docs/documentation/docs/10-getting-started/40-web-standards.md)
- [`documentation/docs/20-core-concepts/10-routing.md`](docs/documentation/docs/20-core-concepts/10-routing.md)
- [`documentation/docs/20-core-concepts/20-load.md`](docs/documentation/docs/20-core-concepts/20-load.md)
- [`documentation/docs/20-core-concepts/30-form-actions.md`](docs/documentation/docs/20-core-concepts/30-form-actions.md)
- [`documentation/docs/20-core-concepts/40-page-options.md`](docs/documentation/docs/20-core-concepts/40-page-options.md)
- [`documentation/docs/20-core-concepts/50-state-management.md`](docs/documentation/docs/20-core-concepts/50-state-management.md)
- [`documentation/docs/20-core-concepts/60-remote-functions.md`](docs/documentation/docs/20-core-concepts/60-remote-functions.md)
- [`documentation/docs/20-core-concepts/70-environment-variables.md`](docs/documentation/docs/20-core-concepts/70-environment-variables.md)
- [`documentation/docs/25-build-and-deploy/10-building-your-app.md`](docs/documentation/docs/25-build-and-deploy/10-building-your-app.md)
- [`documentation/docs/25-build-and-deploy/20-adapters.md`](docs/documentation/docs/25-build-and-deploy/20-adapters.md)
- [`documentation/docs/25-build-and-deploy/30-adapter-auto.md`](docs/documentation/docs/25-build-and-deploy/30-adapter-auto.md)
- [`documentation/docs/25-build-and-deploy/40-adapter-node.md`](docs/documentation/docs/25-build-and-deploy/40-adapter-node.md)
- [`documentation/docs/25-build-and-deploy/50-adapter-static.md`](docs/documentation/docs/25-build-and-deploy/50-adapter-static.md)
- [`documentation/docs/25-build-and-deploy/55-single-page-apps.md`](docs/documentation/docs/25-build-and-deploy/55-single-page-apps.md)
- [`documentation/docs/25-build-and-deploy/60-adapter-cloudflare.md`](docs/documentation/docs/25-build-and-deploy/60-adapter-cloudflare.md)
- [`documentation/docs/25-build-and-deploy/70-adapter-cloudflare-workers.md`](docs/documentation/docs/25-build-and-deploy/70-adapter-cloudflare-workers.md)
- ... and 50 more files under `docs/`
