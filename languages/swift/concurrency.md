# Swift — Concurrency

Swift concurrency is built on `async/await`, `Task`, and `actor` — structured,
safe, and integrated with the compiler.

## Async/Await

```swift
// async function — can suspend at await points
func fetchUser(id: String) async throws -> User {
    let url = URL(string: "https://api.example.com/users/\(id)")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode(User.self, from: data)
}

// Calling async from sync
Task {
    do {
        let user = try await fetchUser(id: "42")
        print(user.name)
    } catch {
        print(error)
    }
}
```

## Task

A `Task` represents a unit of asynchronous work. The compiler checks that
mutable state isn't shared unsafely across tasks.

```swift
// Basic task
let task = Task {
    return try await fetchUser(id: "42")
}

// Priority
Task(priority: .high) {
    await performCriticalWork()
}

// Cancellation
task.cancel()

// Checking cancellation
func process() async throws {
    try Task.checkCancellation()        // throws if cancelled
    // or:
    guard !Task.isCancelled else { return }
}

// Task with result
let result = await task.value           // suspend until complete
// or: task.result                       // Result<User, Error> — no throw

// Detached task (no inheritance of context)
Task.detached {
    // runs independently — no priority, task-local, or actor isolation
}
```

## TaskGroup

Run multiple tasks concurrently and collect results.

```swift
func loadAll<T>(ids: [String], loader: (String) async throws -> T) async throws -> [T] {
    try await withThrowingTaskGroup(of: T.self) { group in
        for id in ids {
            group.addTask {
                try await loader(id)
            }
        }
        var results = [T]()
        for try await result in group {
            results.append(result)
        }
        return results
    }
}
```

## Async Let

Fire multiple async operations in parallel, then await them together.

```swift
func loadProfile() async throws -> Profile {
    async let user = fetchUser()            // starts immediately
    async let posts = fetchPosts()          // starts in parallel
    async let friends = fetchFriends()      // all three concurrent

    return try await Profile(               // await all at once
        user: user,
        posts: posts,
        friends: friends
    )
}
```

## Actors

Actors protect mutable state by serializing access. Only one task can access
an actor's mutable state at a time.

```swift
actor Counter {
    private var value = 0

    func increment() {
        value += 1                         // safe — serialized
    }

    func reset(to newValue: Int) {
        value = newValue
    }

    func get() -> Int {
        value                              // read-only, still serialized
    }
}

let counter = Counter()
await counter.increment()
let current = await counter.get()          // all access is async

// @MainActor — runs on the main thread (UI)
@MainActor
class ViewModel: ObservableObject {
    @Published var items: [Item] = []

    func load() async {
        let data = await api.fetchItems()   // background
        items = data                        // main thread — safe
    }
}

// Global actors
@globalActor
actor DatabaseActor {
    static let shared = DatabaseActor()
}

@DatabaseActor
func queryDatabase() -> [Record] {
    // runs on DatabaseActor's executor
}
```

## Sendable

Sendable types are safe to share across concurrency domains. The compiler
enforces this for actors and tasks.

```swift
// Value types are implicitly Sendable
struct User: Sendable {
    let id: UUID
    var name: String
}

// Classes can be Sendable if immutable or internally synchronized
final class Cache: @unchecked Sendable {
    private let lock = NSLock()
    private var storage: [String: Data] = [:]

    func get(_ key: String) -> Data? {
        lock.lock()
        defer { lock.unlock() }
        return storage[key]
    }
}

// Functions/closures are Sendable if they don't capture non-Sendable values
// @Sendable attribute enforces this
let callback: @Sendable () -> Void = { print("done") }
```

## MainActor

```swift
// Run on main actor from any context
await MainActor.run {
    label.text = "Updated"              // UI update on main thread
}

// Mark a function as MainActor
@MainActor
func updateUI(with data: Data) {
    // always runs on main thread
}

// Calling from background
func refresh() async {
    let data = await fetchData()        // background
    await updateUI(with: data)          // hops to main actor
}
```

## Continuations

Bridge callback-based APIs to async/await.

```swift
// withCheckedContinuation
func fetchLegacy(completion: @escaping (Result<Data, Error>) -> Void) { ... }

func fetchModern() async throws -> Data {
    try await withCheckedContinuation { continuation in
        fetchLegacy { result in
            continuation.resume(with: result)   // must call exactly once
        }
    }
}

// withThrowingTaskGroup (error propagation)
func loadAll() async throws -> [Item] {
    try await withThrowingTaskGroup(of: Item.self) { group in
        for url in urls {
            group.addTask { try await download(url) }
        }
        var items = [Item]()
        for try await item in group {
            items.append(item)
        }
        return items
    }
}

// withCheckedThrowingContinuation
func performOperation() async throws -> String {
    try await withCheckedThrowingContinuation { continuation in
        legacyOperation { value, error in
            if let error = error {
                continuation.resume(throwing: error)
            } else {
                continuation.resume(returning: value!)
            }
        }
    }
}
```

## See Also

- [core.md](core.md) — optionals, structs, closures, Result type
- [protocols.md](protocols.md) — protocol conformance, generics, associated types