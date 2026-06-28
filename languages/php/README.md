# PHP

Modern PHP (8.2+) reference. Covers PHP-FPM, types, and Laravel/Symfony ecosystem.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Syntax, types, arrays, control flow, match expression |
| [oop.md](oop.md) | Classes, interfaces, traits, enums, magic methods |
| [composer.md](composer.md) | Dependency management, autoloading, PSR-4 |

## Quick Reference

```php
// Typed properties (PHP 7.4+)
class User {
    public string $name;
    public ?int $age = null;
    public readonly string $id;
}

// Match expression (PHP 8.0+)
$result = match ($status) {
    200, 201 => 'ok',
    400 => 'bad request',
    404 => 'not found',
    default => 'unknown',
};

// Named arguments (PHP 8.0+)
function createUser(string $name, int $age = 18, bool $admin = false) {}
createUser(name: 'Ada', admin: true);

// Enums (PHP 8.1+)
enum Status: string {
    case Draft = 'draft';
    case Published = 'published';
    case Archived = 'archived';
}

// Nullsafe operator (PHP 8.0+)
$city = $user?->getAddress()?->city;

// Arrow functions (PHP 7.4+)
$doubled = array_map(fn($n) => $n * 2, [1, 2, 3]);

// Attributes (PHP 8.0+)
#[Route('/api/users', methods: ['GET'])]
function listUsers() {}
```