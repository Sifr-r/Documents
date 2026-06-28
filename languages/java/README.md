# Java

Modern Java (17+) reference. Covers the JDK, JVM semantics, streams, concurrency, and essential patterns.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, control flow, records, pattern matching |
| [oop.md](oop.md) | Classes, inheritance, interfaces, sealed classes, abstract |
| [streams.md](streams.md) | Stream API, lambdas, method references, collectors |
| [concurrency.md](concurrency.md) | Virtual threads, ExecutorService, CompletableFuture, locks |

## Quick Reference

```java
// Null safety
var val = Optional.ofNullable(maybe).orElse("default");

// Records (Java 16+)
record Point(int x, int y) {}

// Pattern matching switch (Java 21+)
var result = switch (obj) {
    case String s -> s.length();
    case Integer i -> i * 2;
    case null -> 0;
    default -> -1;
};

// Virtual threads (Java 21+)
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    executor.submit(() -> doWork());
}

// Text blocks (Java 15+)
var json = """
    {"key": "value"}
    """;

// Var (Java 10+)
var list = List.of("a", "b", "c");
```