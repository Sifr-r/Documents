# useLoaderData

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.useLoaderData.html)

Returns the data from the closest route
[`loader`](../../start/framework/route-module#loader) or
[`clientLoader`](../../start/framework/route-module#clientloader).

```tsx
import { useLoaderData } from "react-router";

export async function loader() {
  return await fakeDb.invoices.findAll();
}

export default function Invoices() {
  let invoices = useLoaderData<typeof loader>();
  // ...
}
```

## Signature

```tsx
function useLoaderData<T = any>(): SerializeFrom
```

