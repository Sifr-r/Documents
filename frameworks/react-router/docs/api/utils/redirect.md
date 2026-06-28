# redirect

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.redirect.html)

A redirect [`Response`](https://developer.mozilla.org/en-US/docs/Web/API/Response).
Sets the status code and the [`Location`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Location)
header. Defaults to [`302 Found`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/302).

This utility accepts absolute URLs and can navigate to external domains, so
the application should validate any user-supplied inputs to redirects.

```tsx
import { redirect } from "react-router";

export async function loader({ request }: Route.LoaderArgs) {
  if (!isLoggedIn(request))
    throw redirect("/login");
  }

  // ...
}
```

## Params

### url

The URL to redirect to.

### init

The status code or a `ResponseInit` object to be included in the response.

