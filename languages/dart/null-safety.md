# Dart — Null Safety

## Sound Null Safety

```dart
// Non-nullable by default (Dart 2.12+)
String name = 'Alice';     // cannot be null
// String name = null;     // compile error

// Opt in at library level — no annotation needed
// All types are non-nullable unless marked with ?
```

## Nullable Types (?)

```dart
String? nullable;          // can hold String or null
nullable = 'hello';
nullable = null;           // OK

// Non-nullable — must be initialized
String required = 'value';
// String required;        // error: must be initialized

// Collections
List<String?> mixed = ['a', null, 'b'];  // nullable elements
List<String> strict = ['a', 'b'];        // no nulls allowed
Map<String, int?> scores = {'alice': 90, 'bob': null};
```

## Required Keyword

```dart
// Named parameters are optional by default
void greet({String name = 'Guest'}) => print(name);

// Make named parameter required
void greet({required String name, required int age}) {
  print('$name is $age');
}

greet(name: 'Alice', age: 30);
// greet();               // error: name and age are required

// Required with nullable type
void log({required String? message}) {
  print(message ?? '(no message)');
}
```

## Null-Aware Operators

```dart
String? maybe = null;

// ?? — if-null (fallback)
final value = maybe ?? 'default';       // 'default'

// ?. — safe property access
final len = maybe?.length;              // null (no crash)
final upper = maybe?.toUpperCase();     // null

// ?. with method chaining
final result = maybe?.split(' ')?.first;

// ??= — assign if null
String? name;
name ??= 'fallback';                    // name = 'fallback'
name ??= 'ignored';                     // name stays 'fallback'

// ! — null assertion (throws TypeError if null)
String? maybeNull = 'hello';
final forced = maybeNull!;              // 'hello' (String, not String?)
// null!;                              // throws TypeError
```

## late Keyword & late final

```dart
// late — promise to initialize before first read
late String description;
description = 'set later';
print(description); // 'set later'

// late final — assigned once, lazily
late final config = loadExpensiveConfig(); // runs on first access

// Common pattern: late final in classes
class Screen {
  late final width = _computeWidth();
  late final height = _computeHeight();

  int _computeWidth() => 1920;
  int _computeHeight() => 1080;
}

// late with nullable (allows re-assignment detection)
late int? count; // must assign before read, but value can be null
```

## Platform Types & Non-Nullable Interop

```dart
// Platform types from Java/JNI can be null unexpectedly
// Always guard platform values
final String? platformValue = getJavaString(); // may be null

// Non-nullable assertions after validation
final String safe = platformValue!;

// FFI / JS interop — external values bypass null safety
// Treat external returns as nullable until verified
```

## Type Promotion

```dart
// Dart promotes nullable to non-nullable after null check
void process(String? value) {
  if (value == null) return;
  // value is now String (promoted)
  print(value.length); // no ?. needed

  // Also works with != null
  if (value != null) {
    print(value.toUpperCase());
  }
}

// Promotion with is check
void handle(Object obj) {
  if (obj is String) {
    print(obj.length); // promoted to String
  }
}

// Promotion fails for fields (not local variables)
class Box {
  String? value;
  void show() {
    if (value != null) {
      // print(value.length); // error: value not promoted
      print(value!.length);  // use ! or local variable
    }
  }
}

// Workaround: copy to local
void show() {
  final v = value;
  if (v != null) print(v.length); // promoted
}
```

## Flow Analysis & Definite Assignment

```dart
// Dart analyzes control flow to track initialization
String name;
if (condition) {
  name = 'Alice';
} else {
  name = 'Bob';
}
print(name); // OK — definitely assigned in both branches

// Uninitialized error
String x;
// print(x); // error: not definitely assigned

// Late vs definite assignment
String label;
label = 'set'; // definite assignment (no late needed)
```

## See Also

- [core.md](core.md) — variables, types, control flow
- [async.md](async.md) — Futures, Streams, async/await
