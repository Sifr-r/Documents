# PHP — Core Syntax & Types

## Type System

PHP has a dynamic type system with optional strict typing via `declare(strict_types=1)`.

### Scalar Types

| Type | Description | Example |
|---|---|---|
| `bool` | Boolean | `true`, `false` |
| `int` | Integer (platform-dependent, usually 64-bit) | `42`, `-7`, `0xFF` |
| `float` | IEEE 754 double | `3.14`, `1.5e-3` |
| `string` | Byte string | `"hello"`, `'world'` |

### Compound Types

| Type | Description | Example |
|---|---|---|
| `array` | Ordered map (can be list or dict) | `[1, 2, 3]`, `['a' => 1]` |
| `object` | Class instance | `new User()` |
| `callable` | Function, method, closure, invocable | `'strlen'`, `[$obj, 'method']` |
| `iterable` | Array or Traversable | `[1, 2, 3]`, `new ArrayIterator()` |

### Special Types

| Type | Description |
|---|---|
| `null` | The null type — `null` |
| `void` | Return type for no return |
| `never` | Return type for functions that exit/throw |
| `mixed` | Any type (PHP 8.0+) |
| `resource` | External resource handle |

```php
declare(strict_types=1);

function add(int $a, int $b): int {
    return $a + $b;
}

add(1, 2);     // 3
add('1', '2'); // TypeError in strict mode
```

## Type Declarations

```php
function example(
    string $name,           // required string
    ?int $age = null,       // nullable int with default
    bool $active = true,    // bool with default
    string|int $id,         // union type (PHP 8.0+)
    mixed $data = null,     // mixed (any type, PHP 8.0+)
): string|false {           // union return type
    return $name;
}
```

## Variables

```php
$name = 'Ada';              // always prefixed with $
$$name = 'dynamic';         // variable variables — $Ada = 'dynamic'

// Constants
const APP_NAME = 'MyApp';   // compile-time (class/global)
define('APP_VERSION', '2.0'); // runtime (global only)

// Null coalescing (PHP 7+)
$val = $_GET['key'] ?? 'default';
$val = $a ?? $b ?? $c;      // chainable

// Null coalescing assignment (PHP 7.4+)
$cache[$key] ??= compute($key);
```

## Arrays

```php
// Indexed arrays
$list = [1, 2, 3];
$list = array(1, 2, 3);     // old syntax

// Associative arrays
$map = ['a' => 1, 'b' => 2];

// Spread operator (PHP 7.4+)
$merged = [...$defaults, ...$overrides];

// Destructuring
[$a, $b] = [1, 2];           // positional
['a' => $a, 'b' => $b] = $map; // associative

// Common functions
count($list);                 // length
array_map(fn($n) => $n * 2, $list);
array_filter($list, fn($n) => $n > 1);
array_reduce($list, fn($carry, $n) => $carry + $n, 0);
in_array(2, $list);           // contains check
array_key_exists('a', $map);  // key exists
array_keys($map);             // keys
array_values($map);           // values
```

## Control Flow

```php
// if / elseif / else
if ($x > 0) {
    echo 'positive';
} elseif ($x < 0) {
    echo 'negative';
} else {
    echo 'zero';
}

// foreach
foreach ($items as $item) { }
foreach ($map as $key => $value) { }

// for
for ($i = 0; $i < 10; $i++) { }

// while
while ($condition) { }
```

## Match Expression (PHP 8.0+)

Strict comparison (`===`) with exhaustiveness check. Returns a value.

```php
$code = match ($status) {
    200, 201 => 'ok',
    404 => 'not found',
    500 => 'server error',
    default => 'unknown',
};

// Match with conditions
$range = match (true) {
    $age < 13 => 'child',
    $age < 18 => 'teen',
    $age < 65 => 'adult',
    default => 'senior',
};
```

## String Interpolation

```php
$name = 'Ada';
"Hello, $name";          // "Hello, Ada"
"Hello, {$name}!";       // "Hello, Ada!"
"Count: {$obj->count()}"; // method calls need braces

// Heredoc (like double-quoted)
$text = <<<SQL
SELECT * FROM users
WHERE name = '$name'
SQL;

// Nowdoc (like single-quoted — no interpolation)
$text = <<<'SQL'
SELECT * FROM users
WHERE name = '$name'
SQL;
```

## Arrow Functions (PHP 7.4+)

Single-expression closures that capture variables by value.

```php
$factor = 2;
$doubled = array_map(fn($n) => $n * $factor, [1, 2, 3]);
// [2, 4, 6]

// Equivalent to:
$doubled = array_map(function($n) use ($factor) {
    return $n * $factor;
}, [1, 2, 3]);
```

## Nullsafe Operator (PHP 8.0+)

```php
// Short-circuits to null if any intermediate value is null
$city = $user?->getAddress()?->getCity();

// Equivalent to:
if ($user !== null) {
    $address = $user->getAddress();
    if ($address !== null) {
        $city = $address->getCity();
    }
}
```

## See Also

- [oop.md](oop.md) — classes, interfaces, traits, enums, magic methods
- [composer.md](composer.md) — dependency management, autoloading