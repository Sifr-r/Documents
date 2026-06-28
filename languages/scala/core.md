# Scala — Core Syntax & Types

## Values & Variables

```scala
val x = 42          // immutable (preferred)
var y = 42          // mutable (avoid when possible)
lazy val z = heavy() // computed on first access

// Type annotations
val name: String = "Alice"
val numbers: List[Int] = List(1, 2, 3)

// Significant indentation (Scala 3, optional braces)
def greet(name: String): String =
  val msg = s"Hello, $name"
  msg.toUpperCase
```

## Case Classes

```scala
// Immutable data, auto-gen: equals, hashCode, toString, copy, apply, unapply
case class User(name: String, age: Int, email: Option[String] = None)

val user = User("Alice", 30)
val older = user.copy(age = 31) // non-destructive mutation
user match
  case User(n, a, _) => s"$n is $a"

// Enum (Scala 3)
enum Color:
  case Red, Green, Blue
  case Custom(hex: String)

// Enum with methods
enum Status(val code: Int):
  case Active extends Status(1)
  case Inactive extends Status(0)
```

## Pattern Matching

```scala
// Match on values
x match
  case 1 => "one"
  case 2 => "two"
  case _ => "other"

// Match on types
obj match
  case s: String => s"string: $s"
  case i: Int    => s"int: $i"
  case _         => "unknown"

// Match on case classes
shape match
  case Circle(r)        => math.Pi * r * r
  case Rectangle(w, h)  => w * h

// Guards
n match
  case n if n < 0  => "negative"
  case 0           => "zero"
  case n if n > 0  => "positive"

// Match on collections
list match
  case Nil              => "empty"
  case head :: Nil      => s"single: $head"
  case head :: tail     => s"head: $head, rest: $tail"
```

## Option, Either, Try

```scala
// Option — no null
val maybe: Option[Int] = Some(42)
val none: Option[Int] = None
maybe.getOrElse(0)           // 42
maybe.map(_ * 2)             // Some(84)
maybe.flatMap(x => Some(x + 1))
maybe.filter(_ > 0)
maybe.exists(_ == 42)
maybe.fold("none")(_.toString)

// Either — typed errors
def divide(a: Int, b: Int): Either[String, Int] =
  if b == 0 then Left("div by zero") else Right(a / b)

divide(10, 2) match
  case Right(v) => s"Result: $v"
  case Left(e)  => s"Error: $e"

// Try — exception handling
import scala.util.Try
val result = Try("42".toInt) // Success(42)
result.getOrElse(0)
result.toOption
```

## For-Comprehensions

```scala
// Syntactic sugar for flatMap/map/filter
val result = for
  x <- List(1, 2, 3)
  y <- List(10, 20)
  if x + y > 15
yield (x, y)

// With Option
val combined = for
  a <- maybeGetUser()
  b <- maybeGetOrder(a.id)
yield (a, b)

// With Either
val validated = for
  name <- validateName(input)
  age  <- validateAge(input)
yield User(name, age)

// With Future
val response = for
  user  <- fetchUser(id)
  posts <- fetchPosts(user.id)
yield (user, posts)
```

## Traits & Sealed Types

```scala
trait Drawable:
  def draw(): Unit
  def area: Double // abstract val

trait Loggable:
  def log(msg: String): Unit = println(s"[LOG] $msg") // concrete method

class Circle(r: Double) extends Drawable with Loggable:
  def draw(): Unit = println(s"Circle($r)")
  def area: Double = math.Pi * r * r

// Sealed — all subtypes known at compile time
sealed trait Result[+T]
case class Success[T](value: T) extends Result[T]
case class Failure(msg: String) extends Result[Nothing]
```

## See Also

- [fp.md](fp.md) — given/using, extension methods, type classes
- [collections.md](collections.md) — List, Vector, Map, Set, operations