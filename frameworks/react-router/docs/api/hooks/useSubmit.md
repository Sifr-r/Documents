# useSubmit

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useSubmit.html)

The imperative version of [``](../components/Form) that lets you submit a form
from code instead of a user interaction.

```tsx
import { useSubmit } from "react-router";

function SomeComponent() {
  const submit = useSubmit();
  return (
    <Form onChange={(event) => submit(event.currentTarget)} />
  );
}
```

## Signature

```tsx
function useSubmit(): SubmitFunction
```

## Returns

A function that can be called to submit a [`Form`](../components/Form) imperatively.

