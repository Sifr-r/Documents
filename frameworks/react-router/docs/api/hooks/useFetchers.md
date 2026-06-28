# useFetchers

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useFetchers.html)

Returns an array of all in-flight [`Fetcher`](https://api.reactrouter.com/v7/types/react-router.Fetcher.html)s. This is useful for components
throughout the app that didn't create the fetchers but want to use their submissions
to participate in optimistic UI.

```tsx
import { useFetchers } from "react-router";

function SomeComponent() {
  const fetchers = useFetchers();
  fetchers[0].formData; // FormData
  fetchers[0].state; // etc.
  // ...
}
```

## Signature

```tsx
function useFetchers(): (Fetcher & {
  key: string;
})[]
```

