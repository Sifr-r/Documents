# Java — Core Syntax & Types

## Primitive Types

| Type | Size | Range | Wrapper |
|---|---|---|---|
| `byte` | 8-bit | -128 to 127 | `Byte` |
| `short` | 16-bit | ±32,767 | `Short` |
| `int` | 32-bit | ±2.1B | `Integer` |
| `long` | 64-bit | ±9.2e18 | `Long` |
| `float` | 32-bit | IEEE 754 | `Float` |
| `double` | 64-bit | IEEE 754 | `Double` |
| `boolean` | JVM-dep | `true`/`false` | `Boolean` |
| `char` | 16-bit | 0 to 65,535 (UTF-16) | `Character` |

```java
// Autoboxing / unboxing
Integer boxed = 42;          // auto-box
int unboxed = boxed;         // auto-unbox
Integer nullBox = null;
int npe = nullBox;           // NullPointerException!

// Unsigned operations (Java 8+)
int unsigned = Integer.parseUnsignedInt("4294967295");
String hex = Integer.toUnsignedString(255, 16); // "ff"
```

## Reference Types

```java
String s = "hello";
String s2 = new String("hello"); // don't do this
s.equals(s2);   // true — use .equals(), not ==
s == s2;        // false — reference comparison

// String methods
s.length(); s.charAt(0); s.substring(1, 3);
s.contains("ll"); s.startsWith("he"); s.endsWith("lo");
s.indexOf("l"); s.lastIndexOf("l");
s.toUpperCase(); s.toLowerCase(); s.trim();
s.replace("l", "x"); s.replaceAll("\\d", "");
s.split(","); String.join(",", array);

// StringBuilder (mutable, non-thread-safe)
var sb = new StringBuilder();
sb.append("hello").append(" world");
sb.toString();
```

## Control Flow

```java
// Enhanced for (for-each)
for (var item : items) { }

// Switch (Java 14+ arrow syntax)
switch (day) {
    case MONDAY, FRIDAY -> System.out.println("busy");
    case SUNDAY -> System.out.println("rest");
    default -> System.out.println("meh");
}

// Switch expression (Java 14+)
int numLetters = switch (day) {
    case MONDAY, FRIDAY, SUNDAY -> 6;
    case TUESDAY -> 7;
    default -> { yield day.toString().length(); }
};

// Try-with-resources (auto-close)
try (var reader = new BufferedReader(new FileReader(path))) {
    return reader.readLine();
}
```

## Collections Framework

```java
// Immutable factories (Java 9+)
List<String> list = List.of("a", "b", "c");
Set<Integer> set = Set.of(1, 2, 3);
Map<String, Integer> map = Map.of("a", 1, "b", 2);
Map.ofEntries(Map.entry("a", 1), Map.entry("b", 2));

// Common operations
list.size(); list.get(0); list.contains("a");
list.forEach(System.out::println);

// List implementations
var arrayList = new ArrayList<String>();    // fast random access
var linkedList = new LinkedList<String>();  // fast insert/delete

// Map
var map = new HashMap<String, Integer>();
map.put("key", 1);
map.get("key");           // null if absent
map.getOrDefault("key", 0);
map.containsKey("key");
map.computeIfAbsent("key", k -> 0);

// Set
var set = new HashSet<String>();
set.add("a"); set.contains("a"); set.remove("a");

// Queue / Deque
var queue = new ArrayDeque<String>();
queue.offer("first");     // enqueue
queue.poll();             // dequeue (null if empty)
queue.peek();             // peek (null if empty)
```

## Exception Handling

```java
// Checked vs unchecked
// Checked: extends Exception (must catch or declare)
// Unchecked: extends RuntimeException (optional)

try {
    risky();
} catch (IOException | SQLException e) {  // multi-catch (Java 7+)
    log.error("Failed", e);
} finally {
    cleanup();
}

// Try-with-resources with multiple
try (var in = new FileInputStream(src);
     var out = new FileOutputStream(dst)) {
    in.transferTo(out);  // Java 9+
}

// Custom exception
class MyException extends RuntimeException {
    public MyException(String msg) { super(msg); }
}
```

## See Also

- [oop.md](oop.md) — classes, inheritance, interfaces
- [streams.md](streams.md) — Stream API, lambdas, collectors
- [concurrency.md](concurrency.md) — virtual threads, executors