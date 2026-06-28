# Swift — Protocols

Protocols define a blueprint of methods, properties, and requirements that
types can conform to. Swift's protocol-oriented design is central to its
type system.

## Protocol Definition & Conformance

```swift
protocol Identifiable {
    var id: String { get }              // readable property
    func identify() -> String
}

protocol Nameable {
    var name: String { get set }        // readable + writable
}

// Conforming to multiple protocols
struct User: Identifiable, Nameable, Codable {
    let id: String
    var name: String

    func identify() -> String {
        "User: \(name) (\(id))"
    }
}

// Protocol conformance via extension
struct Book {
    let isbn: String
    let title: String
}

extension Book: Identifiable {
    var id: String { isbn }
    func identify() -> String { "Book: \(title)" }
}
```

## Protocol Inheritance

```swift
protocol Hashable: Equatable { }        // inherits Equatable requirements

protocol Persistent: Identifiable, Codable {
    func save() async throws
    static func load(id: String) async throws -> Self
}

// Protocol composition
typealias Storable = Identifiable & Codable

func store<T: Identifiable & Codable>(_ item: T) { ... }
```

## Associated Types

Protocols can declare associated types — placeholders that conforming types
fill in with concrete types.

```swift
protocol Repository {
    associatedtype Item
    associatedtype ID: Hashable

    func fetch(id: ID) async throws -> Item
    func save(_ item: Item) async throws
    func all() async throws -> [Item]
}

// Concrete conformance
struct UserRepository: Repository {
    typealias Item = User
    typealias ID = UUID

    func fetch(id: UUID) async throws -> User { ... }
    func save(_ user: User) async throws { ... }
    func all() async throws -> [User] { ... }
}

// Associated types with constraints
protocol Cache {
    associatedtype Key: Hashable
    associatedtype Value

    subscript(key: Key) -> Value? { get set }
}
```

## Opaque Types (`some`)

Hide the concrete return type while preserving type identity. Unlike
generics, the caller doesn't choose the type — the callee does.

```swift
// Opaque return type — caller knows it's some View, but not which
func makeProfile() -> some View {
    VStack {
        Text("Ada")
        Divider()
        Text("Engineer")
    }
}

// With protocols using associated types
protocol Shape {
    func area() -> Double
}

func makeRectangle(width: Double, height: Double) -> some Shape {
    Rectangle(width: width, height: height)   // returns opaque Shape
}

// some vs generics:
// func foo<T: Shape>(_ shape: T) — caller chooses T
// func foo() -> some Shape    — callee chooses type
```

## Generic Where Clauses

Constrain generics and extensions with `where` clauses.

```swift
// Generic function with where
func merge<C1: Collection, C2: Collection>(_ a: C1, _ b: C2) -> [C1.Element]
where C1.Element == C2.Element {
    Array(a) + Array(b)
}

// Protocol extension with where
extension Array where Element: Numeric {
    func sum() -> Element {
        reduce(0, +)
    }
}

extension Collection where Element: Identifiable {
    func first(withId id: String) -> Element? {
        first { $0.id == id }
    }
}

// Protocol with where clause
protocol Ordered where Self: Comparable {
    func isBefore(_ other: Self) -> Bool
}

extension Ordered {
    func isBefore(_ other: Self) -> Bool { self < other }
}
```

## Protocol Extensions

Provide default implementations. Types can override them.

```swift
protocol Greetable {
    var name: String { get }
    func greet() -> String
}

extension Greetable {
    // Default implementation
    func greet() -> String {
        "Hello, \(name)!"
    }

    // Additional functionality
    func formalGreeting() -> String {
        "Dear \(name),"
    }
}

struct Person: Greetable {
    let name: String
    // greet() uses default
    // formalGreeting() uses default
}

struct Robot: Greetable {
    let name: String
    func greet() -> String {             // override default
        "Beep boop, I'm \(name)."
    }
}

// Protocol extension with constraints
extension Collection where Element: Greetable {
    func greetAll() -> [String] {
        map { $0.greet() }
    }
}
```

## Type Erasure

When working with protocols that have associated types, you can't use the
protocol as a type directly. Type erasure wraps the concrete type.

```swift
// Problem: protocol with associated type can't be used as a type
// let shapes: [Shape] = ...  // ERROR if Shape has associated type

// Solution: AnyShape wrapper
struct AnyShape: Shape {
    private let _area: () -> Double

    init<S: Shape>(_ shape: S) {
        _area = { shape.area() }
    }

    func area() -> Double { _area() }
}

// Usage
let shapes: [AnyShape] = [
    AnyShape(Circle(radius: 5)),
    AnyShape(Rectangle(width: 3, height: 4)),
]
let areas = shapes.map { $0.area() }

// Swift's standard library provides many type-erased wrappers:
// AnyHashable, AnySequence, AnyCollection, AnyPublisher (Combine)
```

## See Also

- [core.md](core.md) — structs, classes, enums with associated values
- [concurrency.md](concurrency.md) — actors, Sendable, async/await