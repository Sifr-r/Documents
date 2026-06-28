# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Attaching event listeners to this object prevents the request from being a "simple request" and will cause a preflight request to be issued if cross-origin; see [CORS](/en-US/docs/Web/HTTP/Guides/CORS). Because of this, event listeners need to be registered before calling {{domxref("XMLHttpRequest.send", "send()")}} or upload events won't be dispatched.

> [!NOTE]
> The spec also seems to indicate that event listeners should be attached after {{domxref("XMLHttpRequest.open", "open()")}}. However, browsers are buggy on this matter, and often need the listeners to be registered _before_ {{domxref("XMLHttpRequest.open", "open()")}} to work.

