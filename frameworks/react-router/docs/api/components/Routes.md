# Routes

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.Routes.html)

Renders a branch of [``s](../components/Route) that best matches the current
location. Note that these routes do not participate in [data loading](../../start/framework/route-module#loader),
[`action`](../../start/framework/route-module#action), code splitting, or
any other [route module](../../start/framework/route-module) features.

```tsx
import { Route, Routes } from "react-router";

  <Route index element={} />
  <Route path="step-2" element={} />
  <Route path="step-3" element={} />

```

## Signature

```tsx
function Routes({
  children,
  location,
}: RoutesProps): React.ReactElement | null
```

