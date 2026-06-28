# C# / .NET

Modern C# (10+) and .NET 6+ reference. Covers language features, LINQ, async patterns, and the .NET ecosystem.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, control flow, pattern matching, records |
| [linq.md](linq.md) | LINQ queries, method syntax, EF Core integration |
| [async.md](async.md) | Task, async/await, channels, IAsyncEnumerable |

## Quick Reference

```csharp
// Null safety
var val = obj?.Prop?.Nested ?? "default";

// Records (C# 9+)
record Person(string Name, int Age);

// Pattern matching
var result = obj switch {
    string s => s.Length,
    int i => i * 2,
    null => 0,
    _ => -1
};

// Async
var data = await httpClient.GetStringAsync(url);

// String interpolation
var msg = $"Hello {name}";

// Top-level statements (C# 9+)
Console.WriteLine("Hello World");
```