# Outlet

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.Outlet.html)

Renders the matching child route of a parent route or nothing if no child
route matches.

```tsx
import { Outlet } from "react-router";

export default function SomeParent() {
  return (
    <div>
      <h1>Parent Content</h1>
      
    </div>
  );
}
```

## Signature

```tsx
function Outlet(props: OutletProps): React.ReactElement | null
```

## Props

### context

Provides a context value to the element tree below the outlet. Use when
the parent route needs to provide values to child routes.

```tsx
<Outlet context={myContextValue} />
```

Access the context with [`useOutletContext`](../hooks/useOutletContext).

