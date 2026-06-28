# C# — Core Syntax & Types

## Built-in Types

| Type | C# Alias | .NET Type | Range |
|---|---|---|---|
| `int` | `int` | `Int32` | ±2.1B |
| `long` | `long` | `Int64` | ±9.2e18 |
| `float` | `float` | `Single` | ±3.4e38 |
| `double` | `double` | `Double` | ±1.7e308 |
| `decimal` | `decimal` | `Decimal` | ±7.9e28 (128-bit) |
| `bool` | `bool` | `Boolean` | `true`/`false` |
| `char` | `char` | `Char` | UTF-16 code unit |
| `string` | `string` | `String` | immutable, reference |

```csharp
// Value types (struct) vs Reference types (class)
int a = 5; int b = a; b = 10; // a still 5 (copy)
var list1 = new List<int> { 1, 2 }; var list2 = list1; // same reference

// Default values
int i = default; // 0
string s = default; // null
bool b = default; // false
```

## Nullability (C# 8+)

```csharp
// Nullable reference types (NRT)
string nonNull = "hello";       // cannot be null
string? nullable = null;        // can be null

// Null operators
var len = nullable?.Length;           // null if nullable is null
var val = nullable ?? "default";      // null-coalescing
nullable ??= "default";               // null-coalescing assignment
var x = nullable!.Length;             // null-forgiving (suppress warning)

// Nullable value types
int? maybe = null;
var result = maybe ?? -1;
```

## Control Flow & Pattern Matching

```csharp
// Switch expression (C# 8+)
var result = shape switch {
    Circle { Radius: > 0 } c => c.Radius * 2,
    Rectangle { Width: var w, Height: var h } => w * h,
    null => 0,
    _ => throw new ArgumentException()
};

// Property pattern
if (obj is { Name: "Alice", Age: >= 18 }) { }

// List pattern (C# 11+)
if (numbers is [1, 2, .., 10]) { }

// Pattern in if
if (obj is string s) Console.WriteLine(s.Length);

// Relational pattern (C# 9+)
var category = score switch {
    >= 90 => "A",
    >= 80 => "B",
    >= 70 => "C",
    _ => "F"
};
```

## Records (C# 9+)

```csharp
// Positional record (immutable by default)
public record Person(string Name, int Age);

var p1 = new Person("Alice", 30);
var p2 = p1 with { Age = 31 }; // non-destructive mutation

// Value equality (not reference)
p1 == p2; // false (different Age)
var p3 = new Person("Alice", 30);
p1 == p3; // true

// Record struct (C# 10+, value type)
public readonly record struct Point(int X, int Y);
```

## Collections

```csharp
// Immutable
var list = new List<string> { "a", "b", "c" };
var arr = new[] { 1, 2, 3 };
var dict = new Dictionary<string, int> { ["a"] = 1, ["b"] = 2 };

// Range operator (C# 8+)
var slice = arr[1..3];    // elements 1, 2
var last = arr[^1];       // last element
var allButLast = arr[..^1];

// List methods
list.Add("d"); list.Remove("a");
list.Contains("b"); list.IndexOf("c");
list.Find(x => x.Length > 1);

// Dictionary
dict.TryGetValue("key", out var val);
dict.GetValueOrDefault("key", 0);
```

## Exception Handling

```csharp
try {
    DoRisky();
} catch (HttpRequestException ex) when (ex.StatusCode == 404) {
    // exception filter
} catch (Exception ex) {
    throw new CustomException("Wrapped", ex);
} finally {
    Cleanup();
}
```

## See Also

- [linq.md](linq.md) — LINQ queries, method syntax
- [async.md](async.md) — Task, async/await