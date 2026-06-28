# Web Platform

Browser-native web technologies: HTML, CSS, and Web APIs. Covers standards
supported across modern browsers (Chrome, Firefox, Safari, Edge).

> **Source:** This documentation is primarily sourced and adapted from the [MDN Web Docs content repository](https://github.com/mdn/content).

## Topics

| File | Description |
|---|---|
| [html.md](html.md) | Elements, attributes, forms, semantic markup, accessibility |
| [css.md](css.md) | Selectors, layout, flexbox, grid, custom properties, animations |
| [web-apis.md](web-apis.md) | DOM, fetch, storage, Web Workers, observers |
| [mdn/](mdn/) | **Complete MDN Web Docs Reference (12,000+ API entries)** |

## Quick Reference

```html
<!-- Semantic structure -->
<header>, <nav>, <main>, <article>, <section>, <aside>, <footer>

<!-- Form validation -->
<input required minlength="3" pattern="[A-Za-z]+" />

<!-- Lazy loading -->
<img loading="lazy" src="photo.jpg" alt="Description" />
```

```css
/* Modern layout */
.container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1rem;
}

/* Custom properties */
:root {
  --color-primary: #3b82f6;
  --spacing: 1rem;
}
.card { padding: var(--spacing); color: var(--color-primary); }
```

```js
// Fetch with abort
const ctrl = new AbortController();
fetch(url, { signal: ctrl.signal }).then(r => r.json());
setTimeout(() => ctrl.abort(), 5000);

// Intersection Observer
const obs = new IntersectionObserver(entries => {
  entries.forEach(e => { if (e.isIntersecting) loadMore(); });
});
obs.observe(document.querySelector('#sentinel'));
```
