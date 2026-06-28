# Rust

Modern Rust (edition 2021) reference. Covers the borrow checker, ownership,
traits, and concurrency patterns.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, enums, pattern matching, error handling |
| [ownership.md](ownership.md) | Ownership, borrowing, lifetimes, slices |
| [traits.md](traits.md) | Trait definitions, generics, associated types, dyn dispatch |
| [concurrency.md](concurrency.md) | Threads, channels, Arc/Mutex, async/await |
| [patterns.md](patterns.md) | Newtype, builder, RAII, error propagation, extension traits |

## Quick Reference

```rust
// Ownership basics
let s1 = String::from("hello");
let s2 = s1;              // s1 moved — no longer valid
let s3 = s2.clone();      // deep copy

// Borrowing
fn len(s: &String) -> usize { s.len() }
fn mutate(s: &mut String) { s.push_str(" world"); }

// Pattern matching
match value {
    Some(x) if x > 0 => ...,
    None => ...,
    _ => ...,
}

// Error propagation
fn read_config() -> Result<Config, io::Error> {
    let content = std::fs::read_to_string("config.toml")?;
    toml::from_str(&content).map_err(|e| io::Error::new(io::ErrorKind::InvalidData, e))
}

// Async
async fn fetch(url: &str) -> Result<String, reqwest::Error> {
    reqwest::get(url).await?.text().await
}
```
