# useAsyncValue

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useAsyncValue.html)

Returns the resolved promise value from the closest [``](../components/Await).

```tsx
function SomeDescendant() {
  const value = useAsyncValue();
  // ...
}

// somewhere in your app
<Await resolve={somePromise}>
  
;
```

## Signature

```tsx
function useAsyncValue(): unknown
```

## Returns

The resolved value from the nearest [`Await`](../components/Await) component

