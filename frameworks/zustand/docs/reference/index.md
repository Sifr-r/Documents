# Reference

## APIs

Core functions for creating and configuring stores.

- [`create`](./apis/create.md) — Create a store bound to React via hooks.
- [`createStore`](./apis/create-store.md) — Create a standalone store without React.
- [`createWithEqualityFn`](./apis/create-with-equality-fn.md) — Like `create`, but with a custom equality function.
- [`shallow`](./apis/shallow.md) — Utility for shallow comparison of objects and arrays.

## Hooks

React hooks for reading and subscribing to store state.

- [`useStore`](./hooks/use-store.md) — Access and subscribe to a vanilla store from a React component.
- [`useStoreWithEqualityFn`](./hooks/use-store-with-equality-fn.md) — Like `useStore`, but with a custom equality function.
- [`useShallow`](./hooks/use-shallow.md) — Derive a stable reference from a selector using shallow comparison.

## Middlewares

Composable middleware functions for extending store behavior.

- [`persist`](./middlewares/persist.md) — Persist and rehydrate state using `localStorage` or a custom storage engine.
- [`devtools`](./middlewares/devtools.md) — Connect a store to Redux DevTools for time-travel debugging.
- [`redux`](./middlewares/redux.md) — Use a reducer and dispatch pattern similar to Redux.
- [`immer`](./middlewares/immer.md) — Write state updates with mutable syntax using Immer.
- [`combine`](./middlewares/combine.md) — Combine separate state slices into a single store with inferred types.
- [`subscribeWithSelector`](./middlewares/subscribe-with-selector.md) — Subscribe to a slice of state with selector and equality support.

## Integrations

In-depth guides for using Zustand alongside third-party libraries.

- [Persisting store data](./integrations/persisting-store-data.md) — Detailed guide to the `persist` middleware and storage adapters.
- [Immer middleware](./integrations/immer-middleware.md) — Detailed guide to the `immer` middleware.
- [Third-party libraries](./integrations/third-party-libraries.md) — Using Zustand with other libraries in the ecosystem.

## Migrations

Upgrade guides between major versions.

- [Migrating to v5](./migrations/migrating-to-v5.md) — How to upgrade from Zustand v4.
- [Migrating to v4](./migrations/migrating-to-v4.md) — How to upgrade from Zustand v3.

## Previous versions

APIs that existed in older versions of Zustand and are no longer recommended for new code.

- [createContext (v3)](./previous-versions/zustand-v3-create-context.md) — The `createContext` export from `zustand/context`, deprecated in v4 and removed in v5.

