# Kotlin — Null Safety

Kotlin's type system distinguishes between nullable and non-null references,
eliminating `NullPointerException` at compile time.

## Nullable Types

```kotlin
var nonNull: String = "hello"
// nonNull = null              // COMPILE ERROR: null not allowed

var nullable: String? = "hello"
nullable = null                 // OK — String? is nullable

// Type system: String is a subtype of String?
// String? is a union of String and null
```

## Safe Call Operator (`?.`)

Calls a method or property only if the receiver is not null.

```kotlin
val str: String? = getString()
val length = str?.length        // Int? — returns null if str is null
val upper = str?.uppercase()    // String? — safe, no NPE

// Chaining
val dept = user?.department?.head?.name   // null if any link is null

// With let for null-safe blocks
str?.let {
    println(it.length)          // only runs if str != null
    process(it)
}
```

## Elvis Operator (`?:`)

Returns the left-hand side if non-null, otherwise the right-hand side.

```kotlin
val length = str?.length ?: 0           // default if null
val name = user?.name ?: "Unknown"      // fallback value

// throw on null
val result = data ?: throw IllegalArgumentException("data required")

// return on null
fun process(input: String?): Int {
    val s = input ?: return 0           // early return
    return s.length
}
```

## Not-Null Assertion (`!!`)

Forces a nullable value to be treated as non-null. Throws `NullPointerException`
if the value is null — use sparingly.

```kotlin
val str: String? = getNullable()
val length = str!!.length       // NPE if str is null

// Valid use cases:
// 1. You know it's initialized (e.g., after onCreate)
// 2. Test code where null means the test should fail
// 3. Interop with Java frameworks that guarantee non-null
```

## `lateinit`

For properties that can't be initialized in the constructor but will be set
before first access. Only for `var`, non-null, non-primitive types.

```kotlin
class MyActivity : Activity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        binding.textView.text = "Hello"     // safe — initialized above
    }
}

// Check initialization
if (::binding.isInitialized) {
    // use binding
}
```

## `by lazy`

Lazy initialization — computed once on first access. Thread-safe by default.

```kotlin
val expensive: String by lazy {
    println("computing...")
    computeExpensiveValue()     // only called once, on first access
}

// Thread safety modes:
// LazyThreadSafetyMode.SYNCHRONIZED  (default)
// LazyThreadSafetyMode.PUBLICATION   (multiple threads can compute)
// LazyThreadSafetyMode.NONE          (no synchronization — be careful)
```

## Platform Types (Java Interop)

Types from Java have unknown nullability — Kotlin calls them **platform types**.
The IDE shows them as `String!` in diagnostics.

```java
// Java
public class User {
    public String getName() { return name; }     // nullable or not?
}
```

```kotlin
// Kotlin
val name = user.name           // String! — treat carefully
val safe = name?.uppercase()   // safer: treat as nullable
val forced = name!!.uppercase() // NPE risk if Java returns null

// Solution: annotate Java with @Nullable / @NotNull
// javax.annotation, android.annotation, org.jetbrains.annotations
```

```kotlin
// Safe defaults for Java interop
val name = user.name ?: "Unknown"       // Elvis for safety
val length = user.name?.length ?: 0     // chain safe calls

// Collections from Java
val items: List<String>? = javaList      // nullable if unsure
val items: List<String> = javaList.orEmpty() // safe default
```

## `requireNotNull` / `checkNotNull`

Standard library functions for explicit null checks with messages.

```kotlin
fun process(input: String?): String {
    val nonNull = requireNotNull(input) { "input must not be null" }
    // nonNull is String (not String?) from here
    return nonNull.uppercase()
}

val config = checkNotNull(loadConfig())  // throws IllegalStateException
```

## See Also

- [core.md](core.md) — data classes, scope functions, collections
- [coroutines.md](coroutines.md) — coroutine scope and cancellation