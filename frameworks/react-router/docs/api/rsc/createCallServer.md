# createCallServer

## Summary

Create a React `callServer` implementation for React Router.

```tsx
import {
  createFromReadableStream,
  createTemporaryReferenceSet,
  encodeReply,
  setServerCallback,
} from "@vitejs/plugin-rsc/browser";
import { unstable_createCallServer as createCallServer } from "react-router";

setServerCallback(
  createCallServer({
    createFromReadableStream,
    createTemporaryReferenceSet,
    encodeReply,
  })
);
```

## Signature

```tsx
function createCallServer({
  createFromReadableStream,
  createTemporaryReferenceSet,
  encodeReply,
  fetch: fetchImplementation = fetch,
}: {
  createFromReadableStream: BrowserCreateFromReadableStreamFunction;
  createTemporaryReferenceSet: () => unknown;
  encodeReply: EncodeReplyFunction;
  fetch?: (request: Request) => Promise;
})
```

## Params

### opts.createFromReadableStream

Your `react-server-dom-xyz/client`'s `createFromReadableStream`. Used to decode payloads from the server.

### opts.createTemporaryReferenceSet

A function that creates a temporary reference set for the [RSC](https://react.dev/reference/rsc/server-components)
payload.

### opts.encodeReply

Your `react-server-dom-xyz/client`'s `encodeReply`. Used when sending payloads to the server.

### opts.fetch

Optional [Fetch API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) implementation. Defaults to global [`fetch`](https://developer.mozilla.org/en-US/docs/Web/API/fetch).

## Returns

A function that can be used to call server actions.

