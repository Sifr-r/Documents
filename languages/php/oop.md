# PHP — Object-Oriented Programming

## Classes & Constructor Promotion

```php
class User
{
    // Constructor promotion (PHP 8.0+)
    public function __construct(
        public readonly string $id,       // promoted + readonly
        public string $name,
        public ?int $age = null,
        private bool $active = true,
    ) {}

    public function isActive(): bool
    {
        return $this->active;
    }
}

$user = new User(id: 'u1', name: 'Ada', age: 30);
echo $user->name;  // 'Ada'
```

## Typed Properties (PHP 7.4+)

```php
class Product
{
    public string $name;           // must be initialized before access
    public ?float $price = null;   // nullable with default
    public readonly string $sku;   // write-once, can only be set from constructor or declaration

    // Typed static property
    public static int $count = 0;
}
```

## Readonly Classes (PHP 8.2+)

```php
readonly class Config
{
    public function __construct(
        public string $host,
        public int $port,
        public bool $debug = false,
    ) {}
}

$config = new Config('localhost', 8080);
$config->host = 'other';  // Error: readonly property
```

## Inheritance & Abstract Classes

```php
abstract class Model
{
    protected string $table;

    public function __construct(
        protected readonly \PDO $db,
    ) {}

    abstract public function toArray(): array;

    public function find(int $id): array
    {
        $stmt = $this->db->prepare(
            "SELECT * FROM {$this->table} WHERE id = ?"
        );
        $stmt->execute([$id]);
        return $stmt->fetch();
    }
}

class User extends Model
{
    protected string $table = 'users';

    public function toArray(): array
    {
        return ['table' => $this->table];
    }
}
```

## Interfaces

```php
interface Jsonable
{
    public function toJson(int $flags = 0): string;
}

interface Arrayable
{
    public function toArray(): array;
}

class User implements Jsonable, Arrayable
{
    public function __construct(
        public string $name,
        public int $age,
    ) {}

    public function toJson(int $flags = 0): string
    {
        return json_encode($this->toArray(), $flags);
    }

    public function toArray(): array
    {
        return ['name' => $this->name, 'age' => $this->age];
    }
}
```

## Traits

Horizontal code reuse — mix methods into classes.

```php
trait HasTimestamps
{
    public \DateTimeImmutable $createdAt;
    public \DateTimeImmutable $updatedAt;

    public function touch(): void
    {
        $this->updatedAt = new \DateTimeImmutable();
    }

    abstract public function tableName(): string;
}

class Post
{
    use HasTimestamps;

    public function tableName(): string
    {
        return 'posts';
    }
}
```

## Enums (PHP 8.1+)

```php
// Pure enum
enum Status
{
    case Draft;
    case Published;
    case Archived;
}

// Backed enum
enum Role: string
{
    case Admin = 'admin';
    case Editor = 'editor';
    case Viewer = 'viewer';

    public function label(): string
    {
        return match ($this) {
            self::Admin => 'Administrator',
            self::Editor => 'Content Editor',
            self::Viewer => 'Read-only Viewer',
        };
    }
}

$role = Role::from('admin');   // throws ValueError if not found
$role = Role::tryFrom('admin'); // null if not found
$roles = Role::cases();         // all cases
```

## Static Methods & Late Static Binding

```php
class Base
{
    public static function who(): string
    {
        return static::class;  // late static binding
    }

    public static function create(): static
    {
        return new static();   // return type of late-bound class
    }
}

class Child extends Base {}

echo Base::who();   // 'Base'
echo Child::who();  // 'Child' — resolved at runtime
```

## Magic Methods

```php
class Container
{
    private array $data = [];

    public function __construct(array $data = [])
    {
        $this->data = $data;
    }

    public function __get(string $name): mixed
    {
        return $this->data[$name] ?? null;
    }

    public function __set(string $name, mixed $value): void
    {
        $this->data[$name] = $value;
    }

    public function __isset(string $name): bool
    {
        return isset($this->data[$name]);
    }

    public function __toString(): string
    {
        return json_encode($this->data);
    }

    public function __call(string $name, array $args): mixed
    {
        if (str_starts_with($name, 'get')) {
            $key = lcfirst(substr($name, 3));
            return $this->data[$key] ?? null;
        }
        throw new \BadMethodCallException("Method $name not found");
    }
}
```

## Final

`final` prevents class extension or method override.

```php
final class ImmutableValue
{
    public function __construct(
        public readonly string $value,
    ) {}
}

class Service
{
    final public function critical(): void
    {
        // subclasses cannot override this
    }
}
```

## See Also

- [core.md](core.md) — types, control flow, match expression
- [composer.md](composer.md) — dependency management, autoloading