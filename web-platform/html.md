# HTML

## Document Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
</head>
<body>
  <!-- content -->
</body>
</html>
```

## Semantic Elements

| Element | Purpose |
|---|---|
| `<header>` | Introductory content or nav |
| `<nav>` | Major navigation links |
| `<main>` | Dominant content (one per page) |
| `<article>` | Self-contained composition |
| `<section>` | Thematic grouping with heading |
| `<aside>` | Tangentially related content |
| `<footer>` | Footer for section or page |
| `<figure>` / `<figcaption>` | Self-contained media + caption |

## Forms

```html
<form action="/submit" method="POST" novalidate>
  <!-- Text inputs -->
  <input type="text" name="username" required minlength="3" maxlength="20"
         pattern="[A-Za-z0-9]+" autocomplete="username" />

  <input type="email" name="email" required />
  <input type="password" name="password" required minlength="8" />
  <input type="number" name="age" min="0" max="150" step="1" />
  <input type="url" name="website" />
  <input type="tel" name="phone" pattern="[0-9]{10}" />

  <!-- Date / time -->
  <input type="date" name="dob" />
  <input type="datetime-local" name="meeting" />

  <!-- Selection -->
  <select name="country" required>
    <option value="">Select...</option>
    <option value="us">United States</option>
  </select>

  <!-- Radio group -->
  <fieldset>
    <legend>Plan</legend>
    <label><input type="radio" name="plan" value="free" /> Free</label>
    <label><input type="radio" name="plan" value="pro" /> Pro</label>
  </fieldset>

  <!-- Checkbox -->
  <label><input type="checkbox" name="agree" required /> I agree</label>

  <!-- File -->
  <input type="file" name="avatar" accept="image/*" multiple />

  <button type="submit">Submit</button>
</form>
```

## Accessibility (ARIA)

```html
<!-- Landmarks -->
<nav aria-label="Main navigation">...</nav>

<!-- Interactive elements -->
<button aria-expanded="false" aria-controls="menu">Menu</button>
<div id="menu" role="menu" hidden>...</div>

<!-- Live regions -->
<div aria-live="polite" aria-atomic="true">
  <!-- Screen reader announces changes -->
</div>

<!-- Images -->
<img src="chart.png" alt="Sales chart: Q1 up 20%, Q2 up 15%" />
<!-- Decorative: alt="" (empty string) -->

<!-- Form labels -->
<label for="email">Email address</label>
<input id="email" type="email" aria-describedby="email-hint" />
<span id="email-hint">We'll never share your email.</span>
```

## Key Meta Tags

```html
<meta name="description" content="Page description (150-160 chars)" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="theme-color" content="#3b82f6" />
<meta property="og:title" content="Open Graph Title" />
<meta property="og:image" content="https://example.com/image.jpg" />
<link rel="canonical" href="https://example.com/page" />
```

## Script Loading

```html
<!-- Blocks parsing, executes in order -->
<script src="app.js"></script>

<!-- Async: downloads in parallel, executes ASAP (order not guaranteed) -->
<script async src="analytics.js"></script>

<!-- Defer: downloads in parallel, executes after HTML parsing (order preserved) -->
<script defer src="app.js"></script>

<!-- ES Module -->
<script type="module" src="app.js"></script>
```

## See Also

- [css.md](css.md) — styling and layout
- [web-apis.md](web-apis.md) — DOM manipulation, events
