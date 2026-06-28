# href

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.href.html)

Returns a resolved URL path for the specified route.

```tsx
const h = href("/:lang?/about", { lang: "en" })
// -> `/en/about`

<Link to={href("/products/:id", { id: "abc123" })} />
```

