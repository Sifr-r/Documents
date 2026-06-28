# Zustand

Zustand documentation library.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Comparison | [docs/learn/getting-started/comparison.md](docs/learn/getting-started/comparison.md) | Zustand is one of many state management libraries for React. On this page we will discuss Zustand in comparison to so... |
| Introduction | [docs/learn/getting-started/introduction.md](docs/learn/getting-started/introduction.md) | A small, fast, and scalable bearbones state management solution. Zustand has a comfy API based on hooks. It isn't boi... |
| Advanced TypeScript Guide | [docs/learn/guides/advanced-typescript.md](docs/learn/guides/advanced-typescript.md) | The difference when using TypeScript is that instead of writing `create(...)`, you have to write `create()(...)` (not... |
| Auto Generating Selectors | [docs/learn/guides/auto-generating-selectors.md](docs/learn/guides/auto-generating-selectors.md) | We recommend using selectors when using either the properties or actions from the store. You can access values from t... |
| Beginner TypeScript Guide | [docs/learn/guides/beginner-typescript.md](docs/learn/guides/beginner-typescript.md) | Zustand is a lightweight state manager, particularly used with React. Zustand avoids reducers, context, and boilerpla... |
| Connect to state with URL | [docs/learn/guides/connect-to-state-with-url-hash.md](docs/learn/guides/connect-to-state-with-url-hash.md) | If you want to connect state of a store to URL hash, you can create your own hash storage. |
| Calling actions outside a React event handler in pre React 18 | [docs/learn/guides/event-handler-in-pre-react-18.md](docs/learn/guides/event-handler-in-pre-react-18.md) | Because React handles `setState` synchronously if it's called outside an event handler, updating the state outside an... |
| Flux inspired practice | [docs/learn/guides/flux-inspired-practice.md](docs/learn/guides/flux-inspired-practice.md) | Although Zustand is an unopinionated library, we do recommend a few patterns. These are inspired by practices origina... |
| How to reset state | [docs/learn/guides/how-to-reset-state.md](docs/learn/guides/how-to-reset-state.md) | The following pattern can be used to reset the state to its initial value. |
| Immutable state and merging | [docs/learn/guides/immutable-state-and-merging.md](docs/learn/guides/immutable-state-and-merging.md) | Like with React's `useState`, we need to update state immutably. |
| Initialize state with props | [docs/learn/guides/initialize-state-with-props.md](docs/learn/guides/initialize-state-with-props.md) | In cases where [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) is needed, such as when a s... |
| Map and Set Usage | [docs/learn/guides/maps-and-sets-usage.md](docs/learn/guides/maps-and-sets-usage.md) | Map and Set are mutable data structures. To use them in Zustand, you must create new instances when updating. |
| Setup with Next.js | [docs/learn/guides/nextjs.md](docs/learn/guides/nextjs.md) | > [!NOTE] > We will be updating this guide soon based on our discussion in https://github.com/pmndrs/zustand/discussi... |
| Practice with no store actions | [docs/learn/guides/practice-with-no-store-actions.md](docs/learn/guides/practice-with-no-store-actions.md) | The recommended usage is to colocate actions and states within the store (let your actions be located together with y... |
| Prevent rerenders with useShallow | [docs/learn/guides/prevent-rerenders-with-use-shallow.md](docs/learn/guides/prevent-rerenders-with-use-shallow.md) | When you need to subscribe to a computed state from a store, the recommended way is to use a selector. |
| Slices Pattern | [docs/learn/guides/slices-pattern.md](docs/learn/guides/slices-pattern.md) | Your store can become bigger and bigger and tougher to maintain as you add more features. |
| SSR and Hydration | [docs/learn/guides/ssr-and-hydration.md](docs/learn/guides/ssr-and-hydration.md) | Server-side Rendering (SSR) is a technique that helps us render our components into HTML strings on the server, send ... |
| Testing | [docs/learn/guides/testing.md](docs/learn/guides/testing.md) | > **Note**: Since Jest and Vitest have slight differences, like Vitest using **ES modules** and Jest using > **Common... |
| Tutorial: Tic-Tac-Toe | [docs/learn/guides/tutorial-tic-tac-toe.md](docs/learn/guides/tutorial-tic-tac-toe.md) | You will build a small tic-tac-toe game during this tutorial. This tutorial does assume existing React knowledge. The... |
| Updating state | [docs/learn/guides/updating-state.md](docs/learn/guides/updating-state.md) | Updating state with Zustand is simple! Call the provided `set` function with the new state, and it will be shallowly ... |
| Learn | [docs/learn/index.md](docs/learn/index.md) | If you are new to Zustand, begin here for installation, a high-level overview, and a hands-on tutorial. |
| createStore | [docs/reference/apis/create-store.md](docs/reference/apis/create-store.md) | - `stateCreatorFn`: A function that takes `set` function, `get` function and `store` as arguments.   Usually, you wil... |
| createWithEqualityFn | [docs/reference/apis/create-with-equality-fn.md](docs/reference/apis/create-with-equality-fn.md) | `createWithEqualityFn` lets you create a React Hook with API utilities attached, just like `create`. However, it offe... |
| create | [docs/reference/apis/create.md](docs/reference/apis/create.md) | - `stateCreatorFn`: A function that takes `set` function, `get` function and `store` as arguments.   Usually, you wil... |
| shallow | [docs/reference/apis/shallow.md](docs/reference/apis/shallow.md) | - `a`: The first value. - `b`: The second value. |
| useShallow | [docs/reference/hooks/use-shallow.md](docs/reference/hooks/use-shallow.md) | - `selectorFn`: A function that lets you return data that is based on current state. |
| useStoreWithEqualityFn | [docs/reference/hooks/use-store-with-equality-fn.md](docs/reference/hooks/use-store-with-equality-fn.md) | `useStoreWithEqualityFn` is a React Hook that lets you use a vanilla store in React, just like `useStore`. However, i... |
| useStore | [docs/reference/hooks/use-store.md](docs/reference/hooks/use-store.md) | - `storeApi`: The instance that lets you access to store API utilities. - `selectorFn`: A function that lets you retu... |
| Reference | [docs/reference/index.md](docs/reference/index.md) | Core functions for creating and configuring stores. |
| Immer middleware | [docs/reference/integrations/immer-middleware.md](docs/reference/integrations/immer-middleware.md) | The [Immer](https://github.com/immerjs/immer) middleware enables you to use immutable state in a more convenient way.... |
| Persisting store data | [docs/reference/integrations/persisting-store-data.md](docs/reference/integrations/persisting-store-data.md) | The Persist middleware enables you to store your Zustand state in a storage (e.g., `localStorage`, `AsyncStorage`, `I... |
| Third-party Libraries | [docs/reference/integrations/third-party-libraries.md](docs/reference/integrations/third-party-libraries.md) | Zustand provides bear necessities for state management. Although it is great for most projects, some users wish to ex... |
| combine | [docs/reference/middlewares/combine.md](docs/reference/middlewares/combine.md) | `combine` middleware lets you create a cohesive state by merging an initial state with a state creator function that ... |
| devtools | [docs/reference/middlewares/devtools.md](docs/reference/middlewares/devtools.md) | - `stateCreatorFn`: A function that takes `set` function, `get` function and `store` as arguments.   Usually, you wil... |
| immer | [docs/reference/middlewares/immer.md](docs/reference/middlewares/immer.md) | `immer` middleware lets you perform immutable updates. |
| persist | [docs/reference/middlewares/persist.md](docs/reference/middlewares/persist.md) | - `stateCreatorFn`: A function that takes `set` function, `get` function and `store` as arguments.   Usually, you wil... |
| redux | [docs/reference/middlewares/redux.md](docs/reference/middlewares/redux.md) | - `reducerFn`: It should be pure and should take the current state of your application and an action   object as argu... |
| subscribeWithSelector | [docs/reference/middlewares/subscribe-with-selector.md](docs/reference/middlewares/subscribe-with-selector.md) | `subscribeWithSelector` middleware lets you subscribe to specific data based on current state. |
| Migrating to v4 | [docs/reference/migrations/migrating-to-v4.md](docs/reference/migrations/migrating-to-v4.md) | The only breaking changes are in types. If you are using Zustand with TypeScript or JSDoc type annotations, this guid... |
| How to Migrate to v5 from v4 | [docs/reference/migrations/migrating-to-v5.md](docs/reference/migrations/migrating-to-v5.md) | We highly recommend to update to the latest version of v4, before migrating to v5. It will show all deprecation warni... |
| createContext from zustand/context | [docs/reference/previous-versions/zustand-v3-create-context.md](docs/reference/previous-versions/zustand-v3-create-context.md) | A special `createContext` is provided since v3.5, which avoids misusing the store hook. |
