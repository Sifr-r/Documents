# Kotlin

Modern Kotlin (1.9+) reference for JVM and Android.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, data classes, scope functions, collections |
| [coroutines.md](coroutines.md) | launch, async, Flow, channels, structured concurrency |
| [null-safety.md](null-safety.md) | Nullable types, safe calls, lateinit, platform types |

## Quick Reference

```kotlin
// Null safety
val length = str?.length          // safe call
val len = str?.length ?: 0        // Elvis operator
val forced = str!!.length         // not-null assertion

// Data class
data class User(val name: String, val age: Int)

// Extension function
fun String.isEmail(): Boolean = this.contains("@")

// Coroutines
launch {                           // fire-and-forget
    val result = async { fetchData() }.await()
}

// Scope functions
user?.let { println(it.name) }     // null-safe transform
val config = Config().apply {      // configure object
    host = "localhost"
    port = 8080
}
val name = obj.run {               // compute and return
    firstName + " " + lastName
}
```