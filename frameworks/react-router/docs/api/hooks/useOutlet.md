# useOutlet

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useOutlet.html)

Returns the element for the child route at this level of the route
hierarchy. Used internally by [``](../components/Outlet) to render child
routes.

## Signature

```tsx
function useOutlet(context?: unknown): React.ReactElement | null
```

## Params

### context

The context to pass to the outlet

## Returns

The child route element or `null` if no child routes match

