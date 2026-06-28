# useNavigation

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useNavigation.html)

Returns the current [`Navigation`](https://api.reactrouter.com/v7/types/react-router.Navigation.html), defaulting to an "idle" navigation
when no navigation is in progress. You can use this to render pending UI
(like a global spinner) or read [`FormData`](https://developer.mozilla.org/en-US/docs/Web/API/FormData)
from a form navigation.

```tsx
import { useNavigation } from "react-router";

function SomeComponent() {
  let navigation = useNavigation();
  navigation.state;
  navigation.formData;
  // etc.
}
```

## Signature

```tsx
function useNavigation(): UseNavigationResult
```

