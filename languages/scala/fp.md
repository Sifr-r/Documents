# Scala — Functional Programming

## Pure Functions & Immutability

```scala
// Pure function — no side effects, same input → same output
def add(a: Int, b: Int): Int = a + b

// Immutable data (preferred)
val xs = List(1, 2, 3)        // cannot be modified
val ys = xs :+ 4              // new list, xs unchanged

// Avoid var and mutable collections in FP style
case class Config(host: String, port: Int)
val updated = Config("localhost", 8080).copy(port = 9090)
```

## Higher-Order Functions

```scala
// Functions as values
val double: Int => Int = _ * 2

// Taking functions as parameters
def apply(x: Int, f: Int => Int): Int = f(x)
apply(5, double) // 10

// Returning functions
def multiplier(factor: Int): Int => Int = _ * factor
val triple = multiplier(3)
triple(7) // 21

// Common HOFs on collections
List(1, 2, 3).map(_ * 2)           // List(2, 4, 6)
List(1, 2, 3).filter(_ > 1)        // List(2, 3)
List(List(1, 2), List(3)).flatten   // List(1, 2, 3)
List(1, 2, 3).flatMap(x => List(x, x * 10)) // List(1, 10, 2, 20, 3, 30)
```

## Currying & Partial Application

```scala
// Curried function
def add(a: Int)(b: Int): Int = a + b
add(3)(4) // 7

// Convert to curried form
val curriedAdd = (add _).curried   // Int => Int => Int
curriedAdd(3)(4)

// Partial application
val add5 = add(5) _   // Int => Int
add5(3) // 8

// Uncurry
val uncurried = Function.uncurried(curriedAdd)
uncurried(3, 4) // 7
```

## Function Composition

```scala
val double: Int => Int = _ * 2
val inc: Int => Int = _ + 1

// andThen — left to right
val doubleThenInc = double.andThen(inc)
doubleThenInc(5) // 11

// compose — right to left
val doubleAfterInc = double.compose(inc)
doubleAfterInc(5) // 12

// Chaining multiple
val transform: Int => Int =
  ((x: Int) => x + 1)
    .andThen(_ * 2)
    .andThen(_ - 3)
transform(10) // 19

// pipe operator (Scala 3 with import)
import scala.util.ChainingSyntax.*
val result = 5.pipe(double).pipe(inc) // 11
```

## Given/Using (Scala 3)

```scala
// Define a given instance
trait Ord[T]:
  def compare(a: T, b: T): Int

given intOrd: Ord[Int] with
  def compare(a: Int, b: Int): Int = a - b

// Using clause — compiler resolves automatically
def max[T](a: T, b: T)(using ord: Ord[T]): T =
  if ord.compare(a, b) >= 0 then a else b

max(3, 5) // 5 — intOrd resolved implicitly

// Context bounds (shorthand)
def sort[T: Ord](xs: List[T]): List[T] =
  xs.sortWith((a, b) => summon[Ord[T]].compare(a, b) < 0)

// Given imports
import scala.math.Ordering.given
```

## Extension Methods

```scala
// Add methods to existing types
extension (s: String)
  def words: List[String] = s.split("\\s+").toList
  def isPalindrome: Boolean = s == s.reverse

"hello world".words         // List("hello", "world")
"racecar".isPalindrome      // true

// With type parameters
extension [T](xs: List[T])
  def second: T = xs.tail.head
  def showAll(using s: Show[T]): String = xs.map(s.show).mkString(", ")

// Grouped extensions
extension (n: Int)
  def isEven: Boolean = n % 2 == 0
  def times(f: => Unit): Unit = (1 to n).foreach(_ => f)

3.times(println("hi")) // prints "hi" 3 times
```

## Opaque Types

```scala
// Type-safe wrappers with zero runtime overhead
object Domain:
  opaque type Email = String
  opaque type UserId = Int

  // Smart constructors
  def Email(s: String): Option[Email] =
    if s.contains("@") then Some(s) else None

  def UserId(id: Int): Option[UserId] =
    if id > 0 then Some(id) else None

  // Extension methods expose operations inside scope
  extension (e: Email)
    def value: String = e
    def domain: String = e.split("@")(1)

  extension (id: UserId)
    def value: Int = id

// Outside Domain object, Email and UserId are distinct types
import Domain.*
val email = Email("a@b.com").get
email.domain // "b.com"
// email.toUpperCase — won't compile, not a String here
```

## Type Classes Pattern

```scala
// 1. Define the type class
trait Show[T]:
  def show(value: T): String

// 2. Provide instances
object Show:
  def apply[T](using s: Show[T]): Show[T] = s

  given Show[Int] with
    def show(value: Int): String = value.toString

  given Show[Boolean] with
    def show(value: Boolean): String = if value then "yes" else "no"

  given listShow[T](using s: Show[T]): Show[List[T]] with
    def show(value: List[T]): String =
      value.map(s.show).mkString("[", ", ", "]")

// 3. Use via context bounds or extension
extension [T: Show](value: T)
  def show: String = Show[T].show(value)

42.show              // "42"
true.show            // "yes"
List(1, 2, 3).show   // "[1, 2, 3]"
```

## See Also

- [core.md](core.md) — values, pattern matching, case classes, Option/Either
- [collections.md](collections.md) — List, Vector, Map, Set, operations
