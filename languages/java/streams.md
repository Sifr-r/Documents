# Java — Streams & Lambdas

## Lambda Expressions

```java
// Syntax: (params) -> { body }
Runnable r = () -> System.out.println("run");
Predicate<String> p = s -> s.isEmpty();
Comparator<Integer> c = (a, b) -> Integer.compare(a, b);

// Method references
list.forEach(System.out::println);       // instance method
list.stream().map(String::toUpperCase);  // instance method on arbitrary obj
list.stream().map(Integer::valueOf);     // static method
list.stream().map(Person::new);          // constructor

// Functional interfaces in java.util.function
Predicate<T>          // T -> boolean
Function<T, R>        // T -> R
Consumer<T>           // T -> void
Supplier<T>           // () -> T
UnaryOperator<T>      // T -> T
BinaryOperator<T>     // (T, T) -> T
BiFunction<T, U, R>   // (T, U) -> R
```

## Stream Creation

```java
// From collections
list.stream()
list.parallelStream()

// From values
Stream.of("a", "b", "c")
Stream.ofNullable(maybeNull)
IntStream.range(0, 10)          // 0..9
IntStream.rangeClosed(0, 10)    // 0..10

// Infinite
Stream.iterate(0, n -> n + 1).limit(10)
Stream.generate(Math::random).limit(5)

// From arrays
Arrays.stream(array)
```

## Intermediate Operations (lazy)

```java
stream
    .filter(x -> x > 0)           // Predicate
    .map(String::toUpperCase)     // Function
    .flatMap(List::stream)        // flatten nested streams
    .distinct()                   // unique elements
    .sorted()                     // natural order
    .sorted(Comparator.reverseOrder())
    .peek(System.out::println)    // debug, do not mutate
    .limit(10)                    // truncate
    .skip(5)                      // skip first n
    .takeWhile(x -> x < 10)       // Java 9+
    .dropWhile(x -> x < 10)       // Java 9+
    .mapToInt(Integer::intValue)  // to primitive stream
```

## Terminal Operations (eager)

```java
// Collect
List<String> result = stream.collect(Collectors.toList());
Set<String> set = stream.collect(Collectors.toSet());
Map<String, Integer> map = stream.collect(
    Collectors.toMap(Person::name, Person::age));

// Grouping
Map<String, List<Person>> byCity = people.stream()
    .collect(Collectors.groupingBy(Person::city));

Map<String, Long> countByCity = people.stream()
    .collect(Collectors.groupingBy(Person::city, Collectors.counting()));

// Joining
String csv = stream.collect(Collectors.joining(", "));

// Reduce
int sum = stream.reduce(0, Integer::sum);
Optional<Integer> max = stream.max(Integer::compare);
Optional<Integer> min = stream.min(Integer::compare);
long count = stream.count();

// Find
Optional<String> first = stream.findFirst();
Optional<String> any = stream.findAny();  // parallel-friendly

// Match
boolean anyMatch = stream.anyMatch(s -> s.startsWith("A"));
boolean allMatch = stream.allMatch(s -> s.length() > 0);
boolean noneMatch = stream.noneMatch(String::isBlank);

// Foreach
stream.forEach(System.out::println);
```

## Common Patterns

```java
// Flatten nested lists
List<String> flat = orders.stream()
    .flatMap(order -> order.items().stream())
    .map(Item::name)
    .toList();

// Top N
List<Person> top3 = people.stream()
    .sorted(Comparator.comparing(Person::salary).reversed())
    .limit(3)
    .toList();

// Partition
Map<Boolean, List<Person>> partitioned = people.stream()
    .collect(Collectors.partitioningBy(p -> p.age() >= 18));

// Custom collector
var collector = Collectors.teeing(
    Collectors.counting(),
    Collectors.summingInt(Person::age),
    (count, sumAge) -> (double) sumAge / count
);

// Java 16+ toList
List<String> list = stream.toList();  // immutable
```

## See Also

- [core.md](core.md) — collections, control flow
- [oop.md](oop.md) — functional interfaces
- [concurrency.md](concurrency.md) — parallel streams