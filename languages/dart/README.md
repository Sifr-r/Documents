# Dart

Modern Dart (3.x) reference for Flutter, server-side, and CLI applications.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, null safety, classes, mixins |
| [async.md](async.md) | Futures, Streams, async/await, isolates |
| [null-safety.md](null-safety.md) | Nullable types, null-aware operators, late variables |

## Quick Reference

```dart
// Null safety
String? nullable = null;
final val = nullable ?? 'default';
final len = nullable?.length;

// Late initialization
late final String name;
name = 'Alice';

// Cascade notation
var list = []
  ..add(1)
  ..addAll([2, 3]);

// Spread operator
final merged = [...list1, ...list2];

// Collection if/for
final items = [
  for (var i = 0; i < 5; i++) i * 2,
  if (includeExtra) 'extra',
];

// Named constructors
class Point {
  final double x, y;
  Point(this.x, this.y);
  Point.origin() : x = 0, y = 0;
}

// Async
Future<void> fetchData() async {
  final data = await http.get(url);
}
```