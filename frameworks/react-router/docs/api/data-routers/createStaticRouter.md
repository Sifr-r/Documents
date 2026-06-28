# createStaticRouter

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.createStaticRouter.html)

Create a static [`DataRouter`](https://api.reactrouter.com/v7/interfaces/react-router.DataRouter.html) for server-side rendering

```tsx
export async function handleRequest(request: Request) {
  let { query, dataRoutes } = createStaticHandler(routes);
  let context = await query(request);

  if (context instanceof Response) {
    return context;
  }

  let router = createStaticRouter(dataRoutes, context);
  return new Response(
    ReactDOMServer.renderToString(<StaticRouterProvider ... />),
    { headers: { "Content-Type": "text/html" } }
  );
}
```

## Signature

```tsx
function createStaticRouter(
  routes: RouteObject[],
  context: StaticHandlerContext,
  opts: {
    branches?: RouteBranch[];
    future?: Partial;
  } = ,
): DataRouter {}
```

