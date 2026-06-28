# Rust — Concurrency

## Threads

```rust
use std::thread;

let handle = thread::spawn(|| {
    // work in another thread
    42
});

let result = handle.join().unwrap(); // wait for thread, get result
```

## Message Passing (Channels)

```rust
use std::sync::mpsc;

let (tx, rx) = mpsc::channel();

// Spawn producer
let tx1 = tx.clone();
thread::spawn(move || {
    tx1.send("hello").unwrap();
});

thread::spawn(move || {
    tx.send("world").unwrap();
});

// Receive (blocking)
for msg in rx {
    println!("{}", msg);
}
// Prints: hello, world (order not guaranteed)

// Non-blocking
match rx.try_recv() {
    Ok(msg) => println!("{}", msg),
    Err(mpsc::TryRecvError::Empty) => {},
    Err(mpsc::TryRecvError::Disconnected) => break,
}
```

## Shared State (Arc + Mutex)

```rust
use std::sync::{Arc, Mutex};

let counter = Arc::new(Mutex::new(0));
let mut handles = vec![];

for _ in 0..10 {
    let counter = Arc::clone(&counter);
    let handle = thread::spawn(move || {
        let mut num = counter.lock().unwrap(); // blocks until lock acquired
        *num += 1;
    });
    handles.push(handle);
}

for handle in handles {
    handle.join().unwrap();
}
println!("{}", *counter.lock().unwrap()); // 10
```

## RwLock

```rust
use std::sync::RwLock;

let data = RwLock::new(vec![1, 2, 3]);

// Multiple readers
let r1 = data.read().unwrap();
let r2 = data.read().unwrap();  // OK — multiple readers
println!("{} {}", r1[0], r2[0]);

// Writer needs exclusive access
drop(r1);
drop(r2);
let mut w = data.write().unwrap();
w.push(4);
```

## Send & Sync (Auto Traits)

| Trait | Meaning |
|---|---|
| `Send` | Can transfer ownership across threads |
| `Sync` | `&T` can be shared across threads |

Most types are `Send + Sync`. Notable exceptions:
- `Rc<T>` — neither `Send` nor `Sync` (use `Arc<T>` instead)
- `RefCell<T>` — `Send` but not `Sync`
- `*const T`, `*mut T` — neither (raw pointers)

```rust
// Compile-time thread safety — this won't compile:
// let rc = Rc::new(42);
// thread::spawn(move || { println!("{}", rc); });
// ERROR: Rc<i32> cannot be sent between threads safely
```

## Async/Await (Tokio)

```rust
// Tokio is the de facto async runtime (add to Cargo.toml)
use tokio;

#[tokio::main]
async fn main() {
    // Concurrent
    let (res1, res2) = tokio::join!(
        fetch("url1"),
        fetch("url2"),
    );

    // Race (first to complete)
    tokio::select! {
        result = fetch("url1") => { /* handle */ },
        result = fetch("url2") => { /* handle */ },
        _ = tokio::time::sleep(Duration::from_secs(5)) => {
            println!("timeout");
        }
    }

    // Spawn — fire and forget (or await later)
    let handle = tokio::spawn(async {
        fetch("url").await
    });
    let result = handle.await.unwrap();
}

async fn fetch(url: &str) -> Result<String, reqwest::Error> {
    reqwest::get(url).await?.text().await
}
```

## Concurrency vs Parallelism

- **Concurrency**: Structuring a program to handle multiple things at once
  (async/await, channels) — even on a single core.
- **Parallelism**: Running multiple computations simultaneously on multiple cores
  (threads).

Rust's type system catches data races at compile time through `Send` + `Sync`.

## See Also

- [ownership.md](ownership.md) — why Rust can guarantee thread safety
- [traits.md](traits.md) — Send, Sync, and auto traits
- [patterns.md](patterns.md) — RAII for lock guards
