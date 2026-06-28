# Java — OOP & Classes

## Class Basics

```java
public class Person {
    // Fields
    private final String name;
    private int age;

    // Constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Canonical constructor (record-like, Java 17+)
    // For regular classes, use Lombok or manual.

    // Method
    public String greet() { return "Hi, I'm " + name; }

    // Getter / Setter
    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }
}
```

## Records (Java 16+)

Immutable data carriers. Auto-generates constructor, accessors, equals, hashCode, toString.

```java
record Point(int x, int y) {
    // Compact constructor
    public Point {
        if (x < 0) throw new IllegalArgumentException();
    }

    // Instance method
    public Point scale(int factor) {
        return new Point(x * factor, y * factor);
    }

    // Static method
    public static Point origin() { return new Point(0, 0); }
}

var p = new Point(3, 4);
p.x(); p.y();  // accessor methods, not fields
```

## Inheritance

```java
// Single inheritance only
public class Animal {
    protected String name;

    public Animal(String name) { this.name = name; }

    public void speak() { System.out.println("..."); }
}

public class Dog extends Animal {
    public Dog(String name) { super(name); }

    @Override
    public void speak() { System.out.println("Woof!"); }
}

// Final class: cannot be extended
final class ImmutableThing { }

// Sealed classes (Java 17+): restrict which classes can extend
sealed class Shape permits Circle, Rectangle, Triangle { }
final class Circle extends Shape { }
non-sealed class Rectangle extends Shape { }
```

## Interfaces

```java
public interface Drawable {
    // Abstract method (implicitly public abstract)
    void draw();

    // Default method (Java 8+)
    default void debug() {
        System.out.println("Debug: " + this);
    }

    // Static method (Java 8+)
    static Drawable empty() { return () -> {}; }

    // Private method (Java 9+)
    private void helper() { }
}

// Functional interface (exactly one abstract method)
@FunctionalInterface
interface Transformer<T, R> {
    R transform(T input);
}

// Multiple interface implementation
class Circle implements Drawable, Comparable<Circle> {
    @Override public void draw() { }
    @Override public int compareTo(Circle o) { return 0; }
}
```

## Abstract Classes

```java
public abstract class Vehicle {
    protected String model;

    public Vehicle(String model) { this.model = model; }

    // Abstract method (no body)
    public abstract void start();

    // Concrete method
    public String getModel() { return model; }
}
```

## Access Modifiers

| Modifier | Class | Package | Subclass | World |
|---|---|---|---|---|
| `public` | ✓ | ✓ | ✓ | ✓ |
| `protected` | ✓ | ✓ | ✓ | ✗ |
| (default) | ✓ | ✓ | ✗ | ✗ |
| `private` | ✓ | ✗ | ✗ | ✗ |

## Object Methods

```java
public class Product {
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product p)) return false;
        return Objects.equals(name, p.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

    @Override
    public String toString() {
        return "Product[name=" + name + "]";
    }
}
```

## See Also

- [core.md](core.md) — syntax, types, collections
- [streams.md](streams.md) — Stream API, lambdas
- [concurrency.md](concurrency.md) — virtual threads