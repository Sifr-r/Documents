# Dart — Core Syntax & Types

## Variables & Types

```dart
// Variables
var name = 'Alice';         // inferred type
String name = 'Alice';       // explicit type
final age = 30;             // runtime constant
const pi = 3.14;            // compile-time constant
late String description;    // initialized later

// Types
int, double, num, String, bool, List, Set, Map, Symbol, Runes, Null

// Dynamic — opt out of type checking
dynamic x = 'hello';
x = 42; // OK

// Object? — any type including null
Object? anything = null;
```

## Null Safety

```dart
// Non-nullable (default)
String name = 'Alice';      // cannot be null

// Nullable
String? nullable = null;    // can be null

// Null-aware operators
String? maybe = null;
final val = maybe ?? 'default';       // if-null
final len = maybe?.length;            // safe access
maybe ??= 'fallback';                 // assign if null
final x = maybe!;                     // assertion (throws if null)

// Late variables
late String name;
name = 'Alice'; // must assign before use

// Null safety in collections
List<String?> mixed = ['a', null];
```

## Control Flow

```dart
// if/else
if (score >= 90) {
  grade = 'A';
} else if (score >= 80) {
  grade = 'B';
} else {
  grade = 'C';
}

// Switch with pattern matching (Dart 3+)
var result = switch (value) {
  1 => 'one',
  2 => 'two',
  _ => 'other',
};

// Switch expression
final grade = switch (score) {
  >= 90 => 'A',
  >= 80 => 'B',
  >= 70 => 'C',
  _ => 'F',
};

// For loops
for (var i = 0; i < 5; i++) { }
for (final item in items) { }

// While
while (condition) { }
do { } while (condition);
```

## Collections

```dart
// Lists
var list = [1, 2, 3];
final immutable = const [1, 2, 3];
list.add(4); list.remove(2);
list.map((x) => x * 2).toList();
list.where((x) => x > 1).toList();
list.reduce((a, b) => a + b);
list.any((x) => x > 0);
list.every((x) => x > 0);
list.firstWhere((x) => x > 1, orElse: () => -1);

// Sets
var set = {1, 2, 3};
set.add(4); set.contains(2);

// Maps
var map = {'a': 1, 'b': 2};
map['c'] = 3;
map.containsKey('a');
map.remove('b');
map.forEach((k, v) => print('$k: $v'));

// Spread & collection if/for
final merged = [...list1, ...list2, ...?nullableList];
final items = [
  for (var i = 0; i < 5; i++) i * 2,
  if (include) 'extra',
];
```

## Classes & Mixins

```dart
class Person {
  final String name;
  int _age; // private (starts with _)

  // Constructor
  Person(this.name, this._age);

  // Named constructor
  Person.anonymous() : name = 'Unknown', _age = 0;

  // Initializer list
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        _age = json['age'];

  // Getters and setters
  int get age => _age;
  set age(int value) => _age = value.clamp(0, 150);

  // Method
  void greet() => print('Hi, I am $name');
}

// Inheritance
class Employee extends Person {
  final String company;
  Employee(String name, int age, this.company) : super(name, age);

  @override
  void greet() => print('Hi, I work at $company');
}

// Mixins
mixin Logger {
  void log(String msg) => print('[LOG] $msg');
}

class Service with Logger {
  void doWork() {
    log('Starting work');
  }
}
```

## Records & Patterns (Dart 3+)

```dart
// Records
var pair = (1, 'hello');
var named = (x: 10, y: 20);
var (a, b) = pair; // destructuring

// Pattern matching
switch ((x, y)) {
  case (0, 0): return 'origin';
  case (_, 0): return 'x-axis';
  case (0, _): return 'y-axis';
  case (var x, var y) when x == y: return 'diagonal';
  default: return 'point';
}
```

## See Also

- [async.md](async.md) — Futures, Streams, async/await
- [null-safety.md](null-safety.md) — nullable types, null-aware operators