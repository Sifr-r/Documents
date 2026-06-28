# Groovy

Dynamic JVM language with scripting, DSL support, and Gradle integration.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, closures, collections, GDK extensions |

## Quick Reference

```groovy
// def for dynamic typing
def name = "Alice"
def numbers = [1, 2, 3]

// Closures
def greet = { name -> "Hello, $name" }
def double = { it * 2 }  // implicit 'it'

// Collection methods
numbers.each { println it }
numbers.collect { it * 2 }
numbers.findAll { it > 1 }
numbers.inject(0) { sum, n -> sum + n }

// String interpolation
def msg = "Hello ${name}"

// Safe navigation
def length = obj?.text?.length()

// Elvis operator
def val = maybe ?: "default"

// Maps
def map = [a: 1, b: 2]
map.a  // property access
```