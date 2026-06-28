# createContext

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.createContext.html)

Creates a type-safe [`RouterContext`](https://api.reactrouter.com/v7/interfaces/react-router.RouterContext.html) object that can be used to
store and retrieve arbitrary values in [`action`](../../start/framework/route-module#action)s,
[`loader`](../../start/framework/route-module#loader)s, and [middleware](../../how-to/middleware).
Similar to React's [`createContext`](https://react.dev/reference/react/createContext),
but specifically designed for React Router's request/response lifecycle.

If a `defaultValue` is provided, it will be returned from `context.get()`
when no value has been set for the context. Otherwise, reading this context
when no value has been set will throw an error.

```tsx filename=app/context.ts
import { createContext } from "react-router";

// Create a context for user data
export const userContext =
  createContext<User | null>(null);
```

```tsx filename=app/middleware/auth.ts
import { getUserFromSession } from "~/auth.server";
import { userContext } from "~/context";

export const authMiddleware = async ({
  context,
  request,
}) => {
  const user = await getUserFromSession(request);
  context.set(userContext, user);
};
```

```tsx filename=app/routes/profile.tsx
import { userContext } from "~/context";

export async function loader({
  context,
}: Route.LoaderArgs) {
  const user = context.get(userContext);

  if (!user) {
    throw new Response("Unauthorized", { status: 401 });
  }

  return { user };
}
```

## Signature

```tsx
function createContext(defaultValue?: T): RouterContext
```

## Params

### defaultValue

An optional default value for the context. This value will be returned if no value has been set for this context.

