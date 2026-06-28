# Laravel — Core

## Routing

```php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PostController;

// Basic routes
Route::get('/posts', [PostController::class, 'index']);
Route::post('/posts', [PostController::class, 'store']);
Route::get('/posts/{post}', [PostController::class, 'show']);

// Route parameters
Route::get('/users/{user}/posts/{post}', function (User $user, Post $post) {
    return $post;
});

// Named routes
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

// Route groups
Route::middleware(['auth', 'verified'])->prefix('admin')->name('admin.')->group(function () {
    Route::get('/', [AdminController::class, 'index'])->name('home');
    Route::resource('users', AdminUserController::class);
});

// Resource routes
Route::resource('posts', PostController::class);
Route::apiResource('posts', PostController::class); // API (no create/edit)

// Fallback
Route::fallback(fn () => response('Not Found', 404));
```

## Controllers

```php
class PostController extends Controller
{
    public function __construct(
        private PostRepository $posts
    ) {}

    public function index()
    {
        $posts = $this->posts->latest()->paginate(15);
        return view('posts.index', compact('posts'));
    }

    public function store(StorePostRequest $request)
    {
        $post = $this->posts->create($request->validated());
        return redirect()->route('posts.show', $post)->with('success', 'Post created.');
    }

    public function update(UpdatePostRequest $request, Post $post)
    {
        $post->update($request->validated());
        return back()->with('success', 'Post updated.');
    }

    public function destroy(Post $post)
    {
        $this->authorize('delete', $post);
        $post->delete();
        return redirect()->route('posts.index');
    }
}

// API Controller
class Api\PostController extends Controller
{
    public function index()
    {
        return PostResource::collection(Post::paginate(15));
    }

    public function store(Request $request)
    {
        $post = Post::create($request->validate([
            'title' => 'required|string|max:255',
            'body' => 'required|string',
        ]));
        return new PostResource($post);
    }
}
```

## Eloquent ORM

### Models

```php
class Post extends Model
{
    protected $fillable = ['title', 'body', 'published_at'];
    protected $casts = ['published_at' => 'datetime', 'metadata' => 'array'];
    protected $hidden = ['password'];
    protected $appends = ['excerpt'];

    public function getExcerptAttribute(): string
    {
        return Str::limit($this->body, 100);
    }

    // Relationships
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function comments(): HasMany
    {
        return $this->hasMany(Comment::class);
    }

    public function tags(): BelongsToMany
    {
        return $this->belongsToMany(Tag::class)->withTimestamps();
    }

    // Scopes
    public function scopePublished(Builder $query): Builder
    {
        return $query->whereNotNull('published_at')->where('published_at', '<=', now());
    }

    public function scopeSearch(Builder $query, string $term): Builder
    {
        return $query->where('title', 'like', "%{$term}%");
    }
}
```

### Queries

```php
// Eager loading
Post::with(['user', 'comments.user'])->get();
Post::withCount('comments')->get();

// Filtering
Post::where('published', true)->orderByDesc('created_at')->take(10)->get();
Post::whereBetween('views', [100, 1000])->get();
Post::whereHas('comments', fn ($q) => $q->where('approved', true))->get();

// Aggregation
Post::where('published', true)->count();
Post::avg('views');
Post::where('user_id', 1)->max('views');

// Bulk operations
Post::where('old_field', true)->update(['new_field' => 'value']);
Post::insert([['title' => 'A'], ['title' => 'B']]);

// Soft deletes
$post->delete();
Post::withTrashed()->get();
Post::onlyTrashed()->get();
$post->restore();
```

## Blade Templates

```blade
{{-- Layouts --}}
@extends('layouts.app')
@section('title', 'Posts')
@section('content')
  @forelse ($posts as $post)
    <article>
      <h2>{{ $post->title }}</h2>
      <p>{{ Str::limit($post->body, 150) }}</p>
      <a href="{{ route('posts.show', $post) }}">Read more</a>
    </article>
  @empty
    <p>No posts found.</p>
  @endforelse
@endsection

{{-- Components --}}
<x-alert type="success" :message="$flash" />
<x-card>
  <x-slot:header>Card Title</x-slot:header>
  Card body content
</x-card>

{{-- Directives --}}
@auth
  <p>Logged in as {{ auth()->user()->name }}</p>
@else
  <a href="{{ route('login') }}">Login</a>
@endauth

@if ($errors->any())
  <ul>
    @foreach ($errors->all() as $error)
      <li>{{ $error }}</li>
    @endforeach
  </ul>
@endif

@csrf
@method('PUT')
{{ route('posts.show', ['post' => $post]) }}
{{ url('/posts') }}
{{ asset('css/app.css') }}
```

