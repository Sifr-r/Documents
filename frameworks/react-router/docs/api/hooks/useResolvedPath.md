# useResolvedPath

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useResolvedPath.html)

Resolves the pathname of the given `to` value against the current
[`Location`](https://api.reactrouter.com/v7/interfaces/react-router.Location.html). Similar to [`useHref`](../hooks/useHref), but returns a
[`Path`](https://api.reactrouter.com/v7/interfaces/react-router.Path.html) instead of a string.

```tsx
import { useResolvedPath } from "react-router";

function SomeComponent() {
  // if the user is at /dashboard/profile
  let path = useResolvedPath("../accounts");
  path.pathname; // "/dashboard/accounts"
  path.search; // ""
  path.hash; // ""
}
```

## Signature

```tsx
function useResolvedPath(
  to: To,
  {
    relative,
  }: {
    relative?: RelativeRoutingType;
  } = ,
): Path {}
```

## Params

### to

The path to resolve

### options.relative

Defaults to `"route"` so routing is relative to the route tree.                         Set to `"path"` to make relative routing operate against path segments.

