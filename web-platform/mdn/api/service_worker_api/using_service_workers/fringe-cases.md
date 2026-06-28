# Fringe Cases

## Warnings & Notes

> [!NOTE]
> One great thing about service workers is that if you use feature detection like we've shown above, browsers that don't support service workers can just use your app online in the normal expected fashion.

> [!NOTE]
> [The Web Storage API (`localStorage`)](/en-US/docs/Web/API/Web_Storage_API) works in a similar way to service worker cache, but it is synchronous, so not allowed in service workers.

> [!NOTE]
> [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) can be used inside a service worker for data storage if you require it.

> [!NOTE]
> It is possible to bypass this by using [`Clients.claim()`](/en-US/docs/Web/API/Clients/claim).

