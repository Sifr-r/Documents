# C# — LINQ

Language Integrated Query (LINQ) — a set of extension methods on `IEnumerable<T>` and `IQueryable<T>` for querying data in a declarative, composable way.

## Query Syntax vs Method Syntax

| Style | Example | Notes |
|---|---|---|
| Query syntax | `from x in src where x > 5 select x` | SQL-like, limited to a subset of operators |
| Method syntax | `src.Where(x => x > 5)` | Lambda-based, full operator set, preferred for complex queries |

Query syntax compiles to method syntax. Use whichever is more readable for the scenario.

```csharp
// Query syntax (compiles to same IL as method syntax below)
var q1 = from p in products
         where p.Price > 100
         orderby p.Name
         select p.Name;

// Method syntax (equivalent)
var q2 = products
    .Where(p => p.Price > 100)
    .OrderBy(p => p.Name)
    .Select(p => p.Name);
```

## Common Operators

### Filtering & Projection

```csharp
// Where — filter elements
var expensive = products.Where(p => p.Price > 100);

// Select — transform each element
var names = products.Select(p => p.Name);

// SelectMany — flatten nested collections
var tags = posts.SelectMany(p => p.Tags); // IEnumerable<string>
var withIndex = products.Select((p, i) => new { p.Name, Index = i });
```

### Ordering & Grouping

```csharp
// OrderBy / OrderByDescending / ThenBy
var sorted = products
    .OrderBy(p => p.Category)
    .ThenByDescending(p => p.Price);

// GroupBy — keyed groups
var groups = products.GroupBy(p => p.Category);
foreach (var grp in groups)
{
    Console.WriteLine($"{grp.Key}: {grp.Count()}");
}

// GroupBy with projection
var summary = products.GroupBy(
    p => p.Category,
    p => p.Price,
    (key, prices) => new { Category = key, Avg = prices.Average() }
);
```

### Joins

```csharp
// Join — inner join
var result = from p in products
             join c in categories on p.CategoryId equals c.Id
             select new { p.Name, Category = c.Name };

// Method syntax
var result2 = products.Join(categories,
    p => p.CategoryId,
    c => c.Id,
    (p, c) => new { p.Name, Category = c.Name }
);

// GroupJoin — left outer join with grouping
var result3 = from c in categories
              join p in products on c.Id equals p.CategoryId into g
              select new { c.Name, Count = g.Count() };

// Zip — pair elements positionally
var pairs = names.Zip(prices, (n, p) => $"{n}: {p}");
```

### Aggregation & Set Operations

```csharp
var count = products.Count(p => p.Price > 50);
var sum = products.Sum(p => p.Price);
var avg = products.Average(p => p.Price);
var min = products.Min(p => p.Price);
var max = products.Max(p => p.Price);

// Aggregate — custom accumulation
var total = products.Aggregate(0.0m, (acc, p) => acc + p.Price);

// Set operations
var distinct = products.Select(p => p.Category).Distinct();
var union = list1.Union(list2);
var intersect = list1.Intersect(list2);
var except = list1.Except(list2);
```

### Element & Quantifier Operations

```csharp
var first = products.First(p => p.Price > 100);       // throws if none
var firstOr = products.FirstOrDefault(p => p.Price > 100); // default if none
var single = products.Single(p => p.Id == 42);         // throws if 0 or >1
var any = products.Any(p => p.Stock == 0);              // bool
var all = products.All(p => p.Price > 0);               // bool
var contains = products.Contains(specificProduct);
```

## Deferred Execution

LINQ queries are **not evaluated** until they are enumerated. This allows query composition without intermediate allocations.

```csharp
// Nothing executed yet — just builds the expression tree
var query = products.Where(p => p.Price > 100).OrderBy(p => p.Name);

// Execution happens here (foreach, ToList, ToArray, etc.)
var results = query.ToList();

// Re-evaluates on each enumeration — may yield different results
foreach (var p in query) { } // runs query
foreach (var p in query) { } // runs query again

// Force immediate execution
var array = query.ToArray();
var list = query.ToList();
var dict = query.ToDictionary(p => p.Id);
```

## IQueryable vs IEnumerable

| | `IEnumerable<T>` | `IQueryable<T>` |
|---|---|---|
| Where defined | `System.Collections.Generic` | `System.Linq` (via `IQueryable`) |
| Execution | In-memory (LINQ to Objects) | Translated to a remote query (e.g., SQL) |
| Expression trees | Uses compiled delegates | Uses expression trees, inspected by provider |
| Typical use | In-memory collections | Entity Framework Core, remote data sources |

```csharp
// IQueryable — builds expression tree, executes on the database
IQueryable<Product> dbQuery = dbContext.Products.Where(p => p.Price > 100);
// SQL: SELECT * FROM Products WHERE Price > 100

// IEnumerable — pulls data into memory, then filters
IEnumerable<Product> memQuery = dbContext.Products.AsEnumerable().Where(p => p.Price > 100);
// SQL: SELECT * FROM Products (all rows), then filter in-memory — BAD

// Always filter before materializing
var good = dbContext.Products.Where(p => p.Price > 100).ToList();   // SQL-side filter
var bad = dbContext.Products.ToList().Where(p => p.Price > 100);    // in-memory filter
```

## EF Core Patterns

```csharp
// Eager loading — include related entities
var orders = dbContext.Orders
    .Include(o => o.Customer)
    .Include(o => o.Items).ThenInclude(i => i.Product)
    .Where(o => o.Date >= startDate)
    .ToList();

// Select projection — avoids pulling unnecessary columns
var summaries = dbContext.Orders
    .Where(o => o.Date >= startDate)
    .Select(o => new { o.Id, o.Customer.Name, Total = o.Items.Sum(i => i.Price) })
    .ToList();

// Split query — avoids cartesian explosion with multiple Includes
var orders = dbContext.Orders
    .Include(o => o.Customer)
    .Include(o => o.Items)
    .AsSplitQuery()
    .ToList();

// Pagination
var page = dbContext.Products
    .OrderBy(p => p.Name)
    .Skip((pageNum - 1) * pageSize)
    .Take(pageSize)
    .ToList();

// Raw SQL with LINQ
var results = dbContext.Products
    .FromSql($"SELECT * FROM Products WHERE Price > {minPrice}")
    .ToList();
```

## See Also

- [core.md](core.md) — types, collections, pattern matching
- [async.md](async.md) — async/await, IAsyncEnumerable