# useLocation

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useLocation.html)

Returns the current [`Location`](https://api.reactrouter.com/v7/interfaces/react-router.Location.html). This can be useful if you'd like to
perform some side effect whenever it changes.

```tsx
import * as React from 'react'
import { useLocation } from 'react-router'

function SomeComponent() {
  let location = useLocation()

  React.useEffect(() => {
    // Google Analytics
    ga('send', 'pageview')
  }, [location]);

  return (
    // ...
  );
}
```

## Signature

```tsx
function useLocation(): Location
```

