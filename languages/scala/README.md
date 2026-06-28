# Scala

Scala 3 reference. Covers functional programming, the collections framework, and the advanced type system.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, case classes, pattern matching, for-comprehensions |
| [fp.md](fp.md) | Pure functions, given/using, extension methods, opaque types |
| [collections.md](collections.md) | Immutable/mutable collections, common operations, views |

## Quick Reference

```scala
// val vs var
val x = 42          // immutable
var y = 42          // mutable

// Case class
case class Person(name: String, age: Int)

// Pattern matching
value match
  case 1 => "one"
  case n if n > 0 => "positive"
  case _ => "other"

// Option
val name: Option[String] = maybeUser.map(_.name)
val result = maybeValue.getOrElse("default")

// Either
def divide(a: Int, b: Int): Either[String, Int] =
  if b == 0 then Left("div by 0") else Right(a / b)

// For-comprehension
val result = for
  x <- Some(1)
  y <- Some(2)
yield x + y

// Given/using (Scala 3)
def sort[A](list: List[A])(using ord: Ordering[A]): List[A] = list.sorted

// Extension method
extension (s: String) def greet: String = s"Hello, $s"
```