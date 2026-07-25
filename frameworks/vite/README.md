# Vite

Next generation frontend tooling with instant server start via native ES modules and fast HMR.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

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

## See Also

- [Vite Official Documentation](https://neuledge.com)
