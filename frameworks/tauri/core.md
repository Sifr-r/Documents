# Tauri — Core Guide

## Overview

Framework for building smaller, faster, and more secure desktop & mobile apps with web frontends and Rust backends.

## Key Patterns & Usage

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

## Index of Available Documentation Files

All detailed guide files can be found under the [`docs/`](docs/) directory:

- [`ARCHITECTURE.md`](docs/ARCHITECTURE.md)
- [`README.md`](docs/README.md)
- [`bench/README.md`](docs/bench/README.md)
- [`crates/tauri-build/README.md`](docs/crates/tauri-build/README.md)
- [`crates/tauri-bundler/License_Apache.md`](docs/crates/tauri-bundler/License_Apache.md)
- [`crates/tauri-bundler/License_MIT.md`](docs/crates/tauri-bundler/License_MIT.md)
- [`crates/tauri-bundler/README.md`](docs/crates/tauri-bundler/README.md)
- [`crates/tauri-cli/ENVIRONMENT_VARIABLES.md`](docs/crates/tauri-cli/ENVIRONMENT_VARIABLES.md)
- [`crates/tauri-cli/README.md`](docs/crates/tauri-cli/README.md)
- [`crates/tauri-cli/templates/plugin/__example-api/tauri-app/README.md`](docs/crates/tauri-cli/templates/plugin/__example-api/tauri-app/README.md)
- [`crates/tauri-cli/templates/plugin/ios-spm/README.md`](docs/crates/tauri-cli/templates/plugin/ios-spm/README.md)
- [`crates/tauri-codegen/README.md`](docs/crates/tauri-codegen/README.md)
- [`crates/tauri-driver/README.md`](docs/crates/tauri-driver/README.md)
- [`crates/tauri-macos-sign/README.md`](docs/crates/tauri-macos-sign/README.md)
- [`crates/tauri-macros/README.md`](docs/crates/tauri-macros/README.md)
- [`crates/tauri-runtime-wry/README.md`](docs/crates/tauri-runtime-wry/README.md)
- [`crates/tauri-runtime/README.md`](docs/crates/tauri-runtime/README.md)
- [`crates/tauri-schema-generator/README.md`](docs/crates/tauri-schema-generator/README.md)
- [`crates/tauri-schema-worker/README.md`](docs/crates/tauri-schema-worker/README.md)
- [`crates/tauri-utils/README.md`](docs/crates/tauri-utils/README.md)
- ... and 24 more files under `docs/`
