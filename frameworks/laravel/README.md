# Laravel

Laravel 11+ is a PHP web framework with expressive, elegant syntax. It features Eloquent ORM, Blade templating, a powerful CLI (Artisan), queue system, event broadcasting, and first-party packages for authentication and API development.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Routing, controllers, Eloquent ORM, Blade templates, middleware, service container, events, queues, validation, authentication, and Artisan |

## Quick Reference

### Project Setup

```bash
composer create-project laravel/laravel myapp
cd myapp
php artisan migrate
php artisan serve
```

### Routing

```php
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index']);
Route::get('/users/{id}', function (int $id) {
    return User::findOrFail($id);
});

Route::middleware(['auth'])->group(function () {
    Route::resource('posts', PostController::class);
});
```

### Eloquent Model

```php
class Post extends Model
{
    protected $fillable = ['title', 'body', 'user_id'];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }
}
```

### Controller

```php
class PostController extends Controller
{
    public function index()
    {
        $posts = Post::with('user')->latest()->paginate(15);
        return view('posts.index', compact('posts'));
    }

    public function store(StorePostRequest $request)
    {
        $post = auth()->user()->posts()->create($request->validated());
        return redirect()->route('posts.show', $post);
    }
}
```

### Blade Template

```blade
@extends('layouts.app')

@section('content')
  @foreach ($posts as $post)
    <article>
      <h2><a href="{{ route('posts.show', $post) }}">{{ $post->title }}</a></h2>
      <p>{{ Str::limit($post->body, 150) }}</p>
    </article>
  @endforeach
  {{ $posts->links() }}
@endsection
```

### Validation

```php
$request->validate([
    'title' => 'required|string|max:255',
    'body' => 'required|min:10',
    'email' => 'required|email|unique:users,email',
]);
```

### Artisan Commands

```bash
php artisan make:model Post -m -c -r
php artisan make:migration create_posts_table
php artisan make:controller PostController --resource
php artisan migrate
php artisan tinker
php artisan queue:work
```

## See Also

- [Laravel Documentation](https://laravel.com/docs)
- [Laravel GitHub](https://github.com/laravel/laravel)
- [Laravel API Reference](https://laravel.com/api/master/)
- [Laracasts](https://laracasts.com/)
