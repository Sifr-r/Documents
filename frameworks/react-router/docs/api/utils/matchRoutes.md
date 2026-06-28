# matchRoutes

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.matchRoutes.html)

Matches the given routes to a location and returns the match data.

```tsx
import { matchRoutes } from "react-router";

let routes = [{
  path: "/",
  Component: Root,
  children: [{
    path: "dashboard",
    Component: Dashboard,
  }]
}];

matchRoutes(routes, "/dashboard"); // [rootMatch, dashboardMatch]
```

## Signature

```tsx
function matchRoutes<RouteObjectType extends RouteObject = RouteObject>(
  routes: RouteObjectType[],
  locationArg: Partial | string,
  basename = "/",
): RouteMatch<string, RouteObjectType>[] | null
```

## Params

### routes

The array of route objects to match against.

### locationArg

The location to match against, either a string path or a partial [`Location`](https://api.reactrouter.com/v7/interfaces/react-router.Location.html) object

### basename

Optional base path to strip from the location before matching. Defaults to `/`.

## Returns

An array of matched routes, or `null` if no matches were found.

