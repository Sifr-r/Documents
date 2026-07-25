# Vite — Core Guide

## Overview

Next generation frontend tooling with instant server start via native ES modules and fast HMR.

## Key Patterns & Usage

### Config (`vite.config.ts`)
```typescript
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000
  }
});
```

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`docs/acknowledgements.md`](docs/docs/acknowledgements.md)
- [`docs/blog.md`](docs/docs/blog.md)
- [`docs/blog/announcing-vite2.md`](docs/docs/blog/announcing-vite2.md)
- [`docs/blog/announcing-vite3.md`](docs/docs/blog/announcing-vite3.md)
- [`docs/blog/announcing-vite4-3.md`](docs/docs/blog/announcing-vite4-3.md)
- [`docs/blog/announcing-vite4.md`](docs/docs/blog/announcing-vite4.md)
- [`docs/blog/announcing-vite5-1.md`](docs/docs/blog/announcing-vite5-1.md)
- [`docs/blog/announcing-vite5.md`](docs/docs/blog/announcing-vite5.md)
- [`docs/blog/announcing-vite6.md`](docs/docs/blog/announcing-vite6.md)
- [`docs/blog/announcing-vite7.md`](docs/docs/blog/announcing-vite7.md)
- [`docs/blog/announcing-vite8-beta.md`](docs/docs/blog/announcing-vite8-beta.md)
- [`docs/blog/announcing-vite8.md`](docs/docs/blog/announcing-vite8.md)
- [`docs/changes/hotupdate-hook.md`](docs/docs/changes/hotupdate-hook.md)
- [`docs/changes/index.md`](docs/docs/changes/index.md)
- [`docs/changes/per-environment-apis.md`](docs/docs/changes/per-environment-apis.md)
- [`docs/changes/shared-plugins-during-build.md`](docs/docs/changes/shared-plugins-during-build.md)
- [`docs/changes/ssr-using-modulerunner.md`](docs/docs/changes/ssr-using-modulerunner.md)
- [`docs/changes/this-environment-in-hooks.md`](docs/docs/changes/this-environment-in-hooks.md)
- [`docs/config/build-options.md`](docs/docs/config/build-options.md)
- [`docs/config/dep-optimization-options.md`](docs/docs/config/dep-optimization-options.md)
- ... and 35 more files under `docs/`
