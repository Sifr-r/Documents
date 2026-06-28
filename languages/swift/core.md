# Swift — Core Syntax & Types

## Variables

```swift
let immutable = "cannot change"         // constant (prefer)
var mutable = "can change"              // variable
let explicit: String = "typed"          // explicit type annotation
let inferred = "String inferred"        // type inference

// Swift is strongly typed with no implicit conversions
let n = 42
// let d: Double = n                    // ERROR: cannot convert Int to Double
let d = Double(n)                       // explicit conversion required
```

## Basic Types

| Type | Description |
|---|---|
| `Int`, `Int8`–`Int64`, `UInt`–`UInt64` | Signed/unsigned integers |
| `Double` (64-bit), `Float` (32-bit) | IEEE 754 floats |
| `Bool` | `true` / `false` |
| `String` | Unicode-compliant, value type |
| `Character` | Single extended grapheme cluster |

```swift
let n = 42                      // Int
let pi = 3.14                   // Double
let flag = true                 // Bool
let hex = 0xFF
let bin = 0b1010
let big = 1_000_000             // readable
let scientific = 1.5e4          // 15000.0

// Strings
let name = "Ada"
let greeting = "Hello, \(name)"           // interpolation
let multi = """
    multi-line
    string literal
    """                                   // triple-quoted
```

## Optionals

Swift's null safety through the type system — no `nil` without `?`.

```swift
var name: String? = nil         // optional — can be nil
name = "Ada"

// Optional binding (if let / guard let)
if let name = name {
    print(name)                 // name is String (non-optional)
}

// guard let — early exit
guard let name = name else {
    return                      // must exit scope
}
print(name)                     // name available here

// Nil-coalescing
let display = name ?? "Unknown"             // default if nil

// Optional chaining
let dept = user?.department?.head?.name     // nil if any link is nil

// Force unwrap (use sparingly)
let forced = name!                          // crash if nil
```

## Guard

Early exit pattern — keeps the happy path unindented.

```swift
func process(_ input: String?) -> String {
    guard let input = input, !input.isEmpty else {
        return "invalid"
    }
    guard input.count >= 3 else {
        return "too short"
    }
    // input is String, non-empty, >= 3 chars
    return input.uppercased()
}
```

## Switch

Exhaustive, no fallthrough by default, powerful pattern matching.

```swift
switch value {
case 0:
    print("zero")
case 1...10:
    print("1–10")
case let x where x > 10:
    print(">10: \(x)")
default:
    break
}

// Tuple matching
switch (a, b) {
case (0, 0):
    print("origin")
case (_, 0):
    print("x-axis")
case (0, _):
    print("y-axis")
case let (x, y) where x == y:
    print("diagonal: \(x), \(y)")
default:
    print("somewhere")
}
```

## Enums

Enums in Swift are first-class — they can have associated values and methods.

```swift
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}

enum Barcode {
    case upc(Int, Int, Int, Int)            // associated values
    case qrCode(String)
}

// Pattern matching with associated values
switch barcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem)")
case .qrCode(let code):
    print("QR: \(code)")
}

// Enums with raw values
enum Planet: Int {
    case mercury = 1, venus, earth, mars    // earth = 3
}

// Enums with methods
enum Direction {
    case north, south, east, west

    func opposite() -> Direction {
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}
```

## Structs vs Classes

| | Struct | Class |
|---|---|---|
| Type | Value type | Reference type |
| Copy | Copied on assignment | Shared reference |
| Inheritance | No | Yes |
| Deinit | No | Yes |
| Mutability | Explicit `mutating` | Implicit |
| Thread safety | Naturally safer | Needs synchronization |

```swift
struct Point {
    var x: Double
    var y: Double

    mutating func moveBy(dx: Double, dy: Double) {
        x += dx                         // mutating required
        y += dy
    }
}

class Counter {
    var count = 0
    func increment() { count += 1 }     // no mutating needed
}
// Prefer structs by default; use classes for shared mutable state
// or when you need reference semantics or inheritance
```

## Computed Properties

```swift
struct Rectangle {
    var width: Double
    var height: Double

    var area: Double {                  // computed (read-only)
        width * height
    }

    var perimeter: Double {
        get { 2 * (width + height) }
        set { width = newValue / 4; height = newValue / 4 }   // setter
    }
}
```

## Property Observers

```swift
var score = 0 {
    willSet { print("About to change to \(newValue)") }
    didSet { print("Changed from \(oldValue)") }
}

// Use on stored properties, not computed
// didSet is common for UI updates: label.text = "\(score)"
```

## Extensions

Add methods, computed properties, and protocol conformance to existing types.

```swift
extension String {
    var isEmail: Bool {
        contains("@") && contains(".")
    }

    func trimmed() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension Array where Element: Numeric {
    func sum() -> Element {
        reduce(0, +)
    }
}
```

## Closures

```swift
// Full syntax
let add: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a + b
}

// Shorthand
let add: (Int, Int) -> Int = { $0 + $1 }

// Trailing closure syntax
let sorted = items.sorted { $0 < $1 }

// Capturing values
func makeIncrementer(by amount: Int) -> () -> Int {
    var total = 0
    return {                           // captures total by reference
        total += amount
        return total
    }
}

// Escaping closures (stored for later)
func fetch(completion: @escaping (Result<Data, Error>) -> Void) {
    // completion stored or called after function returns
}
```

## Result Type

```swift
enum NetworkError: Error {
    case badURL, noData, decodingFailed
}

func fetchUser(id: String) -> Result<User, NetworkError> {
    guard let url = URL(string: "https://api.example.com/users/\(id)") else {
        return .failure(.badURL)
    }
    // ... network call ...
    return .success(user)
}

// Usage
switch fetchUser(id: "42") {
case .success(let user):
    print(user.name)
case .failure(let error):
    print(error)
}

// Functional style
let result = fetchUser(id: "42")
    .map { $0.name }                    // transform success
    .flatMap { validate($0) }           // chain results
```

## See Also

- [concurrency.md](concurrency.md) — async/await, actors, Task
- [protocols.md](protocols.md) — protocol conformance, generics, opaque types