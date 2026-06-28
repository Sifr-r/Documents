# createHashRouter

## Signature

```tsx
function createHashRouter(
  routes: RouteObject[],
  opts?: DOMRouterOpts,
): DataRouter
```

## Params

### routes

Application routes

### opts.basename

Basename path for the application.

### opts.future

Future flags to enable for the router.

### opts.getContext

A function that returns an [`RouterContextProvider`](../utils/RouterContextProvider) instance
which is provided as the `context` argument to client [`action`](../../start/data/route-object#action)s,
[`loader`](../../start/data/route-object#loader)s and [middleware](../../how-to/middleware).
This function is called to generate a fresh `context` instance on each
navigation or fetcher call.

```tsx
import {
  createContext,
  RouterContextProvider,
} from "react-router";

const apiClientContext = createContext();

function createBrowserRouter(routes, {
  getContext() {
    let context = new RouterContextProvider();
    context.set(apiClientContext, getApiClient());
    return context;
  }
})
```

### opts.hydrationData

When Server-Rendering and opting-out of automatic hydration, the
`hydrationData` option allows you to pass in hydration data from your
server-render. This will almost always be a subset of data from the
[`StaticHandlerContext`](https://api.reactrouter.com/v7/interfaces/react-router.StaticHandlerContext.html) value you get back from the [`StaticHandler`](https://api.reactrouter.com/v7/interfaces/react-router.StaticHandler.html)'s
`query` method:

```tsx
const router = createBrowserRouter(routes, {
  hydrationData: {
    loaderData: {
      // [routeId]: serverLoaderData
    },
    // may also include `errors` and/or `actionData`
  },
});
```

**Partial Hydration Data**

You will almost always include a complete set of `loaderData` to hydrate a
server-rendered app. But in advanced use-cases (such as Framework Mode's
[`clientLoader`](../../start/framework/route-module#clientLoader)), you may
want to include `loaderData` for only some routes that were loaded/rendered
on the server. This allows you to hydrate _some_ of the routes (such as the
app layout/shell) while showing a `HydrateFallback` component and running
the [`loader`](../../start/data/route-object#loader)s for other routes
during hydration.

A route [`loader`](../../start/data/route-object#loader) will run during
hydration in two scenarios:

 1. No hydration data is provided
    In these cases the `HydrateFallback` component will render on initial
    hydration
 2. The `loader.hydrate` property is set to `true`
    This allows you to run the [`loader`](../../start/data/route-object#loader)
    even if you did not render a fallback on initial hydration (i.e., to
    prime a cache with hydration data)

```tsx
const router = createBrowserRouter(
  [
    {
      id: "root",
      loader: rootLoader,
      Component: Root,
      children: [
        {
          id: "index",
          loader: indexLoader,
          HydrateFallback: IndexSkeleton,
          Component: Index,
        },
      ],
    },
  ],
  {
    hydrationData: {
      loaderData: {
        root: "ROOT DATA",
        // No index data provided
      },
    },
  }
);
```

### opts.instrumentations

## Params (part 2)

Array of instrumentation objects allowing you to instrument the router and
individual routes prior to router initialization (and on any subsequently
added routes via `route.lazy` or `patchRoutesOnNavigation`).  This is
mostly useful for observability such as wrapping navigations, fetches,
as well as route loaders/actions/middlewares with logging and/or performance
tracing.  See the [docs](../../how-to/instrumentation) for more information.

```tsx
let router = createBrowserRouter(routes, {
  instrumentations: [logging]
});

let logging = {
  router({ instrument }) {
    instrument({
      navigate: (impl, info) => logExecution(`navigate ${info.to}`, impl),
      fetch: (impl, info) => logExecution(`fetch ${info.to}`, impl)
    });
  },
  route({ instrument, id }) {
    instrument({
      middleware: (impl, info) => logExecution(
        `middleware ${info.request.url} (route ${id})`,
        impl
      ),
      loader: (impl, info) => logExecution(
        `loader ${info.request.url} (route ${id})`,
        impl
      ),
      action: (impl, info) => logExecution(
        `action ${info.request.url} (route ${id})`,
        impl
      ),
    })
  }
};

async function logExecution(label: string, impl: () => Promise<void>) {
  let start = performance.now();
  console.log(`start ${label}`);
  await impl();
  let duration = Math.round(performance.now() - start);
  console.log(`end ${label} (${duration}ms)`);
}
```

### opts.dataStrategy

Override the default data strategy of running loaders in parallel -
see the [docs](../../how-to/data-strategy) for more information.

```tsx
let router = createBrowserRouter(routes, {
  async dataStrategy({
    matches,
    request,
    runClientMiddleware,
  }) {
    const matchesToLoad = matches.filter((m) =>
      m.shouldCallHandler(),
    );

    const results: Record<string, DataStrategyResult> = {};
    await runClientMiddleware(() =>
      Promise.all(
        matchesToLoad.map(async (match) => {
          results[match.route.id] = await match.resolve();
        }),
      ),
    );
    return results;
  },
});
```

### opts.patchRoutesOnNavigation

Lazily define portions of the route tree on navigations.
See [`PatchRoutesOnNavigationFunction`](https://api.reactrouter.com/v7/types/react-router.PatchRoutesOnNavigationFunction.html).

By default, React Router wants you to provide a full route tree up front via
`createBrowserRouter(routes)`. This allows React Router to perform synchronous
route matching, execute loaders, and then render route components in the most
optimistic manner without introducing waterfalls. The tradeoff is that your
initial JS bundle is larger by definition — which may slow down application
start-up times as your application grows.

