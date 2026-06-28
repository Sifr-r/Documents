# Scala — Collections

## Immutable vs Mutable Collections

```scala
// Immutable (default, preferred)
import scala.collection.immutable.*
val xs = List(1, 2, 3)
val m  = Map("a" -> 1, "b" -> 2)

// Mutable (explicit import)
import scala.collection.mutable
val buf = mutable.ListBuffer(1, 2, 3)
buf += 4                        // modifies in place
val mmap = mutable.Map("a" -> 1)
mmap("b") = 2
```

## List

```scala
val xs = List(1, 2, 3)
val ys = 0 :: xs               // prepend: List(0, 1, 2, 3)
val zs = xs ++ List(4, 5)      // concat
xs.head                         // 1
xs.tail                         // List(2, 3)
xs.isEmpty                      // false
xs.length                       // 3
xs.reverse                      // List(3, 2, 1)
xs.take(2)                      // List(1, 2)
xs.drop(1)                      // List(2, 3)
xs.zip(List("a", "b", "c"))    // List((1,"a"), (2,"b"), (3,"c"))

// Pattern matching
xs match
  case Nil          => "empty"
  case head :: tail => s"head=$head"
```

## Vector

```scala
// O(1) amortized access, append, prepend
val v = Vector(1, 2, 3)
val v2 = v :+ 4                // append
val v3 = 0 +: v                // prepend
v(1)                            // index access: 2
v.updated(1, 99)               // Vector(1, 99, 3)

// Prefer Vector over List for large collections with random access
val big = Vector.fill(10000)(scala.util.Random.nextInt(100))
big(5000) // fast
```

## Set

```scala
val s = Set(1, 2, 3)
s.contains(2)                   // true
s + 4                           // Set(1, 2, 3, 4)
s - 2                           // Set(1, 3)

// Set operations
val a = Set(1, 2, 3)
val b = Set(2, 3, 4)
a ++ b                          // union: Set(1, 2, 3, 4)
a.intersect(b)                  // Set(2, 3)
a.diff(b)                       // Set(1)
a.subsetOf(b)                   // false

// Sorted set
import scala.collection.immutable.SortedSet
val ss = SortedSet(3, 1, 2)    // iteration order: 1, 2, 3
```

## Map

```scala
val m = Map("a" -> 1, "b" -> 2)
m("a")                          // 1
m.getOrElse("c", 0)            // 0
m + ("c" -> 3)                 // Map(a->1, b->2, c->3)
m - "a"                         // Map(b->2)
m.updated("a", 99)             // Map(a->99, b->2)
m.keys                          // Set(a, b)
m.values                        // Iterable(1, 2)
m.to(List)                      // List((a,1), (b,2))

// Sorted map
import scala.collection.immutable.SortedMap
val sm = SortedMap("c" -> 3, "a" -> 1, "b" -> 2)
// iteration order: a, b, c
```

## Common Operations

```scala
val xs = List(1, 2, 3, 4, 5)

// Transform
xs.map(_ * 2)                   // List(2, 4, 6, 8, 10)
xs.flatMap(x => List(x, -x))   // List(1,-1,2,-2,...)
xs.collect { case x if x > 3 => x * 10 } // List(40, 50)

// Filter
xs.filter(_ > 3)               // List(4, 5)
xs.filterNot(_ > 3)            // List(1, 2, 3)
xs.takeWhile(_ < 4)            // List(1, 2, 3)
xs.dropWhile(_ < 4)            // List(4, 5)
xs.partition(_ > 3)            // (List(4,5), List(1,2,3))

// Aggregate
xs.foldLeft(0)(_ + _)          // 15
xs.foldRight(0)(_ + _)         // 15
xs.reduce(_ + _)               // 15
xs.sum                          // 15
xs.product                      // 120
xs.min / xs.max                 // 1 / 5

// Group
xs.groupBy(_ % 2)              // Map(0 -> List(2,4), 1 -> List(1,3,5))
xs.groupMap(_ % 2)(_ * 10)     // Map(0 -> List(20,40), 1 -> List(10,30,50))
xs.sliding(3).toList            // List(List(1,2,3), List(2,3,4), List(3,4,5))
```

## Views & Lazy Collections

```scala
// View — lazy, avoids intermediate allocations
val result = (1 to 1000000).view
  .map(_ * 2)
  .filter(_ > 100)
  .take(5)
  .toList                        // only computes what's needed

// LazyList — infinite lazy sequences
val fibs: LazyList[BigInt] =
  BigInt(0) #:: BigInt(1) #:: fibs.zip(fibs.tail).map(_ + _)
fibs.take(10).toList

// Iterator — single-pass lazy traversal
val it = Iterator.from(1).map(_ * 2)
it.take(5).toList               // List(2, 4, 6, 8, 10)
```

## Parallel Collections

```scala
// Scala 2.13+ requires separate module
import scala.collection.parallel.CollectionConverters.*

val xs = (1 to 1000000).par     // convert to parallel collection
xs.map(_ * 2).sum               // parallel map + reduce
xs.filter(_ % 2 == 0).size

// Use with caution — overhead matters only for large collections
// Not available in Scala 3 standard library (use external module)
```

## See Also

- [core.md](core.md) — values, pattern matching, for-comprehensions
- [fp.md](fp.md) — higher-order functions, function composition, type classes
