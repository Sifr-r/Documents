# Swift

Modern Swift (5.9+) reference for Apple platforms.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, optionals, enums, structs, closures, Result type |
| [concurrency.md](concurrency.md) | async/await, Task, actors, Sendable, continuations |
| [protocols.md](protocols.md) | Protocol conformance, associated types, opaque types, generics |

## Quick Reference

```swift
// Optionals
let name: String? = nil
if let name = name { print(name) }               // optional binding
let display = name ?? "Unknown"                  // nil-coalescing

// Async/await
func fetchData() async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

// Task
Task {
    let result = await fetchData()
}

// Async let (parallel)
async let user = fetchUser()
async let posts = fetchPosts()
let (u, p) = try await (user, posts)

// Actor
actor Counter {
    private var value = 0
    func increment() { value += 1 }
    func get() -> Int { value }
}

// Protocol conformance
struct User: Codable, Identifiable {
    let id: UUID
    var name: String
}

// Result type
func load() -> Result<User, Error> {
    // ...
}
```