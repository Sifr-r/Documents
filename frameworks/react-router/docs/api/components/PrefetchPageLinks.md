# PrefetchPageLinks

## Summary

[Reference Documentation ↗](https://api.reactrouter.com/v7/functions/react-router.PrefetchPageLinks.html)

Renders [`<link rel=prefetch|modulepreload>`](https://developer.mozilla.org/en-US/docs/Web/API/HTMLLinkElement/rel)
tags for modules and data of another page to enable an instant navigation to
that page. [`<Link prefetch>`](./Link#prefetch) uses this internally, but you
can render it to prefetch a page for any other reason.

For example, you may render one of this as the user types into a search field
to prefetch search results before they click through to their selection.

```tsx
import { PrefetchPageLinks } from "react-router";

<PrefetchPageLinks page="/absolute/path" />
```

## Signature

```tsx
function PrefetchPageLinks({ page, ...linkProps }: PageLinkDescriptor)
```

