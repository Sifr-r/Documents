# Groovy — Core Syntax

## def and Dynamic Typing

```groovy
def name = "Alice"      // String inferred
def age = 30            // Integer inferred
def pi = 3.14           // BigDecimal
def list = [1, 2, 3]    // ArrayList

// Typed variables (still valid)
String greeting = "Hello"
int count = 0

// Dynamic dispatch — method resolved at runtime
def process(obj) {
    obj.doWork()  // no compile-time check needed
}
```

## Strings

```groovy
// GString — string interpolation with ${}
def name = "Ada"
def msg = "Hello, ${name}"          // GString
def expr = "Sum: ${1 + 2}"          // "Sum: 3"
def lazy = "Value: ${-> expensive()}"  // lazy evaluation

// Single-quoted — plain String (no interpolation)
def plain = 'No interpolation here: $name'

// Triple-quoted — multiline
def multiline = """
    Hello,
    ${name}!
"""

// Triple single-quoted — multiline, no interpolation
def raw = '''
    Line 1
    Line 2
'''

// Slashy strings (regex-friendly)
def pattern = /\d+\.\d+/
```

## Collections

```groovy
// Lists
def nums = [1, 2, 3]
nums << 4                  // append
nums[0]                    // access
nums[-1]                   // last element
nums[1..2]                 // sublist

// Maps (keys are strings by default)
def map = [name: "Ada", age: 30]
map.name                   // property access
map['name']                // bracket access
map.city = "London"        // add entry

// Ranges
def range = 1..10          // inclusive
def halfOpen = 1..<10      // exclusive
('a'..'z').each { print it }
```

## Closures

```groovy
// Basic closure
def greet = { name -> "Hello, $name" }
greet("Ada")  // "Hello, Ada"

// Implicit 'it' parameter (single-arg closures)
def double = { it * 2 }
double(21)  // 42

// Multiple parameters
def add = { a, b -> a + b }

// Closure as last argument (trailing closure syntax)
[1, 2, 3].each { println it }

// Delegate — closure can access owner object's properties
def builder = {
    name = "Ada"  // sets on delegate, not local
}
```

## GDK Collection Methods

```groovy
def nums = [1, 2, 3, 4, 5]

// each — iterate
nums.each { println it }
nums.eachWithIndex { val, idx -> println "$idx: $val" }

// collect — map/transform
nums.collect { it * 2 }           // [2, 4, 6, 8, 10]

// find — first match
nums.find { it > 3 }              // 4

// findAll — all matches
nums.findAll { it > 3 }           // [4, 5]

// inject — reduce/fold
nums.inject(0) { sum, n -> sum + n }  // 15

// any / every — boolean checks
nums.any { it > 4 }               // true
nums.every { it > 0 }             // true

// groupBy / sort
nums.groupBy { it % 2 == 0 ? 'even' : 'odd' }
nums.sort { a, b -> b <=> a }    // descending
```

## Operators

```groovy
// Safe navigation — returns null instead of NullPointerException
def length = obj?.name?.length()

// Elvis operator — provide default if null/false
def val = maybeNull ?: "default"
def name = user?.name ?: "Anonymous"

// Spread operator — invoke method on each element
def lengths = ["hello", "world"]*.length()  // [5, 5]
def results = objects*.process()

// Power operator
2 ** 10   // 1024

// Spaceship operator (comparison)
"a" <=> "b"   // -1
5 <=> 5        // 0

// Range membership
5 in 1..10    // true
```

## Builders

```groovy
import groovy.xml.MarkupBuilder

// XML builder
def writer = new StringWriter()
def xml = new MarkupBuilder(writer)
xml.users {
    user(id: 1) {
        name("Alice")
        age(30)
    }
    user(id: 2) {
        name("Bob")
        age(25)
    }
}
// <users><user id='1'><name>Alice</name><age>30</age></user>...</users>

// StreamingMarkupBuilder — for large documents
import groovy.xml.StreamingMarkupBuilder
def builder = new StreamingMarkupBuilder()
def result = builder.bind { mkp.xmlDeclaration() /* ... */ }
```

## Regular Expressions

```groovy
// ==~ — exact match (entire string must match)
"hello123" ==~ /\w+/         // true
"hello 123" ==~ /\w+/       // false (space)

// =~ — find matcher (returns Matcher object)
def matcher = "cat bat hat" =~ /\w+at/
matcher.count                 // 3
matcher[0]                    // "cat"

// find / findAll on strings
"hello 123 world 456".findAll(/\d+/)   // ["123", "456"]
"hello 123".find(/\d+/)                // "123"

// replaceAll / replaceFirst
"abc 123 def 456".replaceAll(/\d+/, "#")   // "abc # def #"
"abc 123 def 456".replaceFirst(/\d+/, "#") // "abc # def 456"
```

## AST Transformations

Compile-time code generation via annotations.

```groovy
import groovy.transform.*

// @Immutable — makes class immutable, generates equals/hashCode/toString
@Immutable
class Point {
    double x, y
}
def p = new Point(1.0, 2.0)
// p.x = 3  // ReadOnlyPropertyException

// @Delegate — forward method calls to a field
class EnhancedList {
    @Delegate List<String> items = []
}
def el = new EnhancedList()
el.add("hello")      // delegates to items.add()
el.size()            // delegates to items.size()

// @Builder — fluent builder pattern
@Builder
class User {
    String name
    int age
}
def user = User.builder().name("Ada").age(30).build()

// @ToString, @EqualsAndHashCode, @TupleConstructor
@ToString(includeNames = true)
@EqualsAndHashCode
class Item { String name; double price }
```

## See Also

- [README.md](README.md) — overview and quick reference
