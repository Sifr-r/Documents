# CSS

## Selectors

```css
/* Basic */
.class { }
#id { }
element { }
* { } /* universal */

/* Combinators */
parent > child { }       /* direct child */
ancestor descendant { }  /* any descendant */
prev + next { }          /* immediate next sibling */
prev ~ siblings { }      /* all following siblings */

/* Attribute */
[attr] { }
[attr="value"] { }
[attr^="pre"] { }   /* starts with */
[attr$="fix"] { }   /* ends with */
[attr*="sub"] { }   /* contains */

/* Pseudo-classes */
:hover, :focus, :active, :visited
:first-child, :last-child, :nth-child(odd), :nth-of-type(2)
:not(selector)
:has(selector)       /* parent selector (modern browsers) */
:is(selector, list)  /* specificity of highest in list */
:where(selector, list) /* zero specificity */

/* Pseudo-elements */
::before, ::after
::placeholder
::selection
```

## Specificity (0-0-0)

| Selector | Specificity |
|---|---|
| `*` | 0-0-0 |
| `div` | 0-0-1 |
| `.class` | 0-1-0 |
| `#id` | 1-0-0 |
| `style=""` | 1-0-0-0 (inline) |
| `!important` | Overrides all (avoid) |

## Box Model

```css
/* Default: content-box — width = content width */
/* Recommended: border-box — width = content + padding + border */
*,
*::before,
*::after {
  box-sizing: border-box;
}
```

## Flexbox

```css
.container {
  display: flex;
  flex-direction: row | column;
  justify-content: center | space-between | space-around;
  align-items: center | stretch | flex-start;
  flex-wrap: wrap;
  gap: 1rem;
}

.item {
  flex: 1;            /* grow */
  flex: 1 0 200px;    /* grow shrink basis */
  align-self: center; /* override parent align-items */
  order: -1;          /* reorder (avoid for a11y) */
}
```

## Grid

```css
.container {
  display: grid;
  grid-template-columns: 1fr 2fr 1fr;
  grid-template-columns: repeat(3, 1fr);
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-template-rows: auto 1fr auto;
  gap: 1rem;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
}

.item {
  grid-column: 1 / 3;     /* span 2 columns */
  grid-column: span 2;     /* same */
  grid-row: 2;
  grid-area: header;       /* named area */
}
```

## Custom Properties (Variables)

```css
:root {
  --color-primary: #3b82f6;
  --color-primary-dark: #2563eb;
  --radius: 0.5rem;
  --spacing: 1rem;
}

.button {
  background: var(--color-primary);
  border-radius: var(--radius);
  padding: var(--spacing) calc(var(--spacing) * 2);
}

.button:hover {
  /* Fallback if var not defined */
  background: var(--color-primary-dark, #1d4ed8);
}
```

## Responsive Design

```css
/* Mobile-first: base styles for small screens, media queries for larger */

/* Breakpoints */
@media (min-width: 640px) { }  /* sm */
@media (min-width: 768px) { }  /* md */
@media (min-width: 1024px) { } /* lg */
@media (min-width: 1280px) { } /* xl */

/* Container query (modern browsers) */
@container (min-width: 400px) {
  .card { display: flex; }
}

/* Prefers */
@media (prefers-color-scheme: dark) { }
@media (prefers-reduced-motion: reduce) { }

/* Fluid typography */
h1 { font-size: clamp(1.5rem, 4vw, 3rem); }

/* Responsive image */
img { max-width: 100%; height: auto; }
```

## Animations & Transitions

```css
/* Transition */
.button {
  transition: background 200ms ease, transform 150ms ease;
}
.button:hover {
  background: var(--color-primary-dark);
  transform: scale(1.05);
}

/* Keyframe animation */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to   { opacity: 1; transform: translateY(0); }
}
.card {
  animation: fadeIn 300ms ease both;
}
/* animation: name duration easing delay count direction fill-mode */
```

## See Also

- [html.md](html.md) — semantic HTML, accessibility
- [web-apis.md](web-apis.md) — CSSOM, getComputedStyle, matchMedia
