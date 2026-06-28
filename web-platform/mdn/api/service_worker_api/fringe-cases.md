# Fringe Cases

## Warnings & Notes

> [!NOTE]
> Service workers are a type of web worker. See [Web workers](/en-US/docs/Web/API/Web_Workers_API) for general information about worker types and use cases.

> [!NOTE]
> On Firefox, for testing you can run service workers over HTTP (insecurely); simply check the **Enable Service Workers over HTTP (when toolbox is open)** option in the Firefox DevTools options/gear menu.

> [!NOTE]
> Unlike previous attempts in this area such as [AppCache](https://alistapart.com/article/application-cache-is-a-douchebag/), service workers don't make assumptions about what you are trying to do, but then break when those assumptions are not exactly right. Instead, service workers give you much more granular control.

> [!NOTE]
> Service workers make heavy use of [promises](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise), as generally they will wait for responses to come through, after which they will respond with a success or failure action. The promises architecture is ideal for this.

> [!NOTE]
> Because `install`/`activate` events could take a while to complete, the service worker spec provides a {{domxref("ExtendableEvent.waitUntil", "waitUntil()")}} method. Once it is called on `install` or `activate` events with a promise, functional events such as `fetch` and `push` will wait until the promise is successfully resolved.

