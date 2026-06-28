# useRoutes

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useRoutes.html)

Hook version of [``](../components/Routes) that uses objects instead of
components. These objects have the same properties as the component props.
The return value of `useRoutes` is either a valid React element you can use
to render the route tree, or `null` if nothing matched.

```tsx
import { useRoutes } from "react-router";

function App() {
  let element = useRoutes([
    {
      path: "/",
      element: ,
      children: [
        {
          path: "messages",
          element: ,
        },
        { path: "tasks", element:  },
      ],
    },
    { path: "team", element:  },
  ]);

  return element;
}
```

## Signature

```tsx
function useRoutes(
  routes: RouteObject[],
  locationArg?: Partial | string,
): React.ReactElement | null
```

## Returns

A React element to render the matched route, or `null` if no routes matched

