# Rust — Common Patterns

## Newtype Pattern

Wrap a type in a tuple struct to add semantic meaning without runtime cost.

```rust
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
struct UserId(u32);
struct Meters(f64);
struct Seconds(f64);

fn get_user(id: UserId) -> User { ... }
// get_user(5);  // ERROR: expected UserId, found integer
get_user(UserId(5)); // OK
```

## Builder Pattern

```rust
#[derive(Debug)]
struct Server {
    host: String,
    port: u16,
    workers: usize,
    timeout: u64,
}

struct ServerBuilder {
    host: String,
    port: u16,
    workers: usize,
    timeout: u64,
}

impl ServerBuilder {
    fn new(host: String, port: u16) -> Self {
        Self { host, port, workers: 4, timeout: 30 }
    }

    fn workers(mut self, n: usize) -> Self {
        self.workers = n;
        self
    }

    fn timeout(mut self, secs: u64) -> Self {
        self.timeout = secs;
        self
    }

    fn build(self) -> Server {
        Server {
            host: self.host,
            port: self.port,
            workers: self.workers,
            timeout: self.timeout,
        }
    }
}

let server = ServerBuilder::new("0.0.0.0".into(), 8080)
    .workers(8)
    .timeout(60)
    .build();
```

## RAII (Resource Acquisition Is Initialization)

Resources are acquired in constructors and released in `Drop`.

```rust
struct FileGuard {
    path: PathBuf,
    file: File,
}

impl FileGuard {
    fn open(path: impl Into<PathBuf>) -> io::Result<Self> {
        let path = path.into();
        Ok(Self {
            file: File::open(&path)?,
            path,
        })
    }
}

impl Drop for FileGuard {
    fn drop(&mut self) {
        // Auto-cleanup — no manual close needed
        eprintln!("Closing {}", self.path.display());
    }
}
```

## Error Propagation Patterns

```rust
// thiserror — derive Error for custom types
use thiserror::Error;

#[derive(Error, Debug)]
enum AppError {
    #[error("IO error: {0}")]
    Io(#[from] io::Error),         // #[from] enables ? conversion

    #[error("Parse error at line {line}: {message}")]
    Parse { line: usize, message: String },

    #[error("Not found: {0}")]
    NotFound(String),
}

// anyhow — for applications (not libraries)
use anyhow::{Context, Result};

fn read_config(path: &str) -> Result<Config> {
    let content = std::fs::read_to_string(path)
        .with_context(|| format!("Failed to read {}", path))?;
    let config = toml::from_str(&content)
        .context("Invalid TOML")?;
    Ok(config)
}
```

## Typestate Pattern

Encode state in the type system to prevent invalid operations at compile time.

```rust
struct Open;
struct Closed;

struct Connection<State> {
    _state: std::marker::PhantomData<State>,
    stream: TcpStream,
}

impl Connection<Closed> {
    fn open(addr: &str) -> io::Result<Self> { ... }

    fn connect(self) -> Connection<Open> {
        Connection { stream: self.stream, _state: PhantomData }
    }
}

impl Connection<Open> {
    fn send(&mut self, data: &[u8]) -> io::Result<usize> { ... }
    fn close(self) -> Connection<Closed> { ... }
}

// Cannot call send on a closed connection — compile error!
let conn = Connection::open("localhost:8080")?.connect();
conn.send(b"hello")?;      // OK
let conn = conn.close();
// conn.send(b"hello")?;   // ERROR: method not found
```

## Extension Methods via Traits

```rust
trait VecExt<T> {
    fn push_all(&mut self, items: impl IntoIterator<Item = T>);
}

impl<T> VecExt<T> for Vec<T> {
    fn push_all(&mut self, items: impl IntoIterator<Item = T>) {
        self.extend(items);
    }
}
```

## See Also

- [ownership.md](ownership.md) — why these patterns work
- [traits.md](traits.md) — extension traits, generic impls
- [concurrency.md](concurrency.md) — Send/Sync for pattern types
