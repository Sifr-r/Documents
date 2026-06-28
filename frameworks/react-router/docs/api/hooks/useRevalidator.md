# useRevalidator

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useRevalidator.html)

Revalidate the data on the page for reasons outside of normal data mutations
like [`Window` focus](https://developer.mozilla.org/en-US/docs/Web/API/Window/focus_event)
or polling on an interval.

Note that page data is already revalidated automatically after actions.
If you find yourself using this for normal CRUD operations on your data in
response to user interactions, you're probably not taking advantage of the
other APIs like [`useFetcher`](../hooks/useFetcher), [`Form`](../components/Form), [`useSubmit`](../hooks/useSubmit) that do
this automatically.

```tsx
import { useRevalidator } from "react-router";

function WindowFocusRevalidator() {
  const revalidator = useRevalidator();

  useFakeWindowFocus(() => {
    revalidator.revalidate();
  });

  return (
    <div hidden={revalidator.state === "idle"}>
      Revalidating...
    </div>
  );
}
```

## Signature

```tsx
function useRevalidator(): {
  revalidate: () => Promise<void>;
  state: DataRouter["state"]["revalidation"];
}
```

## Returns

An object with a `revalidate` function and the current revalidation
`state`

