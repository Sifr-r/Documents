# useAsyncError

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useAsyncError.html)

Returns the rejection value from the closest [``](../components/Await).

```tsx
import { Await, useAsyncError } from "react-router";

function ErrorElement() {
  const error = useAsyncError();
  return (
    <p>Uh Oh, something went wrong! {error.message}</p>
  );
}

// somewhere in your app
<Await
  resolve={promiseThatRejects}
  errorElement={}
/>;
```

## Signature

```tsx
function useAsyncError(): unknown
```

## Returns

The error that was thrown in the nearest [`Await`](../components/Await) component

