# Kotlin — Core Syntax & Types

## Variables

```kotlin
val immutable = "cannot change"           // read-only (prefer)
var mutable = "can change"                // mutable
val explicit: String = "typed"            // explicit type
val inferred = "String inferred"          // type inference

// Read-only doesn't mean deeply immutable
val list = mutableListOf(1, 2, 3)         // val, but content can change
list.add(4)                               // OK
```

## Basic Types

| Type | Bits | Description |
|---|---|---|
| `Int`, `Long` | 32 / 64 | Signed integers |
| `Short`, `Byte` | 16 / 8 | Short integers |
| `Double`, `Float` | 64 / 32 | IEEE 754 floats |
| `Boolean` | — | `true` / `false` |
| `Char` | 16 | Unicode character |
| `String` | — | Immutable, UTF-16 |

```kotlin
val n = 42                  // Int
val big = 1_000_000L        // Long
val pi = 3.14               // Double
val f = 2.5f                // Float
val hex = 0xFF
val bin = 0b1010

// No implicit widening — must convert explicitly
val long: Long = n.toLong()
```

## String Templates

```kotlin
val name = "Ada"
val greeting = "Hello, $name"                // simple interpolation
val info = "${name.length} characters"       // expression with braces
val escaped = "Price: \$100"                 // escape dollar
val raw = """
    |multi-line
    |string with ${"trim margin".trimMargin()}
""".trimMargin()                            // | is default margin
```

## When Expression

```kotlin
// Replacement for switch — exhaustive, expressive
val result = when (x) {
    1 -> "one"
    2, 3 -> "two or three"
    in 4..10 -> "between 4 and 10"
    !in 11..20 -> "not in range"
    is String -> "it's a string: ${x.length}"
    else -> "unknown"
}

// Without argument — clean if/else chain
when {
    x.isOdd() -> println("odd")
    x.isEven() -> println("even")
    else -> println("unreachable")
}
```

## Sealed Classes

Sealed classes restrict hierarchies so `when` is exhaustive.

```kotlin
sealed class Result<out T> {
    data class Success<T>(val data: T) : Result<T>()
    data class Error(val message: String) : Result<Nothing>()
    object Loading : Result<Nothing>()
}

fun handle(result: Result<String>) = when (result) {
    is Result.Success -> println(result.data)
    is Result.Error -> println("Error: ${result.message}")
    Result.Loading -> println("Loading...")
    // no else needed — sealed class is exhaustive
}
```

## Data Classes

```kotlin
data class User(
    val id: Long,
    val name: String,
    val email: String = ""       // default value
)

// Auto-generated: equals(), hashCode(), toString(), copy(), componentN()
val user = User(1, "Ada", "ada@example.com")
val copy = user.copy(name = "Bob")      // copy with changes
val (id, name, email) = user            // destructuring

// Requirements: primary constructor must have at least one parameter
// All primary constructor params marked val/var
```

## Extension Functions

```kotlin
fun String.isEmail(): Boolean = this.contains("@") && this.contains(".")

fun List<Int>.median(): Double {
    val sorted = this.sorted()
    val mid = size / 2
    return if (size % 2 == 0) (sorted[mid - 1] + sorted[mid]) / 2.0
    else sorted[mid].toDouble()
}

// Extension properties
val String.wordCount: Int
    get() = this.split("\\s+".toRegex()).size

// Use: "hello world".wordCount
```

## Scope Functions

| Function | Receiver | Returns | Use case |
|---|---|---|---|
| `let` | `it` | lambda result | Null-safe calls, transform |
| `apply` | `this` | receiver | Configure object |
| `run` | `this` | lambda result | Compute + return |
| `also` | `it` | receiver | Side effects (logging) |
| `with` | `this` | lambda result | Group ops on non-null |

```kotlin
val user = User().apply {           // configure
    name = "Ada"
    age = 30
}

val length = user?.let {            // null-safe transform
    processName(it.name)
    it.name.length
}

val result = config.run {           // compute on object
    host + ":" + port
}

val tracked = item.also {           // side effect
    log("Processing: $it")
}

val desc = with(person) {           // group operations
    "$firstName $lastName, age $age"
}
```

## Destructuring

```kotlin
data class Point(val x: Int, val y: Int)
val (x, y) = Point(10, 20)          // component1(), component2()

// Map iteration
for ((key, value) in map) { }

// Lists
val (first, second) = listOf(1, 2, 3)

// Underscore for unused
val (_, name) = user
```

## Collections

Kotlin distinguishes read-only and mutable collections.

```kotlin
// Read-only
val list = listOf(1, 2, 3)               // List<T>
val set = setOf("a", "b", "c")           // Set<T>
val map = mapOf("a" to 1, "b" to 2)      // Map<K, V>

// Mutable
val mlist = mutableListOf(1, 2, 3)
val mset = mutableSetOf("a", "b")
val mmap = mutableMapOf("a" to 1)

// Common operations
list.filter { it > 1 }                   // filter
list.map { it * 2 }                      // transform
list.flatMap { listOf(it, it + 1) }      // flatten
list.groupBy { it % 2 }                  // group
list.fold(0) { acc, i -> acc + i }       // accumulate
list.reduce { acc, i -> acc + i }        // reduce
list.sortedBy { it }                     // sort
list.associateBy { it }                  // List → Map
list.find { it > 2 }                     // first match or null
list.first { it > 0 }                    // first match or throw
list.firstOrNull { it > 10 }             // first match or null
list.any { it > 5 }                      // boolean predicate
list.all { it > 0 }                      // all match
list.none { it < 0 }                     // no match
list.take(2)                             // first n
list.drop(1)                             // skip first n
list.zip(listOf("a", "b"))               // pair elements
list.chunked(2)                          // split into chunks
```

## See Also

- [coroutines.md](coroutines.md) — async, Flow, structured concurrency
- [null-safety.md](null-safety.md) — nullable types, safe calls, lateinit