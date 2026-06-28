# redirectDocument

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.redirectDocument.html)

A redirect [`Response`](https://developer.mozilla.org/en-US/docs/Web/API/Response)
that will force a document reload to the new location. Sets the status code
and the [`Location`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Location)
header. Defaults to [`302 Found`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/302).

This utility accepts absolute URLs and can navigate to external domains, so
the application should validate any user-supplied inputs to redirects.

```tsx filename=routes/logout.tsx
import { redirectDocument } from "react-router";

import { destroySession } from "../sessions.server";

export async function action({ request }: Route.ActionArgs) {
  let session = await getSession(request.headers.get("Cookie"));
  return redirectDocument("/", {
    headers: { "Set-Cookie": await destroySession(session) }
  });
}
```