## Middleware

```php
class EnsureAdmin
{
    public function handle(Request $request, Closure $next): Response
    {
        if (! $request->user()?->isAdmin()) {
            abort(403);
        }
        return $next($request);
    }
}

// Registration in bootstrap/app.php
->withMiddleware(function (Middleware $middleware) {
    $middleware->alias(['admin' => EnsureAdmin::class]);
    $middleware->web(append: [TrackVisits::class]);
})

// Usage
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin', [AdminController::class, 'index']);
});
```

## Service Container and Providers

```php
// Service Provider
class PaymentServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->singleton(PaymentGateway::class, function ($app) {
            return new StripeGateway(config('services.stripe.secret'));
        });
    }

    public function boot(): void
    {
        //
    }
}

// Resolving
$gateway = app(PaymentGateway::class);
$gateway = resolve(PaymentGateway::class);

// Constructor injection (automatic)
class OrderController extends Controller
{
    public function __construct(private PaymentGateway $gateway) {}
}
```

## Events and Listeners

```php
// Event
class OrderPlaced
{
    public function __construct(public Order $order) {}
}

// Listener
class SendOrderConfirmation
{
    public function handle(OrderPlaced $event): void
    {
        Mail::to($event->order->user)->send(new OrderConfirmation($event->order));
    }
}

// Dispatching
OrderPlaced::dispatch($order);
event(new OrderPlaced($order));

// In EventServiceProvider
protected $listen = [
    OrderPlaced::class => [SendOrderConfirmation::class, UpdateInventory::class],
];
```

## Queues and Jobs

```php
class ProcessPayment implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $tries = 3;
    public $backoff = [10, 60, 300];

    public function __construct(public Order $order) {}

    public function handle(PaymentGateway $gateway): void
    {
        $gateway->charge($this->order);
    }

    public function failed(Throwable $exception): void
    {
        $this->order->markAsFailed();
    }
}

// Dispatching
ProcessPayment::dispatch($order);
ProcessPayment::dispatch($order)->delay(now()->addMinutes(5));
ProcessPayment::dispatchSync($order);
```

```bash
php artisan queue:work --tries=3
php artisan queue:work --queue=high,default
php artisan queue:failed
php artisan queue:retry all
```

## Validation (FormRequest)

```php
class StorePostRequest extends FormRequest
{
    public function authorize(): bool
    {
        return $this->user()->can('create', Post::class);
    }

    public function rules(): array
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'body' => ['required', 'min:10'],
            'tags' => ['nullable', 'array'],
            'tags.*' => ['exists:tags,id'],
            'image' => ['nullable', 'image', 'max:2048'],
        ];
    }

    public function messages(): array
    {
        return ['title.required' => 'A title is required.'];
    }
}
```

## Authentication

### Sanctum (API tokens)

```php
// Issue token
$token = $user->createToken('api-token')->plainTextToken;

// Protect routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', fn (Request $request) => $request->user());
});

// Revoke
$user->currentAccessToken()->delete();
$user->tokens()->delete();
```

### Policies

```php
class PostPolicy
{
    public function update(User $user, Post $post): bool
    {
        return $user->id === $post->user_id;
    }

    public function delete(User $user, Post $post): bool
    {
        return $user->id === $post->user_id || $user->isAdmin();
    }
}

// In controller
$this->authorize('update', $post);

// In Blade
@can('update', $post)
  <a href="{{ route('posts.edit', $post) }}">Edit</a>
@endcan
```

## Artisan Commands

```php
class SendReminders extends Command
{
    protected $signature = 'reminders:send {--force}';
    protected $description = 'Send reminder emails';

    public function handle(): void
    {
        $users = User::where('reminded', false)->get();
        $this->info("Sending {$users->count()} reminders...");

        $users->each(function ($user) {
            ReminderMail::send($user);
            $user->update(['reminded' => true]);
        });

        $this->info('Done.');
    }
}
```

Common commands:

```bash
php artisan make:model Post -m -c -r -f -s   # Model, migration, controller, resource, factory, seeder
php artisan make:middleware EnsureAdmin
php artisan make:event OrderPlaced
php artisan make:job ProcessPayment
php artisan make:request StorePostRequest
php artisan make:policy PostPolicy
php artisan db:seed
php artisan config:cache
php artisan route:list
```

## See Also

- [Laravel Documentation](https://laravel.com/docs)
- [Eloquent ORM](https://laravel.com/docs/eloquent)
- [Laravel Sanctum](https://laravel.com/docs/sanctum)
- [Laravel GitHub](https://github.com/laravel/laravel)
