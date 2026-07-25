# Tauri

Framework for building smaller, faster, and more secure desktop & mobile apps with web frontends and Rust backends.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Core concepts, API reference, and key usage patterns |
| Documentation | [docs/](docs/) | Full documentation set indexed from upstream package |

## Quick Reference

### Rust Command Definition (`src-tauri/src/lib.rs`)
```rust
#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}!", name)
}
```

### JS/TS Invoke (`src/App.tsx`)
```typescript
import { invoke } from '@tauri-apps/api/core';

const message = await invoke<string>('greet', { name: 'World' });
```

## See Also

- [Tauri Official Documentation](https://neuledge.com)
